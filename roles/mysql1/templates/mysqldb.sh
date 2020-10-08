#!/bin/bash
sudo mysql -uroot -proot mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root'; FLUSH PRIVILEGES;"
<<EOF
sudo mysql -uroot -proot mysql -e "create database tender;

use tender;

create table notice(id int(3) not null auto_increment, title varchar(35),info varchar(300), primary key(id));

modify notice set auto_increment=1;


create table vendor(vid varchar(15) primary key,password varchar(20),vname varchar(30),vmob varchar(12),
		vemail varchar(40),company varchar(15),address varchar(100));


create table tender(tid varchar(15) primary key,tname varchar(40),ttype varchar(20),tprice int,
		    tdesc varchar(300),tdeadline date,tloc varchar(70));

create table bidder (bid varchar(15) primary key,vid varchar(15) references vendor(vid),tid varchar(15) references tender(tid),
		bidamount int,deadline date,status varchar(10));


create table tenderstatus(tid varchar(15) primary key references tender(tid),bid varchar(15) references bidder(bid),
		status varchar(15) not null,vid varchar(15) references vendor(vid));
"

EOF
#sudo mysql --host=127.0.0.1 --user=root --password=root --protocol=tcp --show-warnings -e "USE mysql;","UPDATE user SET plugin='mysql_native_password' WHERE User='root';","FLUSH PRIVILEGES;"
