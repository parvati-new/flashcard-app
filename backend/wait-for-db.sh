#!/bin/bash
# wait-for-db.sh

host="$1"
shift
cmd="$@"

until mysql -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USER" -p"$DB_PASSWORD" -e 'SELECT 1' &> /dev/null; do
  echo "MySQL is unavailable - sleeping"
  sleep 2
done

echo "MySQL is up - executing command"
exec $cmd
