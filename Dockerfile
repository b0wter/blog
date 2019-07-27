FROM jguyomard/hugo-builder AS builder
COPY . /src
WORKDIR /src
RUN hugo

FROM nginx:latest
COPY --from=builder /src/public /usr/share/nginx/html
RUN chown -R nginx:nginx /usr/share/nginx/html
