FROM node:latest
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
ARG NODE_ENV
ENV NODE_ENV $NODE_ENV
COPY package.json /usr/src/app/
RUN npm install
COPY . /usr/src/app
ENV PORT 3000
EXPOSE $PORT
CMD [ "npm", "start" ]
CMD ["mongod", "--dbpath", "/usr/src/app/data/db"]