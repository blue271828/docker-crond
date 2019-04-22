#!/bin/sh

OPTIONS=""
if [ -n "${LOG_LEVEL}" ]; then
  OPTIONS="${OPTIONS} -l ${LOG_LEVEL}"
fi
if [ -n "${LOG_FILE}" ]; then
  OPTIONS="${OPTIONS} -L ${LOG_FILE}"
fi

/usr/sbin/crond -f ${OPTIONS}
