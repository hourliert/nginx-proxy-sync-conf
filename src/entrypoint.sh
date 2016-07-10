#!/bin/sh

echo "Copying config into nginx vhost.d and htpasswd volumes"

if [ -e "/config/htpasswd" ]
then
  cp /config/htpasswd /htpasswd/$VIRTUAL_HOST
fi

if [ -e "/config/vhost" ]
then
  cp /config/vhost /vhost.d/$VIRTUAL_HOST
fi

if [ -e "/config/vhost_location" ]
then
  cp /config/vhost_location /vhost.d/$VIRTUAL_HOST_location
fi

echo "Done"