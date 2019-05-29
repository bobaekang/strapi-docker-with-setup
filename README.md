# [Strapi containerized](https://github.com/strapi/strapi-docker) with setup

A quick test on dockerized Strapi app, with the following additional setup:

- Always using `--dbclient=sqlite`
- Installing `graphql` plugin.
- Generating API for content types `post` and `comment`.

The following files are adopted from [the official "strapi/strapi-docker" repo](https://github.com/strapi/strapi-docker) with changes if relevant:

- `Dockerfile`
- `healthcheck.js`
- `strapi.sh`
