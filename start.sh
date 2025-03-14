#!/bin/sh

ENV_FILE=./.env 
NEXT_ENV_FILE=./CMU-IS432_BlogMindScapeFrontend/.env.production
EXPRESS_ENV_FILE=./CMU-IS432_BlogMindScapeBackend/.env

sh ./scripts/pull.sh


if [ -f $ENV_FILE ]; then
   echo "File $ENV_FILE exists."
else
    echo "File $ENV_FILE does not exist."
    echo "Creating new $ENV_FILE file"
   
    cp ./commons/.env.template ./.env
fi

cp ./commons/.env.template $NEXT_ENV_FILE
cp ./commons/.env.template $EXPRESS_ENV_FILE

echo "Migrating..."
sh ./scripts/migrate.sh

docker-compose down || docker compose down

docker-compose up psql -d || docker compose up psql -d

sleep 10
docker-compose up -d || docker compose up -d
