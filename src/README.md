
### Setup 

Requirements:

- Docker
- Docker Compose

Before running `docker-compose up -d` for the first time, you need to run the following commands:

```bash
docker-compose run --rm -v $HOME:/.cahce/composer:/tmp -e COMPOSER_HOME=/tmp php composer install
docker-compose rin --rm node npm install
```

Now you can run:

```bash
docker-compose up -d
```
