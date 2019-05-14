# docker-crond

[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/blue271828/crond.svg)](https://hub.docker.com/r/blue271828/crond)



## Usage

This project provides container images on [Docker Hub](https://hub.docker.com/r/blue271828/crond) .

```bash
$ docker pull blue271828/crond
```



### Environment variables

When you launch the image, you can configure some options.

| Variable       | Default | Description                                                  |
| -------------- | ------- | ------------------------------------------------------------ |
| `TZ`           | `UTC`   | Change the time zone in the container.<br />Refer to [List of tz database time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) If you set an arbitrary time zone. |
| `LOG_LEVEL`    | `8`     | Set log level for crond.<br />This corresponds to crond `-l` option. |
| `LOG_FILE`     | -       | Set a log file for crond.<br />This corresponds to crond `-L` option. |
| `CRONTAB`      | -       | Set crontab settings.<br />If you set this variable. User's crontab file is overwritten on launch. |
| `CRONTAB_FILE` | -       | Set crontab settings by file.<br />This file is ignored if you set `CRONTAB` env. |



### Example

A container will output “hello crond!” every minute when you type the following command.

```bash
$ docker run -it -e CRONTAB='* * * * * echo "hello crond!"' blue271828/crond
```



If you want to run with Docker Compose, the compose file looks like below.

```yaml
version: '3'
services:
  crond:
    image: blue271828/crond
    environment:
      TZ: Asia/Tokyo
      LOG_LEVEL: 1
      LOG_FILE: /var/log/crond/crond.log
      CRONTAB: |
        * * * * * echo "hello crond!"
        * * * * * date
    volumes:
      - ./crond:/var/log/crond
```
