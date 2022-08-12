from .SubjectTypes import Lab, Lecture, Course, Item, Demands
from typing import List, Tuple, Dict
from .print_schedule import print_table
from rich.console import Console

from .backtracking import backtracking
from .utils import check_demands


def to_items_list(ls: List[Course]) -> Tuple[List[Item], Demands]:
    # Reserve memory for all items.
    items = [None for x in range(perm_count(ls))]
    count = 0
    lectures, skip_lectures, labs, skip_labs = [], [], [], []

    for x in ls:
        if x.talk is not None:
            l = x.talk
            items[count] = Item(
                l.teacher,
                l.day,
                l.time,
                l.priority,
                l.skip,
                x.name,
                x.length[0],
                x.talk.lab,
            )
            if not x.talk.skip:
                lectures.append(x.name)
            else:
                skip_lectures.append(x.name)
            count += 1

        if x.length[1]:
            # FIXME
            if not x.labs[0].skip:
                labs.append(x.name)
            else:
                skip_labs.append(x.name)

        for y in x.labs:
            items[count] = Item(
                y.teacher, y.day, y.time, y.priority, y.skip, x.name, x.length[1], y.lab
            )
            count += 1

    return (
        items,
        Demands(
            lectures,
            skip_lectures,
            labs,
            skip_labs,
            sum([x.priority for x in items]) // len(items),
        ),
    )


def perm_len(ls: List[Course]) -> int:
    """Calculate time max time complexity of lectures + labs from collection."""
    return sum([(lambda a, b: (a != 0) + (b != 0))(*x.length) for x in ls])


def perm_count(ls: List[Course]) -> int:
    """Count number of lectres + number of labs in ls."""
    return sum([len(x.labs) for x in ls]) + sum([1 for x in ls if x.talk is not None])


def extract_subjects(subjects_json) -> List[Course]:
    subjects: List[Course] = []

    for subj in subjects_json:
        name: str = subj['name']
        length: List[int] = subj['length']

        talk = subj.get('talk', None)
        if talk is not None:
            talk = Lecture(talk['teacher'], talk['day'], talk['time'], talk['priority'], talk['skip'])
        
        labs = subj.get('labs', None)
        if labs is not None:
            labs = [Lab(l['teacher'], l['day'], l['time'], l['priority'], l['skip']) for l in labs]
        
        subjects.append(Course(name, length, talk, labs))

    return subjects


def solve(subjects_json = None):
    if subjects_json is None:
        print("Error. Gimmie list with subjects!")
        return

    subjects: List[Course] = extract_subjects(subjects_json)
    
    pl = perm_len(subjects)
    pc = perm_count(subjects)

    tuple_items: Tuple[List[Item], Demands] = to_items_list(subjects)
    items, demands = tuple_items
    items.sort(key=lambda a: a.priority, reverse=True)

    valid, solution, score, results = backtracking(items, items, [], demands)

    scores = list(set([x.best_score for x in results]))
    scores.sort(key=lambda a: a, reverse=True)
    index = 0
    tmp = []
    for x in results:
        if x.best_score == scores[index] and x.valid:
            index = index + 1
            tmp.append(x)
            if index == len(scores):
                break
    results = tmp


    _ = [
       print_table(
          r.best_solution, r.best_score, check_demands(r.best_solution, demands)
       )
       for r in results[:10]
    ]  # [:5]]

    return results


if __name__ == "__main__":
    solve()
