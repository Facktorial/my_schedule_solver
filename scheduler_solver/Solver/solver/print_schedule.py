from rich.console import Console
from rich.table import Table
from datetime import date, time, datetime, timedelta
from typing import List, Tuple
from .SubjectTypes import Item


def yield_times(limit):
    start = datetime.combine(date.today(), time(7, 15))
    yield start
    counter: int = 0
    while counter < limit:
        start += timedelta(minutes=60 if counter % 2 else 45)
        counter += 1
        yield start


def prasecina(days: List[str], courses: List[Item], hours, none_type = ("---", "---", None)) -> List[str]:
    if courses == []:
        return [("---", "---", None) for _ in range(hours + 1)]
    day = [ none_type for _ in range(hours + 1) ]
    it = iter(yield_times(hours + 1))
    course = iter(courses)
    val = next(it)
    lecture = next(course)
    counter = 0
    for b in day:
        t = val.hour + val.minute // 15 * 0.25
        if lecture.time == t:
            for index in range(lecture.length):
                day[counter] = (lecture.name, lecture.teacher, lecture.lab)
                counter = counter + 1
                val = next(it)
            try:
                lecture = next(course)
            except StopIteration:
                break
        else:
            try:
                val = next(it)
            except StopIteration:
                print("???")
            counter = counter + 1
    return day


def print_cell(t: Tuple[str, str, bool]) -> str:
    a, b, c = t
    la = max(len(a), len(b)) - len(a)
    lb = max(len(a), len(b)) - len(b)
    fore_color = "white"
    back_color = "" if c is None else "red" if not c else "blue"
    color = f"{fore_color} on {back_color}"
    return f"[bold {color}]{a}{''.join(' ' for _ in range(la))}[/]\n[{color}]{b}{''.join(' ' for _ in range(lb))}"


def print_table(items: List[Item], score, valid, hours=13):
    print(valid)
    table = Table(
        title=f"[green]{'valid' if valid else ''}[/]\tSTAR ROZVRH TABLE\t[cyan]score: {score}"
    )
    table.add_column("Day", style="gold1")
    for x in yield_times(hours):
        table.add_column(
            f'{x.strftime("%H:%M")}\n  -  \n{(x + timedelta(minutes=45)).strftime("%H:%M")}'
        )

    mmonday = [x for x in filter(lambda a: a.day == 1, items)]
    mtuesday = [x for x in filter(lambda a: a.day == 2, items)]
    mwednesday = [x for x in filter(lambda a: a.day == 3, items)]
    mthursday = [x for x in filter(lambda a: a.day == 4, items)]
    mmonday.sort(key=lambda a: a.time)
    mtuesday.sort(key=lambda a: a.time)
    mwednesday.sort(key=lambda a: a.time)
    mthursday.sort(key=lambda a: a.time)
    monday = [("---", "---", None) for _ in range(hours + 1)]
    tuesday = [("---", "---", None) for _ in range(hours + 1)]
    wednesday = [("---", "---", None) for _ in range(hours + 1)]
    thursday = [("---", "---", None) for _ in range(hours + 1)]

    monday = prasecina(monday, mmonday, hours)
    tuesday = prasecina(tuesday, mtuesday, hours)
    wednesday = prasecina(wednesday, mwednesday, hours)
    thursday = prasecina(thursday, mthursday, hours)

    table.add_row("Monday", *[print_cell(x) for x in monday])
    table.add_row("Tuesday", *[print_cell(x) for x in tuesday])
    table.add_row("Wednesday", *[print_cell(x) for x in wednesday])
    table.add_row("Thursday", *[print_cell(x) for x in thursday])
    table.add_row("Friday", *["---\n---" for _ in range(hours + 1)])

    console.print(table)


console = Console()

if __name__ == "__main__":
    print_table(console, 13, 69)
    print_table(console, 13, 42)
    print_table(console, 13, 17)
