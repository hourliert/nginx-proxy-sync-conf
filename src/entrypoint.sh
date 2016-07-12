#!/bin/sh

IFS=',' read -ra HOSTS <<< "$VIRTUAL_HOST"

echo "Copying config into nginx vhost.d and htpasswd volumes"

for i in "${!HOSTS[@]}"; do
  HOST="${HOSTS[$i]}"

  echo "Configuring $HOST"

  if [ -e "/config/htpasswd" ]
  then
    cp /config/htpasswd /htpasswd/$HOST
  fi

  if [ -e "/config/vhost" ]
  then
    cp /config/vhost /vhost.d/$HOST
  fi

  if [ -e "/config/vhost_location" ]
  then
    cp /config/vhost_location /vhost.d/$HOST_location
  fi

done

echo "Done"