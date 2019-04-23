# docker-crond



## Environment variables

You can run this image with the following environment variables if you need.



| Variable    | Default | Description                                                  |
| ----------- | ------- | ------------------------------------------------------------ |
| `TZ`        | `UTC`   | Set time zone. Refer to [List of tz database time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) If you set arbitrary time zone. |
| `LOG_LEVEL` | `8`     | Set log level. This corresponds to crond `-l` option.        |
| `LOG_FILE`  | -       | Set log file. This corresponds to crond `-L` option.         |

