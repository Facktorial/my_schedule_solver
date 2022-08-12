from typing import List, Tuple
from dataclasses import dataclass


@dataclass
class Demands:
    lectures: List[str]
    skip_lectures: List[str]
    labs: List[str]
    skip_labs: List[str]
    average_priority: int

    @property
    def len_lectures(self) -> Tuple[int, int]:
        return (len(self.lectures), len(self.skip_lectures))

    @property
    def len_labs(self) -> Tuple[int, int]:
        return (len(self.labs), len(self.skip_labs))

    @property
    def max_len_items(self) -> int:
        return sum(self.len_lectures) + sum(self.len_labs)


@dataclass
class Subject:
    teacher: str
    day: int
    time: int
    priority: int
    skip: bool


@dataclass
class Item(Subject):
    name: str
    length: int
    lab: bool


@dataclass
class Lab(Subject):
    skip = False
    lab = True


@dataclass
class Lecture(Subject):
    lab = False


@dataclass
class Course:
    name: str
    length: Tuple[int, int]
    talk: Lecture
    labs: [Lab]


@dataclass
class Result:
    valid: bool
    best_score: int
    best_solution: List[Item]
