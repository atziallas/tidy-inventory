#!/bin/sh

# get the ip of the host to be used in django configuration
# (in our case it is the docker bridge)
export HOST_IP=$(ip route | awk '/default/ { print $3 }')

# wait for the database to start before starting django development server
status=1
until [ $status -eq 0 ]
do
	echo "Checking if database is up"
	nc -zvw1 db 5432
	status=${?}
	sleep 1s
done
echo "Database is accepting connections"
python manage.py runserver_plus 0.0.0.0:8000
