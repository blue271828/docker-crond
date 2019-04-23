#!/bin/sh

if [ -n "${CRONTAB}" ]; then
  echo "${CRONTAB}" > /etc/crontabs/root
fi

OPTIONS=""
if [ -n "${LOG_LEVEL}" ]; then
  OPTIONS="${OPTIONS} -l ${LOG_LEVEL}"
fi
if [ -n "${LOG_FILE}" ]; then
  OPTIONS="${OPTIONS} -L ${LOG_FILE}"
fi

/usr/sbin/crond -f ${OPTIONS}
