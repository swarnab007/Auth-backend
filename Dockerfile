# using node js alpine lightweight image
FROM node:18-alpine AS build

# Create app directory
WORKDIR /app

# Install app dependencies
COPY package*.json ./

# Install dependencies
RUN npm ci


# Production image
FROM node:18-alpine

WORKDIR /app

# Install app dependencies
COPY package*.json ./

ENV NODE_ENV=production

# Install dependencies
RUN npm ci

# Changes ownership of /app to the node user and sets appropriate permissions.
RUN chown -R node:node /app && chmod -R 755 /app

# pm2 is a process manager 
RUN npm i pm2 -g

COPY ecosystem.config.js .

USER node

EXPOSE 7397

CMD [ "pm2-runtime", "start", "ecosystem.config.js" ]