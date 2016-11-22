#!/bin/bash

db_dir='/usr/local/var/mysql55' # your db dir

if [ $# == 0 ]
then
        echo 'enter db name ...'
        exit 0
fi

cd $db_dir

mysql.server stop

for db_name in $@
do
        if [ ! -d "./$db_name" ]; then
                echo "$db_name not exists"
        else
                if [ -f "./$db_name.tar" ]; then
                        echo "===> rm -f $db_name.tar"
                        rm -rf "./$db_name.tar"
                fi
                echo "===> tar -cf $db_name.tar $db_name" 
                tar -cf "$db_name.tar" "$db_name"
                
        fi
done

mysql.server start
