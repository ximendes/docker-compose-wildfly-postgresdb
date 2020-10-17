# Docker Compose with WildFly and PostgreSQL

## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Configuration](#configuration)
* [Setup](#setup)

## General info
Docker Compose with WildFly, Postgres and Flyway migration

## Technologies
* [Docker](https://www.docker.com/)
* [Wildfly 9.0.2.final](https://www.wildfly.org/downloads/)
* [Postgres 10](https://www.postgresql.org/docs/10/)
* [Flyway](https://flywaydb.org/)

## Configuration

Postgres database will be start on port 5432 and expose port 5435,
there is an init-database.sh in /database folder, that will be execute some steps:
 - create a database "my_db".
 - create user:docker with password:docker
 - restore database backup dump-my_db.backup.
 - execute initial-script.sql.
 
Flyway will run migrations on database "my_db". 
Scripts that flyway will run is in /flyway folder.

WilFly will start by start-wildfly.sh with some steps:
- Start wildfly
- Add PostgreSQL Driver using wildfly CLI
- Add datasource connection to postgres database using wildfly CLI
- Add wildfly user with username:admin and password:admin

## Setup
To run this project:

```
$ git clone https://github.com/ximendes/docker-compose-wildfly-postgresdb.git
$ cd docker-compose-wildfly-postgresdb
$ docker-compose up -d
```

To see if all works as expected access: http://localhost:8080/
