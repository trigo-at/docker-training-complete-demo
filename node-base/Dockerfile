FROM node:8-slim

RUN mkdir -p /app
WORKDIR /app

ONBUILD ADD package.json /app/
ONBUILD RUN npm install
ONBUILD ADD . /app/

CMD ["npm", "start"]
