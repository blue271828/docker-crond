#!/bin/sh


OPTIONS=""
if [ -n "${LOG_LEVEL}" ]; then
  OPTIONS="${OPTIONS} -l ${LOG_LEVEL}"
fi
if [ -n "${LOG_FILE}" ]; then
  OPTIONS="${OPTIONS} -L ${LOG_FILE}"
fi

if [ -n "${CRONTAB}" ]; then
  echo "${CRONTAB}" > /etc/crontabs/root
elif [ -n "${CRONTAB_FILE}" ]; then
  cat "${CRONTAB_FILE}" > /etc/crontabs/root
fi

/usr/sbin/crond -f ${OPTIONS}
