# Schedule solver
## Save paper, save your life
Django application for finding most **maybe** (shitty solver \\_(:/)\_/) the best possible option of school schedule for next semester.

![Solver results](https://github.com/Facktorial/my_schedule_solver/blob/main/images/generate_schedule.png)

Also CLI output:

![CLI Solver results](https://github.com/Facktorial/my_schedule_solver/blob/main/images/cli_output.png)

If you don't wanna provide JSON with subjects and values, u can modify something like default by form:

![CLI Solver results](https://github.com/Facktorial/my_schedule_solver/blob/main/images/choosing_preferencies.png)

#### Technologies:
 -[`Django 4.x.`](https://djangoproject.com/) web framework
- [`Postgre`](https://www.postgresql.org/) SQL database
- [`Rich`](https://rich.readthedocs.io/en/stable/introduction.html) rich console
- [`Bootstrap`](https://getbootstrap.com/) frontend toolkit

### Meeting the requirements (Linux)
```bash
sudo apt install poetry postgresql postgresql-contrib
```

#### Recomended first step
```console
poetry install
```

'psycopg2' is PostgreSQL database adapter to communicate with Python to install. I presume, PostgreSQL already installed.

### Set database
[UNDER CONSTRUCTION] For testing/release there will dataset to upload. Also guide how to upload it.

```console
sudo -u postgres psql
```

In psql application:
```console
CREATE DATABASE mydb;
CREATE USER admin WITH ENCRYPTED PASSWORD 'admin';
ALTER ROLE admin SET client_encoding TO 'utf8';
ALTER ROLE admin SET client_encoding TO 'UTC';
GRANT ALL PRIVILEGES ON DATABASE mydb TO admin;
netstat -nlp | grep
\q
```
And then from bash:
```console
pg_restore -U admin -h localhost --dbname=mydb ./dbexport.pgsql
```

### IF SOMETHING GOES WRONG
Create one user, create one term and upload `2021-22_ls.json` file as items... should be enough to test application.


### Run
```console
cd scheduler_solver
poetry run python manage.py makemigrations
poetry run python manage.py migrate scheduler
poetry run python manage.py runserver
```

Entry point to application: By default http://127.0.0.1:8000/ or http://localhost:8000/


## ISSUES
* Redirecting after loging.

