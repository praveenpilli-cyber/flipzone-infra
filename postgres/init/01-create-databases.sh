#!/bin/bash
set -e

create_db() {
  local db=$1
  local user=$2
  local pass=$3

  echo "Creating database '$db' with owner '$user'"
  psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "postgres" <<-EOSQL
    CREATE USER $user WITH PASSWORD '$pass';
    CREATE DATABASE $db OWNER $user;
EOSQL
}

create_db catalog_db      catalog_user      "$CATALOG_DB_PASSWORD"
create_db customer_db     customer_user     "$CUSTOMER_DB_PASSWORD"
create_db inventory_db    inventory_user    "$INVENTORY_DB_PASSWORD"
create_db order_db        order_user        "$ORDER_DB_PASSWORD"
create_db payment_db      payment_user      "$PAYMENT_DB_PASSWORD"
create_db notification_db notification_user "$NOTIFICATION_DB_PASSWORD"
create_db keycloak_db     keycloak_user     "$KEYCLOAK_DB_PASSWORD"