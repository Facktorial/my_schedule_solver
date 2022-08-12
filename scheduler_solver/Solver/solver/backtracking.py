from .SubjectTypes import Item, Demands, Result
from typing import Callable, List, Tuple
from .utils import *
import itertools
import time


def backtracking(
    data: List[Item], items: List[Item], solution: List[Item], demands: Demands
) -> Tuple[bool, List[Item], int, List[Result]]:

    not_used = items

    perm_count: int = 0

    appender: List[Item] = place_no_alternatives(items, demands)
    solution = appender
    not_used = [x for x in not_used if x not in appender]

    valid_exists: bool = False
    for x in items:
        perm_count = perm_count + 1
        # print("Base forloop")
        valid, solution, score, results, perm_count = inner_backtracking(
            data,
            items,
            solution,
            demands,
            [item for item in items if item != x],
            perm_count,
            x.priority,
        )
        valid_exists = valid or valid_exists
        break

    return [valid_exists, solution, score, results]


def inner_backtracking(
    data: List[Item],
    items: List[Item],
    solution: List[Item],
    demands: Demands,
    not_used: List[Result],
    perm_count: int,
    score: int = 0,
    results: List[Result] = [],
) -> Tuple[bool, List[Item], int, List[Result], int]:

    # print("===backtracking init===\t")
    # print(f'items={[x.teacher for x in items]}')
    # print("demands: ", demands)
    # print("not used: ", len(not_used))

    if len([x for x in results if x.valid]) > 1000:
        return [True, solution, score, results, perm_count]

    free_space: int = demands.max_len_items - len(solution)
    if len(results) >= 3:
        if (
            priority_score(solution)
            < results[2].best_score - free_space * solution[len(solution) - 1].priority
        ):
            return [True, solution, score, results, perm_count]

    if (
        ret := check_generation(
            items, solution, not_used, score, demands, results, perm_count
        )
    ) is not None:
        return ret

    # print("===traverse===")
    '''"optimalization"'''
    appender: List[Item] = place_no_alternatives(items, demands)
    _ = [solution.append(x) for x in appender if not is_in_solution(solution, x)]
    not_used = [x for x in not_used if x not in appender]

    # print(f'count={perm_count}, sol={[x.teacher for x in solution]}, score={score}')
    items = discard_already_in_solution(solution, items)
    items = discard_collisions(solution, items)

    # FIXME
    _ = [solution.append(x) for x in add_optional(items, solution, demands)]

    score = sum([x.priority for x in solution])

    if len(solution) == demands.max_len_items:
        if check_demands(solution, demands):
            results.append(Result(True, score, solution))
            # print(f"prunning 2, score: {score}")
            return (True, solution, score, results, perm_count)
        else:
            # print(f"prunning 2 goes wrong, score: {score}")
            return (False, solution, score, results, perm_count)

    for x in items:
        # print(f'{x.name} {x.teacher} {x.time} is not in {[z.name for z in solution]}')
        if check_no_collisions(solution, x):
            new_items = discard_collisions([x], items)
            new_items = discard_alternatives(x, new_items)
            not_used = [item for item in not_used if item != x]

            perm_count = perm_count + 1
            valid, new_sol, new_score, new_results, perm_count = inner_backtracking(
                data,
                new_items,
                solution + [x],
                demands,
                not_used,
                perm_count,
                score + x.priority,
            )
            results = new_results
            results.append(Result(True, new_score, new_sol))
            results.sort(key=lambda a: a.best_score, reverse=True)

    results.append(Result(check_demands(solution, demands), score, solution))
    results.sort(key=lambda a: a.best_score, reverse=True)
    # FIXME
    results = results[:1000]

    if results != []:
        return (False, solution, score, results, perm_count)
    return (False, [], -1, [], perm_count)


def add_mandatory(
    items: List[Item], solution: List[Item], demands: Demands
) -> List[Item]:
    ls = []
    for x in demands.lectures:
        for xx in items:
            if xx.name == x and not xx.lab:
                if not is_in_solution(solution, xx):
                    if check_no_collissions(solution, xx):
                        ls.append(xx)

    for x in demands.labs:
        for xx in items:
            if xx.name == x and xx.lab:
                if not is_in_solution(solution, xx):
                    if check_no_collisions(solution, xx):
                        ls.append(xx)

    ls.sort(key=lambda a: a.priority, reverse=True)
    # print("mandatory")
    # _ = [print(x) for x in solution]
    # print("---")
    # _ = [print(x) for x in ls]
    # print()

    return [x for x in ls if check_no_collisions(solution, x)]


def add_optional(
    items: List[Item], solution: List[Item], demands: Demands
) -> List[Item]:
    ls = []
    for x in demands.skip_lectures:
        for xx in items:
            if xx.name == x and not xx.lab:
                if not is_in_solution(solution, xx):
                    if check_no_collisions(solution, xx):
                        ls.append(xx)

    for x in demands.skip_labs:
        for xx in items:
            if xx.name == x and xx.lab:
                if not is_in_solution(solution, xx):
                    if check_no_collisions(solution, xx):
                        ls.append(xx)

    ls.sort(key=lambda a: a.priority, reverse=True)
    # print("optional", len(solution), len(ls), demands.len_lectures, demands.len_labs)
    # _ = [print(x) for x in solution]
    # print("---")
    # _ = [print(x) for x in ls]
    # print()

    return [x for x in ls if check_no_collisions(solution, x)]


def place_no_alternatives(items: List[Item], demands: Demands) -> List[Item]:
    appender = []
    for x in demands.lectures:
        counter = 0
        tmp: Item = None
        for item in items:
            if item.name == x and not item.lab and not item.skip:
                counter = counter + 1
                tmp = item
                if counter > 1:
                    break
        if counter == 1:
            appender.append(tmp)

    for x in demands.labs:
        counter = 0
        tmp: Item = None
        for item in items:
            if item.name == x and item.lab and not item.skip:
                counter = counter + 1
                tmp = item
                if counter > 1:
                    break
        if counter == 1:
            appender.append(tmp)

    return appender

    # while not flag:
    # tmp = [*filter(lambda xl: (xl[0].name == subj and xl[0].lab == xl[1]), zip(data, itertools.repeat(lab)))]
    # ls.append(*[x[0] for x in tmp])


def priority_score(items: List[Item]) -> int:
    return sum(i.priority for i in items)
