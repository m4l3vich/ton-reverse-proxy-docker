# TON Reverse Proxy for Docker

[tonutils/reverse-proxy](https://github.com/tonutils/reverse-proxy) в виде образа Docker

[![Docker](https://img.shields.io/docker/cloud/build/m4l3vich/ton-reverse-proxy/scratch?label=Docker+Hub&style=flat)](https://hub.docker.com/r/m4l3vich/ton-reverse-proxy/builds)

[English](README.md)

Доступны образы для архитектур `linux/amd64` и `linux/arm64` .

### Развертывание

Для начала нужно сгенерировать файл конфигурации следующей командой:

```shell
docker run --rm --entrypoint "/gen_config.sh" m4l3vich/ton-reverse-proxy
```

В конце вывода появится свежесгенерированная конфигурация. Сохраните её в файл `config.json`. 

После этого можно запустить сам контейнер:

```shell
docker run -p10391:10391/udp -v ./config.json:/app/config.json m4l3vich/ton-reverse-proxy --domain ЗДЕСЬ-ВАШ-ДОМЕН.ton
```

*Где 10391 - `port` из файла конфигурации. Или замените `-p10391:10391` на `--network=host`, если вы не знакомы с тем, как работает сеть в Docker.*

Если возникнут какие-либо проблемы (например `lite server error: code 651`), попробуйте почитать здесь:

- https://telegra.ph/kak-setapnut-svoj-ton-domen-08-01 (Хороший гайд на русском)
- https://docs.ton.org/develop/dapps/tutorials/how-to-run-ton-site
- https://github.com/tonutils/reverse-proxy
