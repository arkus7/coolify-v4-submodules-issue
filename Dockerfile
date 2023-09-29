FROM alpine:latest as build

RUN apk add zola git

WORKDIR /app
COPY . /app

RUN git submodule update --init
RUN zola build

FROM nginx
COPY --from=build /app/public /usr/share/nginx/html


