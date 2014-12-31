# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table person (
  name                      varchar(255),
  other                     varchar(255))
;




# --- !Downs

SET FOREIGN_KEY_CHECKS=0;

drop table person;

SET FOREIGN_KEY_CHECKS=1;

