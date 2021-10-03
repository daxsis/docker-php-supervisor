# docker-php-supervisor
### Setup 

Requirements:

- Docker
- Docker Compose

Before running `docker-compose up -d` for the first time, you need to run the following commands:

```bash
docker-compose run --rm -v $HOME/.cahce/composer:/tmp -e COMPOSER_HOME=/tmp php composer install
docker-compose run --rm node npm install
cp ./src/.env.example .env && vim ./src/.env
```

Now you can run:

```bash
docker-compose up -d
```
Application is accessible at `localhost` and horizon at `localhost/horizon`

And check logs to see that everything is running
```bash
docker-compose logs -f -t
```

To enter inside of the container use
```bash
docker-compose exec php bash
```
