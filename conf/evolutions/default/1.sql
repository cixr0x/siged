# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table actualizacion (
  id                        bigint auto_increment not null,
  texto                     varchar(255),
  fecha                     datetime,
  peticion_id               bigint,
  constraint pk_actualizacion primary key (id))
;

create table peticion (
  id                        bigint auto_increment not null,
  titulo                    varchar(255),
  descripcion               varchar(255),
  fase                      varchar(255),
  creador_username          varchar(255),
  responsable_username      varchar(255),
  fechacreado               datetime,
  fechaasignado             datetime,
  fechacerrado              datetime,
  constraint pk_peticion primary key (id))
;

create table rol (
  codigo                    varchar(255) not null,
  nombre                    varchar(255),
  constraint pk_rol primary key (codigo))
;

create table user (
  username                  varchar(255) not null,
  nombre                    varchar(255),
  apellido                  varchar(255),
  password                  varchar(255),
  correo                    varchar(255),
  constraint pk_user primary key (username))
;


create table user_rol (
  user_username                  varchar(255) not null,
  rol_codigo                     varchar(255) not null,
  constraint pk_user_rol primary key (user_username, rol_codigo))
;
alter table actualizacion add constraint fk_actualizacion_peticion_1 foreign key (peticion_id) references peticion (id) on delete restrict on update restrict;
create index ix_actualizacion_peticion_1 on actualizacion (peticion_id);
alter table peticion add constraint fk_peticion_creador_2 foreign key (creador_username) references user (username) on delete restrict on update restrict;
create index ix_peticion_creador_2 on peticion (creador_username);
alter table peticion add constraint fk_peticion_responsable_3 foreign key (responsable_username) references user (username) on delete restrict on update restrict;
create index ix_peticion_responsable_3 on peticion (responsable_username);



alter table user_rol add constraint fk_user_rol_user_01 foreign key (user_username) references user (username) on delete restrict on update restrict;

alter table user_rol add constraint fk_user_rol_rol_02 foreign key (rol_codigo) references rol (codigo) on delete restrict on update restrict;

# --- !Downs

SET FOREIGN_KEY_CHECKS=0;

drop table actualizacion;

drop table peticion;

drop table rol;

drop table user;

drop table user_rol;

SET FOREIGN_KEY_CHECKS=1;

