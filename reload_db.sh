#!/bin/bash

db_dir='/usr/local/var/mysql55'

if [ $# == 0 ]
then
        echo 'enter db name ...'
        exit 0
fi

cd $db_dir

mysql.server stop

for db_name in $@
do
        if [ ! -f "./$db_name.tar" ]; then
                echo "$db_name.tar not exists"
        else
                echo "===> rm -rf $db_name"
                rm -rf "$db_name"
                echo "===> tar -xf $db_name.tar"
                tar -xf "$db_name.tar"
        fi
done

mysql.server start
