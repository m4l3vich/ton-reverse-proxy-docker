# TON Reverse Proxy for Docker

[tonutils/reverse-proxy](https://github.com/tonutils/reverse-proxy) as a Docker image

[![Docker](https://img.shields.io/docker/cloud/build/m4l3vich/ton-reverse-proxy/scratch?label=Docker+Hub&style=flat)](https://hub.docker.com/r/m4l3vich/ton-reverse-proxy/builds)

[На русском](README_RU.md)

`linux/amd64` and `linux/arm64` images are available.

### Deployment

First, you have to generate a config.json file using this command:

```shell
docker run --entrypoint "/gen_config.sh" m4l3vich/ton-reverse-proxy
```

At the end it should output the freshly generated config, save it in a `config.json` file somewhere.

Then you can run the container:

```shell
docker run -p10391:10391/udp -v ./config.json:/app/config.json m4l3vich/ton-reverse-proxy --domain YOUR-TON-DOMAIN.ton
```

*Replace 10391 with your `port` from the config file. Or replace `-p10391:10391` with `--network=host` if you are not familiar with Docker networking.*

If you have any problems (like `lite server error: code 651`), you can try looking here:

- https://telegra.ph/kak-setapnut-svoj-ton-domen-08-01 (Russian)
- https://docs.ton.org/develop/dapps/tutorials/how-to-run-ton-site
- https://github.com/tonutils/reverse-proxy
