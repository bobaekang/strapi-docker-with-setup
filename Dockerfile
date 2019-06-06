FROM node:11-alpine

WORKDIR /usr/src/api

RUN echo "unsafe-perm = true" >> ~/.npmrc

RUN npm install -g strapi@3.0.0-alpha.26.2

COPY strapi*.sh index.html ./

RUN chmod +x ./strapi.sh

EXPOSE 1337

COPY healthcheck.js ./
HEALTHCHECK --interval=15s --timeout=5s --start-period=30s \
  CMD node /usr/src/api/healthcheck.js

CMD ["./strapi.sh"]
