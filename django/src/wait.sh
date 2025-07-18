#!/bin/sh

# wait for the database to start before starting django development server
status=1
until [ $status -eq 0 ]
do
	echo "Checking if database is up: $DB_HOST:$DB_PORT"
	nc -zvw1 $DB_HOST $DB_PORT
	status=${?}
	sleep 1s
done
echo "Database is accepting connections"

# python manage.py runserver_plus 0.0.0.0:8000
# run the command that the script accepted as argument
exec "$@"

