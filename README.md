# nginx-proxy-sync-conf
Synchronizes configurations files between the container and shared volumes

## Getting started
Create a Dockerfile that extends this image

```Dockerfile
FROM hourliert/nginx-proxy-sync-conf

COPY htpasswd .
COPY vhost .
COPY vhost_location .

```

Then in your docker-compose file:

```yaml
version: '2'
services:
  registry-config:
    build: .
    volumes:
      - proxy_vhostd:/vhost.d
      - proxy_htpasswd:/htpasswd
    environment:
      - VIRTUAL_HOST=${REGISTRY_VIRTUAL_HOST}

```