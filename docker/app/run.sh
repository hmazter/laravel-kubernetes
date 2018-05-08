#!/usr/bin/env ash


if [ "$CONTAINER_ROLE" = "app" ]; then
    echo "Running php-fpm..."
    php-fpm

elif [ "$CONTAINER_ROLE" = "worker" ]; then
    echo "Running queue worker..."
    php artisan queue:work

elif [ "$CONTAINER_ROLE" = "schedule" ]; then
    echo "Running scheduler..."
    while [ true ]
    do
      php artisan schedule:run --verbose --no-interaction &
      sleep 60
    done

else
    echo "No CONTAINER_ROLE specified"
    exit 1
fi
