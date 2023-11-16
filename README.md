# Movie Service API

## Overview
Movie service API provide information about movies and allow the user to review them.

## Requirements

- Ruby 3.2.2
- Rails 7.1.1
- Postgrest
- Redis

## Installation & Setup
Clone the repository and install dependencies
```bash
git clone https://github.com/mcameloa/acme-service.git
cd acme-service
bundle install
```

Start Postgres and Redis with docker-compose
```bash
docker-compose up -d db redis
```
**Note:** You can omit this step if you have your own implementation.

Edit the `config/application.yml` with the credential of the database and redis.

Create database and run migrations
```bash
rails db:create db:migrate
```

For seed the database with the movies run this command
```bash
rails db:seed_genres
rails db:seed_movies
```

run the server
```bash
rails s
```

## Usage
This project integrates RSwag. You can go to the Swagger documentation at
`localhost:3000/api-docs`

## Testing
This project integrates RSpec
```bash
rspec
```
For view the coverage
```bash
open coverage/index.html
```

## Linter
```bash
rubocop -A
```

## Other Commands

If you add more endpoint add the documentation then run:
```bash
rake rswag:specs:swaggerize
```

## LINKS
- [Rubocop](https://rubocop.org) - Linter
- [RSwag](https://github.com/rswag/rswag) - Documentation
- [RSpec](https://rspec.info) - Test
---