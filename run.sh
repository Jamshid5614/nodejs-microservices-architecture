#!/usr/bin/env bash

dev_env="development"
prod_prod="production"
node_env=${1:-"production"}

case $OSTYPE in
  solaris*|darwin*|linux*|bsd*) export NODE_ENV=$node_env ;;
  msys*|cygwin*) SET NODE_ENV=$node_env ;;
  *) export NODE_ENV=$node_env ;;
esac

if [[ $node_env = $dev_env || $node_env = $prod_prod ]]
then
    if [ $2 ]
    then
        if [ $node_env == $dev_env]
        then
            osascript -e "tell app \"terminal\" to do script \"
                cd $PWD/apps/$2
                yarn start-dev
            \""
            say "$2 microservice has been launched"
            nodemon index.js
        else
            osascript -e "tell app \"terminal\" to do script \"
                cd $PWD/apps/$2
                yarn start-dev
            \""
            say "$2 microservice has been launched"
            node index.js
        fi
    else
        if [ $node_env == $dev_env ]
        then
            osascript -e "tell app \"terminal\" to do script \"
                cd $PWD/apps/admins
                yarn start-dev
            \""
            osascript -e "tell app \"terminal\" to do script \"
                cd $PWD/apps/customers
                yarn start-dev
            \""
            osascript -e "tell app \"terminal\" to do script \"
                cd $PWD/apps/products
                yarn start-dev
            \""
            say "all microservices have been launched"
            nodemon index.js
        else 
            osascript -e "tell app \"terminal\" to do script \"
                cd $PWD/apps/admins
                yarn start
            \""
            osascript -e "tell app \"terminal\" to do script \"
                cd $PWD/apps/customers
                yarn start
            \""
            osascript -e "tell app \"terminal\" to do script \"
                cd $PWD/apps/products
                yarn start
            \""
            say "all microservices have been launched"
            node index.js
        fi
    fi
else
    if [ $2 ]
    then
        cd apps/$2
        say "$2 microservice has been launched"
        yarn start
    else
        osascript -e "tell app \"terminal\" to do script \"
            cd $PWD/apps/admins
            yarn start
        \""
        osascript -e "tell app \"terminal\" to do script \"
            cd $PWD/apps/customers
            yarn start
        \""
        osascript -e "tell app \"terminal\" to do script \"
            cd $PWD/apps/products
            yarn start
        \""
        say "all microservices have been launched"
    fi
    node index.js
fi