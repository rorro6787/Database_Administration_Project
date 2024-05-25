CREATE OR REPLACE
PACKAGE BODY BASE AS

  PROCEDURE CREA_GERENTE(
	        P_DATOS IN TCLIENTE,
	        P_USERPASS IN VARCHAR2,
	        P_USUARIO OUT USUARIO%ROWTYPE,
	        P_GERENTE OUT GERENTE%ROWTYPE
     	 ) AS
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE BASE.CREA_GERENTE
    NULL;
  END CREA_GERENTE;

  PROCEDURE CREA_ENTRENADOR(
    P_DATOS IN TENTRENADOR,
    P_USERPASS IN VARCHAR2,
    P_USUARIO OUT USUARIO%ROWTYPE,
    P_ENTRENADOR OUT ENTRENADOR%ROWTYPE
  )AS 
    SECUENCIA NUMBER;
  BEGIN
        INSERT INTO USUARIO (ID,NOMBRE, APELLIDOS, TELEFONO, DIRECCION, CORREO,USUARIOORACLE)
        VALUES (seq_usuarios.nextval,P_DATOS.NOMBRE, P_DATOS.APELLIDOS, P_DATOS.TELEFONO, P_DATOS.DIRECCION, P_DATOS.CORREOE, P_DATOS.NOMBRE || seq_usuarios.currval );
        
       
        INSERT INTO ENTRENADOR (ID, DISPONIBILIDAD, CENTRO_ID)
        VALUES (seq_usuarios.currval, P_DATOS.DISPONIBILIDAD, P_DATOS.CENTRO);
    
    EJECUTAR_SQL('CREATE USER ' || P_DATOS.NOMBRE||SEQ_USUARIOS.CURRVAL || ' IDENTIFIED BY ' || P_USERPASS, 'GRANT R_ENTRENADOR TO ' || P_DATOS.NOMBRE||SEQ_USUARIOS.CURRVAL);
    
    SECUENCIA := SEQ_USUARIOS.CURRVAL;
    SELECT * INTO P_USUARIO FROM USUARIO WHERE ID = SECUENCIA;
    SELECT * INTO P_ENTRENADOR FROM ENTRENADOR WHERE ID = SECUENCIA;
    
  EXCEPTION 
    WHEN OTHERS THEN
        RAISE EXCEPCION_CREACION;
  END CREA_ENTRENADOR;

  PROCEDURE CREA_CLIENTE(
	        P_DATOS IN TCLIENTE,
	        P_USERPASS IN VARCHAR2,
	        P_USUARIO OUT USUARIO%ROWTYPE,
	        P_CLIENTE OUT CLIENTE%ROWTYPE
    ) AS
        SECUENCIA NUMBER;
  BEGIN
    INSERT INTO USUARIO (ID, NOMBRE, APELLIDOS, TELEFONO, DIRECCION, CORREO) 
    VALUES (SEQ_USUARIOS.NEXTVAL, P_DATOS.NOMBRE, P_DATOS.APELLIDOS, P_DATOS.TELEFONO, P_DATOS.DIRECCION, P_DATOS.CORREOE);
    
    INSERT INTO CLIENTE (ID, OBJETIVO, CENTRO_ID, DIETA_ID) 
    VALUES (SEQ_USUARIOS.CURRVAL, P_DATOS.OBJETIVOS, P_DATOS.CENTRO, P_DATOS.DIETA);
    
    EJECUTAR_SQL('CREATE USER ' || P_DATOS.NOMBRE||SEQ_USUARIOS.CURRVAL || ' IDENTIFIED BY ' || P_USERPASS, 'GRANT R_CLIENTE TO ' || P_DATOS.NOMBRE||SEQ_USUARIOS.CURRVAL);
    
    SECUENCIA := SEQ_USUARIOS.CURRVAL;
    SELECT * INTO P_USUARIO FROM USUARIO WHERE ID = SECUENCIA;
    SELECT * INTO P_CLIENTE FROM CLIENTE WHERE ID = SECUENCIA;
    
  EXCEPTION 
    WHEN OTHERS THEN
        RAISE EXCEPCION_CREACION;
  END CREA_CLIENTE;

  PROCEDURE ELIMINA_USER(P_ID USUARIO.ID%TYPE) AS
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE BASE.ELIMINA_USER
    NULL;
  END ELIMINA_USER;

  PROCEDURE ELIMINA_CLIENTE(P_ID USUARIO.ID%TYPE) AS
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE BASE.ELIMINA_CLIENTE
    NULL;
  END ELIMINA_CLIENTE;

  PROCEDURE ELIMINA_GERENTE(P_ID USUARIO.ID%TYPE) AS
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE BASE.ELIMINA_GERENTE
    NULL;
  END ELIMINA_GERENTE;

  PROCEDURE ELIMINA_ENTRENADOR(P_ID USUARIO.ID%TYPE) AS
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE BASE.ELIMINA_ENTRENADOR
    NULL;
  END ELIMINA_ENTRENADOR;

  PROCEDURE ELIMINA_CENTRO(P_ID CENTRO.ID%TYPE) AS
  BEGIN
    -- TAREA: Se necesita implantación para PROCEDURE BASE.ELIMINA_CENTRO
    NULL;
  END ELIMINA_CENTRO;

  PROCEDURE EJECUTAR_SQL(ACCION1 IN VARCHAR2, ACCION2 IN VARCHAR2) AS
    PRAGMA AUTONOMOUS_TRANSACTION;
  BEGIN
    EXECUTE IMMEDIATE ACCION1;
    EXECUTE IMMEDIATE ACCION2;
    COMMIT;
  END EJECUTAR_SQL;

END BASE;