# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table company_model (
  id                        bigint not null,
  name                      varchar(255),
  constraint pk_company_model primary key (id))
;

create table computer_model (
  id                        bigint not null,
  name                      varchar(255),
  introduced                timestamp,
  discontinued              timestamp,
  company_id                bigint,
  constraint pk_computer_model primary key (id))
;

create table flight (
  id                        bigint not null,
  name                      varchar(255),
  constraint pk_flight primary key (id))
;

create table role_model (
  id                        bigint not null,
  name                      varchar(255),
  constraint pk_role_model primary key (id))
;

create table user_model (
  id                        bigint not null,
  name                      varchar(255),
  constraint pk_user_model primary key (id))
;

create sequence company_model_seq;

create sequence computer_model_seq;

create sequence flight_seq;

create sequence role_model_seq;

create sequence user_model_seq;

alter table computer_model add constraint fk_computer_model_company_1 foreign key (company_id) references company_model (id) on delete restrict on update restrict;
create index ix_computer_model_company_1 on computer_model (company_id);



# --- !Downs

SET REFERENTIAL_INTEGRITY FALSE;

drop table if exists company_model;

drop table if exists computer_model;

drop table if exists flight;

drop table if exists role_model;

drop table if exists user_model;

SET REFERENTIAL_INTEGRITY TRUE;

drop sequence if exists company_model_seq;

drop sequence if exists computer_model_seq;

drop sequence if exists flight_seq;

drop sequence if exists role_model_seq;

drop sequence if exists user_model_seq;

