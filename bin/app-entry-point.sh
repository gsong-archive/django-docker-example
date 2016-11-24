#!/bin/bash
set -e

./manage.py collectstatic --noinput
exec uwsgi --chmod-socket --ini /app/config/uwsgi/myproject.ini
