

  CREATE TABLE "SYSTEM"."DEPARTEMENT" 
   (	"ID" NUMBER(*,0), 
	"NOM" VARCHAR2(50), 
	"ID_ETABLISSEMENT" NUMBER(*,0)
   ) ;
--------------------------------------------------------
--  DDL for Table DOMAINE
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."DOMAINE" 
   (	"ID" NUMBER(*,0), 
	"NOM" VARCHAR2(50)
   ) ;
--------------------------------------------------------
--  DDL for Table ETABLISSEMENT
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."ETABLISSEMENT" 
   (	"ID" NUMBER(*,0), 
	"NOM" VARCHAR2(50), 
	"LOCALITE" VARCHAR2(50)
   ) ;
--------------------------------------------------------
--  DDL for Table PERSONNE
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."PERSONNE" 
   (	"ID" NUMBER(*,0), 
	"NOM" VARCHAR2(50), 
	"PRENOM" VARCHAR2(50), 
	"TEL" NUMBER(*,0), 
	"SPECIALITE" VARCHAR2(50), 
	"TYPE" VARCHAR2(50)
   ) ;
--------------------------------------------------------
--  DDL for Table PRESENTATION
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."PRESENTATION" 
   (	"ID" NUMBER(*,0), 
	"TITRE" VARCHAR2(50), 
	"SUJET" VARCHAR2(50), 
	"DATEPRESENTATION" DATE, 
	"HEUREPRESENTATION" VARCHAR2(50), 
	"ID_SEMINAIRE" NUMBER(*,0), 
	"ID_PERSONNE" NUMBER(*,0), 
	"ID_DOMAINE" NUMBER(*,0)
   ) ;
--------------------------------------------------------
--  DDL for Table SEMINAIRE
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."SEMINAIRE" 
   (	"ID" NUMBER(*,0), 
	"NOM" VARCHAR2(50), 
	"ETAT" VARCHAR2(50), 
	"DATE_DEBUT" DATE, 
	"ID_DEPARTEMENT" NUMBER(*,0)
   ) ;

Insert into SYSTEM.ETABLISSEMENT (ID,NOM,LOCALITE) values ('1','ISCAE','NOUAKCHOTT');
Insert into SYSTEM.ETABLISSEMENT (ID,NOM,LOCALITE) values ('2','FST','NOUAKCHOTT');
REM INSERTING into SYSTEM.PERSONNE
SET DEFINE OFF;
Insert into SYSTEM.PERSONNE (ID,NOM,PRENOM,TEL,SPECIALITE,TYPE) values ('1','mohamed','beirouk','37419845','IG','etudiant');
REM INSERTING into SYSTEM.PRESENTATION
SET DEFINE OFF;
REM INSERTING into SYSTEM.SEMINAIRE
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index DEPARTEMENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."DEPARTEMENT_PK" ON "SYSTEM"."DEPARTEMENT" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index DOMAINE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."DOMAINE_PK" ON "SYSTEM"."DOMAINE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index ETABLISSEMENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."ETABLISSEMENT_PK" ON "SYSTEM"."ETABLISSEMENT" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PERSONNE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PERSONNE_PK" ON "SYSTEM"."PERSONNE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PRESENTATION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PRESENTATION_PK" ON "SYSTEM"."PRESENTATION" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SEMINAIRE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SEMINAIRE_PK" ON "SYSTEM"."SEMINAIRE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index DEPARTEMENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."DEPARTEMENT_PK" ON "SYSTEM"."DEPARTEMENT" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index DOMAINE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."DOMAINE_PK" ON "SYSTEM"."DOMAINE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index ETABLISSEMENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."ETABLISSEMENT_PK" ON "SYSTEM"."ETABLISSEMENT" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PERSONNE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PERSONNE_PK" ON "SYSTEM"."PERSONNE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PRESENTATION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PRESENTATION_PK" ON "SYSTEM"."PRESENTATION" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SEMINAIRE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SEMINAIRE_PK" ON "SYSTEM"."SEMINAIRE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Trigger CONTROLE_PRESENTATION
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."DEPARTEMENT_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence DOMAINE_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."DOMAINE_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence ETABLISSEMENT_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."ETABLISSEMENT_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PERSONNE_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."PERSONNE_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PRESENTATION_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."PRESENTATION_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEMINAIRE_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."SEMINAIRE_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;



--------------------------------------------------------
--  DDL for Function NOMBRES_LIGNES
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "SYSTEM"."NOMBRES_LIGNES" 
(
  NOMT IN VARCHAR2 
) RETURN NUMBER is nbre number;
BEGIN
    execute immediate 'select count(*) from ' || NOMT into nbre;
  RETURN nbre;
END NOMBRES_LIGNES;

/

  CREATE OR REPLACE FUNCTION "SYSTEM"."NBRESSEMINAIRESCONFIRMER" 
return number
is
s number;
begin
   select count(*) into s from seminaire where etat= 'confirmer'  ;
   return s;
end ;

/




  CREATE OR REPLACE PROCEDURE "SYSTEM"."INSERTDATA" (
NOMTABLE in varchar2, 
param1 in varchar2 default 0, 
param2 in varchar2 default 0, 
param3 in varchar2 default 0, 
param4 in varchar2 default 0, 
param5 in varchar2 default 0, 
param6 in varchar2 default 0, 
param7 in varchar2 default 0, 
param8 in varchar2 default 0, 
param9 in varchar2 default 0, 
param10 in varchar2 default 0) is num int;
BEGIN
   EXECUTE IMMEDIATE 'SELECT count(*) FROM user_tables WHERE table_name = :1' into num using NOMTABLE ;
  IF( num < 1 )
  THEN  
        dbms_output.put_line('la table n existe pas !!! ');
  ELSE
      CASE NOMTABLE
      when 'DEPARTEMENT' then Ajouterdepartement(param1,param2);
      when 'ETABLISSEMENT' then Ajouteretablissement(param1,param2);
      when 'DOMAINE' then Ajouterdomaine(param1);
      when 'SEMINAIRE' then Ajouterseminaire(param1,param2,param3,param4);
      when 'PERSONNE' then Ajouterpersonne(param1,param2,param3,param4,param5);
      when 'PRESENTATION' then Ajouterpresentation(param1,param2,param3,param4,param5,param6,param7);
      
      else dbms_output.put_line('eurreur');
   END CASE;
  END IF; 
  NULL;
END INSERTDATA;



  CREATE OR REPLACE PROCEDURE "SYSTEM"."AJOUTERDEPARTEMENT" ( nom IN VARCHAR2 , id_etablissement number ) AS 
BEGIN
  INSERT INTO departement (nom, id_etablissement) VALUES (nom, id_etablissement);
END Ajouterdepartement;

/
--------------------------------------------------------
--  DDL for Procedure AJOUTERDOMAINE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SYSTEM"."AJOUTERDOMAINE" ( nom IN VARCHAR2) AS 
BEGIN
  INSERT INTO domaine (nom) VALUES (nom);
END Ajouterdomaine;

/
--------------------------------------------------------
--  DDL for Procedure AJOUTERETABLISSEMENT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SYSTEM"."AJOUTERETABLISSEMENT" ( nom IN VARCHAR2 , localite IN VARCHAR2 ) AS 
BEGIN
  INSERT INTO ETABLISSEMENT(nom, localite) VALUES (nom, localite);
END Ajouteretablissement;

/
--------------------------------------------------------
--  DDL for Procedure AJOUTERPERSONNE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SYSTEM"."AJOUTERPERSONNE" ( nom IN VARCHAR2 , prenom in varchar2,  tel number, specialite in varchar2, type in varchar2 ) AS 
BEGIN
  INSERT INTO personne (nom, prenom ,  tel , specialite , type) VALUES (nom, prenom ,  tel , specialite , type);
END Ajouterpersonne;

/
--------------------------------------------------------
--  DDL for Procedure AJOUTERPRESENTATION
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SYSTEM"."AJOUTERPRESENTATION" ( titre IN VARCHAR2 , sujet in varchar2, datepresentation date, heurepresentation in varchar2, id_seminaire number, id_domaine number, id_personne number ) AS 
BEGIN
  INSERT INTO presentation (titre, sujet,datepresentation, heurepresentation, id_seminaire, id_domaine, id_personne) VALUES (titre, sujet,datepresentation, heurepresentation, id_seminaire, id_domaine, id_personne);
END Ajouterpresentation;

/
--------------------------------------------------------
--  DDL for Procedure AJOUTERSEMINAIRE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SYSTEM"."AJOUTERSEMINAIRE" ( nom IN VARCHAR2 , etat in varchar2, date_debut date, id_departement number ) AS 
BEGIN
  INSERT INTO seminaire (nom, etat, date_debut, id_departement) VALUES (nom, etat, date_debut, id_departement);
END Ajouterseminaire;

/



  CREATE OR REPLACE TRIGGER "SYSTEM"."CONTROLE_PRESENTATION" 
BEFORE INSERT ON PRESENTATION
FOR EACH ROW 
DECLARE
nb NUMBER ;
BEGIN
 SELECT COUNT(*) INTO nb FROM PRESENTATION ;
IF  nb > 100 THEN 
RAISE_APPLICATION_ERROR(-20555,'impossible');
END IF;
END ;
/
ALTER TRIGGER "SYSTEM"."CONTROLE_PRESENTATION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DEPARTEMENT_ON_INSERT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SYSTEM"."DEPARTEMENT_ON_INSERT" 
  BEFORE INSERT ON DEPARTEMENT
  FOR EACH ROW
BEGIN
  SELECT DEPARTEMENT_sequence.nextval
  INTO :new.id
  FROM dual;
END;
/
ALTER TRIGGER "SYSTEM"."DEPARTEMENT_ON_INSERT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DOMAINE_ON_INSERT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SYSTEM"."DOMAINE_ON_INSERT" 
  BEFORE INSERT ON DOMAINE
  FOR EACH ROW
BEGIN
  SELECT DOMAINE_sequence.nextval
  INTO :new.id
  FROM dual;
END;
/
ALTER TRIGGER "SYSTEM"."DOMAINE_ON_INSERT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ETABLISSEMENT_ON_INSERT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SYSTEM"."ETABLISSEMENT_ON_INSERT" 
  BEFORE INSERT ON ETABLISSEMENT
  FOR EACH ROW
BEGIN
  SELECT ETABLISSEMENT_sequence.nextval
  INTO :new.id
  FROM dual;
END;
/
ALTER TRIGGER "SYSTEM"."ETABLISSEMENT_ON_INSERT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PERSONNE_ON_INSERT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SYSTEM"."PERSONNE_ON_INSERT" 
  BEFORE INSERT ON PERSONNE
  FOR EACH ROW
BEGIN
  SELECT PERSONNE_sequence.nextval
  INTO :new.id
  FROM dual;
END;
/
ALTER TRIGGER "SYSTEM"."PERSONNE_ON_INSERT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PRESENTATION_ON_INSERT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SYSTEM"."PRESENTATION_ON_INSERT" 
  BEFORE INSERT ON PRESENTATION
  FOR EACH ROW
BEGIN
  SELECT PRESENTATION_sequence.nextval
  INTO :new.id
  FROM dual;
END;
/
ALTER TRIGGER "SYSTEM"."PRESENTATION_ON_INSERT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SEMINAIRE_ANNEE_COURANTE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SYSTEM"."SEMINAIRE_ANNEE_COURANTE" 
BEFORE INSERT ON SEMINAIRE
FOR EACH ROW
DECLARE
d date;
BEGIN
SELECT DATE_DEBUT INTO d FROM Seminaire WHERE id = :new.id ;

IF ( d < SYSDATE + 365) THEN
    Raise_application_error('-20101','on ne peut ajouter un seminaire dans une periode plus a une année ');
END IF;
END;  

/
ALTER TRIGGER "SYSTEM"."SEMINAIRE_ANNEE_COURANTE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SEMINAIRE_ON_INSERT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SYSTEM"."SEMINAIRE_ON_INSERT" 
  BEFORE INSERT ON SEMINAIRE
  FOR EACH ROW
BEGIN
  SELECT SEMINAIRE_sequence.nextval
  INTO :new.id
  FROM dual;
END;
/
ALTER TRIGGER "SYSTEM"."SEMINAIRE_ON_INSERT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DEPARTEMENT_ON_INSERT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SYSTEM"."DEPARTEMENT_ON_INSERT" 
  BEFORE INSERT ON DEPARTEMENT
  FOR EACH ROW
BEGIN
  SELECT DEPARTEMENT_sequence.nextval
  INTO :new.id
  FROM dual;
END;
/
ALTER TRIGGER "SYSTEM"."DEPARTEMENT_ON_INSERT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DOMAINE_ON_INSERT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SYSTEM"."DOMAINE_ON_INSERT" 
  BEFORE INSERT ON DOMAINE
  FOR EACH ROW
BEGIN
  SELECT DOMAINE_sequence.nextval
  INTO :new.id
  FROM dual;
END;
/
ALTER TRIGGER "SYSTEM"."DOMAINE_ON_INSERT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ETABLISSEMENT_ON_INSERT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SYSTEM"."ETABLISSEMENT_ON_INSERT" 
  BEFORE INSERT ON ETABLISSEMENT
  FOR EACH ROW
BEGIN
  SELECT ETABLISSEMENT_sequence.nextval
  INTO :new.id
  FROM dual;
END;
/
ALTER TRIGGER "SYSTEM"."ETABLISSEMENT_ON_INSERT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PERSONNE_ON_INSERT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SYSTEM"."PERSONNE_ON_INSERT" 
  BEFORE INSERT ON PERSONNE
  FOR EACH ROW
BEGIN
  SELECT PERSONNE_sequence.nextval
  INTO :new.id
  FROM dual;
END;
/
ALTER TRIGGER "SYSTEM"."PERSONNE_ON_INSERT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PRESENTATION_ON_INSERT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SYSTEM"."PRESENTATION_ON_INSERT" 
  BEFORE INSERT ON PRESENTATION
  FOR EACH ROW
BEGIN
  SELECT PRESENTATION_sequence.nextval
  INTO :new.id
  FROM dual;
END;
/
ALTER TRIGGER "SYSTEM"."PRESENTATION_ON_INSERT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CONTROLE_PRESENTATION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SYSTEM"."CONTROLE_PRESENTATION" 
BEFORE INSERT ON PRESENTATION
FOR EACH ROW 
DECLARE
nb NUMBER ;
BEGIN
 SELECT COUNT(*) INTO nb FROM PRESENTATION ;
IF  nb > 100 THEN 
RAISE_APPLICATION_ERROR(-20555,'impossible');
END IF;
END ;
/
ALTER TRIGGER "SYSTEM"."CONTROLE_PRESENTATION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SEMINAIRE_ON_INSERT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SYSTEM"."SEMINAIRE_ON_INSERT" 
  BEFORE INSERT ON SEMINAIRE
  FOR EACH ROW
BEGIN
  SELECT SEMINAIRE_sequence.nextval
  INTO :new.id
  FROM dual;
END;
/
ALTER TRIGGER "SYSTEM"."SEMINAIRE_ON_INSERT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SEMINAIRE_ANNEE_COURANTE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SYSTEM"."SEMINAIRE_ANNEE_COURANTE" 
BEFORE INSERT ON SEMINAIRE
FOR EACH ROW
DECLARE
d date;
BEGIN
SELECT DATE_DEBUT INTO d FROM Seminaire WHERE id = :new.id ;

IF ( d < SYSDATE + 365) THEN
    Raise_application_error('-20101','on ne peut ajouter un seminaire dans une periode plus a une année ');
END IF;
END;  

/
ALTER TRIGGER "SYSTEM"."SEMINAIRE_ANNEE_COURANTE" ENABLE;
--------------------------------------------------------
--  DDL for Procedure AJOUTERDEPARTEMENT
--------------------------------------------------------
set define off;


--------------------------------------------------------
--  Constraints for Table DEPARTEMENT
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."DEPARTEMENT" ADD CONSTRAINT "DEPARTEMENT_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "SYSTEM"."DEPARTEMENT" MODIFY ("ID_ETABLISSEMENT" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."DEPARTEMENT" MODIFY ("NOM" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."DEPARTEMENT" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DOMAINE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."DOMAINE" ADD CONSTRAINT "DOMAINE_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "SYSTEM"."DOMAINE" MODIFY ("NOM" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."DOMAINE" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ETABLISSEMENT
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."ETABLISSEMENT" ADD CONSTRAINT "ETABLISSEMENT_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "SYSTEM"."ETABLISSEMENT" MODIFY ("LOCALITE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ETABLISSEMENT" MODIFY ("NOM" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ETABLISSEMENT" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PERSONNE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."PERSONNE" ADD CONSTRAINT "PERSONNE_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "SYSTEM"."PERSONNE" MODIFY ("TYPE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PERSONNE" MODIFY ("SPECIALITE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PERSONNE" MODIFY ("TEL" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PERSONNE" MODIFY ("PRENOM" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PERSONNE" MODIFY ("NOM" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PERSONNE" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRESENTATION
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."PRESENTATION" ADD CONSTRAINT "PRESENTATION_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "SYSTEM"."PRESENTATION" MODIFY ("ID_DOMAINE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PRESENTATION" MODIFY ("ID_PERSONNE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PRESENTATION" MODIFY ("ID_SEMINAIRE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PRESENTATION" MODIFY ("HEUREPRESENTATION" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PRESENTATION" MODIFY ("DATEPRESENTATION" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PRESENTATION" MODIFY ("SUJET" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PRESENTATION" MODIFY ("TITRE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PRESENTATION" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SEMINAIRE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."SEMINAIRE" ADD CONSTRAINT "SEMINAIRE_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "SYSTEM"."SEMINAIRE" MODIFY ("ID_DEPARTEMENT" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."SEMINAIRE" MODIFY ("DATE_DEBUT" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."SEMINAIRE" MODIFY ("ETAT" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."SEMINAIRE" MODIFY ("NOM" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."SEMINAIRE" MODIFY ("ID" NOT NULL ENABLE);
