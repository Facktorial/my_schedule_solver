import json
from typing import List
from solver.SubjectTypes import Lab, Lecture, Course, Item, Demands


subjects: List[Course] = [
    Course(
        "APPS",
        (3, 2),
        Lecture("Olivka", 1, 8.00, 3, True),
        [
            Lab("Olivka", 1, 10.75, 5, False),
            Lab("Olivka", 2, 10.75, 5, False),
            Lab("Olivka", 3, 10.75, 5, False),
            Lab("Olivka", 3, 7.25, 1, False),
            Lab("Olivka", 3, 9.00, 4, False),
            Lab("Olivka", 4, 10.45, 6, False),
            Lab("Olivka", 3, 7.25, 1, False),
            Lab("Trnka", 3, 16.00, 10, False),
            Lab("Trnka", 3, 17.75, 10, False),
            Lab("Stribny", 3, 12.50, 7, False),
            Lab("Stribny", 1, 14.25, 5, False),
            Lab("Stribny", 3, 14.25, 5, False),
            Lab("Klein", 1, 16.00, 8, False),
            Lab("Klein", 1, 17.75, 8, False),
            Lab("Klein", 4, 14.25, 7, False),
            Lab("Klein", 4, 16.00, 7, False),
        ],
    ),
    Course(
        "UTI",
        (2, 3),
        Lecture("Sawa", 2, 9.00, 8, False),
        [
            Lab("Mensik", 1, 7.25, 3, False),
            Lab("Mensik", 1, 9.75, 4, False),
            Lab("Drazdilova", 1, 12.50, 7, False),
            Lab("Drazdilova", 2, 14.25, 7, False),
            Lab("Kot", 3, 13.25, 7, False),
            Lab("Kot", 3, 10.75, 7, False),
        ],
    ),
    Course(
        "PDS",
        (2, 2),
        Lecture("Kromer", 2, 14.25, 6, True),
        [
            Lab("Kromer", 2, 16.00, 6, True),
        ],
    ),
    Course(
        "C++",
        (2, 2),
        Lecture("Gajdos", 1, 9.00, 9, False),
        [
            Lab("Beranek", 2, 17.75, 10, False),
            Lab("Dolezi", 2, 17.75, 5, False),
            Lab("Dolezi", 2, 16.00, 5, False),
        ],
    ),
    Course(
        "C#",
        (2, 2),
        Lecture("Radecky", 3, 7.25, 2, True),
        [
            Lab("Janousek", 1, 7.25, 1, False),
            Lab("Janousek", 4, 7.25, 1, False),
            Lab("Janousek", 4, 10.75, 4, False),
            Lab("Janousek", 1, 9.00, 3, False),
            Lab("Janousek", 1, 12.50, 8, False),
            Lab("Janousek", 4, 12.50, 4, False),
        ],
    ),
    Course(
        "ENG",
        (0, 2),
        None,
        [
            Lab("Matyaskova", 3, 7.25, 4, False),
            Lab("Matyaskova", 4, 7.25, 4, False),
            Lab("Zarlik", 1, 9.00, 5, False),
            Lab("Illík", 1, 12.50, 5, False),
            Lab("Pretsch", 1, 14.25, 5, False),
            Lab("Pretsch", 2, 14.25, 5, False),
            Lab("Landry", 4, 12.50, 5, False),
            Lab("Manakova", 3, 12.50, 5, False),
            Lab("Trawinska", 3, 12.50, 5, False),
            Lab("Smutna", 3, 12.50, 5, False),
            Lab("Manakova", 3, 14.25, 5, False),
        ],
    ),
    Course(
        "NLA",
        (2, 2),
        Lecture("Merta", 4, 16.00, 5, False),
        [
            Lab("Merta", 4, 17.75, 5, False),
        ],
    ),
    Course(
        "DS2",
        (2, 2),
        Lecture("Kratky", 3, 9.00, 4, False),
        [
            Lab("Baca", 3, 10.75, 6, False),
            Lab("Lukas", 3, 12.50, 5, False),
            Lab("Lukas", 4, 12.50, 5, False),
            Lab("Lukas", 3, 14.25, 5, False),
            Lab("Lukas", 4, 16.00, 5, False),
            Lab("Chovanec", 3, 12.50, 5, False),
            Lab("Chovanec", 4, 12.50, 5, False),
            Lab("Chovanec", 4, 16.00, 5, False),
        ],
    ),
    Course(
        "SKJ",
        (2, 2),
        Lecture("Gaura", 4, 9.00, 3, False),
        [
            Lab("Fabian", 2, 14.25, 7, False),
            Lab("Halman", 2, 14.25, 5, False),
            Lab("Halman", 2, 16.00, 5, False),
            Lab("Sigut", 3, 16.00, 6, False),
            Lab("Sigut", 3, 17.75, 5, False),
            Lab("Holusa", 4, 16.00, 5, False),
            Lab("Holusa", 4, 17.75, 5, False),
        ],
    ),
    Course(
        "URO",
        (2, 2),
        Lecture("Sojka", 4, 14.25, 5, True),
        [
            Lab("Nemec", 1, 9.00, 6, False),
            Lab("Nemec", 1, 10.75, 6, False),
            Lab("Nemec", 1, 12.50, 6, False),
            Lab("Simkanic", 2, 14.25, 5, False),
            Lab("Simkanic", 2, 16.00, 5, False),
            Lab("Simkanic", 2, 17.75, 5, False),
        ],
    ),
    Course(
        "PSYCH",
        (0, 2),
        None,
        [
            Lab("Miklošíková", 1, 14.25, 7, False),
            Lab("Miklosikova", 1, 16.00, 7, False),
            Lab("Miklosikova", 4, 12.50, 6, False),
            Lab("Matochova", 1, 16.00, 6, False),
            Lab("Matochova", 3, 14.25, 5, False),
            Lab("Matochova", 3, 16.00, 5, False),
            Lab("Palenickova", 3, 16.00, 5, False),
            Lab("Palenickova", 3, 9.00, 5, False),
        ],
    ),
]


x = json.dumps(subjects, default=lambda o: o.__dict__)

with open("2021-22_ls.json", "w") as ofile:
    json.dump(x, ofile) # , indent=4)

with open("2021-22_ls.json") as ifile:
    y = json.load(ifile) # , indent=4)
    y = json.loads(y)

print()
print()
print(len(y))
print(y[0])
print(y[0]['name'])
print(y[0]['talk'])
print(y[0]['labs'])
