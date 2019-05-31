# [Strapi containerized](https://github.com/strapi/strapi-docker) with setup

A quick test on dockerized Strapi app, with the following additional setup:

- Add [`traefix`](https://traefik.io/) for reverse-proxying
- Always use SQLite for database
- Use a custom `public/index.html`
- Execute shell scripts for scaffolding:
  - Install `graphql` plugin.
  - Generate API for content types `post` and `comment`.

The following files are adopted from [the official "strapi/strapi-docker" repo](https://github.com/strapi/strapi-docker) with changes if relevant:

- `docker-compose.yml`
- `Dockerfile`
- `healthcheck.js`
- `strapi.sh`

## Quickstart

1. Clone this repo

```sh
git clone https://github.com/bobaekang/strapi-docker-with-setup.git
cd strapi-docker-with-setup
```

2. Build the image

```sh
docker build -t test/strapi-docker .
```

3. Bring up the docker-compose (`-d` is for [detached mode](https://docs.docker.com/v17.09/compose/reference/up/))

```sh
docker-compose up -d
```

4. Open `localhost:1337` in a browser and see if the app is running. (It might take some time.)

5. Go to `localhost:1337/admin` and create the root admin account.

6. Run `strapi-scaffold.sh` in the container.

```sh
# add "winpty" before the command for Windows
docker exec -it strapi-docker-with-setup_api_1 ./strapi-scaffold.sh
```

7. Run `docker-compose restart api` to restart Starpi and make new content types available.

That's it!:raised_hands: Now you have a Strapi server running in container with some custom setup.

Feel free to fork this repo and edit files/scripts to further customize it.
