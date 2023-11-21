drop index surname_idx;

drop index Author_PK;

drop table Author;

drop index name_book_idx;

drop index Book_PK;

drop table Book;

drop index located_FK;

drop index have_FK;

drop index BookCopy_PK;

drop table BookCopy;

drop index appointed_FK;

drop index Fine_PK;

drop table Fine;

drop index Reader_PK;

drop table Reader;

drop index get_FK;

drop index contains_FK;

drop index Request_PK;

drop table Request;

drop index Relationship_7_FK;

drop index Relationship_6_FK;

drop index Sequence_PK;

drop table Sequence;

drop index receives2_FK;

drop index Subscription_PK;

drop table Subscription;

drop index Unit_PK;

drop table Unit;

/*==============================================================*/
/* Table: Author                                                */
/*==============================================================*/
create table Author (
   surname_author       VARCHAR(255)         not null,
   name_author          VARCHAR(255)         not null,
   last_name_author     VARCHAR(255)         null,
   date_birth_author    DATE                 not null,
   date_die_author      DATE                 null,
   id_author            SERIAL               not null,
   constraint PK_AUTHOR primary key (id_author)
);

/*==============================================================*/
/* Index: Author_PK                                             */
/*==============================================================*/
create unique index Author_PK on Author (
id_author
);

/*==============================================================*/
/* Index: surname_idx                                           */
/*==============================================================*/
create  index surname_idx on Author (
surname_author
);

/*==============================================================*/
/* Table: Book                                                  */
/*==============================================================*/
create table Book (
   publisher_book       VARCHAR(255)         not null,
   name_book            VARCHAR(255)         not null,
   id_book              SERIAL               not null,
   date_publish_book    DATE                 null,
   constraint PK_BOOK primary key (id_book)
);

/*==============================================================*/
/* Index: Book_PK                                               */
/*==============================================================*/
create unique index Book_PK on Book (
id_book
);

/*==============================================================*/
/* Index: name_book_idx                                         */
/*==============================================================*/
create  index name_book_idx on Book (
name_book
);

/*==============================================================*/
/* Table: BookCopy                                              */
/*==============================================================*/
create table BookCopy (
   quality_bc           VARCHAR(20)          not null,
   serial_number_bc     VARCHAR(20)          not null,
   id_book              INT4                 not null,
   id_unit              INT4                 not null,
   constraint PK_BOOKCOPY primary key (serial_number_bc)
);

/*==============================================================*/
/* Index: BookCopy_PK                                           */
/*==============================================================*/
create unique index BookCopy_PK on BookCopy (
serial_number_bc
);

/*==============================================================*/
/* Index: have_FK                                               */
/*==============================================================*/
create  index have_FK on BookCopy (
id_book
);

/*==============================================================*/
/* Index: located_FK                                            */
/*==============================================================*/
create  index located_FK on BookCopy (
id_unit
);

/*==============================================================*/
/* Table: Fine                                                  */
/*==============================================================*/
create table Fine (
   cause_fine           VARCHAR(255)         not null,
   summ_fine            INT4                 not null,
   id_fine              SERIAL               not null,
   id_request           INT4                 not null,
   constraint PK_FINE primary key (id_fine)
);

/*==============================================================*/
/* Index: Fine_PK                                               */
/*==============================================================*/
create unique index Fine_PK on Fine (
id_fine
);

/*==============================================================*/
/* Index: appointed_FK                                          */
/*==============================================================*/
create  index appointed_FK on Fine (
id_request
);

/*==============================================================*/
/* Table: Reader                                                */
/*==============================================================*/
create table Reader (
   fio_reader           VARCHAR(255)         not null,
   phone_reader         CHAR(10)             not null,
   address_reader       VARCHAR(255)         not null,
   id_reader            SERIAL               not null,
   constraint PK_READER primary key (id_reader)
);

/*==============================================================*/
/* Index: Reader_PK                                             */
/*==============================================================*/
create unique index Reader_PK on Reader (
id_reader
);

/*==============================================================*/
/* Table: Request                                               */
/*==============================================================*/
create table Request (
   date_receiving       DATE                 not null,
   id_request           SERIAL               not null,
   serial_number_bc     VARCHAR(20)          not null,
   id_subscription      INT4                 not null,
   date_plan            DATE                 not null,
   date_actual          DATE                 null,
   constraint PK_REQUEST primary key (id_request)
);

/*==============================================================*/
/* Index: Request_PK                                            */
/*==============================================================*/
create unique index Request_PK on Request (
id_request
);

/*==============================================================*/
/* Index: contains_FK                                           */
/*==============================================================*/
create  index contains_FK on Request (
serial_number_bc
);

/*==============================================================*/
/* Index: get_FK                                                */
/*==============================================================*/
create  index get_FK on Request (
id_subscription
);

/*==============================================================*/
/* Table: Sequence                                              */
/*==============================================================*/
create table Sequence (
   id_book              INT4                 not null,
   id_author            INT4                 not null,
   number               INT2                 not null default 1,
   constraint PK_SEQUENCE primary key (id_book, id_author)
);

/*==============================================================*/
/* Index: Sequence_PK                                           */
/*==============================================================*/
create unique index Sequence_PK on Sequence (
id_book,
id_author
);

/*==============================================================*/
/* Index: Relationship_6_FK                                     */
/*==============================================================*/
create  index Relationship_6_FK on Sequence (
id_author
);

/*==============================================================*/
/* Index: Relationship_7_FK                                     */
/*==============================================================*/
create  index Relationship_7_FK on Sequence (
id_book
);

/*==============================================================*/
/* Table: Subscription                                          */
/*==============================================================*/
create table Subscription (
   date_receiving       DATE                 not null,
   date_ending          DATE                 not null,
   id_subscription      SERIAL               not null,
   id_reader            INT4                 not null,
   constraint PK_SUBSCRIPTION primary key (id_subscription)
);

/*==============================================================*/
/* Index: Subscription_PK                                       */
/*==============================================================*/
create unique index Subscription_PK on Subscription (
id_subscription
);

/*==============================================================*/
/* Index: receives2_FK                                          */
/*==============================================================*/
create  index receives2_FK on Subscription (
id_reader
);

/*==============================================================*/
/* Table: Unit                                                  */
/*==============================================================*/
create table Unit (
   name_unit            VARCHAR(255)         not null,
   id_unit              SERIAL               not null,
   constraint PK_UNIT primary key (id_unit)
);

/*==============================================================*/
/* Index: Unit_PK                                               */
/*==============================================================*/
create unique index Unit_PK on Unit (
id_unit
);

alter table BookCopy
   add constraint FK_BOOKCOPY_HAVE_BOOK foreign key (id_book)
      references Book (id_book)
      on delete restrict on update restrict;

alter table BookCopy
   add constraint FK_BOOKCOPY_LOCATED_UNIT foreign key (id_unit)
      references Unit (id_unit)
      on delete restrict on update restrict;

alter table Fine
   add constraint FK_FINE_APPOINTED_REQUEST foreign key (id_request)
      references Request (id_request)
      on delete restrict on update restrict;

alter table Request
   add constraint FK_REQUEST_CONTAINS_BOOKCOPY foreign key (serial_number_bc)
      references BookCopy (serial_number_bc)
      on delete restrict on update restrict;

alter table Request
   add constraint FK_REQUEST_GET_SUBSCRIP foreign key (id_subscription)
      references Subscription (id_subscription)
      on delete restrict on update restrict;

alter table Sequence
   add constraint FK_SEQUENCE_RELATIONS_AUTHOR foreign key (id_author)
      references Author (id_author)
      on delete restrict on update restrict;

alter table Sequence
   add constraint FK_SEQUENCE_RELATIONS_BOOK foreign key (id_book)
      references Book (id_book)
      on delete cascade on update restrict;

alter table Subscription
   add constraint FK_SUBSCRIP_RECEIVES2_READER foreign key (id_reader)
      references Reader (id_reader)
      on delete restrict on update restrict;
