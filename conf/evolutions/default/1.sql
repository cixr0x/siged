# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table person (
  name                      varchar(255),
  other                     varchar(255))
;

create table peticion (
  id                        bigint auto_increment not null,
  titulo                    varchar(255),
  descripcion               varchar(255),
  fase                      varchar(255),
  constraint pk_peticion primary key (id))
;

create table rol (
  codigo                    varchar(255) not null,
  nombre                    varchar(255),
  constraint pk_rol primary key (codigo))
;

create table tarea (
  id                        bigint auto_increment not null,
  titulo                    varchar(255),
  terminada                 tinyint(1) default 0,
  fecha_entrega             datetime,
  asignado_username         varchar(255),
  peticion_id               bigint,
  constraint pk_tarea primary key (id))
;

create table user (
  username                  varchar(255) not null,
  nombre                    varchar(255),
  apellido                  varchar(255),
  password                  varchar(255),
  correo                    varchar(255),
  constraint pk_user primary key (username))
;


create table peticion_user (
  peticion_id                    bigint not null,
  user_username                  varchar(255) not null,
  constraint pk_peticion_user primary key (peticion_id, user_username))
;

create table user_rol (
  user_username                  varchar(255) not null,
  rol_codigo                     varchar(255) not null,
  constraint pk_user_rol primary key (user_username, rol_codigo))
;
alter table tarea add constraint fk_tarea_asignado_1 foreign key (asignado_username) references user (username) on delete restrict on update restrict;
create index ix_tarea_asignado_1 on tarea (asignado_username);
alter table tarea add constraint fk_tarea_peticion_2 foreign key (peticion_id) references peticion (id) on delete restrict on update restrict;
create index ix_tarea_peticion_2 on tarea (peticion_id);



alter table peticion_user add constraint fk_peticion_user_peticion_01 foreign key (peticion_id) references peticion (id) on delete restrict on update restrict;

alter table peticion_user add constraint fk_peticion_user_user_02 foreign key (user_username) references user (username) on delete restrict on update restrict;

alter table user_rol add constraint fk_user_rol_user_01 foreign key (user_username) references user (username) on delete restrict on update restrict;

alter table user_rol add constraint fk_user_rol_rol_02 foreign key (rol_codigo) references rol (codigo) on delete restrict on update restrict;

# --- !Downs

SET FOREIGN_KEY_CHECKS=0;

drop table person;

drop table peticion;

drop table peticion_user;

drop table rol;

drop table tarea;

drop table user;

drop table user_rol;

SET FOREIGN_KEY_CHECKS=1;

