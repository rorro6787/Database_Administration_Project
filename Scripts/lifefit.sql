--------------------------------------------------------
-- Archivo creado  - lunes-abril-29-2024   
--------------------------------------------------------
BEGIN
  DBMS_RLS.DROP_POLICY (
    object_schema    => 'LIFEFIT',
    object_name      => 'SESIÓN',
    policy_name      => 'POL_SESION'
  );
END;
/
DROP SEQUENCE "LIFEFIT"."SEQ_EJERCICIOS";
DROP SEQUENCE "LIFEFIT"."SEQ_USUARIOS";
DROP TABLE "LIFEFIT"."CENTRO" cascade constraints;
DROP TABLE "LIFEFIT"."CITA" cascade constraints;
DROP TABLE "LIFEFIT"."CLIENTE" cascade constraints;
DROP TABLE "LIFEFIT"."CONFORMAN" cascade constraints;
DROP TABLE "LIFEFIT"."DIETA" cascade constraints;
DROP TABLE "LIFEFIT"."EJERCICIO" cascade constraints;
DROP TABLE "LIFEFIT"."EJERCICIOS_EXT" cascade constraints;
DROP TABLE "LIFEFIT"."ELEMENTOCALENDARIO" cascade constraints;
DROP TABLE "LIFEFIT"."ENTRENA" cascade constraints;
DROP TABLE "LIFEFIT"."ENTRENADOR" cascade constraints;
DROP TABLE "LIFEFIT"."GERENTE" cascade constraints;
DROP TABLE "LIFEFIT"."PLAN" cascade constraints;
DROP TABLE "LIFEFIT"."RUTINA" cascade constraints;
DROP TABLE "LIFEFIT"."SESIÓN" cascade constraints;
DROP TABLE "LIFEFIT"."USUARIO" cascade constraints;
DROP VIEW "LIFEFIT"."V_CORREO_USUARIO";
DROP VIEW "LIFEFIT"."V_CITA";
DROP VIEW "LIFEFIT"."VEJERCICIO";
DROP VIEW "LIFEFIT"."V_OBJETIVO_CLIENTE";
DROP VIEW "LIFEFIT"."V_VIDEO_SESION";
DROP VIEW "LIFEFIT"."V_SESION";
DROP VIEW "LIFEFIT"."V_DATOS_CLIENTE";
DROP VIEW "LIFEFIT"."V_VIDEOS";
DROP MATERIALIZED VIEW "LIFEFIT"."VM_EJERCICIOS";

--------------------------------------------------------
--  DDL for Sequence SEQ_EJERCICIOS
--------------------------------------------------------

   CREATE SEQUENCE  "LIFEFIT"."SEQ_EJERCICIOS"  MINVALUE 100 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 100 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL;

--------------------------------------------------------
--  DDL for Sequence SEQ_USUARIOS
--------------------------------------------------------

   CREATE SEQUENCE  "LIFEFIT"."SEQ_USUARIOS"  MINVALUE 100 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 100 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table CENTRO
--------------------------------------------------------

  CREATE TABLE "LIFEFIT"."CENTRO" 
   (	"ID" NUMBER, 
	"NOMBRE" VARCHAR2(40 BYTE) ENCRYPT, 
	"DIRECCIÓN" VARCHAR2(60 BYTE) ENCRYPT, 
	"CÓDIGOPOSTAL" VARCHAR2(20 BYTE) ENCRYPT
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_LIFEFIT" ;
  GRANT DELETE ON "LIFEFIT"."CENTRO" TO "R_GERENTE";
  GRANT INSERT ON "LIFEFIT"."CENTRO" TO "R_GERENTE";
  GRANT SELECT ON "LIFEFIT"."CENTRO" TO "R_GERENTE";
  GRANT UPDATE ON "LIFEFIT"."CENTRO" TO "R_GERENTE";
--------------------------------------------------------
--  DDL for Table CITA
--------------------------------------------------------

  CREATE TABLE "LIFEFIT"."CITA" 
   (	"FECHAYHORA" TIMESTAMP (6), 
	"ID" NUMBER, 
	"MODALIDAD" VARCHAR2(16 BYTE), 
	"CLIENTE_ID" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "TS_LIFEFIT" ;
  GRANT DELETE ON "LIFEFIT"."CITA" TO "R_ENTRENADOR";
  GRANT SELECT ON "LIFEFIT"."CITA" TO "R_ENTRENADOR";
  GRANT UPDATE ("FECHAYHORA", "MODALIDAD") ON "LIFEFIT"."CITA" TO "R_ENTRENADOR";
  GRANT INSERT ON "LIFEFIT"."CITA" TO "R_CLIENTE";
  
--------------------------------------------------------
--  DDL for Table CLIENTE
--------------------------------------------------------

  CREATE TABLE "LIFEFIT"."CLIENTE" 
   (	"ID" NUMBER, 
	"OBJETIVO" VARCHAR2(24 BYTE), 
	"PREFERENCIAS" VARCHAR2(16 BYTE), 
	"CENTRO_ID" NUMBER, 
	"DIETA_ID" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "TS_LIFEFIT" ;
  GRANT DELETE ON "LIFEFIT"."CLIENTE" TO "R_GERENTE";
  GRANT INSERT ON "LIFEFIT"."CLIENTE" TO "R_GERENTE";
  GRANT SELECT ON "LIFEFIT"."CLIENTE" TO "R_GERENTE";
  GRANT UPDATE ON "LIFEFIT"."CLIENTE" TO "R_GERENTE";
  GRANT UPDATE ("DIETA_ID") ON "LIFEFIT"."CLIENTE" TO "R_ENTRENADOR_NUTRICION";
--------------------------------------------------------
--  DDL for Table CONFORMAN
--------------------------------------------------------

  CREATE TABLE "LIFEFIT"."CONFORMAN" 
   (	"SERIES" NUMBER, 
	"REPETICIONES" NUMBER, 
	"DURACIÓN" VARCHAR2(16 BYTE), 
	"RUTINA_ID" NUMBER, 
	"EJERCICIO_ID" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "TS_LIFEFIT" ;
  GRANT DELETE ON "LIFEFIT"."CONFORMAN" TO "R_ENTRENADOR";
  GRANT INSERT ON "LIFEFIT"."CONFORMAN" TO "R_ENTRENADOR";
  GRANT SELECT ON "LIFEFIT"."CONFORMAN" TO "R_ENTRENADOR";
  GRANT UPDATE ON "LIFEFIT"."CONFORMAN" TO "R_ENTRENADOR";
--------------------------------------------------------
--  DDL for Table DIETA
--------------------------------------------------------

  CREATE TABLE "LIFEFIT"."DIETA" 
   (	"ID" NUMBER, 
	"NOMBRE" VARCHAR2(40 BYTE), 
	"DESCRIPCIÓN" VARCHAR2(40 BYTE), 
	"TIPO" VARCHAR2(16 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "TS_LIFEFIT" ;
  GRANT DELETE ON "LIFEFIT"."DIETA" TO "R_ENTRENADOR_NUTRICION";
  GRANT INSERT ON "LIFEFIT"."DIETA" TO "R_ENTRENADOR_NUTRICION";
  GRANT SELECT ON "LIFEFIT"."DIETA" TO "R_ENTRENADOR_NUTRICION";
  GRANT UPDATE ON "LIFEFIT"."DIETA" TO "R_ENTRENADOR_NUTRICION";
--------------------------------------------------------
--  DDL for Table EJERCICIO
--------------------------------------------------------

  CREATE TABLE "LIFEFIT"."EJERCICIO" 
   (	"ID" NUMBER, 
	"NOMBRE" VARCHAR2(24 BYTE), 
	"DESCRIPCIÓN" VARCHAR2(4000 BYTE), 
	"VÍDEO" VARCHAR2(60 BYTE), 
	"IMAGEN" BLOB, 
	"PUBLICO" CHAR(1 BYTE) DEFAULT 'S'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_LIFEFIT" 
 LOB ("IMAGEN") STORE AS SECUREFILE (
  TABLESPACE "TS_LIFEFIT" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
  GRANT DELETE ON "LIFEFIT"."EJERCICIO" TO "R_ENTRENADOR";
  GRANT INSERT ON "LIFEFIT"."EJERCICIO" TO "R_ENTRENADOR";
  GRANT SELECT ON "LIFEFIT"."EJERCICIO" TO "R_ENTRENADOR";
  GRANT UPDATE ON "LIFEFIT"."EJERCICIO" TO "R_ENTRENADOR";
--------------------------------------------------------
--  DDL for Table EJERCICIOS_EXT
--------------------------------------------------------

  CREATE TABLE "LIFEFIT"."EJERCICIOS_EXT" 
   (	"EJERCICIO" VARCHAR2(100 BYTE), 
	"DESCRIPCION" VARCHAR2(4000 BYTE), 
	"ENLACEALVIDEO" VARCHAR2(200 BYTE)
   ) 
   ORGANIZATION EXTERNAL 
    ( TYPE ORACLE_LOADER
      DEFAULT DIRECTORY "DIRECTORIO_EXT"
      ACCESS PARAMETERS
      ( RECORDS DELIMITED BY NEWLINE 
        skip 1 
        CHARACTERSET UTF8 
        FIELDS TERMINATED BY ';' 
        OPTIONALLY ENCLOSED BY '"' 
        MISSING FIELD VALUES ARE NULL
            (Ejercicio, Descripcion, EnlacealVideo) 
        )
      LOCATION
       ( 'Ejercicios.csv'
       )
    )
   REJECT LIMIT 0 ;
--------------------------------------------------------
--  DDL for Table ELEMENTOCALENDARIO
--------------------------------------------------------

  CREATE TABLE "LIFEFIT"."ELEMENTOCALENDARIO" 
   (	"FECHAYHORA" TIMESTAMP (6), 
	"ENTRENADOR_ID" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "TS_LIFEFIT" ;
  GRANT DELETE ON "LIFEFIT"."ELEMENTOCALENDARIO" TO "R_ENTRENADOR";
  GRANT INSERT ON "LIFEFIT"."ELEMENTOCALENDARIO" TO "R_ENTRENADOR";
  GRANT SELECT ON "LIFEFIT"."ELEMENTOCALENDARIO" TO "R_ENTRENADOR";
  GRANT UPDATE ON "LIFEFIT"."ELEMENTOCALENDARIO" TO "R_ENTRENADOR";
--------------------------------------------------------
--  DDL for Table ENTRENA
--------------------------------------------------------

  CREATE TABLE "LIFEFIT"."ENTRENA" 
   (	"ESPECIALIDAD" VARCHAR2(16 BYTE), 
	"CLIENTE_ID" NUMBER, 
	"ENTRENADOR_ID" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "TS_LIFEFIT" ;
  GRANT DELETE ON "LIFEFIT"."ENTRENA" TO "R_ENTRENADOR";
  GRANT INSERT ON "LIFEFIT"."ENTRENA" TO "R_ENTRENADOR";
  GRANT UPDATE ON "LIFEFIT"."ENTRENA" TO "R_ENTRENADOR";
--------------------------------------------------------
--  DDL for Table ENTRENADOR
--------------------------------------------------------

  CREATE TABLE "LIFEFIT"."ENTRENADOR" 
   (	"ID" NUMBER, 
	"DISPONIBILIDAD" VARCHAR2(24 BYTE), 
	"CENTRO_ID" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "TS_LIFEFIT" ;
  GRANT DELETE ON "LIFEFIT"."ENTRENADOR" TO "R_GERENTE";
  GRANT INSERT ON "LIFEFIT"."ENTRENADOR" TO "R_GERENTE";
  GRANT SELECT ON "LIFEFIT"."ENTRENADOR" TO "R_GERENTE";
  GRANT UPDATE ON "LIFEFIT"."ENTRENADOR" TO "R_GERENTE";
--------------------------------------------------------
--  DDL for Table GERENTE
--------------------------------------------------------

  CREATE TABLE "LIFEFIT"."GERENTE" 
   (	"ID" NUMBER, 
	"DESPACHO" VARCHAR2(8 BYTE), 
	"HORARIO" VARCHAR2(24 BYTE), 
	"CENTRO_ID" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "TS_LIFEFIT" ;
--------------------------------------------------------
--  DDL for Table PLAN
--------------------------------------------------------

  CREATE TABLE "LIFEFIT"."PLAN" 
   (	"INICIO" VARCHAR2(16 BYTE), 
	"FIN" VARCHAR2(16 BYTE), 
	"ENTRENA_CLIENTE_ID" NUMBER, 
	"ENTRENA_ID1" NUMBER, 
	"RUTINA_ID" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "TS_LIFEFIT" ;
  GRANT DELETE ON "LIFEFIT"."PLAN" TO "R_ENTRENADOR";
  GRANT INSERT ON "LIFEFIT"."PLAN" TO "R_ENTRENADOR";
  GRANT UPDATE ON "LIFEFIT"."PLAN" TO "R_ENTRENADOR";
  GRANT SELECT ON "LIFEFIT"."PLAN" TO "R_ENTRENADOR";
--------------------------------------------------------
--  DDL for Table RUTINA
--------------------------------------------------------

  CREATE TABLE "LIFEFIT"."RUTINA" 
   (	"ID" NUMBER, 
	"NOMBRE" VARCHAR2(30 BYTE), 
	"DESCRIPCIÓN" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "TS_LIFEFIT" ;
  GRANT DELETE ON "LIFEFIT"."RUTINA" TO "R_ENTRENADOR";
  GRANT INSERT ON "LIFEFIT"."RUTINA" TO "R_ENTRENADOR";
  GRANT UPDATE ON "LIFEFIT"."RUTINA" TO "R_ENTRENADOR";
  GRANT SELECT ON "LIFEFIT"."RUTINA" TO "R_ENTRENADOR";
--------------------------------------------------------
--  DDL for Table SESIÓN
--------------------------------------------------------

  CREATE TABLE "LIFEFIT"."SESIÓN" 
   (	"INICIO" VARCHAR2(16 BYTE), 
	"FIN" VARCHAR2(16 BYTE), 
	"PRESENCIAL" CHAR(1 BYTE), 
	"DESCRIPCIÓN" VARCHAR2(50 BYTE), 
	"VIDEO" VARCHAR2(60 BYTE), 
	"DATOSSALUD" VARCHAR2(40 BYTE), 
	"PLAN_INICIO" VARCHAR2(16 BYTE), 
	"PLAN_ENTRENA_CLIENTE_ID" NUMBER, 
	"PLAN_ENTRENA_ID1" NUMBER, 
	"PLAN_RUTINA_ID" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "TS_LIFEFIT" ;
  GRANT DELETE ON "LIFEFIT"."SESIÓN" TO "R_ENTRENADOR";
  GRANT SELECT ON "LIFEFIT"."SESIÓN" TO "R_ENTRENADOR";
  GRANT INSERT ON "LIFEFIT"."SESIÓN" TO "R_ENTRENADOR";
  GRANT UPDATE ON "LIFEFIT"."SESIÓN" TO "R_ENTRENADOR";
--------------------------------------------------------
--  DDL for Table USUARIO
--------------------------------------------------------

  CREATE TABLE "LIFEFIT"."USUARIO" 
   (	"ID" NUMBER, 
	"NOMBRE" VARCHAR2(50 BYTE), 
	"APELLIDOS" VARCHAR2(50 BYTE), 
	"TELEFONO" VARCHAR2(16 BYTE), 
	"DIRECCION" VARCHAR2(50 BYTE), 
	"CORREO" VARCHAR2(80 BYTE), 
	"USUARIOORACLE" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_LIFEFIT" ;
--------------------------------------------------------
--  DDL for View V_CORREO_USUARIO
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "LIFEFIT"."V_CORREO_USUARIO" ("CORREO") AS 
  SELECT correo FROM lifefit.usuario
;
  GRANT SELECT ON "LIFEFIT"."V_CORREO_USUARIO" TO "R_ENTRENADOR";
--------------------------------------------------------
--  DDL for View VEJERCICIO
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "LIFEFIT"."VEJERCICIO" ("ID", "NOMBRE", "DESCRIPCIÓN", "VÍDEO", "IMAGEN") AS 
  SELECT id, nombre, descripcion, video, imagen FROM "LIFEFIT"."EJERCICIO" where publico = 'S'
;
--------------------------------------------------------
--  DDL for View V_OBJETIVO_CLIENTE
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "LIFEFIT"."V_OBJETIVO_CLIENTE" ("OBJETIVO") AS 
  SELECT objetivo FROM lifefit.cliente
;
  GRANT SELECT ON "LIFEFIT"."V_OBJETIVO_CLIENTE" TO "R_ENTRENADOR";
--------------------------------------------------------
--  DDL for View V_VIDEO_SESION
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "LIFEFIT"."V_VIDEO_SESION" ("VIDEO") AS 
  SELECT video FROM lifefit.sesión
;
  GRANT SELECT ON "LIFEFIT"."V_VIDEO_SESION" TO "R_ENTRENADOR";
  
--------------------------------------------------------
--  DDL for View V_CITA
--------------------------------------------------------

  create view "V_CITA" as select
  FECHAYHORA, CITA.ID, MODALIDAD
  from CITA join USUARIO on "LIFEFIT"."CITA"."CLIENTE_ID" = "LIFEFIT"."USUARIO"."ID"
  where usuariooracle = user;

  grant select on "V_CITA" to "R_CLIENTE";
  grant delete on "V_CITA" to "R_CLIENTE";
  grant update on "V_CITA" to "R_CLIENTE";
  
--------------------------------------------------------
--  DDL for View V_SESION
--------------------------------------------------------
  
  create view "V_SESION" as select
  INICIO, FIN, PRESENCIAL, DESCRIPCIÓN, VIDEO, DATOSSALUD, OBJETIVO, PREFERENCIAS
  from SESIÓN join USUARIO on SESIÓN.PLAN_ENTRENA_CLIENTE_ID = USUARIO.ID join CLIENTE on USUARIO.ID = CLIENTE.ID
  where usuariooracle = user;
  
  grant select on "V_SESION" to "R_CLIENTE";
  grant update on "V_SESION" to R_CLIENTE;
  grant delete on "V_SESION" to "R_CLIENTE";
  grant insert on "V_SESION" to R_CLIENTE;

--------------------------------------------------------
--  DDL for V_VIDEOS
--------------------------------------------------------

CREATE VIEW V_VIDEOS AS
SELECT VIDEO FROM SESIÓN JOIN USUARIO ON (USUARIO.ID = SESIÓN.PLAN_ENTRENA_ID1) WHERE USUARIO.USUARIOORACLE = USER;
GRANT SELECT ON V_VIDEOS TO R_ENTRENADOR;

--------------------------------------------------------
--  DDL for V_DATOS_CLIENTE
--------------------------------------------------------

CREATE VIEW V_DATOS_CLIENTE AS
SELECT SESIÓN.INICIO, SESIÓN.FIN, SESIÓN.DESCRIPCIÓN, SESIÓN.DATOSSALUD, CLIENTE.OBJETIVO
FROM SESIÓN JOIN USUARIO ON (USUARIO.ID = SESIÓN.PLAN_ENTRENA_ID1) JOIN CLIENTE ON (CLIENTE.ID = SESIÓN.PLAN_ENTRENA_CLIENTE_ID) 
WHERE USUARIO.USUARIOORACLE = USER;
GRANT SELECT ON V_DATOS_CLIENTE TO R_ENTRENADOR;

--------------------------------------------------------
--  DDL for Materialized View VM_EJERCICIOS
--------------------------------------------------------

  CREATE MATERIALIZED VIEW "LIFEFIT"."VM_EJERCICIOS" ("ID", "NOMBRE", "DESCRIPCIÓN", "VÍDEO", "IMAGEN")
  SEGMENT CREATION IMMEDIATE
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_LIFEFIT" 
 LOB ("IMAGEN") STORE AS SECUREFILE (
  TABLESPACE "TS_LIFEFIT" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
  BUILD IMMEDIATE
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_LIFEFIT" 
  REFRESH FORCE ON DEMAND START WITH sysdate+0 NEXT TRUNC(SYSDATE) + 1
  WITH PRIMARY KEY USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS DISABLE ON QUERY COMPUTATION DISABLE QUERY REWRITE
  AS SELECT "EJERCICIO"."ID" "ID","EJERCICIO"."NOMBRE" "NOMBRE","EJERCICIO"."DESCRIPCIÓN" "DESCRIPCIÓN","EJERCICIO"."VÍDEO" "VÍDEO","EJERCICIO"."IMAGEN" "IMAGEN" FROM "EJERCICIO" "EJERCICIO";

   COMMENT ON MATERIALIZED VIEW "LIFEFIT"."VM_EJERCICIOS"  IS 'snapshot table for snapshot LIFEFIT.VM_EJERCICIOS';
REM INSERTING into LIFEFIT.CENTRO
SET DEFINE OFF;
Insert into LIFEFIT.CENTRO (ID,NOMBRE,"DIRECCIÓN","CÓDIGOPOSTAL") values ('10','Gimnasio FitLife','Calle de la Victoria, 12','29012');
Insert into LIFEFIT.CENTRO (ID,NOMBRE,"DIRECCIÓN","CÓDIGOPOSTAL") values ('20','Gimnasio SportZone','Avenida de Andalucía, 34','29006');
Insert into LIFEFIT.CENTRO (ID,NOMBRE,"DIRECCIÓN","CÓDIGOPOSTAL") values ('30','Gimnasio Vitality','Calle de la Unión, 8','29004');
Insert into LIFEFIT.CENTRO (ID,NOMBRE,"DIRECCIÓN","CÓDIGOPOSTAL") values ('40','Gimnasio BodyFit','Calle de la Paz, 21','29002');
Insert into LIFEFIT.CENTRO (ID,NOMBRE,"DIRECCIÓN","CÓDIGOPOSTAL") values ('50','Gimnasio PowerFlex','Avenida de la Constitución, 45','29008');
Insert into LIFEFIT.CENTRO (ID,NOMBRE,"DIRECCIÓN","CÓDIGOPOSTAL") values ('60','Gimnasio ActiveLife','Calle de la Alcazabilla, 17','29015');
Insert into LIFEFIT.CENTRO (ID,NOMBRE,"DIRECCIÓN","CÓDIGOPOSTAL") values ('70','Gimnasio IronStrong','Calle de la Trinidad, 5','29001');
Insert into LIFEFIT.CENTRO (ID,NOMBRE,"DIRECCIÓN","CÓDIGOPOSTAL") values ('80','Gimnasio FitZone','Avenida de la Malagueta, 28','29016');
Insert into LIFEFIT.CENTRO (ID,NOMBRE,"DIRECCIÓN","CÓDIGOPOSTAL") values ('90','Gimnasio Wellness','Calle de la Merced, 10','29013');
Insert into LIFEFIT.CENTRO (ID,NOMBRE,"DIRECCIÓN","CÓDIGOPOSTAL") values ('100','Gimnasio FlexFit','Avenida de la Aurora, 9','29005');
Insert into LIFEFIT.CENTRO (ID,NOMBRE,"DIRECCIÓN","CÓDIGOPOSTAL") values ('110','Gimnasio BodyTech','Calle de la Alameda, 22','29014');
Insert into LIFEFIT.CENTRO (ID,NOMBRE,"DIRECCIÓN","CÓDIGOPOSTAL") values ('120','Gimnasio EliteFitness','Avenida de la Rosaleda, 7','29010');
Insert into LIFEFIT.CENTRO (ID,NOMBRE,"DIRECCIÓN","CÓDIGOPOSTAL") values ('130','Gimnasio ActiveZone','Calle de la Victoria, 18','29011');
Insert into LIFEFIT.CENTRO (ID,NOMBRE,"DIRECCIÓN","CÓDIGOPOSTAL") values ('140','Gimnasio PowerGym','Avenida de la Malagueta, 12','29017');
Insert into LIFEFIT.CENTRO (ID,NOMBRE,"DIRECCIÓN","CÓDIGOPOSTAL") values ('150','Gimnasio FitFlex','Calle de la Unión, 14','29003');
Insert into LIFEFIT.CENTRO (ID,NOMBRE,"DIRECCIÓN","CÓDIGOPOSTAL") values ('160','Gimnasio SportLife','Avenida de Andalucía, 22','29007');
Insert into LIFEFIT.CENTRO (ID,NOMBRE,"DIRECCIÓN","CÓDIGOPOSTAL") values ('170','Gimnasio VitalFit','Calle de la Paz, 31','29001');
Insert into LIFEFIT.CENTRO (ID,NOMBRE,"DIRECCIÓN","CÓDIGOPOSTAL") values ('180','Gimnasio BodyZone','Avenida de la Constitución, 50','29009');
Insert into LIFEFIT.CENTRO (ID,NOMBRE,"DIRECCIÓN","CÓDIGOPOSTAL") values ('190','Gimnasio IronFit','Calle de la Alcazabilla, 21','29016');
Insert into LIFEFIT.CENTRO (ID,NOMBRE,"DIRECCIÓN","CÓDIGOPOSTAL") values ('200','Gimnasio FitStrong','Calle de la Trinidad, 8','29002');
Insert into LIFEFIT.CENTRO (ID,NOMBRE,"DIRECCIÓN","CÓDIGOPOSTAL") values ('210','Gimnasio ActiveFit','Avenida de la Malagueta, 32','29018');
Insert into LIFEFIT.CENTRO (ID,NOMBRE,"DIRECCIÓN","CÓDIGOPOSTAL") values ('220','Gimnasio WellnessZone','Calle de la Merced, 15','29014');
Insert into LIFEFIT.CENTRO (ID,NOMBRE,"DIRECCIÓN","CÓDIGOPOSTAL") values ('230','Gimnasio FlexLife','Avenida de la Aurora, 12','29006');
Insert into LIFEFIT.CENTRO (ID,NOMBRE,"DIRECCIÓN","CÓDIGOPOSTAL") values ('240','Gimnasio BodyFlex','Calle de la Alameda, 25','29015');
Insert into LIFEFIT.CENTRO (ID,NOMBRE,"DIRECCIÓN","CÓDIGOPOSTAL") values ('250','Gimnasio EliteFit','Avenida de la Rosaleda, 10','29011');
Insert into LIFEFIT.CENTRO (ID,NOMBRE,"DIRECCIÓN","CÓDIGOPOSTAL") values ('260','Gimnasio ActiveGym','Calle de la Victoria, 20','29010');
Insert into LIFEFIT.CENTRO (ID,NOMBRE,"DIRECCIÓN","CÓDIGOPOSTAL") values ('270','Gimnasio PowerLife','Avenida de la Malagueta, 15','29017');
Insert into LIFEFIT.CENTRO (ID,NOMBRE,"DIRECCIÓN","CÓDIGOPOSTAL") values ('280','Gimnasio FitTech','Calle de la Unión, 10','29003');
Insert into LIFEFIT.CENTRO (ID,NOMBRE,"DIRECCIÓN","CÓDIGOPOSTAL") values ('290','Gimnasio SportFlex','Avenida de Andalucía, 28','29008');
Insert into LIFEFIT.CENTRO (ID,NOMBRE,"DIRECCIÓN","CÓDIGOPOSTAL") values ('300','Gimnasio VitalFlex','Calle de la Paz, 28','29001');
REM INSERTING into LIFEFIT.CITA
SET DEFINE OFF;
REM INSERTING into LIFEFIT.CLIENTE
SET DEFINE OFF;
REM INSERTING into LIFEFIT.CONFORMAN
SET DEFINE OFF;
REM INSERTING into LIFEFIT.DIETA
SET DEFINE OFF;
REM INSERTING into LIFEFIT.EJERCICIO
SET DEFINE OFF;
Insert into LIFEFIT.EJERCICIO (ID,NOMBRE,"DESCRIPCIÓN","VÍDEO",PUBLICO) values ('1','Sentadillas','Ejercicio básico para fortalecer las piernas. Párate con los pies separados al ancho de los hombros y baja el cuerpo doblando las rodillas, manteniendo la espalda recta. Luego, vuelve a la posición inicial.','https://www.youtube.com/watch?v=QKKZ9AGYTi4','S');
Insert into LIFEFIT.EJERCICIO (ID,NOMBRE,"DESCRIPCIÓN","VÍDEO",PUBLICO) values ('2','Flexiones de Brazos','Ejercicio para fortalecer los músculos del pecho, hombros y tríceps. Apóyate en el suelo con las manos a la altura de los hombros, manteniendo el cuerpo recto y descendiendo hasta que los codos estén en un ángulo de 90 grados','https://www.youtube.com/watch?v=UwRLWMcOdwI','S');
Insert into LIFEFIT.EJERCICIO (ID,NOMBRE,"DESCRIPCIÓN","VÍDEO",PUBLICO) values ('3','Plancha Abdominal','Ejercicio de isometría para fortalecer el core. Colócate en posición de plancha, apoyando el peso en los antebrazos y los dedos de los pies, manteniendo el cuerpo recto y los músculos abdominales contraídos.','https://www.youtube.com/watch?v=TvxNkmjdhMM','S');
Insert into LIFEFIT.EJERCICIO (ID,NOMBRE,"DESCRIPCIÓN","VÍDEO",PUBLICO) values ('4','Levantamiento de Pesas','Ejercicio de fuerza que se puede adaptar a diferentes grupos musculares. Utiliza pesas adecuadas para tu nivel de fuerza, mantén una postura adecuada y realiza movimientos controlados para evitar lesiones.','https://www.youtube.com/watch?v=qEwKCR5JCog','S');
Insert into LIFEFIT.EJERCICIO (ID,NOMBRE,"DESCRIPCIÓN","VÍDEO",PUBLICO) values ('5','Burpees','Ejercicio que combina flexiones, saltos y sentadillas. Comienza en posición de cuclillas, luego apoya las manos en el suelo, estira las piernas hacia atrás realizando una flexión, lleva las piernas de vuelta a la posición de cuclillas y salta','https://www.youtube.com/watch?v=JZQA08SlJnM','S');
Insert into LIFEFIT.EJERCICIO (ID,NOMBRE,"DESCRIPCIÓN","VÍDEO",PUBLICO) values ('6','Dominadas','Ejercicio para fortalecer la espalda y los brazos. Agárrate a una barra con las manos separadas al ancho de los hombros y levántate hasta que la barbilla esté por encima de la barra. Luego, baja lentamente hasta la posición inicial.','https://www.youtube.com/watch?v=eGo4IYlbE5g','S');
Insert into LIFEFIT.EJERCICIO (ID,NOMBRE,"DESCRIPCIÓN","VÍDEO",PUBLICO) values ('7','Zancadas','Ejercicio para fortalecer las piernas y glúteos. Da un paso adelante con una pierna y flexiona ambas rodillas hasta que las piernas formen ángulos de 90 grados. Luego, vuelve a la posición inicial y repite con la otra pierna.','https://www.youtube.com/watch?v=QOVaHwm-Q6U','S');
Insert into LIFEFIT.EJERCICIO (ID,NOMBRE,"DESCRIPCIÓN","VÍDEO",PUBLICO) values ('8','Flexiones Diamante','Variante de las flexiones que enfatiza más en los tríceps. Coloca las manos juntas debajo del pecho, formando un diamante con los pulgares y los índices. Realiza las flexiones manteniendo los codos cerca del cuerpo.','https://www.youtube.com/watch?v=Jx4cT2Ny8Mg','S');
Insert into LIFEFIT.EJERCICIO (ID,NOMBRE,"DESCRIPCIÓN","VÍDEO",PUBLICO) values ('9','Elevaciones Laterales','Ejercicio para fortalecer los hombros y los músculos del deltoides medio. De pie, con una mancuerna en cada mano, levanta los brazos hacia los lados hasta que estén paralelos al suelo, luego baja lentamente.','https://www.youtube.com/watch?v=yho0e_9rOwA','S');
Insert into LIFEFIT.EJERCICIO (ID,NOMBRE,"DESCRIPCIÓN","VÍDEO",PUBLICO) values ('10','Plancha Lateral','Ejercicio para trabajar los músculos abdominales, oblicuos y estabilizadores del core. Acuéstate de lado apoyándote en el antebrazo y el costado del pie, mantén el cuerpo en línea recta y sostén la posición durante el tiempo deseado.','https://www.youtube.com/watch?v=zf0RBDYF8iE','S');
REM INSERTING into LIFEFIT.EJERCICIOS_EXT
SET DEFINE OFF;
REM INSERTING into LIFEFIT.ELEMENTOCALENDARIO
SET DEFINE OFF;
REM INSERTING into LIFEFIT.ENTRENA
SET DEFINE OFF;
REM INSERTING into LIFEFIT.ENTRENADOR
SET DEFINE OFF;
REM INSERTING into LIFEFIT.GERENTE
SET DEFINE OFF;
REM INSERTING into LIFEFIT.PLAN
SET DEFINE OFF;
REM INSERTING into LIFEFIT.RUTINA
SET DEFINE OFF;
REM INSERTING into LIFEFIT."SESIÓN"
SET DEFINE OFF;
REM INSERTING into LIFEFIT.USUARIO
SET DEFINE OFF;
Insert into LIFEFIT.USUARIO (ID,NOMBRE,APELLIDOS,TELEFONO,DIRECCION,CORREO,USUARIOORACLE) values ('1','Ana','García Pérez','678123456','Calle del Sol, 5','ana.garcia@email.com',null);
Insert into LIFEFIT.USUARIO (ID,NOMBRE,APELLIDOS,TELEFONO,DIRECCION,CORREO,USUARIOORACLE) values ('2','José','López Martínez','612987654','Avenida de la Luna, 12','jose.lopez@email.com',null);
Insert into LIFEFIT.USUARIO (ID,NOMBRE,APELLIDOS,TELEFONO,DIRECCION,CORREO,USUARIOORACLE) values ('3','María','Rodríguez Sánchez','655234567','Calle de la Playa, 8','maria.rodriguez@email.com',null);
Insert into LIFEFIT.USUARIO (ID,NOMBRE,APELLIDOS,TELEFONO,DIRECCION,CORREO,USUARIOORACLE) values ('4','David','Fernández González','633345678','Avenida del Mar, 20','david.fernandez@email.com',null);
Insert into LIFEFIT.USUARIO (ID,NOMBRE,APELLIDOS,TELEFONO,DIRECCION,CORREO,USUARIOORACLE) values ('5','Laura','Martín Romero','644456789','Calle de la Montaña, 15','laura.martin@email.com',null);
Insert into LIFEFIT.USUARIO (ID,NOMBRE,APELLIDOS,TELEFONO,DIRECCION,CORREO,USUARIOORACLE) values ('6','Carlos','Pérez García','600567890','Avenida del Bosque, 30','carlos.perez@email.com',null);
Insert into LIFEFIT.USUARIO (ID,NOMBRE,APELLIDOS,TELEFONO,DIRECCION,CORREO,USUARIOORACLE) values ('7','Sofía','González López','677678901','Calle del Río, 25','sofia.gonzalez@email.com',null);
Insert into LIFEFIT.USUARIO (ID,NOMBRE,APELLIDOS,TELEFONO,DIRECCION,CORREO,USUARIOORACLE) values ('8','Pablo','Romero Martínez','688789012','Avenida de la Ciudad, 18','pablo.romero@email.com',null);
Insert into LIFEFIT.USUARIO (ID,NOMBRE,APELLIDOS,TELEFONO,DIRECCION,CORREO,USUARIOORACLE) values ('9','Isabel','Sánchez Rodríguez','655890123','Calle de la Estrella, 10','isabel.sanchez@email.com',null);
Insert into LIFEFIT.USUARIO (ID,NOMBRE,APELLIDOS,TELEFONO,DIRECCION,CORREO,USUARIOORACLE) values ('10','Adrián','López Fernández','633901234','Avenida del Parque, 22','adrian.lopez@email.com',null);
Insert into LIFEFIT.USUARIO (ID,NOMBRE,APELLIDOS,TELEFONO,DIRECCION,CORREO,USUARIOORACLE) values ('11','Andrea','Rodríguez García','644012345','Calle del Paseo, 14','andrea.rodriguez@email.com',null);
Insert into LIFEFIT.USUARIO (ID,NOMBRE,APELLIDOS,TELEFONO,DIRECCION,CORREO,USUARIOORACLE) values ('12','Javier','Fernández Pérez','600123456','Avenida de la Plaza, 28','javier.fernandez@email.com',null);
Insert into LIFEFIT.USUARIO (ID,NOMBRE,APELLIDOS,TELEFONO,DIRECCION,CORREO,USUARIOORACLE) values ('13','Paula','Martín Sánchez','677234567','Calle de la Fuente, 7','paula.martin@email.com',null);
Insert into LIFEFIT.USUARIO (ID,NOMBRE,APELLIDOS,TELEFONO,DIRECCION,CORREO,USUARIOORACLE) values ('14','Alejandro','Pérez Romero','688345678','Avenida del Jardín, 9','alejandro.perez@email.com',null);
Insert into LIFEFIT.USUARIO (ID,NOMBRE,APELLIDOS,TELEFONO,DIRECCION,CORREO,USUARIOORACLE) values ('15','Elena','González Martínez','655456789','Calle de la Cuesta, 11','elena.gonzalez@email.com',null);
Insert into LIFEFIT.USUARIO (ID,NOMBRE,APELLIDOS,TELEFONO,DIRECCION,CORREO,USUARIOORACLE) values ('16','Miguel','Romero López','633567890','Avenida de la Colina, 5','miguel.romero@email.com',null);
Insert into LIFEFIT.USUARIO (ID,NOMBRE,APELLIDOS,TELEFONO,DIRECCION,CORREO,USUARIOORACLE) values ('17','Valeria','Sánchez García','644678901','Calle del Bosque, 12','valeria.sanchez@email.com',null);
Insert into LIFEFIT.USUARIO (ID,NOMBRE,APELLIDOS,TELEFONO,DIRECCION,CORREO,USUARIOORACLE) values ('18','Daniel','López Sánchez','600789012','Avenida del Mar, 17','daniel.lopez@email.com',null);
Insert into LIFEFIT.USUARIO (ID,NOMBRE,APELLIDOS,TELEFONO,DIRECCION,CORREO,USUARIOORACLE) values ('19','Alba','Rodríguez Pérez','677890123','Calle de la Luna, 20','alba.rodriguez@email.com',null);
Insert into LIFEFIT.USUARIO (ID,NOMBRE,APELLIDOS,TELEFONO,DIRECCION,CORREO,USUARIOORACLE) values ('20','Iván','Fernández Martínez','688901234','Avenida de la Playa, 14','ivan.fernandez@email.com',null);
Insert into LIFEFIT.USUARIO (ID,NOMBRE,APELLIDOS,TELEFONO,DIRECCION,CORREO,USUARIOORACLE) values ('21','Carmen','Martín García','655012345','Calle de la Montaña, 9','carmen.martin@email.com',null);
Insert into LIFEFIT.USUARIO (ID,NOMBRE,APELLIDOS,TELEFONO,DIRECCION,CORREO,USUARIOORACLE) values ('22','Rubén','Pérez Romero','633123456','Avenida del Río, 22','ruben.perez@email.com',null);
Insert into LIFEFIT.USUARIO (ID,NOMBRE,APELLIDOS,TELEFONO,DIRECCION,CORREO,USUARIOORACLE) values ('23','Sara','González Sánchez','644234567','Calle de la Ciudad, 16','sara.gonzalez@email.com',null);
Insert into LIFEFIT.USUARIO (ID,NOMBRE,APELLIDOS,TELEFONO,DIRECCION,CORREO,USUARIOORACLE) values ('24','Aitor','Romero López','600345678','Avenida de la Estrella, 8','aitor.romero@email.com',null);
Insert into LIFEFIT.USUARIO (ID,NOMBRE,APELLIDOS,TELEFONO,DIRECCION,CORREO,USUARIOORACLE) values ('25','Natalia','López García','677456789','Calle del Parque, 11','natalia.lopez@email.com',null);
Insert into LIFEFIT.USUARIO (ID,NOMBRE,APELLIDOS,TELEFONO,DIRECCION,CORREO,USUARIOORACLE) values ('26','Hugo','Rodríguez Martínez','688567890','Avenida del Paseo, 19','hugo.rodriguez@email.com',null);
Insert into LIFEFIT.USUARIO (ID,NOMBRE,APELLIDOS,TELEFONO,DIRECCION,CORREO,USUARIOORACLE) values ('27','Olivia','Fernández Pérez','655678901','Calle de la Plaza, 27','olivia.fernandez@email.com',null);
Insert into LIFEFIT.USUARIO (ID,NOMBRE,APELLIDOS,TELEFONO,DIRECCION,CORREO,USUARIOORACLE) values ('28','Diego','Martín Sánchez','633789012','Avenida de la Fuente, 6','diego.martin@email.com',null);
Insert into LIFEFIT.USUARIO (ID,NOMBRE,APELLIDOS,TELEFONO,DIRECCION,CORREO,USUARIOORACLE) values ('29','Valentina','Pérez Romero','644890123','Calle del Jardín, 8','valentina.perez@email.com',null);
Insert into LIFEFIT.USUARIO (ID,NOMBRE,APELLIDOS,TELEFONO,DIRECCION,CORREO,USUARIOORACLE) values ('30','Álvaro','González Martínez','600901234','Avenida de la Cuesta, 10','alvaro.gonzalez@email.com',null);
--------------------------------------------------------
--  DDL for Index CENTRO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LIFEFIT"."CENTRO_PK" ON "LIFEFIT"."CENTRO" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_INDICES" ;
--------------------------------------------------------
--  DDL for Index CITA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LIFEFIT"."CITA_PK" ON "LIFEFIT"."CITA" ("FECHAYHORA", "ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "TS_INDICES" ;
--------------------------------------------------------
--  DDL for Index CITA_PKV1
--------------------------------------------------------

  CREATE UNIQUE INDEX "LIFEFIT"."CITA_PKV1" ON "LIFEFIT"."CITA" ("CLIENTE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "TS_LIFEFIT" ;
--------------------------------------------------------
--  DDL for Index CLIENTE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LIFEFIT"."CLIENTE_PK" ON "LIFEFIT"."CLIENTE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "TS_INDICES" ;
--------------------------------------------------------
--  DDL for Index CONFORMAN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LIFEFIT"."CONFORMAN_PK" ON "LIFEFIT"."CONFORMAN" ("RUTINA_ID", "EJERCICIO_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "TS_INDICES" ;
--------------------------------------------------------
--  DDL for Index DIETA_NOMBRE_UN
--------------------------------------------------------

  CREATE UNIQUE INDEX "LIFEFIT"."DIETA_NOMBRE_UN" ON "LIFEFIT"."DIETA" ("NOMBRE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "TS_INDICES" ;
--------------------------------------------------------
--  DDL for Index DIETA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LIFEFIT"."DIETA_PK" ON "LIFEFIT"."DIETA" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "TS_INDICES" ;
--------------------------------------------------------
--  DDL for Index EJERCICIO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LIFEFIT"."EJERCICIO_PK" ON "LIFEFIT"."EJERCICIO" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_INDICES" ;
--------------------------------------------------------
--  DDL for Index ELEMENTOCALENDARIO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LIFEFIT"."ELEMENTOCALENDARIO_PK" ON "LIFEFIT"."ELEMENTOCALENDARIO" ("FECHAYHORA", "ENTRENADOR_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "TS_INDICES" ;
--------------------------------------------------------
--  DDL for Index ENTRENADOR_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LIFEFIT"."ENTRENADOR_PK" ON "LIFEFIT"."ENTRENADOR" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "TS_INDICES" ;
--------------------------------------------------------
--  DDL for Index ENTRENA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LIFEFIT"."ENTRENA_PK" ON "LIFEFIT"."ENTRENA" ("CLIENTE_ID", "ENTRENADOR_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "TS_INDICES" ;
--------------------------------------------------------
--  DDL for Index GERENTE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LIFEFIT"."GERENTE_PK" ON "LIFEFIT"."GERENTE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "TS_INDICES" ;
--------------------------------------------------------
--  DDL for Index PLAN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LIFEFIT"."PLAN_PK" ON "LIFEFIT"."PLAN" ("INICIO", "ENTRENA_CLIENTE_ID", "ENTRENA_ID1", "RUTINA_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "TS_INDICES" ;
--------------------------------------------------------
--  DDL for Index RUTINA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LIFEFIT"."RUTINA_PK" ON "LIFEFIT"."RUTINA" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "TS_INDICES" ;
--------------------------------------------------------
--  DDL for Index SESIÓN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LIFEFIT"."SESIÓN_PK" ON "LIFEFIT"."SESIÓN" ("INICIO", "PLAN_INICIO", "PLAN_ENTRENA_CLIENTE_ID", "PLAN_ENTRENA_ID1", "PLAN_RUTINA_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "TS_INDICES" ;
--------------------------------------------------------
--  DDL for Index USUARIO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LIFEFIT"."USUARIO_PK" ON "LIFEFIT"."USUARIO" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_INDICES" ;
--------------------------------------------------------
--  DDL for Index IDX_USUARIO_APELLIDOS
--------------------------------------------------------

  CREATE INDEX "LIFEFIT"."IDX_USUARIO_APELLIDOS" ON "LIFEFIT"."USUARIO" (UPPER("APELLIDOS")) 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_INDICES" ;
--------------------------------------------------------
--  DDL for Index IDX_CLIENTE_CENTRO_ID
--------------------------------------------------------

  CREATE BITMAP INDEX "LIFEFIT"."IDX_CLIENTE_CENTRO_ID" ON "LIFEFIT"."CLIENTE" ("CENTRO_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "TS_INDICES" ;
--------------------------------------------------------
--  DDL for Index SYS_C_SNAP$_1EJERCICIO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LIFEFIT"."SYS_C_SNAP$_1EJERCICIO_PK" ON "LIFEFIT"."VM_EJERCICIOS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_LIFEFIT" ;
--------------------------------------------------------
--  DDL for Index GERENTE__IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "LIFEFIT"."GERENTE__IDX" ON "LIFEFIT"."GERENTE" ("CENTRO_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "TS_LIFEFIT" ;
--------------------------------------------------------
--  DDL for Index IDX_USUARIO_NOMBRE
--------------------------------------------------------

  CREATE INDEX "LIFEFIT"."IDX_USUARIO_NOMBRE" ON "LIFEFIT"."USUARIO" ("NOMBRE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_INDICES" ;
--------------------------------------------------------
--  DDL for Index IDX_USUARIO_CORREO
--------------------------------------------------------

  CREATE INDEX "LIFEFIT"."IDX_USUARIO_CORREO" ON "LIFEFIT"."USUARIO" ("CORREO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_INDICES" ;
--------------------------------------------------------
--  DDL for Trigger TR_EJERCICIO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "LIFEFIT"."TR_EJERCICIO" 
BEFORE INSERT ON EJERCICIO
FOR EACH ROW
BEGIN
    IF :new.ID IS NULL THEN
        :new.ID := SEQ_EJERCICIOS.NEXTVAL;
    END IF;
END;


/
ALTER TRIGGER "LIFEFIT"."TR_EJERCICIO" ENABLE;
--------------------------------------------------------
--  Constraints for Table USUARIO
--------------------------------------------------------

  ALTER TABLE "LIFEFIT"."USUARIO" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."USUARIO" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."USUARIO" MODIFY ("TELEFONO" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."USUARIO" ADD CONSTRAINT "USUARIO_PK" PRIMARY KEY ("ID")
  USING INDEX "LIFEFIT"."USUARIO_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CITA
--------------------------------------------------------

  ALTER TABLE "LIFEFIT"."CITA" MODIFY ("FECHAYHORA" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."CITA" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."CITA" MODIFY ("CLIENTE_ID" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."CITA" ADD CONSTRAINT "CITA_PK" PRIMARY KEY ("FECHAYHORA", "ID")
  USING INDEX "LIFEFIT"."CITA_PK"  ENABLE;
  ALTER TABLE "LIFEFIT"."CITA" ADD CONSTRAINT "CITA_PKV1" UNIQUE ("CLIENTE_ID")
  USING INDEX "LIFEFIT"."CITA_PKV1"  ENABLE;
--------------------------------------------------------
--  Constraints for Table GERENTE
--------------------------------------------------------

  ALTER TABLE "LIFEFIT"."GERENTE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."GERENTE" MODIFY ("CENTRO_ID" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."GERENTE" ADD CONSTRAINT "GERENTE_PK" PRIMARY KEY ("ID")
  USING INDEX "LIFEFIT"."GERENTE_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PLAN
--------------------------------------------------------

  ALTER TABLE "LIFEFIT"."PLAN" MODIFY ("INICIO" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."PLAN" MODIFY ("ENTRENA_CLIENTE_ID" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."PLAN" MODIFY ("ENTRENA_ID1" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."PLAN" MODIFY ("RUTINA_ID" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."PLAN" ADD CONSTRAINT "PLAN_PK" PRIMARY KEY ("INICIO", "ENTRENA_CLIENTE_ID", "ENTRENA_ID1", "RUTINA_ID")
  USING INDEX "LIFEFIT"."PLAN_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CENTRO
--------------------------------------------------------

  ALTER TABLE "LIFEFIT"."CENTRO" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."CENTRO" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."CENTRO" ADD CONSTRAINT "CENTRO_PK" PRIMARY KEY ("ID")
  USING INDEX "LIFEFIT"."CENTRO_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CLIENTE
--------------------------------------------------------

  ALTER TABLE "LIFEFIT"."CLIENTE" MODIFY ("CENTRO_ID" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."CLIENTE" ADD CONSTRAINT "CLIENTE_PK" PRIMARY KEY ("ID")
  USING INDEX "LIFEFIT"."CLIENTE_PK"  ENABLE;
  ALTER TABLE "LIFEFIT"."CLIENTE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."CLIENTE" MODIFY ("OBJETIVO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DIETA
--------------------------------------------------------

  ALTER TABLE "LIFEFIT"."DIETA" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."DIETA" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."DIETA" ADD CONSTRAINT "DIETA_PK" PRIMARY KEY ("ID")
  USING INDEX "LIFEFIT"."DIETA_PK"  ENABLE;
  ALTER TABLE "LIFEFIT"."DIETA" ADD CONSTRAINT "DIETA_NOMBRE_UN" UNIQUE ("NOMBRE")
  USING INDEX "LIFEFIT"."DIETA_NOMBRE_UN"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ENTRENADOR
--------------------------------------------------------

  ALTER TABLE "LIFEFIT"."ENTRENADOR" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."ENTRENADOR" MODIFY ("CENTRO_ID" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."ENTRENADOR" ADD CONSTRAINT "ENTRENADOR_PK" PRIMARY KEY ("ID")
  USING INDEX "LIFEFIT"."ENTRENADOR_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ELEMENTOCALENDARIO
--------------------------------------------------------

  ALTER TABLE "LIFEFIT"."ELEMENTOCALENDARIO" MODIFY ("FECHAYHORA" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."ELEMENTOCALENDARIO" MODIFY ("ENTRENADOR_ID" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."ELEMENTOCALENDARIO" ADD CONSTRAINT "ELEMENTOCALENDARIO_PK" PRIMARY KEY ("FECHAYHORA", "ENTRENADOR_ID")
  USING INDEX "LIFEFIT"."ELEMENTOCALENDARIO_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SESIÓN
--------------------------------------------------------

  ALTER TABLE "LIFEFIT"."SESIÓN" MODIFY ("INICIO" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."SESIÓN" MODIFY ("PLAN_INICIO" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."SESIÓN" MODIFY ("PLAN_ENTRENA_CLIENTE_ID" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."SESIÓN" MODIFY ("PLAN_ENTRENA_ID1" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."SESIÓN" MODIFY ("PLAN_RUTINA_ID" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."SESIÓN" ADD CONSTRAINT "SESIÓN_PK" PRIMARY KEY ("INICIO", "PLAN_INICIO", "PLAN_ENTRENA_CLIENTE_ID", "PLAN_ENTRENA_ID1", "PLAN_RUTINA_ID")
  USING INDEX "LIFEFIT"."SESIÓN_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table EJERCICIO
--------------------------------------------------------

  ALTER TABLE "LIFEFIT"."EJERCICIO" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."EJERCICIO" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."EJERCICIO" ADD CONSTRAINT "EJERCICIO_PK" PRIMARY KEY ("ID")
  USING INDEX "LIFEFIT"."EJERCICIO_PK"  ENABLE;
  ALTER TABLE "LIFEFIT"."EJERCICIO" ADD CHECK (PUBLICO IN ('S', 'N')) ENABLE;
--------------------------------------------------------
--  Constraints for Table ENTRENA
--------------------------------------------------------

  ALTER TABLE "LIFEFIT"."ENTRENA" MODIFY ("CLIENTE_ID" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."ENTRENA" MODIFY ("ENTRENADOR_ID" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."ENTRENA" ADD CONSTRAINT "ENTRENA_PK" PRIMARY KEY ("CLIENTE_ID", "ENTRENADOR_ID")
  USING INDEX "LIFEFIT"."ENTRENA_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CONFORMAN
--------------------------------------------------------

  ALTER TABLE "LIFEFIT"."CONFORMAN" MODIFY ("RUTINA_ID" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."CONFORMAN" MODIFY ("EJERCICIO_ID" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."CONFORMAN" ADD CONSTRAINT "CONFORMAN_PK" PRIMARY KEY ("RUTINA_ID", "EJERCICIO_ID")
  USING INDEX "LIFEFIT"."CONFORMAN_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table RUTINA
--------------------------------------------------------

  ALTER TABLE "LIFEFIT"."RUTINA" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."RUTINA" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "LIFEFIT"."RUTINA" ADD CONSTRAINT "RUTINA_PK" PRIMARY KEY ("ID")
  USING INDEX "LIFEFIT"."RUTINA_PK"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CITA
--------------------------------------------------------

  ALTER TABLE "LIFEFIT"."CITA" ADD CONSTRAINT "CITA_CLIENTE_FK" FOREIGN KEY ("CLIENTE_ID")
	  REFERENCES "LIFEFIT"."CLIENTE" ("ID") ENABLE;
  ALTER TABLE "LIFEFIT"."CITA" ADD CONSTRAINT "CITA_ELEMENTOCALENDARIO_FK" FOREIGN KEY ("FECHAYHORA", "ID")
	  REFERENCES "LIFEFIT"."ELEMENTOCALENDARIO" ("FECHAYHORA", "ENTRENADOR_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CLIENTE
--------------------------------------------------------

  ALTER TABLE "LIFEFIT"."CLIENTE" ADD CONSTRAINT "CLIENTE_CENTRO_FK" FOREIGN KEY ("CENTRO_ID")
	  REFERENCES "LIFEFIT"."CENTRO" ("ID") ENABLE;
  ALTER TABLE "LIFEFIT"."CLIENTE" ADD CONSTRAINT "CLIENTE_DIETA_FK" FOREIGN KEY ("DIETA_ID")
	  REFERENCES "LIFEFIT"."DIETA" ("ID") ENABLE;
  ALTER TABLE "LIFEFIT"."CLIENTE" ADD CONSTRAINT "CLIENTE_USUARIO_FK" FOREIGN KEY ("ID")
	  REFERENCES "LIFEFIT"."USUARIO" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CONFORMAN
--------------------------------------------------------

  ALTER TABLE "LIFEFIT"."CONFORMAN" ADD CONSTRAINT "CONFORMAN_EJERCICIO_FK" FOREIGN KEY ("EJERCICIO_ID")
	  REFERENCES "LIFEFIT"."EJERCICIO" ("ID") ENABLE;
  ALTER TABLE "LIFEFIT"."CONFORMAN" ADD CONSTRAINT "CONFORMAN_RUTINA_FK" FOREIGN KEY ("RUTINA_ID")
	  REFERENCES "LIFEFIT"."RUTINA" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ELEMENTOCALENDARIO
--------------------------------------------------------

  ALTER TABLE "LIFEFIT"."ELEMENTOCALENDARIO" ADD CONSTRAINT "ELEMENTCALEND_ENTRENADOR_FK" FOREIGN KEY ("ENTRENADOR_ID")
	  REFERENCES "LIFEFIT"."ENTRENADOR" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ENTRENA
--------------------------------------------------------

  ALTER TABLE "LIFEFIT"."ENTRENA" ADD CONSTRAINT "ENTRENA_CLIENTE_FK" FOREIGN KEY ("CLIENTE_ID")
	  REFERENCES "LIFEFIT"."CLIENTE" ("ID") ENABLE;
  ALTER TABLE "LIFEFIT"."ENTRENA" ADD CONSTRAINT "ENTRENA_ENTRENADOR_FK" FOREIGN KEY ("ENTRENADOR_ID")
	  REFERENCES "LIFEFIT"."ENTRENADOR" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ENTRENADOR
--------------------------------------------------------

  ALTER TABLE "LIFEFIT"."ENTRENADOR" ADD CONSTRAINT "ENTRENADOR_CENTRO_FK" FOREIGN KEY ("CENTRO_ID")
	  REFERENCES "LIFEFIT"."CENTRO" ("ID") ENABLE;
  ALTER TABLE "LIFEFIT"."ENTRENADOR" ADD CONSTRAINT "ENTRENADOR_USUARIO_FK" FOREIGN KEY ("ID")
	  REFERENCES "LIFEFIT"."USUARIO" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table GERENTE
--------------------------------------------------------

  ALTER TABLE "LIFEFIT"."GERENTE" ADD CONSTRAINT "GERENTE_CENTRO_FK" FOREIGN KEY ("CENTRO_ID")
	  REFERENCES "LIFEFIT"."CENTRO" ("ID") ENABLE;
  ALTER TABLE "LIFEFIT"."GERENTE" ADD CONSTRAINT "GERENTE_USUARIO_FK" FOREIGN KEY ("ID")
	  REFERENCES "LIFEFIT"."USUARIO" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PLAN
--------------------------------------------------------

  ALTER TABLE "LIFEFIT"."PLAN" ADD CONSTRAINT "PLAN_ENTRENA_FK" FOREIGN KEY ("ENTRENA_CLIENTE_ID", "ENTRENA_ID1")
	  REFERENCES "LIFEFIT"."ENTRENA" ("CLIENTE_ID", "ENTRENADOR_ID") ENABLE;
  ALTER TABLE "LIFEFIT"."PLAN" ADD CONSTRAINT "PLAN_RUTINA_FK" FOREIGN KEY ("RUTINA_ID")
	  REFERENCES "LIFEFIT"."RUTINA" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SESIÓN
--------------------------------------------------------

  ALTER TABLE "LIFEFIT"."SESIÓN" ADD CONSTRAINT "SESIÓN_PLAN_FK" FOREIGN KEY ("PLAN_INICIO", "PLAN_ENTRENA_CLIENTE_ID", "PLAN_ENTRENA_ID1", "PLAN_RUTINA_ID")
	  REFERENCES "LIFEFIT"."PLAN" ("INICIO", "ENTRENA_CLIENTE_ID", "ENTRENA_ID1", "RUTINA_ID") ENABLE;

--------------------------------------------------------
--  DDL for Security Mecanism for clients training sessions visualization
--------------------------------------------------------

create or replace function vpd_function(p_schema varchar2, p_obj varchar2)
  Return varchar2
is
  Vusuario VARCHAR2(100);
  client_id NUMBER;
Begin
  Vusuario := SYS_CONTEXT('userenv', 'SESSION_USER');
  select id into client_id from usuario where usuariooracle = Vusuario; 
  
  return 'plan_entrena_cliente_id = ' || client_id;
End;
/

BEGIN dbms_rls.add_policy (
	object_schema=>'LIFEFIT',                  
	object_name=>'SESIÓN',                 
	policy_name=>'POL_SESION',              
	function_schema=>'LIFEFIT',              
	policy_function=>'VPD_FUNCTION',          
	statement_types=>'SELECT'  
);
end;
/

--------------------------------------------------------
--  DDL for Packages
--------------------------------------------------------

    CREATE OR REPLACE PACKAGE BASE IS
      	 -- Excepciones personalizadas
      	 EXCEPCION_CREACION EXCEPTION;
      	 EXCEPCION_MODIFICACION EXCEPTION;
      	 EXCEPCION_ELIMINACION EXCEPTION;
      	 EXCEPCION_LECTURA EXCEPTION;

	 PRAGMA EXCEPTION_INIT(EXCEPCION_CREACION, -20001);
     	 PRAGMA EXCEPTION_INIT(EXCEPCION_MODIFICACION, -20002);
     	 PRAGMA EXCEPTION_INIT(EXCEPCION_ELIMINACION, -20003);
      	 PRAGMA EXCEPTION_INIT(EXCEPCION_LECTURA, -20004);
      
         TYPE TCLIENTE IS RECORD (
	        NOMBRE USUARIO.NOMBRE%TYPE,
	        APELLIDOS USUARIO.APELLIDOS%TYPE,
	        TELEFONO USUARIO.TELEFONO%TYPE,
	        DIRECCION USUARIO.DIRECCION%TYPE,
	        CORREOE USUARIO.CORREO%TYPE,
	        OBJETIVOS CLIENTE.OBJETIVO%TYPE,
	        DIETA CLIENTE.DIETA_ID%TYPE,
	        PREFERENCIAS CLIENTE.PREFERENCIAS%TYPE,
	        CENTRO CLIENTE.CENTRO_ID%TYPE
         );
      
      	 TYPE TENTRENADOR IS RECORD (
	        NOMBRE USUARIO.NOMBRE%TYPE,
	        APELLIDOS USUARIO.APELLIDOS%TYPE,
	        TELEFONO USUARIO.TELEFONO%TYPE,
	        DIRECCION USUARIO.DIRECCION%TYPE,
	        CORREOE USUARIO.CORREO%TYPE,
	        DISPONIBILIDAD ENTRENADOR.DISPONIBILIDAD%TYPE,
	        CENTRO ENTRENADOR.CENTRO_ID%TYPE
         );
      
         TYPE TGERENTE IS RECORD (
         	NOMBRE USUARIO.NOMBRE%TYPE,
       	 	APELLIDOS USUARIO.APELLIDOS%TYPE,
        	TELEFONO USUARIO.TELEFONO%TYPE,
        	DIRECCION USUARIO.DIRECCION%TYPE,
        	CORREOE USUARIO.CORREO%TYPE,
        	DESPACHO GERENTE.DESPACHO%TYPE,
        	HORARIO GERENTE.HORARIO%TYPE,
         	CENTRO GERENTE.CENTRO_ID%TYPE
         );

	 PROCEDURE CREA_GERENTE(
	        P_DATOS IN TGERENTE,
	        P_USERPASS IN VARCHAR2,
	        P_USUARIO OUT USUARIO%ROWTYPE,
	        P_GERENTE OUT GERENTE%ROWTYPE
     	 );

	 PROCEDURE CREA_ENTRENADOR(
	        P_DATOS IN TENTRENADOR,
	        P_USERPASS IN VARCHAR2,
	        P_USUARIO OUT USUARIO%ROWTYPE,
	        P_ENTRENADOR OUT ENTRENADOR%ROWTYPE
	 );

  	 PROCEDURE CREA_CLIENTE(
	        P_DATOS IN TCLIENTE,
	        P_USERPASS IN VARCHAR2,
	        P_USUARIO OUT USUARIO%ROWTYPE,
	        P_CLIENTE OUT CLIENTE%ROWTYPE
        );

  	PROCEDURE ELIMINA_USER(P_ID USUARIO.ID%TYPE);

  	PROCEDURE ELIMINA_CLIENTE(P_ID USUARIO.ID%TYPE);

  	PROCEDURE ELIMINA_GERENTE(P_ID USUARIO.ID%TYPE);

 	PROCEDURE ELIMINA_ENTRENADOR(P_ID USUARIO.ID%TYPE);

  	PROCEDURE ELIMINA_CENTRO(P_ID CENTRO.ID%TYPE);

  	PROCEDURE EJECUTAR_SQL(ACCION1 IN VARCHAR2, ACCION2 IN VARCHAR2);
    
    END BASE;
    /
    
    CREATE OR REPLACE PACKAGE ICALC AS 
	    
    END ICALC;
    /

    SET SERVEROUTPUT ON;
