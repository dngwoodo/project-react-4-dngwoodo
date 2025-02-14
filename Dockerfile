FROM node:lts-alpine

ENV NODE_ENV production
ENV NPM_CONFIG_LOGLEVEL warn

RUN mkdir /home/node/app/ && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package.json package.json
COPY package-lock.json package-lock.json

USER node

RUN npm ci

COPY --chown=node:node .next .next
COPY --chown=node:node public public

CMD npm start