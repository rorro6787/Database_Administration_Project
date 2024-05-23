DROP VIEW lifefit.v_objetivo_cliente;
DROP VIEW lifefit.v_correo_usuario;
DROP VIEW lifefit.v_video_sesion;
DROP MATERIALIZED VIEW "LIFEFIT"."VM_EJERCICIOS";
DROP ROLE r_gerente;
DROP ROLE r_entrenador;
DROP ROLE r_entrenador_nutricion;
DROP ROLE r_cliente;
DROP ROLE r_administrador;
DROP TABLESPACE ts_lifefit INCLUDING CONTENTS AND DATAFILES;
DROP TABLESPACE ts_indices INCLUDING CONTENTS AND DATAFILES;
DROP USER lifefit CASCADE;

CREATE TABLESPACE TS_LIFEFIT DATAFILE 'lifefit.dbf' SIZE 10M AUTOEXTEND ON;
CREATE TABLESPACE TS_INDICES DATAFILE 'ts_indices.dbf' SIZE 50M;
CREATE OR REPLACE directory directorio_ext as 'C:\app\alumnos\admin\orcl\dpdump';

CREATE USER LIFEFIT IDENTIFIED BY lifefit DEFAULT TABLESPACE TS_LIFEFIT
			 QUOTA 100M ON TS_LIFEFIT;

CREATE ROLE r_gerente;
CREATE ROLE r_entrenador;
CREATE ROLE r_entrenador_nutricion;
CREATE ROLE r_cliente;
CREATE ROLE r_administrador;

GRANT RESOURCE TO r_administrador WITH ADMIN OPTION;
GRANT CREATE USER TO r_administrador WITH ADMIN OPTION;
GRANT CONNECT TO r_administrador WITH ADMIN OPTION;
GRANT r_administrador TO LIFEFIT WITH ADMIN OPTION;
GRANT r_gerente TO LIFEFIT WITH ADMIN OPTION;
GRANT r_entrenador TO LIFEFIT WITH ADMIN OPTION;
GRANT r_entrenador_nutricion TO LIFEFIT WITH ADMIN OPTION;
GRANT r_cliente TO LIFEFIT WITH ADMIN OPTION;


GRANT READ, WRITE ON DIRECTORY directorio_ext TO lifefit; 
ALTER USER LIFEFIT QUOTA 50M ON TS_INDICES;
