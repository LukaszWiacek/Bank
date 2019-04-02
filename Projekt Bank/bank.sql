--------------------------------------------------------
--  File created - niedziela-maj-29-2016   
--------------------------------------------------------
DROP TABLE "STUDENT"."DATAA" cascade constraints;
DROP TABLE "STUDENT"."DATAA_IN" cascade constraints;
DROP TABLE "STUDENT"."DATAA_IN_KOMUNIKAT" cascade constraints;
DROP TABLE "STUDENT"."HISTORIA_TRANSAKCJI" cascade constraints;
DROP TABLE "STUDENT"."KARTA" cascade constraints;
DROP TABLE "STUDENT"."LOKATA" cascade constraints;
DROP TABLE "STUDENT"."RACHUNEK" cascade constraints;
DROP TABLE "STUDENT"."WLASCICIEL" cascade constraints;
DROP SEQUENCE "STUDENT"."KARTA_SEQ";
DROP SEQUENCE "STUDENT"."KOLEJNOSC_TRAN_SEQ";
DROP SEQUENCE "STUDENT"."LOKATA_SEQ";
DROP SEQUENCE "STUDENT"."RACHUNEK_SEQ1";
DROP FUNCTION "STUDENT"."KUPUJ_KARTA_FUN";
DROP PROCEDURE "STUDENT"."ADD_WLASCICEL";
DROP PROCEDURE "STUDENT"."AKTUALIZUJ";
DROP PROCEDURE "STUDENT"."DODAJ_DATE_P";
DROP PROCEDURE "STUDENT"."NOWAKARTA";
DROP PROCEDURE "STUDENT"."NOWALOKATA";
DROP PROCEDURE "STUDENT"."NOWYRACHUNEK";
DROP PROCEDURE "STUDENT"."PRZELEW";
DROP PROCEDURE "STUDENT"."ZERWIJ_LOKATE";
--------------------------------------------------------
--  DDL for Sequence KARTA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "STUDENT"."KARTA_SEQ"  MINVALUE 8001 MAXVALUE 9999 INCREMENT BY 1 START WITH 8361 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence KOLEJNOSC_TRAN_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "STUDENT"."KOLEJNOSC_TRAN_SEQ"  MINVALUE 10000 MAXVALUE 20000 INCREMENT BY 1 START WITH 10220 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence LOKATA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "STUDENT"."LOKATA_SEQ"  MINVALUE 1001 MAXVALUE 2000 INCREMENT BY 1 START WITH 1301 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence RACHUNEK_SEQ1
--------------------------------------------------------

   CREATE SEQUENCE  "STUDENT"."RACHUNEK_SEQ1"  MINVALUE 1 MAXVALUE 1000 INCREMENT BY 1 START WITH 401 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Table DATAA
--------------------------------------------------------

  CREATE TABLE "STUDENT"."DATAA" 
   (	"DATA1" DATE, 
	"AK_DZ" DATE, 
	"AK_MS" DATE, 
	"AK_LOK" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table DATAA_IN
--------------------------------------------------------

  CREATE TABLE "STUDENT"."DATAA_IN" 
   (	"DATA2" DATE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table DATAA_IN_KOMUNIKAT
--------------------------------------------------------

  CREATE TABLE "STUDENT"."DATAA_IN_KOMUNIKAT" 
   (	"KOM" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table HISTORIA_TRANSAKCJI
--------------------------------------------------------

  CREATE TABLE "STUDENT"."HISTORIA_TRANSAKCJI" 
   (	"PESEL" NUMBER(11,0), 
	"NAIDRACHUNKU" NUMBER(4,0), 
	"TYP" VARCHAR2(14 BYTE), 
	"DATA_TRAN" DATE, 
	"NAZWA" VARCHAR2(50 BYTE), 
	"KWOTA" NUMBER(7,2), 
	"WALUTA" VARCHAR2(5 BYTE), 
	"ID" NUMBER(5,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table KARTA
--------------------------------------------------------

  CREATE TABLE "STUDENT"."KARTA" 
   (	"IDKARTY" NUMBER(4,0), 
	"IDRACHUNKU" NUMBER(4,0), 
	"NAZWAKARTY" VARCHAR2(30 BYTE), 
	"DATAWAZNOSCI" DATE, 
	"KWOTLIMITDZ" NUMBER(7,2), 
	"KWOTLIMITMIES" NUMBER(7,2), 
	"WALUTA" VARCHAR2(5 BYTE), 
	"PESEL" NUMBER(11,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table LOKATA
--------------------------------------------------------

  CREATE TABLE "STUDENT"."LOKATA" 
   (	"IDLOKATY" NUMBER(4,0), 
	"IDRACHUNKU" NUMBER(4,0), 
	"NAZWA" VARCHAR2(14 BYTE), 
	"DATA_ZALOZENIA" DATE, 
	"DATA_ZAPADALNOSCI" DATE, 
	"KWOTA" NUMBER(7,2), 
	"OPROCENTOWANIE" NUMBER(1,0), 
	"PESEL" NUMBER(11,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table RACHUNEK
--------------------------------------------------------

  CREATE TABLE "STUDENT"."RACHUNEK" 
   (	"IDRACHUNKU" NUMBER(4,0), 
	"NAZWA" VARCHAR2(30 BYTE), 
	"NRRACHUNKU" CHAR(26 BYTE), 
	"SRODKI" NUMBER(7,2), 
	"PESEL" NUMBER(11,0), 
	"WALUTA" VARCHAR2(5 BYTE), 
	"PRZYZNANY" VARCHAR2(4 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table WLASCICIEL
--------------------------------------------------------

  CREATE TABLE "STUDENT"."WLASCICIEL" 
   (	"PESEL" NUMBER(11,0), 
	"IMIE" VARCHAR2(12 CHAR), 
	"NAZWISKO" VARCHAR2(10 CHAR), 
	"ADRES" VARCHAR2(250 CHAR), 
	"NR_TELEFONU" NUMBER(9,0), 
	"LOGIN" VARCHAR2(20 CHAR), 
	"HASLO" VARCHAR2(20 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into STUDENT.DATAA
SET DEFINE OFF;
Insert into STUDENT.DATAA (DATA1,AK_DZ,AK_MS,AK_LOK) values (to_date('00/06/01','RR/MM/DD'),to_date('00/01/01','RR/MM/DD'),to_date('00/01/01','RR/MM/DD'),to_date('00/01/01','RR/MM/DD'));
REM INSERTING into STUDENT.DATAA_IN
SET DEFINE OFF;
REM INSERTING into STUDENT.DATAA_IN_KOMUNIKAT
SET DEFINE OFF;
Insert into STUDENT.DATAA_IN_KOMUNIKAT (KOM) values ('top');
Insert into STUDENT.DATAA_IN_KOMUNIKAT (KOM) values ('top');
Insert into STUDENT.DATAA_IN_KOMUNIKAT (KOM) values ('top');
Insert into STUDENT.DATAA_IN_KOMUNIKAT (KOM) values ('top');
Insert into STUDENT.DATAA_IN_KOMUNIKAT (KOM) values ('top');
REM INSERTING into STUDENT.HISTORIA_TRANSAKCJI
SET DEFINE OFF;
Insert into STUDENT.HISTORIA_TRANSAKCJI (PESEL,NAIDRACHUNKU,TYP,DATA_TRAN,NAZWA,KWOTA,WALUTA,ID) values ('345','363','Przelew',to_date('00/06/01','RR/MM/DD'),'qqq','-123','PLN','10160');
Insert into STUDENT.HISTORIA_TRANSAKCJI (PESEL,NAIDRACHUNKU,TYP,DATA_TRAN,NAZWA,KWOTA,WALUTA,ID) values ('345','381','Przelew',to_date('00/06/01','RR/MM/DD'),'Zwrot z lokaty','200','PLN','10200');
Insert into STUDENT.HISTORIA_TRANSAKCJI (PESEL,NAIDRACHUNKU,TYP,DATA_TRAN,NAZWA,KWOTA,WALUTA,ID) values ('345','363','Przelew',to_date('00/06/01','RR/MM/DD'),'zzz','-12','PLN','10162');
Insert into STUDENT.HISTORIA_TRANSAKCJI (PESEL,NAIDRACHUNKU,TYP,DATA_TRAN,NAZWA,KWOTA,WALUTA,ID) values ('345','381','Przelew',to_date('00/06/01','RR/MM/DD'),'pierwsza','-50','PLN','10180');
Insert into STUDENT.HISTORIA_TRANSAKCJI (PESEL,NAIDRACHUNKU,TYP,DATA_TRAN,NAZWA,KWOTA,WALUTA,ID) values ('345','381','Przelew',to_date('00/06/01','RR/MM/DD'),'druga','-200','PLN','10181');
REM INSERTING into STUDENT.KARTA
SET DEFINE OFF;
Insert into STUDENT.KARTA (IDKARTY,IDRACHUNKU,NAZWAKARTY,DATAWAZNOSCI,KWOTLIMITDZ,KWOTLIMITMIES,WALUTA,PESEL) values ('8342','381','Mastercard',to_date('02/06/01','RR/MM/DD'),'250','1500','PLN','345');
REM INSERTING into STUDENT.LOKATA
SET DEFINE OFF;
Insert into STUDENT.LOKATA (IDLOKATY,IDRACHUNKU,NAZWA,DATA_ZALOZENIA,DATA_ZAPADALNOSCI,KWOTA,OPROCENTOWANIE,PESEL) values ('1281','381','Na_3_dni',to_date('00/06/01','RR/MM/DD'),to_date('00/06/04','RR/MM/DD'),'50','4','345');
REM INSERTING into STUDENT.RACHUNEK
SET DEFINE OFF;
Insert into STUDENT.RACHUNEK (IDRACHUNKU,NAZWA,NRRACHUNKU,SRODKI,PESEL,WALUTA,PRZYZNANY) values ('363','fff','-6788185483781154931      ','1096','534534','PLN','nie');
Insert into STUDENT.RACHUNEK (IDRACHUNKU,NAZWA,NRRACHUNKU,SRODKI,PESEL,WALUTA,PRZYZNANY) values ('381','nowy','1511018803576926353       ','19950','345','PLN','nie');
REM INSERTING into STUDENT.WLASCICIEL
SET DEFINE OFF;
Insert into STUDENT.WLASCICIEL (PESEL,IMIE,NAZWISKO,ADRES,NR_TELEFONU,LOGIN,HASLO) values ('534534','Bob','Cena','ggg 3','5462359','aaa','aaa');
Insert into STUDENT.WLASCICIEL (PESEL,IMIE,NAZWISKO,ADRES,NR_TELEFONU,LOGIN,HASLO) values ('345','John','Cena','ter','534','qqq','qqq');
--------------------------------------------------------
--  DDL for Index LOKATA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STUDENT"."LOKATA_PK" ON "STUDENT"."LOKATA" ("IDLOKATY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index RACHUNEK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STUDENT"."RACHUNEK_PK" ON "STUDENT"."RACHUNEK" ("IDRACHUNKU") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index WLASCICIEL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STUDENT"."WLASCICIEL_PK" ON "STUDENT"."WLASCICIEL" ("PESEL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table LOKATA
--------------------------------------------------------

  ALTER TABLE "STUDENT"."LOKATA" MODIFY ("PESEL" NOT NULL ENABLE);
  ALTER TABLE "STUDENT"."LOKATA" MODIFY ("IDLOKATY" NOT NULL ENABLE);
  ALTER TABLE "STUDENT"."LOKATA" ADD CONSTRAINT "LOKATA_PK" PRIMARY KEY ("IDLOKATY")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table RACHUNEK
--------------------------------------------------------

  ALTER TABLE "STUDENT"."RACHUNEK" MODIFY ("IDRACHUNKU" NOT NULL ENABLE);
  ALTER TABLE "STUDENT"."RACHUNEK" ADD CONSTRAINT "RACHUNEK_PK" PRIMARY KEY ("IDRACHUNKU")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "STUDENT"."RACHUNEK" MODIFY ("PESEL" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table WLASCICIEL
--------------------------------------------------------

  ALTER TABLE "STUDENT"."WLASCICIEL" MODIFY ("PESEL" NOT NULL ENABLE);
  ALTER TABLE "STUDENT"."WLASCICIEL" MODIFY ("IMIE" NOT NULL ENABLE);
  ALTER TABLE "STUDENT"."WLASCICIEL" MODIFY ("NAZWISKO" NOT NULL ENABLE);
  ALTER TABLE "STUDENT"."WLASCICIEL" MODIFY ("ADRES" NOT NULL ENABLE);
  ALTER TABLE "STUDENT"."WLASCICIEL" MODIFY ("NR_TELEFONU" NOT NULL ENABLE);
  ALTER TABLE "STUDENT"."WLASCICIEL" MODIFY ("LOGIN" NOT NULL ENABLE);
  ALTER TABLE "STUDENT"."WLASCICIEL" MODIFY ("HASLO" NOT NULL ENABLE);
  ALTER TABLE "STUDENT"."WLASCICIEL" ADD CONSTRAINT "WLASCICIEL_PK" PRIMARY KEY ("PESEL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HISTORIA_TRANSAKCJI
--------------------------------------------------------

  ALTER TABLE "STUDENT"."HISTORIA_TRANSAKCJI" ADD CONSTRAINT "HISTORIA_TRANSAKCJI_RACHU_FK2" FOREIGN KEY ("NAIDRACHUNKU")
	  REFERENCES "STUDENT"."RACHUNEK" ("IDRACHUNKU") ON DELETE CASCADE ENABLE;
  ALTER TABLE "STUDENT"."HISTORIA_TRANSAKCJI" ADD CONSTRAINT "HISTORIA_TRANSAKCJI_WLASC_FK1" FOREIGN KEY ("PESEL")
	  REFERENCES "STUDENT"."WLASCICIEL" ("PESEL") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table KARTA
--------------------------------------------------------

  ALTER TABLE "STUDENT"."KARTA" ADD CONSTRAINT "KARTA_RACHUNEK_FK1" FOREIGN KEY ("IDRACHUNKU")
	  REFERENCES "STUDENT"."RACHUNEK" ("IDRACHUNKU") ON DELETE CASCADE ENABLE;
  ALTER TABLE "STUDENT"."KARTA" ADD CONSTRAINT "KARTA_WLASCICIEL_FK1" FOREIGN KEY ("PESEL")
	  REFERENCES "STUDENT"."WLASCICIEL" ("PESEL") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table LOKATA
--------------------------------------------------------

  ALTER TABLE "STUDENT"."LOKATA" ADD CONSTRAINT "LOKATA_RACHUNEK_FK1" FOREIGN KEY ("IDRACHUNKU")
	  REFERENCES "STUDENT"."RACHUNEK" ("IDRACHUNKU") ON DELETE CASCADE ENABLE;
  ALTER TABLE "STUDENT"."LOKATA" ADD CONSTRAINT "LOKATA_WLASCICIEL_FK1" FOREIGN KEY ("PESEL")
	  REFERENCES "STUDENT"."WLASCICIEL" ("PESEL") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RACHUNEK
--------------------------------------------------------

  ALTER TABLE "STUDENT"."RACHUNEK" ADD CONSTRAINT "RACHUNEK_WLASCICIEL_FK1" FOREIGN KEY ("PESEL")
	  REFERENCES "STUDENT"."WLASCICIEL" ("PESEL") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  DDL for Trigger DODAJ_DATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "STUDENT"."DODAJ_DATE" 
AFTER
INSERT
ON dataa_in
begin
dodaj_date_p;
end;
/
ALTER TRIGGER "STUDENT"."DODAJ_DATE" ENABLE;
--------------------------------------------------------
--  DDL for Function KUPUJ_KARTA_FUN
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "STUDENT"."KUPUJ_KARTA_FUN" (
id_rach number,
id_kart number,
kwota number,
info varchar2
) return varchar2
is
kwot_lim_dz number(7,2);
kwot_lim_ms number(7,2);
srodki_temp number(7,2);
walut  varchar(5);

dataz date;
pes number(11,0);
begin
select pesel into pes from rachunek where idrachunku=id_rach;
select data1 into dataz from dataa where rownum = 1;


select KWOTLIMITDZ into kwot_lim_dz from karta where idkarty=id_kart;
select KWOTLIMITMIES into kwot_lim_ms from karta where idkarty=id_kart;

kwot_lim_dz:=kwot_lim_dz - kwota;
kwot_lim_ms:=kwot_lim_ms - kwota;

update karta set KWOTLIMITDZ=kwot_lim_dz where idkarty=id_kart;
update karta set KWOTLIMITMIES=kwot_lim_ms where idkarty=id_kart;


select srodki into srodki_temp from rachunek where idrachunku=id_rach;
srodki_temp:=srodki_temp - kwota;

update rachunek set srodki=srodki_temp where idrachunku=id_rach;

select waluta into walut from rachunek where idrachunku=id_rach;

insert into historia_transakcji values(pes,id_rach,'Pay_by_card',dataz,info,-kwota,walut,kolejnosc_tran_seq.NEXTVAL);
return  walut;
end;

/
--------------------------------------------------------
--  DDL for Procedure ADD_WLASCICEL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "STUDENT"."ADD_WLASCICEL" 
(
pesel in number,
imie in varchar2,
nazwisko in varchar2,
adres in varchar2,
nr_telefonu in number,
login in varchar2,
haslo in varchar2
)
is 
begin
insert into wlasciciel values(pesel, imie, nazwisko ,adres ,nr_telefonu ,login ,haslo);
end;

/
--------------------------------------------------------
--  DDL for Procedure AKTUALIZUJ
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "STUDENT"."AKTUALIZUJ" 
(
 
info in varchar2
)
is
actual_date date;
 dat_zalozenia date;
 dat_zapadalnosci date;
 
 min_id_lok number (4,0);
 max_id_lok number (4,0);
 
 nazw_lok varchar2(14);
 
 dodane number(7,2);
 idrach number(4,0);
 srodkii number(7,2);
 kwotaa number(7,2);
 walut varchar(5);
  pes number(11,0);
 info2 varchar2(50);
 ilosc number(7,2);
begin
 select data1 into actual_date from dataa where rownum=1;
select max(idlokaty) into max_id_lok from lokata;
select min(idlokaty) into min_id_lok from lokata;
select count(idlokaty) into ilosc from lokata;

 

if(ilosc = 0)
then
null;
else


for i in min_id_lok .. max_id_lok loop

 

select nazwa into nazw_lok from lokata where idlokaty=i;
select kwota into kwotaa from lokata where idlokaty=i;
 select data_zalozenia into dat_zalozenia from lokata where idlokaty=i;
 select DATA_ZAPADALNOSCI into dat_zapadalnosci from lokata where idlokaty=i;

 info2:= info || '"'|| nazw_lok ||'"';

 select lokata.pesel into pes from lokata join rachunek using(idrachunku) where idlokaty=i;
select idrachunku into idrach from lokata join rachunek using(idrachunku) where idlokaty=i;
select srodki into srodkii from rachunek join lokata using(idrachunku) where idlokaty=i;
 select waluta into walut from lokata join rachunek using(idrachunku) where idlokaty=i;
 
 
 if(nazw_lok = 'Na_3_dni')
 then
if(actual_date >= dat_zapadalnosci)
then

 select srodki into srodkii from rachunek join lokata using(idrachunku) where idlokaty=i;
dodane:=(((4*kwotaa)/100)/30*3)+kwotaa;
srodkii:=srodkii+dodane;
 
insert into HISTORIA_TRANSAKCJI values(pes,idrach,'Przelew',dat_zapadalnosci,info2,dodane, walut,kolejnosc_tran_seq.NEXTVAL);

update rachunek set srodki = srodkii where idrachunku=idrach;
delete from lokata where idlokaty=i;
 
 end if;
 
 end if;

 
 
  if (nazw_lok = 'Na_2_Miesiace')
 then
select srodki into srodkii from rachunek join lokata using(idrachunku) where idlokaty=i;
dodane:=((5*kwotaa)/100*2) +kwotaa;
srodkii:=srodkii+dodane;
 
insert into HISTORIA_TRANSAKCJI values(pes,idrach,'Przelew',dat_zapadalnosci,info2,dodane, walut,kolejnosc_tran_seq.NEXTVAL);

update rachunek set srodki = srodkii where idrachunku=idrach;
delete from lokata where idlokaty=i;
 
 end if;
 
 if (nazw_lok = 'Na_6_Miesiecy')
 then
select srodki into srodkii from rachunek join lokata using(idrachunku) where idlokaty=i;
dodane:=((8*kwotaa)/100*6)+kwotaa;
srodkii:=srodkii+dodane;
 
insert into HISTORIA_TRANSAKCJI values(pes,idrach,'Przelew',dat_zapadalnosci,info2,dodane, walut,kolejnosc_tran_seq.NEXTVAL);

update rachunek set srodki = srodkii where idrachunku=idrach;
delete from lokata where idlokaty=i;
 
 end if;

end loop;
end if;

end;

/
--------------------------------------------------------
--  DDL for Procedure DODAJ_DATE_P
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "STUDENT"."DODAJ_DATE_P" 
is
data_temp1 date;
data_temp2 date;
begin

select Data1 into data_temp1 from dataa where rownum = 1;
select Data2 into data_temp2 from dataa_in where rownum = 1;

if data_temp1 > data_temp2 then

    delete from dataa_in;
    delete from dataa_in_komunikat;
      insert into dataa_in_komunikat values('nie');
else
    delete from dataa_in;
    update dataa set data1 =data_temp2 where rownum=1;
    
    delete from dataa_in_komunikat;
      insert into dataa_in_komunikat values('top');
     
end if;
end;

/
--------------------------------------------------------
--  DDL for Procedure NOWAKARTA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "STUDENT"."NOWAKARTA" (

idrachunkuu   number,
nazwakarty   varchar2  

)
is
walutbin varchar(4);
pes number;
actual_date date;
datawaznosci date;

begin

select data1 into actual_date from dataa;

select Add_Months(actual_date,24) into datawaznosci from dataa;

select waluta into walutbin from rachunek where idrachunku=idrachunkuu;
select pesel into pes from rachunek where idrachunku=idrachunkuu;

if nazwakarty='VISA'
then
insert into karta values (karta_seq.NEXTVAL, idrachunkuu, nazwakarty, datawaznosci,200,2100,walutbin,pes);
else
insert into karta values (karta_seq.NEXTVAL, idrachunkuu, nazwakarty, datawaznosci,250,1500,walutbin,pes);
end if;
end;

/
--------------------------------------------------------
--  DDL for Procedure NOWALOKATA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "STUDENT"."NOWALOKATA" (

idrachunkuz  in number, 
nazwa_net in varchar2,
kwota in number,
info2 in varchar2
)
is

nazwaz varchar2(14 char);
data_zalozenia date;
data_zapadalnisci date;
oprocentowanie number(1);
nowe_srodki_rach number(7,2);


pes number(11,0);
walut varchar(5);
nazwa_rach varchar(30);
begin
 select nazwa into nazwa_rach from rachunek where idrachunku=idrachunkuz;

 

select waluta into walut from rachunek where idrachunku=idrachunkuz;
select pesel into pes from rachunek where idrachunku=idrachunkuz;



select data1 into data_zalozenia  from dataa;


if nazwa_net = '3dni'
then
nazwaz:='Na_3_dni';
select data_zalozenia+3 into data_zapadalnisci from dataa;
oprocentowanie:=4;
insert into lokata values (lokata_seq.NEXTVAL, idrachunkuz,nazwaz,data_zalozenia,data_zapadalnisci,kwota, oprocentowanie,pes);
 
insert into historia_transakcji values(pes,idrachunkuz,'Przelew',data_zalozenia,info2,-kwota,walut,kolejnosc_tran_seq.NEXTVAL);

elsif nazwa_net='2mies'
then
nazwaz:='Na_2_Miesiace';
select Add_Months(data_zalozenia,2)  into data_zapadalnisci from dataa;
oprocentowanie:=5;
insert into lokata values (lokata_seq.NEXTVAL, idrachunkuz,nazwaz,data_zalozenia,data_zapadalnisci,kwota, oprocentowanie,pes);
 
insert into historia_transakcji values(pes,idrachunkuz,'Przelew',data_zalozenia,info2,-kwota,walut,kolejnosc_tran_seq.NEXTVAL);


else
nazwaz:='Na_6_Miesiecy';
select Add_Months(data_zalozenia,6)  into data_zapadalnisci from dataa;
oprocentowanie:=6;
insert into lokata values (lokata_seq.NEXTVAL, idrachunkuz,nazwaz,data_zalozenia,data_zapadalnisci,kwota, oprocentowanie,pes);
 
insert into historia_transakcji values(pes,idrachunkuz,'Przelew',data_zalozenia,info2,-kwota,walut,kolejnosc_tran_seq.NEXTVAL);

end if;
select srodki into nowe_srodki_rach from rachunek where idrachunku=idrachunkuz;

nowe_srodki_rach:=nowe_srodki_rach-kwota;
update rachunek set srodki=nowe_srodki_rach where idrachunku=idrachunkuz;

end;

/
--------------------------------------------------------
--  DDL for Procedure NOWYRACHUNEK
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "STUDENT"."NOWYRACHUNEK" (

nazwa in varchar2,
nrrachunku  varchar2,   -- losuj
srodki in number,
pesel in char,
waluta in varchar2
)
is
begin
insert into rachunek values (rachunek_seq1.NEXTVAL,nazwa,nrrachunku,srodki,pesel,waluta,'nie');
end;

/
--------------------------------------------------------
--  DDL for Procedure PRZELEW
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "STUDENT"."PRZELEW" ( 

id_rach_na in number,
id_rach_wyjs in number,
kwota in number,
info1 in varchar,
info2 in varchar
)
is
kwota_temp number(7,3);
walut_wyjs varchar(5);
walut_na varchar(5);
kwota2 number(7,3);
pes number(11,0);
pes2 number(11,0);
dat date;
begin
select data1 into dat from dataa where rownum=1;

select pesel into pes from  rachunek where idrachunku=id_rach_wyjs;
select pesel into pes2 from  rachunek where idrachunku=id_rach_na;

select waluta into walut_wyjs from rachunek where idrachunku=id_rach_wyjs;
select waluta into walut_na from rachunek where idrachunku=id_rach_na;

select srodki into kwota_temp from rachunek where idrachunku=id_rach_wyjs;

if(walut_wyjs !=walut_na)
then
kwota_temp:=kwota_temp-kwota-((2*kwota)/100);
elsif(walut_wyjs =walut_na)
then
kwota_temp:=kwota_temp-kwota;
update rachunek set srodki=kwota_temp where idrachunku=id_rach_wyjs;
end if;

if(walut_wyjs='PLN')
then

if(walut_na='GBP')
then
kwota2:=kwota/5.7141;
elsif(walut_na='EUR')
then
kwota2:=kwota/4.1106;
end if;

elsif(walut_wyjs='EUR')
then

if(walut_na='GBP')
then
kwota2:=kwota/0.7193;
elsif(walut_na='PLN')
then
kwota2:=kwota*4.1106;
end if;

elsif(walut_wyjs='GBP')
then

if(walut_na='EUR')
then
kwota2:=kwota*0.7193;
elsif(walut_na='PLN')
then
kwota2:=kwota*5.7141;
end if;
end if;

if(walut_wyjs =walut_na)
then
kwota2:=kwota;
end if;

select srodki into kwota_temp from rachunek where idrachunku=id_rach_na;
kwota_temp:=kwota_temp-(-kwota2);
update rachunek set srodki=kwota_temp where idrachunku=id_rach_na;

insert into HISTORIA_TRANSAKCJI values(pes2,id_rach_wyjs,'Przelew',dat,info1,-kwota,walut_wyjs,kolejnosc_tran_seq.NEXTVAL);
insert into HISTORIA_TRANSAKCJI values(pes,id_rach_na,'Przelew',dat,info2,kwota2,walut_na,kolejnosc_tran_seq.NEXTVAL);

end;

/
--------------------------------------------------------
--  DDL for Procedure ZERWIJ_LOKATE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "STUDENT"."ZERWIJ_LOKATE" (
id_lok in number,
id_rach in number,
info in varchar2
)
is
kwota_tmp number(7,2);
kwota_tmp2 number(7,2);

pes number(11);
data_op date;
walut varchar2(5);
begin
select pesel into pes from rachunek where idrachunku=id_rach;
select data1 into data_op from dataa where rownum=1;
select waluta into walut from rachunek where idrachunku=id_rach;

select srodki into kwota_tmp from rachunek where idrachunku=id_rach;
select kwota into kwota_tmp2 from lokata where idlokaty=id_lok;
delete from lokata where idlokaty=id_lok;

kwota_tmp:=kwota_tmp+kwota_tmp2;
update rachunek set srodki=kwota_tmp where idrachunku=id_rach;

insert into historia_transakcji values(pes,id_rach,'Przelew',data_op,info,kwota_tmp2,walut,kolejnosc_tran_seq.NEXTVAL);

end;

/
