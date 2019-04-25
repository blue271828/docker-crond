# docker-crond

<a href="https://hub.docker.com/r/blue271828/crond">
  <img alt="Docker Cloud Build Status" src="https://img.shields.io/docker/cloud/build/blue271828/crond.svg">
</a>



## Environment variables

You can run this image with the following environment variables if you need.



| Variable    | Default | Description                                                  |
| ----------- | ------- | ------------------------------------------------------------ |
| `TZ`        | `UTC`   | Set time zone. Refer to [List of tz database time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) If you set arbitrary time zone. |
| `LOG_LEVEL` | `8`     | Set log level. This corresponds to crond `-l` option.        |
| `LOG_FILE`  | -       | Set log file. This corresponds to crond `-L` option.         |
| `CRONTAB`   | -       | Set cron setting. If you set this variable. User's crontab file is overwritten on launch. |



## How to run



### docker command

```bash
$ docker run -it \
		-e CRONTAB='* * * * * echo "hello crond!"' \
		blue271828/crond
```



### docker-compose

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



