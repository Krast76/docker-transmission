### Coming Soon ###

### Compose

``` bash
        image: krast/docker-transmission
        container_name: transmission
        environment:
          - TRANSMISSION_USER=user
          - TRANSMISSION_PASSWORD=password
        volumes:œ
          - /path/totorrents:/var/lib/transmission
          - transmission-config:/etc/transmission-daemon

```
