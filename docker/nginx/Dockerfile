# Asset build stage
FROM node:carbon

WORKDIR /application
ADD . .

# install yarn dependencies and build assets
RUN yarn && yarn

FROM nginx:mainline-alpine

LABEL maintainer="krihog@gmail.com"

# Add config
ADD ./docker/nginx/nginx.conf /etc/nginx/conf.d/default.conf

# Add app
ADD . /application

# include all static assets built with webpack/laravel-mix
COPY --from=0 /application/public /application/public

WORKDIR /application
