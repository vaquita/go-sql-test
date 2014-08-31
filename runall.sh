#!/bin/bash

echo updating go-sql-test
git pull

echo creating gosqltest database
mysql -uroot --port=3306 --host=127.0.0.1 -e "create database gosqltest"

export GOPATH=`pwd`

echo downloading the drivers
go get sqltest

cd src/sqltest
go test -v
