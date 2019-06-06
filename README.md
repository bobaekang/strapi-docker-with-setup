# [Strapi containerized](https://github.com/strapi/strapi-docker) with setup

A quick test on dockerized Strapi app, with the following additional setup:

- Add [`traefix`](https://traefik.io/) for reverse-proxying
- Use SQLite for the default database as in [Quick Start](https://strapi.io/documentation/3.0.0-alpha.x/getting-started/quick-start.html))
- Execute shell scripts for scaffolding:
  - Use a custom `public/index.html`
  - Install `graphql` plugin.
  - Generate API for content types `post` and `comment`.

The following files are adopted from [the official "strapi/strapi-docker" repo](https://github.com/strapi/strapi-docker) with changes if relevant:

- `docker-compose.yml`, `mongo.docker-compose.yml`
- `Dockerfile`, `mongo.Dockerfile`
- `healthcheck.js`
- `strapi.sh`, `mongo/strapi.sh`

## Quickstart

1. Clone this repo

```sh
git clone https://github.com/bobaekang/strapi-docker-with-setup.git
cd strapi-docker-with-setup
```

2. Bring up the docker-compose (Add `-d` flag is for [detached mode](https://docs.docker.com/v17.09/compose/reference/up/)) This will build the `test/strapi-docker` image as well.

```sh
docker-compose up
```

If you want to use Mongo for database as in [the official Strapi containerized repo](https://github.com/strapi/strapi-docker), use the following command instead:

```sh
docker-compose -f docker-compose.yml -f mongo.docker-compose.yml up
```

This will combine both Docker Compose files into a single configuration and build the `test/strapi-docker-mongo` image. Refer to [this page of the Docker documentation](https://docs.docker.com/compose/reference/overview/#use--f-to-specify-name-and-path-of-one-or-more-compose-files) for more on combining Compose files.

3. Open `localhost:1337` in a browser and see if the app is running. (It might take some time.)

4. Go to `localhost:1337/admin` and create the root admin account.

5. Run `strapi-scaffold.sh` in the container.

```sh
# add "winpty" before the command for Windows
docker exec -it strapi-docker-with-setup_api_1 ./strapi-scaffold.sh
```

6. Run `docker-compose restart api` to restart Starpi and make new content types available.

That's it!:raised_hands: Now you have a Strapi server running in container with some custom setup.

Feel free to fork this repo and edit files/scripts to further customize it.
