from .SubjectTypes import Item, Demands, Result
from typing import List, Tuple


def check_generation(items, sol, not_used, score, demands, results, counter):
    if not_used == []:
        # print("NOT USED EMPTY")
        return (True, sol, score, results, counter)

    if len(sol) == demands.max_len_items and check_demands(sol, demands):
        results.append(Result(True, score, sol))
        # print("prunning", score, " ", len(results))
        return (True, sol, score, results, counter)

    if not may_check_demands(items, sol, demands)[0]:
        # print("prunning not demandable items")
        return (False, sol, score, results, counter)

    return None


def discard_alternatives(item: Item, items: List[Item]) -> List[Item]:
    items = [x for x in items if not item.name == x.name and item.lab == x.lab]
    return items


def discard_collisions(solution: List[Item], items: List[Item]) -> List[Item]:
    items = [item for item in items if check_no_collisions(solution, item)]
    return items


def discard_already_in_solution(solution: List[Item], items: List[Item]) -> List[Item]:
    items = [item for item in items if not is_in_solution(solution, item)]
    return items


def is_in_solution(items: List[Item], new_item: Item) -> bool:
    for x in items:
        if new_item.name == x.name and x.lab == new_item.lab:
            return True
    return False


def check_no_collisions(items: List[Item], new_item: Item) -> bool:
    no_collision: bool = True
    x: Item = new_item

    for y in items:
        if x.day == y.day:
            xt: float = x.time + 0.75 * x.length
            yt: float = y.time + 0.75 * y.length

            if (
                (x.time >= y.time and x.time <= yt)
                or (y.time >= x.time and y.time <= xt)
                or (x.time <= y.time and y.time <= xt and xt <= yt)
                or (y.time <= x.time and x.time <= yt and yt <= xt)
                or (x.time >= y.time and x.time <= yt and yt <= xt)
                or (y.time >= x.time and y.time <= xt and xt <= yt)
            ):

                # if x.priority <= y.priority:
                # print(f'\t....{x.teacher} in collision with {y.teacher}')
                no_collision = False
                break
    # print(f'....{x.teacher} is not collision')
    return no_collision


def check_demands(items: List[Item], demands: Demands) -> bool:
    # print("demands=", demands)
    lectures: List[str] = []
    labs: List[str] = []
    for x in items:
        if x.lab:
            labs.append(x.name)
        else:
            lectures.append(x.name)

    # print(lectures, labs)
    # print(demands.len_lectures, demands.len_labs)

    if len(lectures) != len(set(lectures)):
        # print("bad len")
        return False

    if len(labs) != len(set(labs)):
        # print("bad len of set")
        return False

    if len(lectures) >= demands.len_lectures[0] or len(lectures) <= sum(
        list(demands.len_lectures)
    ):
        for x in demands.lectures:
            if x not in lectures:
                # print(f"{x} not in lectures...")
                return False
    else:
        # print("bad else")
        return False

    if len(labs) >= demands.len_labs[0] or len(labs) <= sum(list(demands.len_labs)):
        for x in demands.labs:
            if x not in labs:
                # print(f"{x} not in labs")
                return False
    else:
        # print("bad else labs")
        return False

    return True


def may_check_demands(
    items: List[Item], solution: List[Item], demands: Demands
) -> Tuple[bool, str, bool]:
    lectures: List[str] = []
    labs: List[str] = []

    for x in solution:
        if x.lab:
            labs.append(x.name)
        else:
            lectures.append(x.name)

    for x in items:
        if x.lab:
            if x.name not in labs:
                labs.append(x.name)
        else:
            if x.name not in lectures:
                lectures.append(x.name)

    # print("maybe")
    # _ = [print(x) for x in labs]
    # _ = [print(x) for x in lectures]
    # print("..")
    # _ = [print(x) for x in demands.labs]
    # _ = [print(x) for x in demands.lectures]

    if len(lectures) >= demands.len_lectures[0] or len(lectures) >= sum(
        list(demands.len_lectures)
    ):
        for x in demands.lectures:
            if x not in lectures:
                return (False, x, False)
    else:
        # print("len >=")
        return (False, "", None)

    if len(labs) >= demands.len_labs[0] or len(labs) >= sum(list(demands.len_labs)):
        for x in demands.labs:
            if x not in labs:
                return (False, x, True)
    else:
        # print("labs len >=")
        return (False, "", None)

    return (True, "", None)
