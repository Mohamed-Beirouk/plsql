--------------------------------------------------------
--  Fichier créé - lundi-février-21-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table AQ$_INTERNET_AGENT_PRIVS
--------------------------------------------------------

  CREATE TABLE "AQ$_INTERNET_AGENT_PRIVS" 
   (	"AGENT_NAME" VARCHAR2(30), 
	"DB_USERNAME" VARCHAR2(30)
   ) ;
--------------------------------------------------------
--  DDL for Table AQ$_INTERNET_AGENTS
--------------------------------------------------------

  CREATE TABLE "AQ$_INTERNET_AGENTS" 
   (	"AGENT_NAME" VARCHAR2(30), 
	"PROTOCOL" NUMBER(*,0), 
	"SPARE1" VARCHAR2(128)
   ) ;
--------------------------------------------------------
--  DDL for Table AQ$_QUEUES
--------------------------------------------------------

  CREATE TABLE "AQ$_QUEUES" 
   (	"OID" RAW(16), 
	"EVENTID" NUMBER, 
	"NAME" VARCHAR2(30), 
	"TABLE_OBJNO" NUMBER, 
	"USAGE" NUMBER, 
	"ENABLE_FLAG" NUMBER, 
	"MAX_RETRIES" NUMBER, 
	"RETRY_DELAY" NUMBER, 
	"PROPERTIES" NUMBER, 
	"RET_TIME" NUMBER, 
	"QUEUE_COMMENT" VARCHAR2(2000), 
	"SUBSCRIBERS" "AQ$_SUBSCRIBERS" , 
	"MEMORY_THRESHOLD" NUMBER, 
	"SERVICE_NAME" VARCHAR2(64), 
	"NETWORK_NAME" VARCHAR2(256)
   ) ;
--------------------------------------------------------
--  DDL for Table AQ$_QUEUE_TABLES
--------------------------------------------------------

  CREATE TABLE "AQ$_QUEUE_TABLES" 
   (	"SCHEMA" VARCHAR2(30), 
	"NAME" VARCHAR2(30), 
	"UDATA_TYPE" NUMBER, 
	"OBJNO" NUMBER, 
	"FLAGS" NUMBER, 
	"SORT_COLS" NUMBER, 
	"TIMEZONE" VARCHAR2(64), 
	"TABLE_COMMENT" VARCHAR2(2000)
   ) ;
--------------------------------------------------------
--  DDL for Table AQ$_SCHEDULES
--------------------------------------------------------

  CREATE TABLE "AQ$_SCHEDULES" 
   (	"OID" RAW(16), 
	"DESTINATION" VARCHAR2(128), 
	"START_TIME" DATE, 
	"DURATION" VARCHAR2(8), 
	"NEXT_TIME" VARCHAR2(128), 
	"LATENCY" VARCHAR2(8), 
	"LAST_TIME" DATE, 
	"JOBNO" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table CLIENTS
--------------------------------------------------------

  CREATE TABLE "CLIENTS" 
   (	"NUMCLIENT" NUMBER(*,0), 
	"NOMCLIENT" VARCHAR2(30) DEFAULT NULL, 
	"ADRESSE" VARCHAR2(10) DEFAULT NULL, 
	"TELE" VARCHAR2(10)
   ) ;
--------------------------------------------------------
--  DDL for Table DEF$_CALLDEST
--------------------------------------------------------

  CREATE TABLE "DEF$_CALLDEST" 
   (	"ENQ_TID" VARCHAR2(22), 
	"STEP_NO" NUMBER, 
	"DBLINK" VARCHAR2(128), 
	"SCHEMA_NAME" VARCHAR2(30), 
	"PACKAGE_NAME" VARCHAR2(30), 
	"CATCHUP" RAW(16) DEFAULT '00'
   ) ;

   COMMENT ON COLUMN "DEF$_CALLDEST"."ENQ_TID" IS 'Transaction ID';
   COMMENT ON COLUMN "DEF$_CALLDEST"."STEP_NO" IS 'Unique ID of call within transaction';
   COMMENT ON COLUMN "DEF$_CALLDEST"."DBLINK" IS 'The destination database';
   COMMENT ON COLUMN "DEF$_CALLDEST"."SCHEMA_NAME" IS 'The schema of the deferred remote procedure call';
   COMMENT ON COLUMN "DEF$_CALLDEST"."PACKAGE_NAME" IS 'The package of the deferred remote procedure call';
   COMMENT ON COLUMN "DEF$_CALLDEST"."CATCHUP" IS 'Dummy column for foreign key';
   COMMENT ON TABLE "DEF$_CALLDEST"  IS 'Information about call destinations for D-type and error transactions';
--------------------------------------------------------
--  DDL for Table DEF$_DEFAULTDEST
--------------------------------------------------------

  CREATE TABLE "DEF$_DEFAULTDEST" 
   (	"DBLINK" VARCHAR2(128)
   ) ;

   COMMENT ON COLUMN "DEF$_DEFAULTDEST"."DBLINK" IS 'Default destination';
   COMMENT ON TABLE "DEF$_DEFAULTDEST"  IS 'Default destinations for deferred remote procedure calls';
--------------------------------------------------------
--  DDL for Table DEF$_DESTINATION
--------------------------------------------------------

  CREATE TABLE "DEF$_DESTINATION" 
   (	"DBLINK" VARCHAR2(128), 
	"LAST_DELIVERED" NUMBER DEFAULT 0, 
	"LAST_ENQ_TID" VARCHAR2(22), 
	"LAST_SEQ" NUMBER, 
	"DISABLED" CHAR(1), 
	"JOB" NUMBER, 
	"LAST_TXN_COUNT" NUMBER, 
	"LAST_ERROR_NUMBER" NUMBER, 
	"LAST_ERROR_MESSAGE" VARCHAR2(2000), 
	"APPLY_INIT" VARCHAR2(4000), 
	"CATCHUP" RAW(16) DEFAULT '00', 
	"ALTERNATE" CHAR(1) DEFAULT 'F', 
	"TOTAL_TXN_COUNT" NUMBER DEFAULT 0, 
	"TOTAL_PROP_TIME_THROUGHPUT" NUMBER DEFAULT 0, 
	"TOTAL_PROP_TIME_LATENCY" NUMBER DEFAULT 0, 
	"TO_COMMUNICATION_SIZE" NUMBER DEFAULT 0, 
	"FROM_COMMUNICATION_SIZE" NUMBER DEFAULT 0, 
	"FLAG" RAW(4) DEFAULT '00000000', 
	"SPARE1" NUMBER DEFAULT 0, 
	"SPARE2" NUMBER DEFAULT 0, 
	"SPARE3" NUMBER DEFAULT 0, 
	"SPARE4" NUMBER DEFAULT 0
   ) ;

   COMMENT ON COLUMN "DEF$_DESTINATION"."DBLINK" IS 'Destination';
   COMMENT ON COLUMN "DEF$_DESTINATION"."LAST_DELIVERED" IS 'Value of delivery_order of last transaction propagated';
   COMMENT ON COLUMN "DEF$_DESTINATION"."LAST_ENQ_TID" IS 'Transaction ID of last transaction propagated';
   COMMENT ON COLUMN "DEF$_DESTINATION"."LAST_SEQ" IS 'Parallel prop seq number of last transaction propagated';
   COMMENT ON COLUMN "DEF$_DESTINATION"."DISABLED" IS 'Is propagation to destination disabled';
   COMMENT ON COLUMN "DEF$_DESTINATION"."JOB" IS 'Number of job that pushes queue';
   COMMENT ON COLUMN "DEF$_DESTINATION"."LAST_TXN_COUNT" IS 'Number of transactions pushed during last attempt';
   COMMENT ON COLUMN "DEF$_DESTINATION"."LAST_ERROR_NUMBER" IS 'Oracle error number from last push';
   COMMENT ON COLUMN "DEF$_DESTINATION"."LAST_ERROR_MESSAGE" IS 'Error message from last push';
   COMMENT ON COLUMN "DEF$_DESTINATION"."CATCHUP" IS 'Used to break transaction into pieces';
   COMMENT ON COLUMN "DEF$_DESTINATION"."ALTERNATE" IS 'Used to break transaction into pieces';
   COMMENT ON COLUMN "DEF$_DESTINATION"."TOTAL_TXN_COUNT" IS 'Total number of transactions pushed';
   COMMENT ON COLUMN "DEF$_DESTINATION"."TOTAL_PROP_TIME_THROUGHPUT" IS 'Total propagation time in seconds for measuring throughput';
   COMMENT ON COLUMN "DEF$_DESTINATION"."TOTAL_PROP_TIME_LATENCY" IS 'Total propagation time in seconds for measuring latency';
   COMMENT ON COLUMN "DEF$_DESTINATION"."TO_COMMUNICATION_SIZE" IS 'Total number of bytes sent to this dblink';
   COMMENT ON COLUMN "DEF$_DESTINATION"."FROM_COMMUNICATION_SIZE" IS 'Total number of bytes received from this dblink';
   COMMENT ON COLUMN "DEF$_DESTINATION"."SPARE1" IS 'Total number of round trips for this dblink';
   COMMENT ON COLUMN "DEF$_DESTINATION"."SPARE2" IS 'Total number of administrative requests';
   COMMENT ON COLUMN "DEF$_DESTINATION"."SPARE3" IS 'Total number of error transactions pushed';
   COMMENT ON COLUMN "DEF$_DESTINATION"."SPARE4" IS 'Total time in seconds spent sleeping during push';
   COMMENT ON TABLE "DEF$_DESTINATION"  IS 'Information about propagation to different destinations';
--------------------------------------------------------
--  DDL for Table DEF$_ERROR
--------------------------------------------------------

  CREATE TABLE "DEF$_ERROR" 
   (	"ENQ_TID" VARCHAR2(22), 
	"ORIGIN_TRAN_DB" VARCHAR2(128), 
	"ORIGIN_ENQ_TID" VARCHAR2(22), 
	"DESTINATION" VARCHAR2(128), 
	"STEP_NO" NUMBER, 
	"RECEIVER" NUMBER, 
	"ENQ_TIME" DATE, 
	"ERROR_NUMBER" NUMBER, 
	"ERROR_MSG" VARCHAR2(2000)
   ) ;

   COMMENT ON COLUMN "DEF$_ERROR"."ENQ_TID" IS 'The ID of the transaction that created the error';
   COMMENT ON COLUMN "DEF$_ERROR"."ORIGIN_TRAN_DB" IS 'The database originating the deferred transaction';
   COMMENT ON COLUMN "DEF$_ERROR"."ORIGIN_ENQ_TID" IS 'The original ID of the transaction';
   COMMENT ON COLUMN "DEF$_ERROR"."DESTINATION" IS 'Database link used to address destination';
   COMMENT ON COLUMN "DEF$_ERROR"."STEP_NO" IS 'Unique ID of call that caused an error';
   COMMENT ON COLUMN "DEF$_ERROR"."RECEIVER" IS 'User ID of the original receiver';
   COMMENT ON COLUMN "DEF$_ERROR"."ENQ_TIME" IS 'Time original transaction enqueued';
   COMMENT ON COLUMN "DEF$_ERROR"."ERROR_NUMBER" IS 'Oracle error number';
   COMMENT ON COLUMN "DEF$_ERROR"."ERROR_MSG" IS 'Error message text';
   COMMENT ON TABLE "DEF$_ERROR"  IS 'Information about all deferred transactions that caused an error';
--------------------------------------------------------
--  DDL for Table DEF$_LOB
--------------------------------------------------------

  CREATE TABLE "DEF$_LOB" 
   (	"ID" RAW(16), 
	"ENQ_TID" VARCHAR2(22), 
	"BLOB_COL" BLOB, 
	"CLOB_COL" CLOB, 
	"NCLOB_COL" NCLOB
   ) ;

   COMMENT ON COLUMN "DEF$_LOB"."ID" IS 'Identifier of LOB parameter';
   COMMENT ON COLUMN "DEF$_LOB"."ENQ_TID" IS 'Transaction identifier for deferred RPC with this LOB parameter';
   COMMENT ON COLUMN "DEF$_LOB"."BLOB_COL" IS 'Binary LOB parameter';
   COMMENT ON COLUMN "DEF$_LOB"."CLOB_COL" IS 'Character LOB parameter';
   COMMENT ON COLUMN "DEF$_LOB"."NCLOB_COL" IS 'National Character LOB parameter';
   COMMENT ON TABLE "DEF$_LOB"  IS 'Storage for LOB parameters to deferred RPCs';
--------------------------------------------------------
--  DDL for Table DEF$_ORIGIN
--------------------------------------------------------

  CREATE TABLE "DEF$_ORIGIN" 
   (	"ORIGIN_DB" VARCHAR2(128), 
	"ORIGIN_DBLINK" VARCHAR2(128), 
	"INUSR" NUMBER, 
	"CSCN" NUMBER, 
	"ENQ_TID" VARCHAR2(22), 
	"RECO_SEQ_NO" NUMBER, 
	"CATCHUP" RAW(16) DEFAULT '00'
   ) ;

   COMMENT ON COLUMN "DEF$_ORIGIN"."ORIGIN_DB" IS 'Originating database for the deferred transaction';
   COMMENT ON COLUMN "DEF$_ORIGIN"."ORIGIN_DBLINK" IS 'Database link from deferred transaction origin to this site';
   COMMENT ON COLUMN "DEF$_ORIGIN"."INUSR" IS 'Connected user receiving the deferred transaction';
   COMMENT ON COLUMN "DEF$_ORIGIN"."CSCN" IS 'Prepare SCN assigned at origin site';
   COMMENT ON COLUMN "DEF$_ORIGIN"."ENQ_TID" IS 'Transaction id assigned at origin site';
   COMMENT ON COLUMN "DEF$_ORIGIN"."RECO_SEQ_NO" IS 'Deferred transaction sequence number for recovery';
   COMMENT ON COLUMN "DEF$_ORIGIN"."CATCHUP" IS 'Used to break transaction into pieces';
   COMMENT ON TABLE "DEF$_ORIGIN"  IS 'Information about deferred transactions pushed to this site';
--------------------------------------------------------
--  DDL for Table DEF$_PROPAGATOR
--------------------------------------------------------

  CREATE TABLE "DEF$_PROPAGATOR" 
   (	"USERID" NUMBER, 
	"USERNAME" VARCHAR2(30), 
	"CREATED" DATE DEFAULT SYSDATE
   ) ;

   COMMENT ON COLUMN "DEF$_PROPAGATOR"."USERID" IS 'User ID of the propagator';
   COMMENT ON COLUMN "DEF$_PROPAGATOR"."USERNAME" IS 'User name of the propagator';
   COMMENT ON COLUMN "DEF$_PROPAGATOR"."CREATED" IS 'The time when the propagator is registered';
   COMMENT ON TABLE "DEF$_PROPAGATOR"  IS 'The propagator for deferred remote procedure calls';
--------------------------------------------------------
--  DDL for Table DEF$_PUSHED_TRANSACTIONS
--------------------------------------------------------

  CREATE TABLE "DEF$_PUSHED_TRANSACTIONS" 
   (	"SOURCE_SITE_ID" NUMBER, 
	"LAST_TRAN_ID" NUMBER DEFAULT 0, 
	"DISABLED" VARCHAR2(1) DEFAULT 'F', 
	"SOURCE_SITE" VARCHAR2(128)
   ) ;

   COMMENT ON COLUMN "DEF$_PUSHED_TRANSACTIONS"."SOURCE_SITE_ID" IS 'Originating database identifier for the deferred transaction';
   COMMENT ON COLUMN "DEF$_PUSHED_TRANSACTIONS"."LAST_TRAN_ID" IS 'Last committed transaction';
   COMMENT ON COLUMN "DEF$_PUSHED_TRANSACTIONS"."DISABLED" IS 'Disable propagation';
   COMMENT ON COLUMN "DEF$_PUSHED_TRANSACTIONS"."SOURCE_SITE" IS 'Obsolete - do not use';
   COMMENT ON TABLE "DEF$_PUSHED_TRANSACTIONS"  IS 'Information about deferred transactions pushed to this site by RepAPI clients';
--------------------------------------------------------
--  DDL for Table DEPARTEMENT
--------------------------------------------------------

  CREATE TABLE "DEPARTEMENT" 
   (	"ID" NUMBER(*,0), 
	"NOM" VARCHAR2(50), 
	"ID_ETABLISSEMENT" NUMBER(*,0)
   ) ;
--------------------------------------------------------
--  DDL for Table DOMAINE
--------------------------------------------------------

  CREATE TABLE "DOMAINE" 
   (	"ID" NUMBER(*,0), 
	"NOM" VARCHAR2(50)
   ) ;
--------------------------------------------------------
--  DDL for Table ETABLISSEMENT
--------------------------------------------------------

  CREATE TABLE "ETABLISSEMENT" 
   (	"ID" NUMBER(*,0), 
	"NOM" VARCHAR2(50), 
	"LOCALITE" VARCHAR2(50)
   ) ;
--------------------------------------------------------
--  DDL for Table HELP
--------------------------------------------------------

  CREATE TABLE "HELP" 
   (	"TOPIC" VARCHAR2(50), 
	"SEQ" NUMBER, 
	"INFO" VARCHAR2(80)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_AGE_SPILL$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_AGE_SPILL$" 
   (	"SESSION#" NUMBER, 
	"XIDUSN" NUMBER, 
	"XIDSLT" NUMBER, 
	"XIDSQN" NUMBER, 
	"CHUNK" NUMBER, 
	"SEQUENCE#" NUMBER, 
	"OFFSET" NUMBER, 
	"SPILL_DATA" BLOB, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_ATTRCOL$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_ATTRCOL$" 
   (	"INTCOL#" NUMBER, 
	"NAME" VARCHAR2(4000), 
	"OBJ#" NUMBER, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_ATTRIBUTE$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_ATTRIBUTE$" 
   (	"VERSION#" NUMBER, 
	"NAME" VARCHAR2(30), 
	"ATTRIBUTE#" NUMBER, 
	"ATTR_TOID" RAW(16), 
	"ATTR_VERSION#" NUMBER, 
	"SYNOBJ#" NUMBER, 
	"PROPERTIES" NUMBER, 
	"CHARSETID" NUMBER, 
	"CHARSETFORM" NUMBER, 
	"LENGTH" NUMBER, 
	"PRECISION#" NUMBER, 
	"SCALE" NUMBER, 
	"EXTERNNAME" VARCHAR2(4000), 
	"XFLAGS" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"SPARE4" NUMBER, 
	"SPARE5" NUMBER, 
	"SETTER" NUMBER, 
	"GETTER" NUMBER, 
	"TOID" RAW(16), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_CCOL$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_CCOL$" 
   (	"CON#" NUMBER, 
	"OBJ#" NUMBER, 
	"COL#" NUMBER, 
	"POS#" NUMBER, 
	"INTCOL#" NUMBER, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNRC_DBNAME_UID_MAP
--------------------------------------------------------

  CREATE TABLE "LOGMNRC_DBNAME_UID_MAP" 
   (	"GLOBAL_NAME" VARCHAR2(128), 
	"LOGMNR_UID" NUMBER, 
	"FLAGS" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_CDEF$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_CDEF$" 
   (	"CON#" NUMBER, 
	"COLS" NUMBER, 
	"TYPE#" NUMBER, 
	"ROBJ#" NUMBER, 
	"RCON#" NUMBER, 
	"ENABLED" NUMBER, 
	"DEFER" NUMBER, 
	"OBJ#" NUMBER, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNRC_GSBA
--------------------------------------------------------

  CREATE TABLE "LOGMNRC_GSBA" 
   (	"LOGMNR_UID" NUMBER, 
	"AS_OF_SCN" NUMBER, 
	"FDO_LENGTH" NUMBER, 
	"FDO_VALUE" RAW(255), 
	"CHARSETID" NUMBER, 
	"NCHARSETID" NUMBER, 
	"DBTIMEZONE_LEN" NUMBER, 
	"DBTIMEZONE_VALUE" VARCHAR2(64), 
	"LOGMNR_SPARE1" NUMBER, 
	"LOGMNR_SPARE2" NUMBER, 
	"LOGMNR_SPARE3" VARCHAR2(1000), 
	"LOGMNR_SPARE4" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNRC_GSII
--------------------------------------------------------

  CREATE TABLE "LOGMNRC_GSII" 
   (	"LOGMNR_UID" NUMBER, 
	"OBJ#" NUMBER, 
	"BO#" NUMBER, 
	"INDTYPE#" NUMBER, 
	"DROP_SCN" NUMBER, 
	"LOGMNR_SPARE1" NUMBER, 
	"LOGMNR_SPARE2" NUMBER, 
	"LOGMNR_SPARE3" VARCHAR2(1000), 
	"LOGMNR_SPARE4" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNRC_GTCS
--------------------------------------------------------

  CREATE TABLE "LOGMNRC_GTCS" 
   (	"LOGMNR_UID" NUMBER, 
	"OBJ#" NUMBER, 
	"OBJV#" NUMBER, 
	"SEGCOL#" NUMBER, 
	"INTCOL#" NUMBER, 
	"COLNAME" VARCHAR2(30), 
	"TYPE#" NUMBER, 
	"LENGTH" NUMBER, 
	"PRECISION" NUMBER, 
	"SCALE" NUMBER, 
	"INTERVAL_LEADING_PRECISION" NUMBER, 
	"INTERVAL_TRAILING_PRECISION" NUMBER, 
	"PROPERTY" NUMBER, 
	"TOID" RAW(16), 
	"CHARSETID" NUMBER, 
	"CHARSETFORM" NUMBER, 
	"TYPENAME" VARCHAR2(30), 
	"FQCOLNAME" VARCHAR2(4000), 
	"NUMINTCOLS" NUMBER, 
	"NUMATTRS" NUMBER, 
	"ADTORDER" NUMBER, 
	"LOGMNR_SPARE1" NUMBER, 
	"LOGMNR_SPARE2" NUMBER, 
	"LOGMNR_SPARE3" VARCHAR2(1000), 
	"LOGMNR_SPARE4" DATE, 
	"LOGMNR_SPARE5" NUMBER, 
	"LOGMNR_SPARE6" NUMBER, 
	"LOGMNR_SPARE7" NUMBER, 
	"LOGMNR_SPARE8" NUMBER, 
	"LOGMNR_SPARE9" NUMBER, 
	"COL#" NUMBER, 
	"XTYPESCHEMANAME" VARCHAR2(30), 
	"XTYPENAME" VARCHAR2(4000), 
	"XFQCOLNAME" VARCHAR2(4000), 
	"XTOPINTCOL" NUMBER, 
	"XREFFEDTABLEOBJN" NUMBER, 
	"XREFFEDTABLEOBJV" NUMBER, 
	"XCOLTYPEFLAGS" NUMBER, 
	"XOPQTYPETYPE" NUMBER, 
	"XOPQTYPEFLAGS" NUMBER, 
	"XOPQLOBINTCOL" NUMBER, 
	"XOPQOBJINTCOL" NUMBER, 
	"XXMLINTCOL" NUMBER, 
	"EAOWNER#" NUMBER, 
	"EAMKEYID" VARCHAR2(64), 
	"EAENCALG" NUMBER, 
	"EAINTALG" NUMBER, 
	"EACOLKLC" RAW(2000), 
	"EAKLCLEN" NUMBER, 
	"EAFLAGS" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNRC_GTLO
--------------------------------------------------------

  CREATE TABLE "LOGMNRC_GTLO" 
   (	"LOGMNR_UID" NUMBER, 
	"KEYOBJ#" NUMBER, 
	"LVLCNT" NUMBER, 
	"BASEOBJ#" NUMBER, 
	"BASEOBJV#" NUMBER, 
	"LVL1OBJ#" NUMBER, 
	"LVL2OBJ#" NUMBER, 
	"LVL0TYPE#" NUMBER, 
	"LVL1TYPE#" NUMBER, 
	"LVL2TYPE#" NUMBER, 
	"OWNER#" NUMBER, 
	"OWNERNAME" VARCHAR2(30), 
	"LVL0NAME" VARCHAR2(30), 
	"LVL1NAME" VARCHAR2(30), 
	"LVL2NAME" VARCHAR2(30), 
	"INTCOLS" NUMBER, 
	"COLS" NUMBER, 
	"KERNELCOLS" NUMBER, 
	"TAB_FLAGS" NUMBER, 
	"TRIGFLAG" NUMBER, 
	"ASSOC#" NUMBER, 
	"OBJ_FLAGS" NUMBER, 
	"TS#" NUMBER, 
	"TSNAME" VARCHAR2(30), 
	"PROPERTY" NUMBER, 
	"START_SCN" NUMBER, 
	"DROP_SCN" NUMBER, 
	"XIDUSN" NUMBER, 
	"XIDSLT" NUMBER, 
	"XIDSQN" NUMBER, 
	"FLAGS" NUMBER, 
	"LOGMNR_SPARE1" NUMBER, 
	"LOGMNR_SPARE2" NUMBER, 
	"LOGMNR_SPARE3" VARCHAR2(1000), 
	"LOGMNR_SPARE4" DATE, 
	"LOGMNR_SPARE5" NUMBER, 
	"LOGMNR_SPARE6" NUMBER, 
	"LOGMNR_SPARE7" NUMBER, 
	"LOGMNR_SPARE8" NUMBER, 
	"LOGMNR_SPARE9" NUMBER, 
	"PARTTYPE" NUMBER, 
	"SUBPARTTYPE" NUMBER, 
	"UNSUPPORTEDCOLS" NUMBER, 
	"COMPLEXTYPECOLS" NUMBER, 
	"NTPARENTOBJNUM" NUMBER, 
	"NTPARENTOBJVERSION" NUMBER, 
	"NTPARENTINTCOLNUM" NUMBER, 
	"LOGMNRTLOFLAGS" NUMBER, 
	"LOGMNRMCV" VARCHAR2(30)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_COL$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_COL$" 
   (	"COL#" NUMBER(22,0), 
	"SEGCOL#" NUMBER(22,0), 
	"NAME" VARCHAR2(30), 
	"TYPE#" NUMBER(22,0), 
	"LENGTH" NUMBER(22,0), 
	"PRECISION#" NUMBER(22,0), 
	"SCALE" NUMBER(22,0), 
	"NULL$" NUMBER(22,0), 
	"INTCOL#" NUMBER(22,0), 
	"PROPERTY" NUMBER(22,0), 
	"CHARSETID" NUMBER(22,0), 
	"CHARSETFORM" NUMBER(22,0), 
	"SPARE1" NUMBER(22,0), 
	"SPARE2" NUMBER(22,0), 
	"OBJ#" NUMBER(22,0), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_COLTYPE$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_COLTYPE$" 
   (	"COL#" NUMBER, 
	"INTCOL#" NUMBER, 
	"TOID" RAW(16), 
	"VERSION#" NUMBER, 
	"PACKED" NUMBER, 
	"INTCOLS" NUMBER, 
	"INTCOL#S" RAW(2000), 
	"FLAGS" NUMBER, 
	"TYPIDCOL#" NUMBER, 
	"SYNOBJ#" NUMBER, 
	"OBJ#" NUMBER, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_DICTIONARY$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_DICTIONARY$" 
   (	"DB_NAME" VARCHAR2(9), 
	"DB_ID" NUMBER(20,0), 
	"DB_CREATED" VARCHAR2(20), 
	"DB_DICT_CREATED" VARCHAR2(20), 
	"DB_DICT_SCN" NUMBER(22,0), 
	"DB_THREAD_MAP" RAW(8), 
	"DB_TXN_SCNBAS" NUMBER(22,0), 
	"DB_TXN_SCNWRP" NUMBER(22,0), 
	"DB_RESETLOGS_CHANGE#" NUMBER(22,0), 
	"DB_RESETLOGS_TIME" VARCHAR2(20), 
	"DB_VERSION_TIME" VARCHAR2(20), 
	"DB_REDO_TYPE_ID" VARCHAR2(8), 
	"DB_REDO_RELEASE" VARCHAR2(60), 
	"DB_CHARACTER_SET" VARCHAR2(30), 
	"DB_VERSION" VARCHAR2(64), 
	"DB_STATUS" VARCHAR2(64), 
	"DB_GLOBAL_NAME" VARCHAR2(128), 
	"DB_DICT_MAXOBJECTS" NUMBER(22,0), 
	"DB_DICT_OBJECTCOUNT" NUMBER(22,0), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_DICTSTATE$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_DICTSTATE$" 
   (	"LOGMNR_UID" NUMBER(22,0), 
	"START_SCNBAS" NUMBER, 
	"START_SCNWRP" NUMBER, 
	"END_SCNBAS" NUMBER, 
	"END_SCNWRP" NUMBER, 
	"REDO_THREAD" NUMBER, 
	"RBASQN" NUMBER, 
	"RBABLK" NUMBER, 
	"RBABYTE" NUMBER, 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_ENC$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_ENC$" 
   (	"OBJ#" NUMBER, 
	"OWNER#" NUMBER, 
	"ENCALG" NUMBER, 
	"INTALG" NUMBER, 
	"COLKLC" RAW(2000), 
	"KLCLEN" NUMBER, 
	"FLAG" NUMBER, 
	"MKEYID" VARCHAR2(64), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_ERROR$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_ERROR$" 
   (	"SESSION#" NUMBER, 
	"TIME_OF_ERROR" DATE, 
	"CODE" NUMBER, 
	"MESSAGE" VARCHAR2(4000), 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"SPARE4" VARCHAR2(4000), 
	"SPARE5" VARCHAR2(4000)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_FILTER$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_FILTER$" 
   (	"SESSION#" NUMBER, 
	"FILTER_TYPE" VARCHAR2(30), 
	"ATTR1" NUMBER, 
	"ATTR2" NUMBER, 
	"ATTR3" NUMBER, 
	"ATTR4" NUMBER, 
	"ATTR5" NUMBER, 
	"ATTR6" NUMBER, 
	"FILTER_SCN" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_GLOBAL$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_GLOBAL$" 
   (	"HIGH_RECID_FOREIGN" NUMBER, 
	"HIGH_RECID_DELETED" NUMBER, 
	"LOCAL_RESET_SCN" NUMBER, 
	"LOCAL_RESET_TIMESTAMP" NUMBER, 
	"VERSION_TIMESTAMP" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"SPARE4" VARCHAR2(2000), 
	"SPARE5" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_GT_TAB_INCLUDE$
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "LOGMNR_GT_TAB_INCLUDE$" 
   (	"SCHEMA_NAME" VARCHAR2(32), 
	"TABLE_NAME" VARCHAR2(32)
   ) ON COMMIT PRESERVE ROWS ;
--------------------------------------------------------
--  DDL for Table LOGMNR_GT_USER_INCLUDE$
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "LOGMNR_GT_USER_INCLUDE$" 
   (	"USER_NAME" VARCHAR2(32), 
	"USER_TYPE" NUMBER
   ) ON COMMIT PRESERVE ROWS ;
--------------------------------------------------------
--  DDL for Table LOGMNR_GT_XID_INCLUDE$
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "LOGMNR_GT_XID_INCLUDE$" 
   (	"XIDUSN" NUMBER, 
	"XIDSLT" NUMBER, 
	"XIDSQN" NUMBER
   ) ON COMMIT PRESERVE ROWS ;
--------------------------------------------------------
--  DDL for Table LOGMNR_ICOL$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_ICOL$" 
   (	"OBJ#" NUMBER, 
	"BO#" NUMBER, 
	"COL#" NUMBER, 
	"POS#" NUMBER, 
	"SEGCOL#" NUMBER, 
	"INTCOL#" NUMBER, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_IND$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_IND$" 
   (	"BO#" NUMBER(22,0), 
	"COLS" NUMBER(22,0), 
	"TYPE#" NUMBER(22,0), 
	"FLAGS" NUMBER, 
	"PROPERTY" NUMBER, 
	"OBJ#" NUMBER(22,0), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_INDCOMPART$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_INDCOMPART$" 
   (	"OBJ#" NUMBER, 
	"DATAOBJ#" NUMBER, 
	"BO#" NUMBER, 
	"PART#" NUMBER, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_INDPART$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_INDPART$" 
   (	"OBJ#" NUMBER, 
	"BO#" NUMBER, 
	"PART#" NUMBER, 
	"TS#" NUMBER, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_INDSUBPART$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_INDSUBPART$" 
   (	"OBJ#" NUMBER(22,0), 
	"DATAOBJ#" NUMBER(22,0), 
	"POBJ#" NUMBER(22,0), 
	"SUBPART#" NUMBER(22,0), 
	"TS#" NUMBER(22,0), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_INTEGRATED_SPILL$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_INTEGRATED_SPILL$" 
   (	"SESSION#" NUMBER, 
	"XIDUSN" NUMBER, 
	"XIDSLT" NUMBER, 
	"XIDSQN" NUMBER, 
	"CHUNK" NUMBER, 
	"FLAG" NUMBER, 
	"CTIME" DATE, 
	"MTIME" DATE, 
	"SPILL_DATA" BLOB, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"SPARE4" DATE, 
	"SPARE5" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_KOPM$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_KOPM$" 
   (	"LENGTH" NUMBER, 
	"METADATA" RAW(255), 
	"NAME" VARCHAR2(30), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_LOB$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_LOB$" 
   (	"OBJ#" NUMBER, 
	"INTCOL#" NUMBER, 
	"COL#" NUMBER, 
	"LOBJ#" NUMBER, 
	"CHUNK" NUMBER, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_LOBFRAG$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_LOBFRAG$" 
   (	"FRAGOBJ#" NUMBER, 
	"PARENTOBJ#" NUMBER, 
	"TABFRAGOBJ#" NUMBER, 
	"INDFRAGOBJ#" NUMBER, 
	"FRAG#" NUMBER, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_LOG$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_LOG$" 
   (	"SESSION#" NUMBER, 
	"THREAD#" NUMBER, 
	"SEQUENCE#" NUMBER, 
	"FIRST_CHANGE#" NUMBER, 
	"NEXT_CHANGE#" NUMBER, 
	"FIRST_TIME" DATE, 
	"NEXT_TIME" DATE, 
	"FILE_NAME" VARCHAR2(513), 
	"STATUS" NUMBER, 
	"INFO" VARCHAR2(32), 
	"TIMESTAMP" DATE, 
	"DICT_BEGIN" VARCHAR2(3), 
	"DICT_END" VARCHAR2(3), 
	"STATUS_INFO" VARCHAR2(32), 
	"DB_ID" NUMBER, 
	"RESETLOGS_CHANGE#" NUMBER, 
	"RESET_TIMESTAMP" NUMBER, 
	"PREV_RESETLOGS_CHANGE#" NUMBER, 
	"PREV_RESET_TIMESTAMP" NUMBER, 
	"BLOCKS" NUMBER, 
	"BLOCK_SIZE" NUMBER, 
	"FLAGS" NUMBER, 
	"CONTENTS" NUMBER, 
	"RECID" NUMBER, 
	"RECSTAMP" NUMBER, 
	"MARK_DELETE_TIMESTAMP" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"SPARE4" NUMBER, 
	"SPARE5" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_LOGMNR_BUILDLOG
--------------------------------------------------------

  CREATE TABLE "LOGMNR_LOGMNR_BUILDLOG" 
   (	"BUILD_DATE" VARCHAR2(20), 
	"DB_TXN_SCNBAS" NUMBER, 
	"DB_TXN_SCNWRP" NUMBER, 
	"CURRENT_BUILD_STATE" NUMBER, 
	"COMPLETION_STATUS" NUMBER, 
	"MARKED_LOG_FILE_LOW_SCN" NUMBER, 
	"INITIAL_XID" VARCHAR2(22), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_NTAB$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_NTAB$" 
   (	"COL#" NUMBER, 
	"INTCOL#" NUMBER, 
	"NTAB#" NUMBER, 
	"NAME" VARCHAR2(4000), 
	"OBJ#" NUMBER, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_OBJ$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_OBJ$" 
   (	"OBJV#" NUMBER(22,0), 
	"OWNER#" NUMBER(22,0), 
	"NAME" VARCHAR2(30), 
	"NAMESPACE" NUMBER(22,0), 
	"SUBNAME" VARCHAR2(30), 
	"TYPE#" NUMBER(22,0), 
	"OID$" RAW(16), 
	"REMOTEOWNER" VARCHAR2(30), 
	"LINKNAME" VARCHAR2(128), 
	"FLAGS" NUMBER(22,0), 
	"SPARE3" NUMBER(22,0), 
	"STIME" DATE, 
	"OBJ#" NUMBER(22,0), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0), 
	"START_SCNBAS" NUMBER, 
	"START_SCNWRP" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_OPQTYPE$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_OPQTYPE$" 
   (	"INTCOL#" NUMBER, 
	"TYPE" NUMBER, 
	"FLAGS" NUMBER, 
	"LOBCOL" NUMBER, 
	"OBJCOL" NUMBER, 
	"EXTRACOL" NUMBER, 
	"SCHEMAOID" RAW(16), 
	"ELEMNUM" NUMBER, 
	"SCHEMAURL" VARCHAR2(4000), 
	"OBJ#" NUMBER, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_PARAMETER$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_PARAMETER$" 
   (	"SESSION#" NUMBER, 
	"NAME" VARCHAR2(30), 
	"VALUE" VARCHAR2(2000), 
	"TYPE" NUMBER, 
	"SCN" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(2000)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_PARTOBJ$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_PARTOBJ$" 
   (	"PARTTYPE" NUMBER, 
	"PARTCNT" NUMBER, 
	"PARTKEYCOLS" NUMBER, 
	"FLAGS" NUMBER, 
	"DEFTS#" NUMBER, 
	"DEFPCTFREE" NUMBER, 
	"DEFPCTUSED" NUMBER, 
	"DEFPCTTHRES" NUMBER, 
	"DEFINITRANS" NUMBER, 
	"DEFMAXTRANS" NUMBER, 
	"DEFTINIEXTS" NUMBER, 
	"DEFEXTSIZE" NUMBER, 
	"DEFMINEXTS" NUMBER, 
	"DEFMAXEXTS" NUMBER, 
	"DEFEXTPCT" NUMBER, 
	"DEFLISTS" NUMBER, 
	"DEFGROUPS" NUMBER, 
	"DEFLOGGING" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"DEFINCLCOL" NUMBER, 
	"PARAMETERS" VARCHAR2(1000), 
	"OBJ#" NUMBER, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNRP_CTAS_PART_MAP
--------------------------------------------------------

  CREATE TABLE "LOGMNRP_CTAS_PART_MAP" 
   (	"LOGMNR_UID" NUMBER, 
	"BASEOBJ#" NUMBER, 
	"BASEOBJV#" NUMBER, 
	"KEYOBJ#" NUMBER, 
	"PART#" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(1000)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_PROCESSED_LOG$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_PROCESSED_LOG$" 
   (	"SESSION#" NUMBER, 
	"THREAD#" NUMBER, 
	"SEQUENCE#" NUMBER, 
	"FIRST_CHANGE#" NUMBER, 
	"NEXT_CHANGE#" NUMBER, 
	"FIRST_TIME" DATE, 
	"NEXT_TIME" DATE, 
	"FILE_NAME" VARCHAR2(513), 
	"STATUS" NUMBER, 
	"INFO" VARCHAR2(32), 
	"TIMESTAMP" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_PROPS$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_PROPS$" 
   (	"VALUE$" VARCHAR2(4000), 
	"COMMENT$" VARCHAR2(4000), 
	"NAME" VARCHAR2(30), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_REFCON$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_REFCON$" 
   (	"COL#" NUMBER, 
	"INTCOL#" NUMBER, 
	"REFTYP" NUMBER, 
	"STABID" RAW(16), 
	"EXPCTOID" RAW(16), 
	"OBJ#" NUMBER, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_RESTART_CKPT$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_RESTART_CKPT$" 
   (	"SESSION#" NUMBER, 
	"VALID" NUMBER, 
	"CKPT_SCN" NUMBER, 
	"XIDUSN" NUMBER, 
	"XIDSLT" NUMBER, 
	"XIDSQN" NUMBER, 
	"SESSION_NUM" NUMBER, 
	"SERIAL_NUM" NUMBER, 
	"CKPT_INFO" BLOB, 
	"FLAG" NUMBER, 
	"OFFSET" NUMBER, 
	"CLIENT_DATA" BLOB, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_RESTART_CKPT_TXINFO$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_RESTART_CKPT_TXINFO$" 
   (	"SESSION#" NUMBER, 
	"XIDUSN" NUMBER, 
	"XIDSLT" NUMBER, 
	"XIDSQN" NUMBER, 
	"SESSION_NUM" NUMBER, 
	"SERIAL_NUM" NUMBER, 
	"FLAG" NUMBER, 
	"START_SCN" NUMBER, 
	"EFFECTIVE_SCN" NUMBER, 
	"OFFSET" NUMBER, 
	"TX_DATA" BLOB
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_SEED$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_SEED$" 
   (	"SEED_VERSION" NUMBER(22,0), 
	"GATHER_VERSION" NUMBER(22,0), 
	"SCHEMANAME" VARCHAR2(30), 
	"OBJ#" NUMBER, 
	"OBJV#" NUMBER(22,0), 
	"TABLE_NAME" VARCHAR2(30), 
	"COL_NAME" VARCHAR2(30), 
	"COL#" NUMBER, 
	"INTCOL#" NUMBER, 
	"SEGCOL#" NUMBER, 
	"TYPE#" NUMBER, 
	"LENGTH" NUMBER, 
	"PRECISION#" NUMBER, 
	"SCALE" NUMBER, 
	"NULL$" NUMBER, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_SESSION$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_SESSION$" 
   (	"SESSION#" NUMBER, 
	"CLIENT#" NUMBER, 
	"SESSION_NAME" VARCHAR2(128), 
	"DB_ID" NUMBER, 
	"RESETLOGS_CHANGE#" NUMBER, 
	"SESSION_ATTR" NUMBER, 
	"SESSION_ATTR_VERBOSE" VARCHAR2(400), 
	"START_SCN" NUMBER, 
	"END_SCN" NUMBER, 
	"SPILL_SCN" NUMBER, 
	"SPILL_TIME" DATE, 
	"OLDEST_SCN" NUMBER, 
	"RESUME_SCN" NUMBER, 
	"GLOBAL_DB_NAME" VARCHAR2(128) DEFAULT null, 
	"RESET_TIMESTAMP" NUMBER, 
	"BRANCH_SCN" NUMBER, 
	"VERSION" VARCHAR2(64), 
	"REDO_COMPAT" VARCHAR2(20), 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"SPARE4" NUMBER, 
	"SPARE5" NUMBER, 
	"SPARE6" DATE, 
	"SPARE7" VARCHAR2(1000), 
	"SPARE8" VARCHAR2(1000)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_SESSION_ACTIONS$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_SESSION_ACTIONS$" 
   (	"FLAGSRUNTIME" NUMBER DEFAULT 0, 
	"DROPSCN" NUMBER, 
	"MODIFYTIME" TIMESTAMP (6), 
	"DISPATCHTIME" TIMESTAMP (6), 
	"DROPTIME" TIMESTAMP (6), 
	"LCRCOUNT" NUMBER DEFAULT 0, 
	"ACTIONNAME" VARCHAR2(30), 
	"LOGMNRSESSION#" NUMBER, 
	"PROCESSROLE#" NUMBER, 
	"ACTIONTYPE#" NUMBER, 
	"FLAGSDEFINETIME" NUMBER, 
	"CREATETIME" TIMESTAMP (6), 
	"XIDUSN" NUMBER, 
	"XIDSLT" NUMBER, 
	"XIDSQN" NUMBER, 
	"THREAD#" NUMBER, 
	"STARTSCN" NUMBER, 
	"STARTSUBSCN" NUMBER, 
	"ENDSCN" NUMBER, 
	"ENDSUBSCN" NUMBER, 
	"RBASQN" NUMBER, 
	"RBABLK" NUMBER, 
	"RBABYTE" NUMBER, 
	"SESSION#" NUMBER, 
	"OBJ#" NUMBER, 
	"ATTR1" NUMBER, 
	"ATTR2" NUMBER, 
	"ATTR3" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" TIMESTAMP (6), 
	"SPARE4" VARCHAR2(2000)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_SESSION_EVOLVE$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_SESSION_EVOLVE$" 
   (	"BRANCH_LEVEL" NUMBER, 
	"SESSION#" NUMBER, 
	"DB_ID" NUMBER, 
	"RESET_SCN" NUMBER, 
	"RESET_TIMESTAMP" NUMBER, 
	"PREV_RESET_SCN" NUMBER, 
	"PREV_RESET_TIMESTAMP" NUMBER, 
	"STATUS" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"SPARE4" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_SPILL$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_SPILL$" 
   (	"SESSION#" NUMBER, 
	"XIDUSN" NUMBER, 
	"XIDSLT" NUMBER, 
	"XIDSQN" NUMBER, 
	"CHUNK" NUMBER, 
	"STARTIDX" NUMBER, 
	"ENDIDX" NUMBER, 
	"FLAG" NUMBER, 
	"SEQUENCE#" NUMBER, 
	"SPILL_DATA" BLOB, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_SUBCOLTYPE$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_SUBCOLTYPE$" 
   (	"INTCOL#" NUMBER, 
	"TOID" RAW(16), 
	"VERSION#" NUMBER, 
	"INTCOLS" NUMBER, 
	"INTCOL#S" RAW(2000), 
	"FLAGS" NUMBER, 
	"SYNOBJ#" NUMBER, 
	"OBJ#" NUMBER, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_TAB$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_TAB$" 
   (	"TS#" NUMBER(22,0), 
	"COLS" NUMBER(22,0), 
	"PROPERTY" NUMBER(22,0), 
	"INTCOLS" NUMBER(22,0), 
	"KERNELCOLS" NUMBER(22,0), 
	"BOBJ#" NUMBER(22,0), 
	"TRIGFLAG" NUMBER(22,0), 
	"FLAGS" NUMBER(22,0), 
	"OBJ#" NUMBER(22,0), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_TABCOMPART$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_TABCOMPART$" 
   (	"OBJ#" NUMBER(22,0), 
	"BO#" NUMBER(22,0), 
	"PART#" NUMBER(22,0), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_TABPART$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_TABPART$" 
   (	"OBJ#" NUMBER(22,0), 
	"TS#" NUMBER(22,0), 
	"PART#" NUMBER, 
	"BO#" NUMBER(22,0), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_TABSUBPART$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_TABSUBPART$" 
   (	"OBJ#" NUMBER(22,0), 
	"DATAOBJ#" NUMBER(22,0), 
	"POBJ#" NUMBER(22,0), 
	"SUBPART#" NUMBER(22,0), 
	"TS#" NUMBER(22,0), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNRT_MDDL$
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "LOGMNRT_MDDL$" 
   (	"SOURCE_OBJ#" NUMBER, 
	"SOURCE_ROWID" ROWID, 
	"DEST_ROWID" ROWID
   ) ON COMMIT DELETE ROWS ;
--------------------------------------------------------
--  DDL for Table LOGMNR_TS$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_TS$" 
   (	"TS#" NUMBER(22,0), 
	"NAME" VARCHAR2(30), 
	"OWNER#" NUMBER(22,0), 
	"BLOCKSIZE" NUMBER(22,0), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_TYPE$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_TYPE$" 
   (	"VERSION#" NUMBER, 
	"VERSION" VARCHAR2(30), 
	"TVOID" RAW(16), 
	"TYPECODE" NUMBER, 
	"PROPERTIES" NUMBER, 
	"ATTRIBUTES" NUMBER, 
	"METHODS" NUMBER, 
	"HIDDENMETHODS" NUMBER, 
	"SUPERTYPES" NUMBER, 
	"SUBTYPES" NUMBER, 
	"EXTERNTYPE" NUMBER, 
	"EXTERNNAME" VARCHAR2(4000), 
	"HELPERCLASSNAME" VARCHAR2(4000), 
	"LOCAL_ATTRS" NUMBER, 
	"LOCAL_METHODS" NUMBER, 
	"TYPEID" RAW(16), 
	"ROOTTOID" RAW(16), 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"SUPERTOID" RAW(16), 
	"HASHCODE" RAW(17), 
	"TOID" RAW(16), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_UID$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_UID$" 
   (	"LOGMNR_UID" NUMBER(22,0), 
	"SESSION#" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_USER$
--------------------------------------------------------

  CREATE TABLE "LOGMNR_USER$" 
   (	"USER#" NUMBER(22,0), 
	"NAME" VARCHAR2(30), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGSTDBY$APPLY_MILESTONE
--------------------------------------------------------

  CREATE TABLE "LOGSTDBY$APPLY_MILESTONE" 
   (	"SESSION_ID" NUMBER, 
	"COMMIT_SCN" NUMBER, 
	"COMMIT_TIME" DATE, 
	"SYNCH_SCN" NUMBER, 
	"EPOCH" NUMBER, 
	"PROCESSED_SCN" NUMBER, 
	"PROCESSED_TIME" DATE, 
	"FETCHLWM_SCN" NUMBER DEFAULT (0), 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(2000)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGSTDBY$APPLY_PROGRESS
--------------------------------------------------------

  CREATE TABLE "LOGSTDBY$APPLY_PROGRESS" 
   (	"XIDUSN" NUMBER, 
	"XIDSLT" NUMBER, 
	"XIDSQN" NUMBER, 
	"COMMIT_SCN" NUMBER, 
	"COMMIT_TIME" DATE, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(2000)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGSTDBY$EDS_TABLES
--------------------------------------------------------

  CREATE TABLE "LOGSTDBY$EDS_TABLES" 
   (	"OWNER" VARCHAR2(30), 
	"TABLE_NAME" VARCHAR2(30), 
	"SHADOW_TABLE_NAME" VARCHAR2(30), 
	"BASE_TRIGGER_NAME" VARCHAR2(30), 
	"SHADOW_TRIGGER_NAME" VARCHAR2(30), 
	"DBLINK" VARCHAR2(255), 
	"FLAGS" NUMBER, 
	"STATE" VARCHAR2(255), 
	"OBJV" NUMBER, 
	"OBJ#" NUMBER, 
	"SOBJ#" NUMBER, 
	"CTIME" TIMESTAMP (6), 
	"SPARE1" NUMBER, 
	"SPARE2" VARCHAR2(255), 
	"SPARE3" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table LOGSTDBY$EVENTS
--------------------------------------------------------

  CREATE TABLE "LOGSTDBY$EVENTS" 
   (	"EVENT_TIME" TIMESTAMP (6), 
	"CURRENT_SCN" NUMBER, 
	"COMMIT_SCN" NUMBER, 
	"XIDUSN" NUMBER, 
	"XIDSLT" NUMBER, 
	"XIDSQN" NUMBER, 
	"ERRVAL" NUMBER, 
	"EVENT" VARCHAR2(2000), 
	"FULL_EVENT" CLOB, 
	"ERROR" VARCHAR2(2000), 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(2000)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGSTDBY$FLASHBACK_SCN
--------------------------------------------------------

  CREATE TABLE "LOGSTDBY$FLASHBACK_SCN" 
   (	"PRIMARY_SCN" NUMBER, 
	"PRIMARY_TIME" DATE, 
	"STANDBY_SCN" NUMBER, 
	"STANDBY_TIME" DATE, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table LOGSTDBY$HISTORY
--------------------------------------------------------

  CREATE TABLE "LOGSTDBY$HISTORY" 
   (	"STREAM_SEQUENCE#" NUMBER, 
	"LMNR_SID" NUMBER, 
	"DBID" NUMBER, 
	"FIRST_CHANGE#" NUMBER, 
	"LAST_CHANGE#" NUMBER, 
	"SOURCE" NUMBER, 
	"STATUS" NUMBER, 
	"FIRST_TIME" DATE, 
	"LAST_TIME" DATE, 
	"DGNAME" VARCHAR2(255), 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(2000)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGSTDBY$PARAMETERS
--------------------------------------------------------

  CREATE TABLE "LOGSTDBY$PARAMETERS" 
   (	"NAME" VARCHAR2(30), 
	"VALUE" VARCHAR2(2000), 
	"TYPE" NUMBER, 
	"SCN" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(2000)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGSTDBY$PLSQL
--------------------------------------------------------

  CREATE TABLE "LOGSTDBY$PLSQL" 
   (	"SESSION_ID" NUMBER, 
	"START_FINISH" NUMBER, 
	"CALL_TEXT" CLOB, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(2000)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGSTDBY$SCN
--------------------------------------------------------

  CREATE TABLE "LOGSTDBY$SCN" 
   (	"OBJ#" NUMBER, 
	"OBJNAME" VARCHAR2(4000), 
	"SCHEMA" VARCHAR2(30), 
	"TYPE" VARCHAR2(20), 
	"SCN" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(2000)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGSTDBY$SKIP
--------------------------------------------------------

  CREATE TABLE "LOGSTDBY$SKIP" 
   (	"ERROR" NUMBER, 
	"STATEMENT_OPT" VARCHAR2(30), 
	"SCHEMA" VARCHAR2(30), 
	"NAME" VARCHAR2(65), 
	"USE_LIKE" NUMBER, 
	"ESC" VARCHAR2(1), 
	"PROC" VARCHAR2(98), 
	"ACTIVE" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(2000)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGSTDBY$SKIP_SUPPORT
--------------------------------------------------------

  CREATE TABLE "LOGSTDBY$SKIP_SUPPORT" 
   (	"ACTION" NUMBER, 
	"NAME" VARCHAR2(30), 
	"REG" NUMBER(*,0), 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(2000)
   ) ;
--------------------------------------------------------
--  DDL for Table LOGSTDBY$SKIP_TRANSACTION
--------------------------------------------------------

  CREATE TABLE "LOGSTDBY$SKIP_TRANSACTION" 
   (	"XIDUSN" NUMBER, 
	"XIDSLT" NUMBER, 
	"XIDSQN" NUMBER, 
	"ACTIVE" NUMBER, 
	"COMMIT_SCN" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(2000)
   ) ;
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_AJG
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_AJG" 
   (	"AJGID#" NUMBER, 
	"RUNID#" NUMBER, 
	"AJGDESLEN" NUMBER, 
	"AJGDES" LONG RAW, 
	"HASHVALUE" NUMBER, 
	"FREQUENCY" NUMBER
   ) ;

   COMMENT ON TABLE "MVIEW$_ADV_AJG"  IS 'Anchor-join graph representation';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_BASETABLE
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_BASETABLE" 
   (	"COLLECTIONID#" NUMBER, 
	"QUERYID#" NUMBER, 
	"OWNER" VARCHAR2(30), 
	"TABLE_NAME" VARCHAR2(30), 
	"TABLE_TYPE" NUMBER
   ) ;

   COMMENT ON TABLE "MVIEW$_ADV_BASETABLE"  IS 'Base tables refered by a query';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_CLIQUE
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_CLIQUE" 
   (	"CLIQUEID#" NUMBER, 
	"RUNID#" NUMBER, 
	"CLIQUEDESLEN" NUMBER, 
	"CLIQUEDES" LONG RAW, 
	"HASHVALUE" NUMBER, 
	"FREQUENCY" NUMBER, 
	"BYTECOST" NUMBER, 
	"ROWSIZE" NUMBER, 
	"NUMROWS" NUMBER
   ) ;

   COMMENT ON TABLE "MVIEW$_ADV_CLIQUE"  IS 'Table for storing canonical form of Clique queries';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_ELIGIBLE
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_ELIGIBLE" 
   (	"SUMOBJN#" NUMBER, 
	"RUNID#" NUMBER, 
	"BYTECOST" NUMBER, 
	"FLAGS" NUMBER, 
	"FREQUENCY" NUMBER
   ) ;

   COMMENT ON TABLE "MVIEW$_ADV_ELIGIBLE"  IS 'Summary management rewrite eligibility information';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_EXCEPTIONS
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_EXCEPTIONS" 
   (	"RUNID#" NUMBER, 
	"OWNER" VARCHAR2(30), 
	"TABLE_NAME" VARCHAR2(30), 
	"DIMENSION_NAME" VARCHAR2(30), 
	"RELATIONSHIP" VARCHAR2(11), 
	"BAD_ROWID" ROWID
   ) ;

   COMMENT ON TABLE "MVIEW$_ADV_EXCEPTIONS"  IS 'Output table for dimension validations';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_FILTER
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_FILTER" 
   (	"FILTERID#" NUMBER, 
	"SUBFILTERNUM#" NUMBER, 
	"SUBFILTERTYPE" NUMBER, 
	"STR_VALUE" VARCHAR2(1028), 
	"NUM_VALUE1" NUMBER, 
	"NUM_VALUE2" NUMBER, 
	"DATE_VALUE1" DATE, 
	"DATE_VALUE2" DATE
   ) ;

   COMMENT ON TABLE "MVIEW$_ADV_FILTER"  IS 'Table for workload filter definition';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_FILTERINSTANCE
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_FILTERINSTANCE" 
   (	"RUNID#" NUMBER, 
	"FILTERID#" NUMBER, 
	"SUBFILTERNUM#" NUMBER, 
	"SUBFILTERTYPE" NUMBER, 
	"STR_VALUE" VARCHAR2(1028), 
	"NUM_VALUE1" NUMBER, 
	"NUM_VALUE2" NUMBER, 
	"DATE_VALUE1" DATE, 
	"DATE_VALUE2" DATE
   ) ;

   COMMENT ON TABLE "MVIEW$_ADV_FILTERINSTANCE"  IS 'Table for workload filter instance definition';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_FJG
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_FJG" 
   (	"FJGID#" NUMBER, 
	"AJGID#" NUMBER, 
	"FJGDESLEN" NUMBER, 
	"FJGDES" LONG RAW, 
	"HASHVALUE" NUMBER, 
	"FREQUENCY" NUMBER
   ) ;

   COMMENT ON TABLE "MVIEW$_ADV_FJG"  IS 'Representation for query join sub-graph not in AJG ';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_GC
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_GC" 
   (	"GCID#" NUMBER, 
	"FJGID#" NUMBER, 
	"GCDESLEN" NUMBER, 
	"GCDES" LONG RAW, 
	"HASHVALUE" NUMBER, 
	"FREQUENCY" NUMBER
   ) ;

   COMMENT ON TABLE "MVIEW$_ADV_GC"  IS 'Group-by columns of a query';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_INFO
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_INFO" 
   (	"RUNID#" NUMBER, 
	"SEQ#" NUMBER, 
	"TYPE" NUMBER, 
	"INFOLEN" NUMBER, 
	"INFO" LONG RAW, 
	"STATUS" NUMBER, 
	"FLAG" NUMBER
   ) ;

   COMMENT ON TABLE "MVIEW$_ADV_INFO"  IS 'Internal table for passing information from the SQL analyzer';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_JOURNAL
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_JOURNAL" 
   (	"RUNID#" NUMBER, 
	"SEQ#" NUMBER, 
	"TIMESTAMP" DATE, 
	"FLAGS" NUMBER, 
	"NUM" NUMBER, 
	"TEXT" LONG, 
	"TEXTLEN" NUMBER
   ) ;

   COMMENT ON TABLE "MVIEW$_ADV_JOURNAL"  IS 'Summary advisor journal table for debugging and information';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_LEVEL
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_LEVEL" 
   (	"RUNID#" NUMBER, 
	"LEVELID#" NUMBER, 
	"DIMOBJ#" NUMBER, 
	"FLAGS" NUMBER, 
	"TBLOBJ#" NUMBER, 
	"COLUMNLIST" RAW(70), 
	"LEVELNAME" VARCHAR2(30)
   ) ;

   COMMENT ON TABLE "MVIEW$_ADV_LEVEL"  IS 'Level definition';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_LOG
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_LOG" 
   (	"RUNID#" NUMBER, 
	"FILTERID#" NUMBER, 
	"RUN_BEGIN" DATE, 
	"RUN_END" DATE, 
	"RUN_TYPE" NUMBER, 
	"UNAME" VARCHAR2(30), 
	"STATUS" NUMBER, 
	"MESSAGE" VARCHAR2(2000), 
	"COMPLETED" NUMBER, 
	"TOTAL" NUMBER, 
	"ERROR_CODE" VARCHAR2(20)
   ) ;

   COMMENT ON TABLE "MVIEW$_ADV_LOG"  IS 'Log all calls to summary advisory functions';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_OUTPUT
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_OUTPUT" 
   (	"RUNID#" NUMBER, 
	"OUTPUT_TYPE" NUMBER, 
	"RANK#" NUMBER, 
	"ACTION_TYPE" VARCHAR2(6), 
	"SUMMARY_OWNER" VARCHAR2(30), 
	"SUMMARY_NAME" VARCHAR2(30), 
	"GROUP_BY_COLUMNS" VARCHAR2(2000), 
	"WHERE_CLAUSE" VARCHAR2(2000), 
	"FROM_CLAUSE" VARCHAR2(2000), 
	"MEASURES_LIST" VARCHAR2(2000), 
	"FACT_TABLES" VARCHAR2(1000), 
	"GROUPING_LEVELS" VARCHAR2(2000), 
	"QUERYLEN" NUMBER, 
	"QUERY_TEXT" LONG, 
	"STORAGE_IN_BYTES" NUMBER, 
	"PCT_PERFORMANCE_GAIN" NUMBER, 
	"FREQUENCY" NUMBER, 
	"CUMULATIVE_BENEFIT" NUMBER, 
	"BENEFIT_TO_COST_RATIO" NUMBER, 
	"VALIDATED" NUMBER
   ) ;

   COMMENT ON TABLE "MVIEW$_ADV_OUTPUT"  IS 'Output table for summary recommendations and evaluations';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_PARAMETERS
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_PARAMETERS" 
   (	"PARAMETER_NAME" VARCHAR2(30), 
	"PARAMETER_TYPE" NUMBER, 
	"STRING_VALUE" VARCHAR2(30), 
	"DATE_VALUE" DATE, 
	"NUMERICAL_VALUE" NUMBER
   ) ;

   COMMENT ON TABLE "MVIEW$_ADV_PARAMETERS"  IS 'Summary advisor tuning parameters';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_PLAN
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_PLAN" 
   (	"STATEMENT_ID" VARCHAR2(30), 
	"TIMESTAMP" DATE, 
	"REMARKS" VARCHAR2(80), 
	"OPERATION" VARCHAR2(30), 
	"OPTIONS" VARCHAR2(255), 
	"OBJECT_NODE" VARCHAR2(128), 
	"OBJECT_OWNER" VARCHAR2(30), 
	"OBJECT_NAME" VARCHAR2(30), 
	"OBJECT_INSTANCE" NUMBER(*,0), 
	"OBJECT_TYPE" VARCHAR2(30), 
	"OPTIMIZER" VARCHAR2(255), 
	"SEARCH_COLUMNS" NUMBER, 
	"ID" NUMBER(*,0), 
	"PARENT_ID" NUMBER(*,0), 
	"POSITION" NUMBER(*,0), 
	"COST" NUMBER(*,0), 
	"CARDINALITY" NUMBER(*,0), 
	"BYTES" NUMBER(*,0), 
	"OTHER_TAG" VARCHAR2(255), 
	"PARTITION_START" VARCHAR2(255), 
	"PARTITION_STOP" VARCHAR2(255), 
	"PARTITION_ID" NUMBER(*,0), 
	"OTHER" LONG, 
	"DISTRIBUTION" VARCHAR2(30), 
	"CPU_COST" NUMBER(*,0), 
	"IO_COST" NUMBER(*,0), 
	"TEMP_SPACE" NUMBER(*,0)
   ) ;

   COMMENT ON TABLE "MVIEW$_ADV_PLAN"  IS 'Private plan table for estimate_mview_size operations';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_PRETTY
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_PRETTY" 
   (	"QUERYID#" NUMBER, 
	"SQL_TEXT" LONG
   ) ;

   COMMENT ON TABLE "MVIEW$_ADV_PRETTY"  IS 'Table for sql parsing';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_ROLLUP
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_ROLLUP" 
   (	"RUNID#" NUMBER, 
	"CLEVELID#" NUMBER, 
	"PLEVELID#" NUMBER, 
	"FLAGS" NUMBER
   ) ;

   COMMENT ON TABLE "MVIEW$_ADV_ROLLUP"  IS 'Each row repesents either a functional dependency or join-key relationship';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_SQLDEPEND
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_SQLDEPEND" 
   (	"COLLECTIONID#" NUMBER, 
	"INST_ID" NUMBER, 
	"FROM_ADDRESS" RAW(16), 
	"FROM_HASH" NUMBER, 
	"TO_OWNER" VARCHAR2(64), 
	"TO_NAME" VARCHAR2(1000), 
	"TO_TYPE" NUMBER, 
	"CARDINALITY" NUMBER
   ) ;

   COMMENT ON TABLE "MVIEW$_ADV_SQLDEPEND"  IS 'Temporary table for workload collections';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_TEMP
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_TEMP" 
   (	"ID#" NUMBER, 
	"SEQ#" NUMBER, 
	"TEXT" LONG
   ) ;

   COMMENT ON TABLE "MVIEW$_ADV_TEMP"  IS 'Table for temporary data';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_WORKLOAD
--------------------------------------------------------

  CREATE TABLE "MVIEW$_ADV_WORKLOAD" 
   (	"QUERYID#" NUMBER, 
	"COLLECTIONID#" NUMBER, 
	"COLLECTTIME" DATE, 
	"APPLICATION" VARCHAR2(64), 
	"CARDINALITY" NUMBER, 
	"RESULTSIZE" NUMBER, 
	"UNAME" VARCHAR2(30), 
	"QDATE" DATE, 
	"PRIORITY" NUMBER, 
	"EXEC_TIME" NUMBER, 
	"SQL_TEXT" LONG, 
	"SQL_TEXTLEN" NUMBER, 
	"SQL_HASH" NUMBER, 
	"SQL_ADDR" RAW(16), 
	"FREQUENCY" NUMBER
   ) ;

   COMMENT ON TABLE "MVIEW$_ADV_WORKLOAD"  IS 'Shared workload repository for DBA users of summary advisor';
--------------------------------------------------------
--  DDL for Table OL$
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "OL$" 
   (	"OL_NAME" VARCHAR2(30), 
	"SQL_TEXT" LONG, 
	"TEXTLEN" NUMBER, 
	"SIGNATURE" RAW(16), 
	"HASH_VALUE" NUMBER, 
	"HASH_VALUE2" NUMBER, 
	"CATEGORY" VARCHAR2(30), 
	"VERSION" VARCHAR2(64), 
	"CREATOR" VARCHAR2(30), 
	"TIMESTAMP" DATE, 
	"FLAGS" NUMBER, 
	"HINTCOUNT" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" VARCHAR2(1000)
   ) ON COMMIT PRESERVE ROWS ;
--------------------------------------------------------
--  DDL for Table OL$HINTS
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "OL$HINTS" 
   (	"OL_NAME" VARCHAR2(30), 
	"HINT#" NUMBER, 
	"CATEGORY" VARCHAR2(30), 
	"HINT_TYPE" NUMBER, 
	"HINT_TEXT" VARCHAR2(512), 
	"STAGE#" NUMBER, 
	"NODE#" NUMBER, 
	"TABLE_NAME" VARCHAR2(30), 
	"TABLE_TIN" NUMBER, 
	"TABLE_POS" NUMBER, 
	"REF_ID" NUMBER, 
	"USER_TABLE_NAME" VARCHAR2(64), 
	"COST" FLOAT(126), 
	"CARDINALITY" FLOAT(126), 
	"BYTES" FLOAT(126), 
	"HINT_TEXTOFF" NUMBER, 
	"HINT_TEXTLEN" NUMBER, 
	"JOIN_PRED" VARCHAR2(2000), 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"HINT_STRING" CLOB
   ) ON COMMIT PRESERVE ROWS ;
--------------------------------------------------------
--  DDL for Table OL$NODES
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "OL$NODES" 
   (	"OL_NAME" VARCHAR2(30), 
	"CATEGORY" VARCHAR2(30), 
	"NODE_ID" NUMBER, 
	"PARENT_ID" NUMBER, 
	"NODE_TYPE" NUMBER, 
	"NODE_TEXTLEN" NUMBER, 
	"NODE_TEXTOFF" NUMBER, 
	"NODE_NAME" VARCHAR2(64)
   ) ON COMMIT PRESERVE ROWS ;
--------------------------------------------------------
--  DDL for Table PERSONNE
--------------------------------------------------------

  CREATE TABLE "PERSONNE" 
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

  CREATE TABLE "PRESENTATION" 
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
--  DDL for Table PRODUITS
--------------------------------------------------------

  CREATE TABLE "PRODUITS" 
   (	"REFPROD" NUMBER(*,0), 
	"NOM" CHAR(20) DEFAULT NULL, 
	"CATÉGORIE" CHAR(20) DEFAULT NULL, 
	"PRIXUNITAIRE" FLOAT(126) DEFAULT NULL
   ) ;
--------------------------------------------------------
--  DDL for Table REPCAT$_AUDIT_ATTRIBUTE
--------------------------------------------------------

  CREATE TABLE "REPCAT$_AUDIT_ATTRIBUTE" 
   (	"ATTRIBUTE" VARCHAR2(30), 
	"DATA_TYPE_ID" NUMBER(*,0), 
	"DATA_LENGTH" NUMBER(*,0), 
	"SOURCE" VARCHAR2(92)
   ) ;

   COMMENT ON COLUMN "REPCAT$_AUDIT_ATTRIBUTE"."ATTRIBUTE" IS 'Description of the attribute';
   COMMENT ON COLUMN "REPCAT$_AUDIT_ATTRIBUTE"."DATA_TYPE_ID" IS 'Datatype of the attribute value';
   COMMENT ON COLUMN "REPCAT$_AUDIT_ATTRIBUTE"."DATA_LENGTH" IS 'Length of the attribute value in byte';
   COMMENT ON COLUMN "REPCAT$_AUDIT_ATTRIBUTE"."SOURCE" IS 'Name of the function which returns the attribute value';
   COMMENT ON TABLE "REPCAT$_AUDIT_ATTRIBUTE"  IS 'Information about attributes automatically maintained for replication';
--------------------------------------------------------
--  DDL for Table REPCAT$_AUDIT_COLUMN
--------------------------------------------------------

  CREATE TABLE "REPCAT$_AUDIT_COLUMN" 
   (	"SNAME" VARCHAR2(30), 
	"ONAME" VARCHAR2(30), 
	"COLUMN_NAME" VARCHAR2(30), 
	"BASE_SNAME" VARCHAR2(30), 
	"BASE_ONAME" VARCHAR2(30), 
	"BASE_CONFLICT_TYPE_ID" NUMBER(*,0), 
	"BASE_REFERENCE_NAME" VARCHAR2(30), 
	"ATTRIBUTE" VARCHAR2(30)
   ) ;

   COMMENT ON COLUMN "REPCAT$_AUDIT_COLUMN"."SNAME" IS 'Owner of the shadow table';
   COMMENT ON COLUMN "REPCAT$_AUDIT_COLUMN"."ONAME" IS 'Name of the shadow table';
   COMMENT ON COLUMN "REPCAT$_AUDIT_COLUMN"."COLUMN_NAME" IS 'Name of the column in the shadow table';
   COMMENT ON COLUMN "REPCAT$_AUDIT_COLUMN"."BASE_SNAME" IS 'Owner of replicated table';
   COMMENT ON COLUMN "REPCAT$_AUDIT_COLUMN"."BASE_ONAME" IS 'Name of the replicated table';
   COMMENT ON COLUMN "REPCAT$_AUDIT_COLUMN"."BASE_CONFLICT_TYPE_ID" IS 'Type of conflict';
   COMMENT ON COLUMN "REPCAT$_AUDIT_COLUMN"."BASE_REFERENCE_NAME" IS 'Table name, unique constraint name, or column group name';
   COMMENT ON COLUMN "REPCAT$_AUDIT_COLUMN"."ATTRIBUTE" IS 'Description of the attribute';
   COMMENT ON TABLE "REPCAT$_AUDIT_COLUMN"  IS 'Information about columns in all shadow tables for all replicated tables in the database';
--------------------------------------------------------
--  DDL for Table REPCAT$_COLUMN_GROUP
--------------------------------------------------------

  CREATE TABLE "REPCAT$_COLUMN_GROUP" 
   (	"SNAME" VARCHAR2(30), 
	"ONAME" VARCHAR2(30), 
	"GROUP_NAME" VARCHAR2(30), 
	"GROUP_COMMENT" VARCHAR2(80)
   ) ;

   COMMENT ON COLUMN "REPCAT$_COLUMN_GROUP"."SNAME" IS 'Owner of replicated object';
   COMMENT ON COLUMN "REPCAT$_COLUMN_GROUP"."ONAME" IS 'Name of the replicated object';
   COMMENT ON COLUMN "REPCAT$_COLUMN_GROUP"."GROUP_NAME" IS 'Name of the column group';
   COMMENT ON COLUMN "REPCAT$_COLUMN_GROUP"."GROUP_COMMENT" IS 'Description of the column group';
   COMMENT ON TABLE "REPCAT$_COLUMN_GROUP"  IS 'All column groups of replicated tables in the database';
--------------------------------------------------------
--  DDL for Table REPCAT$_CONFLICT
--------------------------------------------------------

  CREATE TABLE "REPCAT$_CONFLICT" 
   (	"SNAME" VARCHAR2(30), 
	"ONAME" VARCHAR2(30), 
	"CONFLICT_TYPE_ID" NUMBER(*,0), 
	"REFERENCE_NAME" VARCHAR2(30)
   ) ;

   COMMENT ON COLUMN "REPCAT$_CONFLICT"."SNAME" IS 'Owner of replicated object';
   COMMENT ON COLUMN "REPCAT$_CONFLICT"."ONAME" IS 'Name of the replicated object';
   COMMENT ON COLUMN "REPCAT$_CONFLICT"."CONFLICT_TYPE_ID" IS 'Type of conflict';
   COMMENT ON COLUMN "REPCAT$_CONFLICT"."REFERENCE_NAME" IS 'Table name, unique constraint name, or column group name';
   COMMENT ON TABLE "REPCAT$_CONFLICT"  IS 'All conflicts for which users have specified resolutions in the database';
--------------------------------------------------------
--  DDL for Table REPCAT$_DDL
--------------------------------------------------------

  CREATE TABLE "REPCAT$_DDL" 
   (	"LOG_ID" NUMBER, 
	"SOURCE" VARCHAR2(128), 
	"ROLE" VARCHAR2(1), 
	"MASTER" VARCHAR2(128), 
	"LINE" NUMBER(*,0), 
	"TEXT" VARCHAR2(2000), 
	"DDL_NUM" NUMBER(*,0) DEFAULT 1       -- order of ddls to execute

   ) ;

   COMMENT ON COLUMN "REPCAT$_DDL"."LOG_ID" IS 'Identifying number of the repcat log record';
   COMMENT ON COLUMN "REPCAT$_DDL"."SOURCE" IS 'Name of the database at which the request originated';
   COMMENT ON COLUMN "REPCAT$_DDL"."ROLE" IS 'Is this database the masterdef for the request';
   COMMENT ON COLUMN "REPCAT$_DDL"."MASTER" IS 'Name of the database that processes this request';
   COMMENT ON COLUMN "REPCAT$_DDL"."LINE" IS 'Ordering of records within a single request';
   COMMENT ON COLUMN "REPCAT$_DDL"."TEXT" IS 'Portion of an argument';
   COMMENT ON COLUMN "REPCAT$_DDL"."DDL_NUM" IS 'Ordering of DDLs to execute';
   COMMENT ON TABLE "REPCAT$_DDL"  IS 'Arguments that do not fit in a single repcat log record';
--------------------------------------------------------
--  DDL for Table REPCAT$_EXCEPTIONS
--------------------------------------------------------

  CREATE TABLE "REPCAT$_EXCEPTIONS" 
   (	"EXCEPTION_ID" NUMBER, 
	"USER_NAME" VARCHAR2(30), 
	"REQUEST" CLOB, 
	"JOB" NUMBER, 
	"ERROR_DATE" DATE, 
	"ERROR_NUMBER" NUMBER, 
	"ERROR_MESSAGE" VARCHAR2(4000), 
	"LINE_NUMBER" NUMBER
   ) ;

   COMMENT ON COLUMN "REPCAT$_EXCEPTIONS"."EXCEPTION_ID" IS 'Internal primary key of the exceptions table.';
   COMMENT ON COLUMN "REPCAT$_EXCEPTIONS"."USER_NAME" IS 'User name of user submitting the exception.';
   COMMENT ON COLUMN "REPCAT$_EXCEPTIONS"."REQUEST" IS 'Originating request containing the exception.';
   COMMENT ON COLUMN "REPCAT$_EXCEPTIONS"."JOB" IS 'Originating job containing the exception.';
   COMMENT ON COLUMN "REPCAT$_EXCEPTIONS"."ERROR_DATE" IS 'Date of occurance for the exception.';
   COMMENT ON COLUMN "REPCAT$_EXCEPTIONS"."ERROR_NUMBER" IS 'Error number generating the exception.';
   COMMENT ON COLUMN "REPCAT$_EXCEPTIONS"."ERROR_MESSAGE" IS 'Error message associated with the error generating the exception.';
   COMMENT ON COLUMN "REPCAT$_EXCEPTIONS"."LINE_NUMBER" IS 'Line number of the exception.';
   COMMENT ON TABLE "REPCAT$_EXCEPTIONS"  IS 'Repcat processing exceptions table.';
--------------------------------------------------------
--  DDL for Table REPCAT$_EXTENSION
--------------------------------------------------------

  CREATE TABLE "REPCAT$_EXTENSION" 
   (	"EXTENSION_ID" RAW(16), 
	"EXTENSION_CODE" NUMBER, 
	"MASTERDEF" VARCHAR2(128), 
	"EXPORT_REQUIRED" VARCHAR2(1), 
	"REPCATLOG_ID" NUMBER, 
	"EXTENSION_STATUS" NUMBER, 
	"FLASHBACK_SCN" NUMBER, 
	"PUSH_TO_MDEF" VARCHAR2(1), 
	"PUSH_TO_NEW" VARCHAR2(1), 
	"PERCENTAGE_FOR_CATCHUP_MDEF" NUMBER, 
	"CYCLE_SECONDS_MDEF" NUMBER, 
	"PERCENTAGE_FOR_CATCHUP_NEW" NUMBER, 
	"CYCLE_SECONDS_NEW" NUMBER
   ) ;

   COMMENT ON COLUMN "REPCAT$_EXTENSION"."EXTENSION_ID" IS 'Globally unique identifier for replication extension';
   COMMENT ON COLUMN "REPCAT$_EXTENSION"."EXTENSION_CODE" IS 'Kind of replication extension';
   COMMENT ON COLUMN "REPCAT$_EXTENSION"."MASTERDEF" IS 'Master definition site for replication extension';
   COMMENT ON COLUMN "REPCAT$_EXTENSION"."EXPORT_REQUIRED" IS 'YES if this extension requires an export, and NO if no export is required';
   COMMENT ON COLUMN "REPCAT$_EXTENSION"."REPCATLOG_ID" IS 'Identifier of repcatlog records related to replication extension';
   COMMENT ON COLUMN "REPCAT$_EXTENSION"."EXTENSION_STATUS" IS 'Status of replication extension';
   COMMENT ON COLUMN "REPCAT$_EXTENSION"."FLASHBACK_SCN" IS 'Flashback_scn for export or change-based recovery for replication extension';
   COMMENT ON COLUMN "REPCAT$_EXTENSION"."PUSH_TO_MDEF" IS 'YES if existing masters partially push to masterdef, NO if no pushing';
   COMMENT ON COLUMN "REPCAT$_EXTENSION"."PUSH_TO_NEW" IS 'YES if existing masters partially push to new masters, NO if no pushing';
   COMMENT ON COLUMN "REPCAT$_EXTENSION"."PERCENTAGE_FOR_CATCHUP_MDEF" IS 'Fraction of push to masterdef cycle devoted to catching up';
   COMMENT ON COLUMN "REPCAT$_EXTENSION"."CYCLE_SECONDS_MDEF" IS 'Length of push to masterdef cycle when catching up';
   COMMENT ON COLUMN "REPCAT$_EXTENSION"."PERCENTAGE_FOR_CATCHUP_NEW" IS 'Fraction of push to new masters cycle devoted to catching up';
   COMMENT ON COLUMN "REPCAT$_EXTENSION"."CYCLE_SECONDS_NEW" IS 'Length of push to new masters cycle when catching up';
   COMMENT ON TABLE "REPCAT$_EXTENSION"  IS 'Information about replication extension requests';
--------------------------------------------------------
--  DDL for Table REPCAT$_FLAVOR_OBJECTS
--------------------------------------------------------

  CREATE TABLE "REPCAT$_FLAVOR_OBJECTS" 
   (	"FLAVOR_ID" NUMBER, 
	"GOWNER" VARCHAR2(30) DEFAULT 'PUBLIC', 
	"GNAME" VARCHAR2(30), 
	"SNAME" VARCHAR2(30), 
	"ONAME" VARCHAR2(30), 
	"TYPE" NUMBER, 
	"VERSION#" NUMBER, 
	"HASHCODE" RAW(17), 
	"COLUMNS_PRESENT" RAW(125)
   ) ;

   COMMENT ON COLUMN "REPCAT$_FLAVOR_OBJECTS"."FLAVOR_ID" IS 'Flavor identifier';
   COMMENT ON COLUMN "REPCAT$_FLAVOR_OBJECTS"."GOWNER" IS 'Owner of the object group containing object';
   COMMENT ON COLUMN "REPCAT$_FLAVOR_OBJECTS"."GNAME" IS 'Object group containing object';
   COMMENT ON COLUMN "REPCAT$_FLAVOR_OBJECTS"."SNAME" IS 'Schema containing object';
   COMMENT ON COLUMN "REPCAT$_FLAVOR_OBJECTS"."ONAME" IS 'Name of object';
   COMMENT ON COLUMN "REPCAT$_FLAVOR_OBJECTS"."TYPE" IS 'Object type';
   COMMENT ON COLUMN "REPCAT$_FLAVOR_OBJECTS"."VERSION#" IS 'Version# of a user-defined type';
   COMMENT ON COLUMN "REPCAT$_FLAVOR_OBJECTS"."HASHCODE" IS 'Hashcode of a user-defined type';
   COMMENT ON COLUMN "REPCAT$_FLAVOR_OBJECTS"."COLUMNS_PRESENT" IS 'For tables, encoded mapping of columns present';
   COMMENT ON TABLE "REPCAT$_FLAVOR_OBJECTS"  IS 'Replicated objects in flavors';
--------------------------------------------------------
--  DDL for Table REPCAT$_FLAVORS
--------------------------------------------------------

  CREATE TABLE "REPCAT$_FLAVORS" 
   (	"FLAVOR_ID" NUMBER, 
	"GOWNER" VARCHAR2(30) DEFAULT 'PUBLIC', 
	"GNAME" VARCHAR2(30), 
	"FNAME" VARCHAR2(30), 
	"CREATION_DATE" DATE DEFAULT SYSDATE, 
	"CREATED_BY" NUMBER DEFAULT UID, 
	"PUBLISHED" VARCHAR2(1) DEFAULT 'N'
   ) ;

   COMMENT ON COLUMN "REPCAT$_FLAVORS"."FLAVOR_ID" IS 'Flavor identifier, unique within object group';
   COMMENT ON COLUMN "REPCAT$_FLAVORS"."GOWNER" IS 'Owner of the object group';
   COMMENT ON COLUMN "REPCAT$_FLAVORS"."GNAME" IS 'Name of the object group';
   COMMENT ON COLUMN "REPCAT$_FLAVORS"."FNAME" IS 'Name of the flavor';
   COMMENT ON COLUMN "REPCAT$_FLAVORS"."CREATION_DATE" IS 'Date on which the flavor was created';
   COMMENT ON COLUMN "REPCAT$_FLAVORS"."CREATED_BY" IS 'Identifier of user that created the flavor';
   COMMENT ON COLUMN "REPCAT$_FLAVORS"."PUBLISHED" IS 'Indicates whether flavor is published (Y/N) or obsolete (O)';
   COMMENT ON TABLE "REPCAT$_FLAVORS"  IS 'Flavors defined for replicated object groups';
--------------------------------------------------------
--  DDL for Table REPCAT$_GENERATED
--------------------------------------------------------

  CREATE TABLE "REPCAT$_GENERATED" 
   (	"SNAME" VARCHAR2(30), 
	"ONAME" VARCHAR2(30), 
	"TYPE" NUMBER(*,0), 
	"REASON" NUMBER, 
	"BASE_SNAME" VARCHAR2(30), 
	"BASE_ONAME" VARCHAR2(30), 
	"BASE_TYPE" NUMBER(*,0), 
	"PACKAGE_PREFIX" VARCHAR2(30), 
	"PROCEDURE_PREFIX" VARCHAR2(30), 
	"DISTRIBUTED" VARCHAR2(1)
   ) ;

   COMMENT ON COLUMN "REPCAT$_GENERATED"."SNAME" IS 'Schema containing the generated object';
   COMMENT ON COLUMN "REPCAT$_GENERATED"."ONAME" IS 'Name of the generated object';
   COMMENT ON COLUMN "REPCAT$_GENERATED"."TYPE" IS 'Type of the generated object';
   COMMENT ON COLUMN "REPCAT$_GENERATED"."REASON" IS 'Reason the object was generated';
   COMMENT ON COLUMN "REPCAT$_GENERATED"."BASE_SNAME" IS 'Name of the object''s owner';
   COMMENT ON COLUMN "REPCAT$_GENERATED"."BASE_ONAME" IS 'Name of the object';
   COMMENT ON COLUMN "REPCAT$_GENERATED"."BASE_TYPE" IS 'Type of the object';
   COMMENT ON COLUMN "REPCAT$_GENERATED"."PACKAGE_PREFIX" IS 'Prefix for package wrapper';
   COMMENT ON COLUMN "REPCAT$_GENERATED"."PROCEDURE_PREFIX" IS 'Procedure prefix for package wrapper or procedure wrapper';
   COMMENT ON COLUMN "REPCAT$_GENERATED"."DISTRIBUTED" IS 'Is the generated object separately generated at each master';
   COMMENT ON TABLE "REPCAT$_GENERATED"  IS 'Objects generated to support replication';
--------------------------------------------------------
--  DDL for Table REPCAT$_GROUPED_COLUMN
--------------------------------------------------------

  CREATE TABLE "REPCAT$_GROUPED_COLUMN" 
   (	"SNAME" VARCHAR2(30), 
	"ONAME" VARCHAR2(30), 
	"GROUP_NAME" VARCHAR2(30), 
	"COLUMN_NAME" VARCHAR2(30), 
	"POS" NUMBER
   ) ;

   COMMENT ON COLUMN "REPCAT$_GROUPED_COLUMN"."SNAME" IS 'Owner of replicated object';
   COMMENT ON COLUMN "REPCAT$_GROUPED_COLUMN"."ONAME" IS 'Name of the replicated object';
   COMMENT ON COLUMN "REPCAT$_GROUPED_COLUMN"."GROUP_NAME" IS 'Name of the column group';
   COMMENT ON COLUMN "REPCAT$_GROUPED_COLUMN"."COLUMN_NAME" IS 'Name of the column in the column group';
   COMMENT ON COLUMN "REPCAT$_GROUPED_COLUMN"."POS" IS 'Position of a column or an attribute in the table';
   COMMENT ON TABLE "REPCAT$_GROUPED_COLUMN"  IS 'Columns in all column groups of replicated tables in the database';
--------------------------------------------------------
--  DDL for Table REPCAT$_INSTANTIATION_DDL
--------------------------------------------------------

  CREATE TABLE "REPCAT$_INSTANTIATION_DDL" 
   (	"REFRESH_TEMPLATE_ID" NUMBER, 
	"DDL_TEXT" CLOB, 
	"DDL_NUM" NUMBER, 
	"PHASE" NUMBER
   ) ;

   COMMENT ON COLUMN "REPCAT$_INSTANTIATION_DDL"."REFRESH_TEMPLATE_ID" IS 'Primary key of template containing supplementary DDL.';
   COMMENT ON COLUMN "REPCAT$_INSTANTIATION_DDL"."DDL_TEXT" IS 'Supplementary DDL string.';
   COMMENT ON COLUMN "REPCAT$_INSTANTIATION_DDL"."DDL_NUM" IS 'Column for ordering of supplementary DDL.';
   COMMENT ON COLUMN "REPCAT$_INSTANTIATION_DDL"."PHASE" IS 'Phase to execute the DDL string.';
   COMMENT ON TABLE "REPCAT$_INSTANTIATION_DDL"  IS 'Table containing supplementary DDL to be executed during instantiation.';
--------------------------------------------------------
--  DDL for Table REPCAT$_KEY_COLUMNS
--------------------------------------------------------

  CREATE TABLE "REPCAT$_KEY_COLUMNS" 
   (	"SNAME" VARCHAR2(30), 
	"ONAME" VARCHAR2(30), 
	"TYPE" NUMBER(*,0), 
	"COL" VARCHAR2(30)
   ) ;

   COMMENT ON COLUMN "REPCAT$_KEY_COLUMNS"."SNAME" IS 'Schema containing table';
   COMMENT ON COLUMN "REPCAT$_KEY_COLUMNS"."ONAME" IS 'Name of the table';
   COMMENT ON COLUMN "REPCAT$_KEY_COLUMNS"."TYPE" IS 'Type identifier';
   COMMENT ON COLUMN "REPCAT$_KEY_COLUMNS"."COL" IS 'Column in the table';
   COMMENT ON TABLE "REPCAT$_KEY_COLUMNS"  IS 'Primary columns for a table using column-level replication';
--------------------------------------------------------
--  DDL for Table REPCAT$_OBJECT_PARMS
--------------------------------------------------------

  CREATE TABLE "REPCAT$_OBJECT_PARMS" 
   (	"TEMPLATE_PARAMETER_ID" NUMBER, 
	"TEMPLATE_OBJECT_ID" NUMBER
   ) ;

   COMMENT ON COLUMN "REPCAT$_OBJECT_PARMS"."TEMPLATE_PARAMETER_ID" IS 'Primary key of template parameter.';
   COMMENT ON COLUMN "REPCAT$_OBJECT_PARMS"."TEMPLATE_OBJECT_ID" IS 'Primary key of object using the paramter.';
--------------------------------------------------------
--  DDL for Table REPCAT$_OBJECT_TYPES
--------------------------------------------------------

  CREATE TABLE "REPCAT$_OBJECT_TYPES" 
   (	"OBJECT_TYPE_ID" NUMBER, 
	"OBJECT_TYPE_NAME" VARCHAR2(200), 
	"FLAGS" RAW(255), 
	"SPARE1" VARCHAR2(4000)
   ) ;

   COMMENT ON COLUMN "REPCAT$_OBJECT_TYPES"."OBJECT_TYPE_ID" IS 'Internal primary key of the template object types table.';
   COMMENT ON COLUMN "REPCAT$_OBJECT_TYPES"."OBJECT_TYPE_NAME" IS 'Descriptive name for the object type.';
   COMMENT ON COLUMN "REPCAT$_OBJECT_TYPES"."FLAGS" IS 'Internal flags for object type processing.';
   COMMENT ON COLUMN "REPCAT$_OBJECT_TYPES"."SPARE1" IS 'Reserved for future use.';
   COMMENT ON TABLE "REPCAT$_OBJECT_TYPES"  IS 'Internal table for template object types.';
--------------------------------------------------------
--  DDL for Table REPCAT$_PARAMETER_COLUMN
--------------------------------------------------------

  CREATE TABLE "REPCAT$_PARAMETER_COLUMN" 
   (	"SNAME" VARCHAR2(30), 
	"ONAME" VARCHAR2(30), 
	"CONFLICT_TYPE_ID" NUMBER(*,0), 
	"REFERENCE_NAME" VARCHAR2(30), 
	"SEQUENCE_NO" NUMBER, 
	"PARAMETER_TABLE_NAME" VARCHAR2(30), 
	"PARAMETER_COLUMN_NAME" VARCHAR2(4000), 
	"PARAMETER_SEQUENCE_NO" NUMBER, 
	"COLUMN_POS" NUMBER, 
	"ATTRIBUTE_SEQUENCE_NO" NUMBER
   ) ;

   COMMENT ON COLUMN "REPCAT$_PARAMETER_COLUMN"."SNAME" IS 'Owner of replicated object';
   COMMENT ON COLUMN "REPCAT$_PARAMETER_COLUMN"."ONAME" IS 'Name of the replicated object';
   COMMENT ON COLUMN "REPCAT$_PARAMETER_COLUMN"."CONFLICT_TYPE_ID" IS 'Type of conflict';
   COMMENT ON COLUMN "REPCAT$_PARAMETER_COLUMN"."REFERENCE_NAME" IS 'Table name, unique constraint name, or column group name';
   COMMENT ON COLUMN "REPCAT$_PARAMETER_COLUMN"."SEQUENCE_NO" IS 'Ordering on resolution';
   COMMENT ON COLUMN "REPCAT$_PARAMETER_COLUMN"."PARAMETER_TABLE_NAME" IS 'Name of the table to which the parameter column belongs';
   COMMENT ON COLUMN "REPCAT$_PARAMETER_COLUMN"."PARAMETER_COLUMN_NAME" IS 'Name of the parameter column used for resolving the conflict';
   COMMENT ON COLUMN "REPCAT$_PARAMETER_COLUMN"."PARAMETER_SEQUENCE_NO" IS 'Ordering on parameter column';
   COMMENT ON COLUMN "REPCAT$_PARAMETER_COLUMN"."COLUMN_POS" IS 'Column position of an attribute or a column';
   COMMENT ON COLUMN "REPCAT$_PARAMETER_COLUMN"."ATTRIBUTE_SEQUENCE_NO" IS 'Sequence number for an attribute of an ADT/pkREF column or a scalar column';
   COMMENT ON TABLE "REPCAT$_PARAMETER_COLUMN"  IS 'All columns used for resolving conflicts in the database';
--------------------------------------------------------
--  DDL for Table REPCAT$_PRIORITY
--------------------------------------------------------

  CREATE TABLE "REPCAT$_PRIORITY" 
   (	"SNAME" VARCHAR2(30), 
	"PRIORITY_GROUP" VARCHAR2(30), 
	"PRIORITY" NUMBER, 
	"RAW_VALUE" RAW(2000), 
	"CHAR_VALUE" CHAR(255), 
	"NUMBER_VALUE" NUMBER, 
	"DATE_VALUE" DATE, 
	"VARCHAR2_VALUE" VARCHAR2(4000), 
	"NCHAR_VALUE" NCHAR(500), 
	"NVARCHAR2_VALUE" NVARCHAR2(1000), 
	"LARGE_CHAR_VALUE" CHAR(2000)
   ) ;

   COMMENT ON COLUMN "REPCAT$_PRIORITY"."SNAME" IS 'Name of the replicated object group';
   COMMENT ON COLUMN "REPCAT$_PRIORITY"."PRIORITY_GROUP" IS 'Name of the priority group';
   COMMENT ON COLUMN "REPCAT$_PRIORITY"."PRIORITY" IS 'Priority of the value';
   COMMENT ON COLUMN "REPCAT$_PRIORITY"."RAW_VALUE" IS 'Raw value';
   COMMENT ON COLUMN "REPCAT$_PRIORITY"."CHAR_VALUE" IS 'Blank-padded character string';
   COMMENT ON COLUMN "REPCAT$_PRIORITY"."NUMBER_VALUE" IS 'Numeric value';
   COMMENT ON COLUMN "REPCAT$_PRIORITY"."DATE_VALUE" IS 'Date value';
   COMMENT ON COLUMN "REPCAT$_PRIORITY"."VARCHAR2_VALUE" IS 'Character string';
   COMMENT ON COLUMN "REPCAT$_PRIORITY"."NCHAR_VALUE" IS 'NCHAR string';
   COMMENT ON COLUMN "REPCAT$_PRIORITY"."NVARCHAR2_VALUE" IS 'NVARCHAR2 string';
   COMMENT ON COLUMN "REPCAT$_PRIORITY"."LARGE_CHAR_VALUE" IS 'Blank-padded character string over 255 characters';
   COMMENT ON TABLE "REPCAT$_PRIORITY"  IS 'Values and their corresponding priorities in all priority groups in the database';
--------------------------------------------------------
--  DDL for Table REPCAT$_PRIORITY_GROUP
--------------------------------------------------------

  CREATE TABLE "REPCAT$_PRIORITY_GROUP" 
   (	"SNAME" VARCHAR2(30), 
	"PRIORITY_GROUP" VARCHAR2(30), 
	"DATA_TYPE_ID" NUMBER(*,0), 
	"FIXED_DATA_LENGTH" NUMBER(*,0), 
	"PRIORITY_COMMENT" VARCHAR2(80)
   ) ;

   COMMENT ON COLUMN "REPCAT$_PRIORITY_GROUP"."SNAME" IS 'Name of the replicated object group';
   COMMENT ON COLUMN "REPCAT$_PRIORITY_GROUP"."PRIORITY_GROUP" IS 'Name of the priority group';
   COMMENT ON COLUMN "REPCAT$_PRIORITY_GROUP"."DATA_TYPE_ID" IS 'Datatype of the value in the priority group';
   COMMENT ON COLUMN "REPCAT$_PRIORITY_GROUP"."FIXED_DATA_LENGTH" IS 'Length of the value in bytes if the datatype is CHAR';
   COMMENT ON COLUMN "REPCAT$_PRIORITY_GROUP"."PRIORITY_COMMENT" IS 'Description of the priority group';
   COMMENT ON TABLE "REPCAT$_PRIORITY_GROUP"  IS 'Information about all priority groups in the database';
--------------------------------------------------------
--  DDL for Table REPCAT$_REFRESH_TEMPLATES
--------------------------------------------------------

  CREATE TABLE "REPCAT$_REFRESH_TEMPLATES" 
   (	"REFRESH_TEMPLATE_ID" NUMBER, 
	"OWNER" VARCHAR2(30), 
	"REFRESH_GROUP_NAME" VARCHAR2(30), 
	"REFRESH_TEMPLATE_NAME" VARCHAR2(30), 
	"TEMPLATE_COMMENT" VARCHAR2(2000), 
	"PUBLIC_TEMPLATE" VARCHAR2(1), 
	"LAST_MODIFIED" DATE, 
	"MODIFIED_BY" NUMBER, 
	"CREATION_DATE" DATE, 
	"CREATED_BY" NUMBER, 
	"REFRESH_GROUP_ID" NUMBER DEFAULT 0, 
	"TEMPLATE_TYPE_ID" NUMBER DEFAULT 1, 
	"TEMPLATE_STATUS_ID" NUMBER DEFAULT 0, 
	"FLAGS" RAW(255), 
	"SPARE1" VARCHAR2(4000)
   ) ;

   COMMENT ON COLUMN "REPCAT$_REFRESH_TEMPLATES"."REFRESH_TEMPLATE_ID" IS 'Internal primary key of the REPCAT$_REFRESH_TEMPLATES table.';
   COMMENT ON COLUMN "REPCAT$_REFRESH_TEMPLATES"."OWNER" IS 'Owner of the refresh group template.';
   COMMENT ON COLUMN "REPCAT$_REFRESH_TEMPLATES"."REFRESH_GROUP_NAME" IS 'Name of the refresh group to create during instantiation.';
   COMMENT ON COLUMN "REPCAT$_REFRESH_TEMPLATES"."REFRESH_TEMPLATE_NAME" IS 'Name of the refresh group template.';
   COMMENT ON COLUMN "REPCAT$_REFRESH_TEMPLATES"."TEMPLATE_COMMENT" IS 'Optional comment field for the refresh group template.';
   COMMENT ON COLUMN "REPCAT$_REFRESH_TEMPLATES"."PUBLIC_TEMPLATE" IS 'Flag specifying public template or private template.';
   COMMENT ON COLUMN "REPCAT$_REFRESH_TEMPLATES"."LAST_MODIFIED" IS 'Date the row was last modified.';
   COMMENT ON COLUMN "REPCAT$_REFRESH_TEMPLATES"."MODIFIED_BY" IS 'User id of the user that modified the row.';
   COMMENT ON COLUMN "REPCAT$_REFRESH_TEMPLATES"."CREATION_DATE" IS 'Date the row was created.';
   COMMENT ON COLUMN "REPCAT$_REFRESH_TEMPLATES"."CREATED_BY" IS 'User id of the user that created the row.';
   COMMENT ON COLUMN "REPCAT$_REFRESH_TEMPLATES"."REFRESH_GROUP_ID" IS 'Internal primary key to default refresh group for the template.';
   COMMENT ON COLUMN "REPCAT$_REFRESH_TEMPLATES"."TEMPLATE_TYPE_ID" IS 'Internal primary key to the template types.';
   COMMENT ON COLUMN "REPCAT$_REFRESH_TEMPLATES"."TEMPLATE_STATUS_ID" IS 'Internal primary key to the template status table.';
   COMMENT ON COLUMN "REPCAT$_REFRESH_TEMPLATES"."FLAGS" IS 'Internal flags for the template.';
   COMMENT ON COLUMN "REPCAT$_REFRESH_TEMPLATES"."SPARE1" IS 'Reserved for future use.';
   COMMENT ON TABLE "REPCAT$_REFRESH_TEMPLATES"  IS 'Primary table containing deployment template information.';
--------------------------------------------------------
--  DDL for Table REPCAT$_REPCAT
--------------------------------------------------------

  CREATE TABLE "REPCAT$_REPCAT" 
   (	"GOWNER" VARCHAR2(30) DEFAULT 'PUBLIC', 
	"SNAME" VARCHAR2(30), 
	"MASTER" VARCHAR2(1), 
	"STATUS" NUMBER(*,0), 
	"SCHEMA_COMMENT" VARCHAR2(80), 
	"FLAVOR_ID" NUMBER, 
	"FLAG" RAW(4) DEFAULT '00000000'
   ) ;

   COMMENT ON COLUMN "REPCAT$_REPCAT"."GOWNER" IS 'Owner of the object group';
   COMMENT ON COLUMN "REPCAT$_REPCAT"."SNAME" IS 'Name of the replicated object group';
   COMMENT ON COLUMN "REPCAT$_REPCAT"."MASTER" IS 'Is the site a master site for the replicated object group';
   COMMENT ON COLUMN "REPCAT$_REPCAT"."STATUS" IS 'If the site is a master, the master''s status';
   COMMENT ON COLUMN "REPCAT$_REPCAT"."SCHEMA_COMMENT" IS 'Description of the replicated object group';
   COMMENT ON COLUMN "REPCAT$_REPCAT"."FLAVOR_ID" IS 'Flavor identifier';
   COMMENT ON COLUMN "REPCAT$_REPCAT"."FLAG" IS 'Miscellaneous repgroup info';
   COMMENT ON TABLE "REPCAT$_REPCAT"  IS 'Information about all replicated object groups';
--------------------------------------------------------
--  DDL for Table REPCAT$_REPCATLOG
--------------------------------------------------------

  CREATE TABLE "REPCAT$_REPCATLOG" 
   (	"VERSION" NUMBER, 
	"ID" NUMBER, 
	"SOURCE" VARCHAR2(128), 
	"USERID" VARCHAR2(30), 
	"TIMESTAMP" DATE, 
	"ROLE" VARCHAR2(1), 
	"MASTER" VARCHAR2(128), 
	"SNAME" VARCHAR2(30), 
	"REQUEST" NUMBER(*,0), 
	"ONAME" VARCHAR2(30), 
	"TYPE" NUMBER(*,0), 
	"A_COMMENT" VARCHAR2(2000), 
	"BOOL_ARG" VARCHAR2(1), 
	"ANO_BOOL_ARG" VARCHAR2(1), 
	"INT_ARG" NUMBER(*,0), 
	"ANO_INT_ARG" NUMBER(*,0), 
	"LINES" NUMBER(*,0), 
	"STATUS" NUMBER(*,0), 
	"MESSAGE" VARCHAR2(200), 
	"ERRNUM" NUMBER, 
	"GNAME" VARCHAR2(30)
   ) ;

   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."VERSION" IS 'Version of the repcat log record';
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."ID" IS 'Identifying number of repcat log record';
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."SOURCE" IS 'Name of the database at which the request originated';
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."USERID" IS 'Name of the user who submitted the request';
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."TIMESTAMP" IS 'When the request was submitted';
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."ROLE" IS 'Is this database the masterdef for the request';
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."MASTER" IS 'Name of the database that processes this request$_ddl';
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."SNAME" IS 'Schema of replicated object';
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."REQUEST" IS 'Name of the requested operation';
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."ONAME" IS 'Replicated object name, if applicable';
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."TYPE" IS 'Type of replicated object, if applicable';
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."A_COMMENT" IS 'Textual argument used for comments';
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."BOOL_ARG" IS 'Boolean argument';
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."ANO_BOOL_ARG" IS 'Another Boolean argument';
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."INT_ARG" IS 'Integer argument';
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."ANO_INT_ARG" IS 'Another integer argument';
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."LINES" IS 'The number of rows in system.repcat$_ddl at the processing site';
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."STATUS" IS 'Status of the request at this database';
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."MESSAGE" IS 'Error message associated with processing the request';
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."ERRNUM" IS 'Oracle error number associated with processing the request';
   COMMENT ON COLUMN "REPCAT$_REPCATLOG"."GNAME" IS 'Name of the replicated object group';
   COMMENT ON TABLE "REPCAT$_REPCATLOG"  IS 'Information about asynchronous administration requests';
--------------------------------------------------------
--  DDL for Table REPCAT$_REPCOLUMN
--------------------------------------------------------

  CREATE TABLE "REPCAT$_REPCOLUMN" 
   (	"SNAME" VARCHAR2(30), 
	"ONAME" VARCHAR2(30), 
	"TYPE" NUMBER(*,0), 
	"CNAME" VARCHAR2(30), 
	"LCNAME" VARCHAR2(4000), 
	"TOID" RAW(16), 
	"VERSION#" NUMBER, 
	"HASHCODE" RAW(17), 
	"CTYPE_NAME" VARCHAR2(30), 
	"CTYPE_OWNER" VARCHAR2(30), 
	"ID" NUMBER, 
	"POS" NUMBER, 
	"TOP" VARCHAR2(30), 
	"FLAG" RAW(2) DEFAULT '0000', 
	"CTYPE" NUMBER, 
	"LENGTH" NUMBER, 
	"PRECISION#" NUMBER, 
	"SCALE" NUMBER, 
	"NULL$" NUMBER, 
	"CHARSETID" NUMBER, 
	"CHARSETFORM" NUMBER, 
	"PROPERTY" RAW(4) DEFAULT '00000000', 
	"CLENGTH" NUMBER
   ) ;

   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."SNAME" IS 'Name of the object owner';
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."ONAME" IS 'Name of the object';
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."TYPE" IS 'Type of the object';
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."CNAME" IS 'Column name';
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."LCNAME" IS 'Long column name';
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."TOID" IS 'Type object identifier of a user-defined type';
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."VERSION#" IS 'Version# of a column of user-defined type';
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."HASHCODE" IS 'Hashcode of a column of user-defined type';
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."ID" IS 'Column ID';
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."POS" IS 'Ordering of column used as IN parameter in the replication procedures';
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."TOP" IS 'Top column name for an attribute';
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."FLAG" IS 'Replication information about column';
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."CTYPE" IS 'Type of the column';
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."LENGTH" IS 'Length of the column in bytes';
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."PRECISION#" IS 'Length: decimal digits (NUMBER) or binary digits (FLOAT)';
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."SCALE" IS 'Digits to right of decimal point in a number';
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."NULL$" IS 'Does column allow NULL values?';
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."CHARSETID" IS 'Character set identifier';
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."CHARSETFORM" IS 'Character set form';
   COMMENT ON COLUMN "REPCAT$_REPCOLUMN"."CLENGTH" IS 'The maximum length of the column in characters';
   COMMENT ON TABLE "REPCAT$_REPCOLUMN"  IS 'Replicated columns for a table sorted alphabetically in ascending order';
--------------------------------------------------------
--  DDL for Table REPCAT$_REPGROUP_PRIVS
--------------------------------------------------------

  CREATE TABLE "REPCAT$_REPGROUP_PRIVS" 
   (	"USERID" NUMBER, 
	"USERNAME" VARCHAR2(30), 
	"GOWNER" VARCHAR2(30), 
	"GNAME" VARCHAR2(30), 
	"GLOBAL_FLAG" NUMBER, 
	"CREATED" DATE, 
	"PRIVILEGE" NUMBER
   ) ;

   COMMENT ON COLUMN "REPCAT$_REPGROUP_PRIVS"."USERID" IS 'OBSOLETE COLUMN: Identifying number of the user';
   COMMENT ON COLUMN "REPCAT$_REPGROUP_PRIVS"."USERNAME" IS 'Identifying name of the registered user';
   COMMENT ON COLUMN "REPCAT$_REPGROUP_PRIVS"."GOWNER" IS 'Owner of the replicated object group';
   COMMENT ON COLUMN "REPCAT$_REPGROUP_PRIVS"."GNAME" IS 'Name of the replicated object group';
   COMMENT ON COLUMN "REPCAT$_REPGROUP_PRIVS"."GLOBAL_FLAG" IS '1 if gname is NULL, 0 otherwise';
   COMMENT ON COLUMN "REPCAT$_REPGROUP_PRIVS"."CREATED" IS 'Registration date';
   COMMENT ON COLUMN "REPCAT$_REPGROUP_PRIVS"."PRIVILEGE" IS 'Registered privileges';
   COMMENT ON TABLE "REPCAT$_REPGROUP_PRIVS"  IS 'Information about users who are registered for object group privileges';
--------------------------------------------------------
--  DDL for Table REPCAT$_REPOBJECT
--------------------------------------------------------

  CREATE TABLE "REPCAT$_REPOBJECT" 
   (	"SNAME" VARCHAR2(30), 
	"ONAME" VARCHAR2(30), 
	"TYPE" NUMBER(*,0), 
	"VERSION#" NUMBER, 
	"HASHCODE" RAW(17), 
	"ID" NUMBER, 
	"OBJECT_COMMENT" VARCHAR2(80), 
	"STATUS" NUMBER(*,0), 
	"GENPACKAGE" NUMBER(*,0), 
	"GENPLOGID" NUMBER(*,0), 
	"GENTRIGGER" NUMBER(*,0), 
	"GENTLOGID" NUMBER(*,0), 
	"GOWNER" VARCHAR2(30), 
	"GNAME" VARCHAR2(30), 
	"FLAG" RAW(4) DEFAULT '00000000'
   ) ;

   COMMENT ON COLUMN "REPCAT$_REPOBJECT"."SNAME" IS 'Name of the object owner';
   COMMENT ON COLUMN "REPCAT$_REPOBJECT"."ONAME" IS 'Name of the object';
   COMMENT ON COLUMN "REPCAT$_REPOBJECT"."TYPE" IS 'Type of the object';
   COMMENT ON COLUMN "REPCAT$_REPOBJECT"."VERSION#" IS 'Version of objects of TYPE';
   COMMENT ON COLUMN "REPCAT$_REPOBJECT"."HASHCODE" IS 'Hashcode of objects of TYPE';
   COMMENT ON COLUMN "REPCAT$_REPOBJECT"."ID" IS 'Identifier of the local object';
   COMMENT ON COLUMN "REPCAT$_REPOBJECT"."OBJECT_COMMENT" IS 'Description of the replicated object';
   COMMENT ON COLUMN "REPCAT$_REPOBJECT"."STATUS" IS 'Status of the last create or alter request on the local object';
   COMMENT ON COLUMN "REPCAT$_REPOBJECT"."GENPACKAGE" IS 'Status of whether the object needs to generate replication package';
   COMMENT ON COLUMN "REPCAT$_REPOBJECT"."GENPLOGID" IS 'Log id of message sent for generating package support';
   COMMENT ON COLUMN "REPCAT$_REPOBJECT"."GENTRIGGER" IS 'Status of whether the object needs to generate replication trigger';
   COMMENT ON COLUMN "REPCAT$_REPOBJECT"."GENTLOGID" IS 'Log id of message sent for generating trigger support';
   COMMENT ON COLUMN "REPCAT$_REPOBJECT"."GOWNER" IS 'Owner of the object''s object group';
   COMMENT ON COLUMN "REPCAT$_REPOBJECT"."GNAME" IS 'Name of the object''s object group';
   COMMENT ON COLUMN "REPCAT$_REPOBJECT"."FLAG" IS 'Information about replicated object';
   COMMENT ON TABLE "REPCAT$_REPOBJECT"  IS 'Information about replicated objects';
--------------------------------------------------------
--  DDL for Table REPCAT$_REPPROP
--------------------------------------------------------

  CREATE TABLE "REPCAT$_REPPROP" 
   (	"SNAME" VARCHAR2(30), 
	"ONAME" VARCHAR2(30), 
	"TYPE" NUMBER(*,0), 
	"DBLINK" VARCHAR2(128), 
	"HOW" NUMBER(*,0), 
	"PROPAGATE_COMMENT" VARCHAR2(80), 
	"DELIVERY_ORDER" NUMBER, 
	"RECIPIENT_KEY" NUMBER, 
	"EXTENSION_ID" RAW(16) DEFAULT '00'
   ) ;

   COMMENT ON COLUMN "REPCAT$_REPPROP"."SNAME" IS 'Name of the object owner';
   COMMENT ON COLUMN "REPCAT$_REPPROP"."ONAME" IS 'Name of the object';
   COMMENT ON COLUMN "REPCAT$_REPPROP"."TYPE" IS 'Type of the object';
   COMMENT ON COLUMN "REPCAT$_REPPROP"."DBLINK" IS 'Destination database for propagation';
   COMMENT ON COLUMN "REPCAT$_REPPROP"."HOW" IS 'Propagation choice for the destination database';
   COMMENT ON COLUMN "REPCAT$_REPPROP"."PROPAGATE_COMMENT" IS 'Description of the propagation choice';
   COMMENT ON COLUMN "REPCAT$_REPPROP"."DELIVERY_ORDER" IS 'Value of delivery order when the master was added';
   COMMENT ON COLUMN "REPCAT$_REPPROP"."RECIPIENT_KEY" IS 'Recipient key for sname and oname, used in joining with def$_aqcall';
   COMMENT ON COLUMN "REPCAT$_REPPROP"."EXTENSION_ID" IS 'Identifier of any active extension request';
   COMMENT ON TABLE "REPCAT$_REPPROP"  IS 'Propagation information about replicated objects';
--------------------------------------------------------
--  DDL for Table REPCAT$_REPSCHEMA
--------------------------------------------------------

  CREATE TABLE "REPCAT$_REPSCHEMA" 
   (	"GOWNER" VARCHAR2(30) DEFAULT 'PUBLIC', 
	"SNAME" VARCHAR2(30), 
	"DBLINK" VARCHAR2(128), 
	"MASTERDEF" VARCHAR2(1), 
	"SNAPMASTER" VARCHAR2(1), 
	"MASTER_COMMENT" VARCHAR2(80), 
	"MASTER" VARCHAR2(1), 
	"PROP_UPDATES" NUMBER DEFAULT 0, 
	"MY_DBLINK" VARCHAR2(1), 
	"EXTENSION_ID" RAW(16) DEFAULT '00'
   ) ;

   COMMENT ON COLUMN "REPCAT$_REPSCHEMA"."GOWNER" IS 'Owner of the replicated object group';
   COMMENT ON COLUMN "REPCAT$_REPSCHEMA"."SNAME" IS 'Name of the replicated object group';
   COMMENT ON COLUMN "REPCAT$_REPSCHEMA"."DBLINK" IS 'A database site replicating the object group';
   COMMENT ON COLUMN "REPCAT$_REPSCHEMA"."MASTERDEF" IS 'Is the database the master definition site for the replicated object group';
   COMMENT ON COLUMN "REPCAT$_REPSCHEMA"."SNAPMASTER" IS 'For a snapshot site, is this the current refresh_master';
   COMMENT ON COLUMN "REPCAT$_REPSCHEMA"."MASTER_COMMENT" IS 'Description of the database site';
   COMMENT ON COLUMN "REPCAT$_REPSCHEMA"."MASTER" IS 'Redundant information from repcat$_repcat.master';
   COMMENT ON COLUMN "REPCAT$_REPSCHEMA"."PROP_UPDATES" IS 'Number of requested updates for master in repcat$_repprop';
   COMMENT ON COLUMN "REPCAT$_REPSCHEMA"."MY_DBLINK" IS 'A sanity check after import: is this master the current site';
   COMMENT ON COLUMN "REPCAT$_REPSCHEMA"."EXTENSION_ID" IS 'Dummy column for foreign key';
   COMMENT ON TABLE "REPCAT$_REPSCHEMA"  IS 'N-way replication information';
--------------------------------------------------------
--  DDL for Table REPCAT$_RESOL_STATS_CONTROL
--------------------------------------------------------

  CREATE TABLE "REPCAT$_RESOL_STATS_CONTROL" 
   (	"SNAME" VARCHAR2(30), 
	"ONAME" VARCHAR2(30), 
	"CREATED" DATE, 
	"STATUS" NUMBER(*,0), 
	"STATUS_UPDATE_DATE" DATE, 
	"PURGED_DATE" DATE, 
	"LAST_PURGE_START_DATE" DATE, 
	"LAST_PURGE_END_DATE" DATE
   ) ;

   COMMENT ON COLUMN "REPCAT$_RESOL_STATS_CONTROL"."SNAME" IS 'Owner of replicated object';
   COMMENT ON COLUMN "REPCAT$_RESOL_STATS_CONTROL"."ONAME" IS 'Name of the replicated object';
   COMMENT ON COLUMN "REPCAT$_RESOL_STATS_CONTROL"."CREATED" IS 'Timestamp for which statistics collection was first started';
   COMMENT ON COLUMN "REPCAT$_RESOL_STATS_CONTROL"."STATUS" IS 'Status of statistics collection: ACTIVE, CANCELLED';
   COMMENT ON COLUMN "REPCAT$_RESOL_STATS_CONTROL"."STATUS_UPDATE_DATE" IS 'Timestamp for which the status was last updated';
   COMMENT ON COLUMN "REPCAT$_RESOL_STATS_CONTROL"."PURGED_DATE" IS 'Timestamp for the last purge of statistics data';
   COMMENT ON COLUMN "REPCAT$_RESOL_STATS_CONTROL"."LAST_PURGE_START_DATE" IS 'The last start date of the statistics purging date range';
   COMMENT ON COLUMN "REPCAT$_RESOL_STATS_CONTROL"."LAST_PURGE_END_DATE" IS 'The last end date of the statistics purging date range';
   COMMENT ON TABLE "REPCAT$_RESOL_STATS_CONTROL"  IS 'Information about statistics collection for conflict resolutions for all replicated tables in the database';
--------------------------------------------------------
--  DDL for Table REPCAT$_RESOLUTION
--------------------------------------------------------

  CREATE TABLE "REPCAT$_RESOLUTION" 
   (	"SNAME" VARCHAR2(30), 
	"ONAME" VARCHAR2(30), 
	"CONFLICT_TYPE_ID" NUMBER(*,0), 
	"REFERENCE_NAME" VARCHAR2(30), 
	"SEQUENCE_NO" NUMBER, 
	"METHOD_NAME" VARCHAR2(80), 
	"FUNCTION_NAME" VARCHAR2(92), 
	"PRIORITY_GROUP" VARCHAR2(30), 
	"RESOLUTION_COMMENT" VARCHAR2(80)
   ) ;

   COMMENT ON COLUMN "REPCAT$_RESOLUTION"."SNAME" IS 'Owner of replicated object';
   COMMENT ON COLUMN "REPCAT$_RESOLUTION"."ONAME" IS 'Name of the replicated object';
   COMMENT ON COLUMN "REPCAT$_RESOLUTION"."CONFLICT_TYPE_ID" IS 'Type of conflict';
   COMMENT ON COLUMN "REPCAT$_RESOLUTION"."REFERENCE_NAME" IS 'Table name, unique constraint name, or column group name';
   COMMENT ON COLUMN "REPCAT$_RESOLUTION"."SEQUENCE_NO" IS 'Ordering on resolution';
   COMMENT ON COLUMN "REPCAT$_RESOLUTION"."METHOD_NAME" IS 'Name of the conflict resolution method';
   COMMENT ON COLUMN "REPCAT$_RESOLUTION"."FUNCTION_NAME" IS 'Name of the resolution function';
   COMMENT ON COLUMN "REPCAT$_RESOLUTION"."PRIORITY_GROUP" IS 'Name of the priority group used in conflict resolution';
   COMMENT ON COLUMN "REPCAT$_RESOLUTION"."RESOLUTION_COMMENT" IS 'Description of the conflict resolution';
   COMMENT ON TABLE "REPCAT$_RESOLUTION"  IS 'Description of all conflict resolutions in the database';
--------------------------------------------------------
--  DDL for Table REPCAT$_RESOLUTION_METHOD
--------------------------------------------------------

  CREATE TABLE "REPCAT$_RESOLUTION_METHOD" 
   (	"CONFLICT_TYPE_ID" NUMBER(*,0), 
	"METHOD_NAME" VARCHAR2(80)
   ) ;

   COMMENT ON COLUMN "REPCAT$_RESOLUTION_METHOD"."CONFLICT_TYPE_ID" IS 'Type of conflict';
   COMMENT ON COLUMN "REPCAT$_RESOLUTION_METHOD"."METHOD_NAME" IS 'Name of the conflict resolution method';
   COMMENT ON TABLE "REPCAT$_RESOLUTION_METHOD"  IS 'All conflict resolution methods in the database';
--------------------------------------------------------
--  DDL for Table REPCAT$_RESOLUTION_STATISTICS
--------------------------------------------------------

  CREATE TABLE "REPCAT$_RESOLUTION_STATISTICS" 
   (	"SNAME" VARCHAR2(30), 
	"ONAME" VARCHAR2(30), 
	"CONFLICT_TYPE_ID" NUMBER(*,0), 
	"REFERENCE_NAME" VARCHAR2(30), 
	"METHOD_NAME" VARCHAR2(80), 
	"FUNCTION_NAME" VARCHAR2(92), 
	"PRIORITY_GROUP" VARCHAR2(30), 
	"RESOLVED_DATE" DATE, 
	"PRIMARY_KEY_VALUE" VARCHAR2(2000)
   ) ;

   COMMENT ON COLUMN "REPCAT$_RESOLUTION_STATISTICS"."SNAME" IS 'Owner of replicated object';
   COMMENT ON COLUMN "REPCAT$_RESOLUTION_STATISTICS"."ONAME" IS 'Name of the replicated object';
   COMMENT ON COLUMN "REPCAT$_RESOLUTION_STATISTICS"."CONFLICT_TYPE_ID" IS 'Type of conflict';
   COMMENT ON COLUMN "REPCAT$_RESOLUTION_STATISTICS"."REFERENCE_NAME" IS 'Table name, unique constraint name, or column group name';
   COMMENT ON COLUMN "REPCAT$_RESOLUTION_STATISTICS"."METHOD_NAME" IS 'Name of the conflict resolution method';
   COMMENT ON COLUMN "REPCAT$_RESOLUTION_STATISTICS"."FUNCTION_NAME" IS 'Name of the resolution function';
   COMMENT ON COLUMN "REPCAT$_RESOLUTION_STATISTICS"."PRIORITY_GROUP" IS 'Name of the priority group used in conflict resolution';
   COMMENT ON COLUMN "REPCAT$_RESOLUTION_STATISTICS"."RESOLVED_DATE" IS 'Timestamp for the resolution of the conflict';
   COMMENT ON COLUMN "REPCAT$_RESOLUTION_STATISTICS"."PRIMARY_KEY_VALUE" IS 'Primary key of the replicated row (character data)';
   COMMENT ON TABLE "REPCAT$_RESOLUTION_STATISTICS"  IS 'Statistics for conflict resolutions for all replicated tables in the database';
--------------------------------------------------------
--  DDL for Table REPCAT$_RUNTIME_PARMS
--------------------------------------------------------

  CREATE TABLE "REPCAT$_RUNTIME_PARMS" 
   (	"RUNTIME_PARM_ID" NUMBER, 
	"PARAMETER_NAME" VARCHAR2(30), 
	"PARM_VALUE" CLOB
   ) ;

   COMMENT ON COLUMN "REPCAT$_RUNTIME_PARMS"."RUNTIME_PARM_ID" IS 'Primary key of the parameter values table.';
   COMMENT ON COLUMN "REPCAT$_RUNTIME_PARMS"."PARAMETER_NAME" IS 'Name of the parameter.';
   COMMENT ON COLUMN "REPCAT$_RUNTIME_PARMS"."PARM_VALUE" IS 'Parameter value.';
--------------------------------------------------------
--  DDL for Table REPCAT$_SITE_OBJECTS
--------------------------------------------------------

  CREATE TABLE "REPCAT$_SITE_OBJECTS" 
   (	"TEMPLATE_SITE_ID" NUMBER, 
	"SNAME" VARCHAR2(30), 
	"ONAME" VARCHAR2(30), 
	"OBJECT_TYPE_ID" NUMBER
   ) ;

   COMMENT ON COLUMN "REPCAT$_SITE_OBJECTS"."TEMPLATE_SITE_ID" IS 'Internal primary key of the template sites table.';
   COMMENT ON COLUMN "REPCAT$_SITE_OBJECTS"."SNAME" IS 'Schema containing the deployed database object.';
   COMMENT ON COLUMN "REPCAT$_SITE_OBJECTS"."ONAME" IS 'Name of the deployed database object.';
   COMMENT ON COLUMN "REPCAT$_SITE_OBJECTS"."OBJECT_TYPE_ID" IS 'Internal ID of the object type of the deployed database object.';
   COMMENT ON TABLE "REPCAT$_SITE_OBJECTS"  IS 'Table for maintaining database objects deployed at a site.';
--------------------------------------------------------
--  DDL for Table REPCAT$_SITES_NEW
--------------------------------------------------------

  CREATE TABLE "REPCAT$_SITES_NEW" 
   (	"EXTENSION_ID" RAW(16), 
	"GOWNER" VARCHAR2(30), 
	"GNAME" VARCHAR2(30), 
	"DBLINK" VARCHAR2(128), 
	"FULL_INSTANTIATION" VARCHAR2(1), 
	"MASTER_STATUS" NUMBER
   ) ;

   COMMENT ON COLUMN "REPCAT$_SITES_NEW"."EXTENSION_ID" IS 'Globally unique identifier for replication extension';
   COMMENT ON COLUMN "REPCAT$_SITES_NEW"."GOWNER" IS 'Owner of the object group';
   COMMENT ON COLUMN "REPCAT$_SITES_NEW"."GNAME" IS 'Name of the replicated object group';
   COMMENT ON COLUMN "REPCAT$_SITES_NEW"."DBLINK" IS 'A database site that will replicate the object group';
   COMMENT ON COLUMN "REPCAT$_SITES_NEW"."FULL_INSTANTIATION" IS 'Y if the database uses full-database export or change-based recovery';
   COMMENT ON COLUMN "REPCAT$_SITES_NEW"."MASTER_STATUS" IS 'Instantiation status of the new master';
   COMMENT ON TABLE "REPCAT$_SITES_NEW"  IS 'Information about new masters for replication extension';
--------------------------------------------------------
--  DDL for Table REPCAT$_SNAPGROUP
--------------------------------------------------------

  CREATE TABLE "REPCAT$_SNAPGROUP" 
   (	"GOWNER" VARCHAR2(30) DEFAULT 'PUBLIC', 
	"GNAME" VARCHAR2(30), 
	"DBLINK" VARCHAR2(128), 
	"GROUP_COMMENT" VARCHAR2(80), 
	"REP_TYPE" NUMBER, 
	"FLAVOR_ID" NUMBER
   ) ;

   COMMENT ON COLUMN "REPCAT$_SNAPGROUP"."GOWNER" IS 'Owner of the snapshot repgroup';
   COMMENT ON COLUMN "REPCAT$_SNAPGROUP"."GNAME" IS 'Name of the snapshot repgroup';
   COMMENT ON COLUMN "REPCAT$_SNAPGROUP"."DBLINK" IS 'Database site of the snapshot repgroup';
   COMMENT ON COLUMN "REPCAT$_SNAPGROUP"."GROUP_COMMENT" IS 'Description of the snapshot repgroup';
   COMMENT ON COLUMN "REPCAT$_SNAPGROUP"."REP_TYPE" IS 'Identifier of flavor at snapshot';
   COMMENT ON TABLE "REPCAT$_SNAPGROUP"  IS 'Snapshot repgroup registration information';
--------------------------------------------------------
--  DDL for Table REPCAT$_TEMPLATE_OBJECTS
--------------------------------------------------------

  CREATE TABLE "REPCAT$_TEMPLATE_OBJECTS" 
   (	"TEMPLATE_OBJECT_ID" NUMBER, 
	"REFRESH_TEMPLATE_ID" NUMBER, 
	"OBJECT_NAME" VARCHAR2(30), 
	"OBJECT_TYPE" NUMBER, 
	"OBJECT_VERSION#" NUMBER, 
	"DDL_TEXT" CLOB, 
	"MASTER_ROLLBACK_SEG" VARCHAR2(30), 
	"DERIVED_FROM_SNAME" VARCHAR2(30), 
	"DERIVED_FROM_ONAME" VARCHAR2(30), 
	"FLAVOR_ID" NUMBER, 
	"SCHEMA_NAME" VARCHAR2(30), 
	"DDL_NUM" NUMBER DEFAULT 1, 
	"TEMPLATE_REFGROUP_ID" NUMBER DEFAULT 0, 
	"FLAGS" RAW(255), 
	"SPARE1" VARCHAR2(4000)
   ) ;

   COMMENT ON COLUMN "REPCAT$_TEMPLATE_OBJECTS"."TEMPLATE_OBJECT_ID" IS 'Internal primary key of the REPCAT$_TEMPLATE_OBJECTS table.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_OBJECTS"."REFRESH_TEMPLATE_ID" IS 'Internal primary key of the REPCAT$_REFRESH_TEMPLATES table.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_OBJECTS"."OBJECT_NAME" IS 'Name of the database object.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_OBJECTS"."OBJECT_TYPE" IS 'Type of database object.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_OBJECTS"."OBJECT_VERSION#" IS 'Version# of database object of TYPE.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_OBJECTS"."DDL_TEXT" IS 'DDL string for creating the object or WHERE clause for snapshot query.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_OBJECTS"."MASTER_ROLLBACK_SEG" IS 'Rollback segment for use during snapshot refreshes.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_OBJECTS"."DERIVED_FROM_SNAME" IS 'Schema name of schema containing object this was derived from.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_OBJECTS"."DERIVED_FROM_ONAME" IS 'Object name of object this object was derived from.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_OBJECTS"."FLAVOR_ID" IS 'Foreign key to the REPCAT$_FLAVORS table.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_OBJECTS"."SCHEMA_NAME" IS 'Schema containing the object.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_OBJECTS"."DDL_NUM" IS 'Order of ddls to execute.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_OBJECTS"."TEMPLATE_REFGROUP_ID" IS 'Internal ID of the refresh group to contain the object.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_OBJECTS"."FLAGS" IS 'Internal flags for the object.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_OBJECTS"."SPARE1" IS 'Reserved for future use.';
--------------------------------------------------------
--  DDL for Table REPCAT$_TEMPLATE_PARMS
--------------------------------------------------------

  CREATE TABLE "REPCAT$_TEMPLATE_PARMS" 
   (	"TEMPLATE_PARAMETER_ID" NUMBER, 
	"REFRESH_TEMPLATE_ID" NUMBER, 
	"PARAMETER_NAME" VARCHAR2(30), 
	"DEFAULT_PARM_VALUE" CLOB, 
	"PROMPT_STRING" VARCHAR2(2000), 
	"USER_OVERRIDE" VARCHAR2(1) DEFAULT 'Y'
   ) ;

   COMMENT ON COLUMN "REPCAT$_TEMPLATE_PARMS"."TEMPLATE_PARAMETER_ID" IS 'Internal primary key of the REPCAT$_TEMPLATE_PARMS table.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_PARMS"."REFRESH_TEMPLATE_ID" IS 'Internal primary key of the REPCAT$_REFRESH_TEMPLATES table.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_PARMS"."PARAMETER_NAME" IS 'name of the parameter.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_PARMS"."DEFAULT_PARM_VALUE" IS 'Default value for the parameter.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_PARMS"."PROMPT_STRING" IS 'String for use in prompting for parameter values.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_PARMS"."USER_OVERRIDE" IS 'User override flag.';
--------------------------------------------------------
--  DDL for Table REPCAT$_TEMPLATE_REFGROUPS
--------------------------------------------------------

  CREATE TABLE "REPCAT$_TEMPLATE_REFGROUPS" 
   (	"REFRESH_GROUP_ID" NUMBER, 
	"REFRESH_GROUP_NAME" VARCHAR2(30), 
	"REFRESH_TEMPLATE_ID" NUMBER, 
	"ROLLBACK_SEG" VARCHAR2(30), 
	"START_DATE" VARCHAR2(200), 
	"INTERVAL" VARCHAR2(200)
   ) ;

   COMMENT ON COLUMN "REPCAT$_TEMPLATE_REFGROUPS"."REFRESH_GROUP_ID" IS 'Internal primary key of the refresh groups table.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_REFGROUPS"."REFRESH_GROUP_NAME" IS 'Name of the refresh group';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_REFGROUPS"."REFRESH_TEMPLATE_ID" IS 'Primary key of the template containing the refresh group.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_REFGROUPS"."ROLLBACK_SEG" IS 'Name of the rollback segment to use during refresh.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_REFGROUPS"."START_DATE" IS 'Refresh start date.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_REFGROUPS"."INTERVAL" IS 'Refresh interval.';
   COMMENT ON TABLE "REPCAT$_TEMPLATE_REFGROUPS"  IS 'Table for maintaining refresh group information for template.';
--------------------------------------------------------
--  DDL for Table REPCAT$_TEMPLATE_SITES
--------------------------------------------------------

  CREATE TABLE "REPCAT$_TEMPLATE_SITES" 
   (	"TEMPLATE_SITE_ID" NUMBER, 
	"REFRESH_TEMPLATE_NAME" VARCHAR2(30), 
	"REFRESH_GROUP_NAME" VARCHAR2(30), 
	"TEMPLATE_OWNER" VARCHAR2(30), 
	"USER_NAME" VARCHAR2(30), 
	"SITE_NAME" VARCHAR2(128), 
	"REPAPI_SITE_ID" NUMBER, 
	"STATUS" NUMBER, 
	"REFRESH_TEMPLATE_ID" NUMBER, 
	"USER_ID" NUMBER, 
	"INSTANTIATION_DATE" DATE
   ) ;

   COMMENT ON COLUMN "REPCAT$_TEMPLATE_SITES"."TEMPLATE_SITE_ID" IS 'Internal primary key of the REPCAT$_TEMPLATE_SITES table.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_SITES"."REFRESH_TEMPLATE_NAME" IS 'Name of the refresh group template.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_SITES"."REFRESH_GROUP_NAME" IS 'Name of the refresh group to create during instantiation.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_SITES"."TEMPLATE_OWNER" IS 'Owner of the refresh group template.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_SITES"."USER_NAME" IS 'Database user name.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_SITES"."SITE_NAME" IS 'Name of the site that has instantiated the template.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_SITES"."REPAPI_SITE_ID" IS 'Name of the site that has instantiated the template.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_SITES"."STATUS" IS 'Obsolete - do not use.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_SITES"."REFRESH_TEMPLATE_ID" IS 'Obsolete - do not use.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_SITES"."USER_ID" IS 'Obsolete - do not use.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_SITES"."INSTANTIATION_DATE" IS 'Date template was instantiated.';
--------------------------------------------------------
--  DDL for Table REPCAT$_TEMPLATE_STATUS
--------------------------------------------------------

  CREATE TABLE "REPCAT$_TEMPLATE_STATUS" 
   (	"TEMPLATE_STATUS_ID" NUMBER, 
	"STATUS_TYPE_NAME" VARCHAR2(100)
   ) ;

   COMMENT ON COLUMN "REPCAT$_TEMPLATE_STATUS"."TEMPLATE_STATUS_ID" IS 'Internal primary key for the template status table.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_STATUS"."STATUS_TYPE_NAME" IS 'User friendly name for the template status.';
   COMMENT ON TABLE "REPCAT$_TEMPLATE_STATUS"  IS 'Table for template status and template status codes.';
--------------------------------------------------------
--  DDL for Table REPCAT$_TEMPLATE_TARGETS
--------------------------------------------------------

  CREATE TABLE "REPCAT$_TEMPLATE_TARGETS" 
   (	"TEMPLATE_TARGET_ID" NUMBER, 
	"TARGET_DATABASE" VARCHAR2(128), 
	"TARGET_COMMENT" VARCHAR2(2000), 
	"CONNECT_STRING" VARCHAR2(4000), 
	"SPARE1" VARCHAR2(4000)
   ) ;

   COMMENT ON COLUMN "REPCAT$_TEMPLATE_TARGETS"."TEMPLATE_TARGET_ID" IS 'Internal primary key of the template targets table.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_TARGETS"."TARGET_DATABASE" IS 'Global identifier of the target database.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_TARGETS"."TARGET_COMMENT" IS 'Comment on the target database.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_TARGETS"."CONNECT_STRING" IS 'The connection descriptor used to connect to the target database.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_TARGETS"."SPARE1" IS 'The spare column';
   COMMENT ON TABLE "REPCAT$_TEMPLATE_TARGETS"  IS 'Internal table for tracking potential target databases for templates.';
--------------------------------------------------------
--  DDL for Table REPCAT$_TEMPLATE_TYPES
--------------------------------------------------------

  CREATE TABLE "REPCAT$_TEMPLATE_TYPES" 
   (	"TEMPLATE_TYPE_ID" NUMBER, 
	"TEMPLATE_DESCRIPTION" VARCHAR2(200), 
	"FLAGS" RAW(255), 
	"SPARE1" VARCHAR2(4000)
   ) ;

   COMMENT ON COLUMN "REPCAT$_TEMPLATE_TYPES"."TEMPLATE_TYPE_ID" IS 'Internal primary key of the template types table.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_TYPES"."TEMPLATE_DESCRIPTION" IS 'Description of the template type.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_TYPES"."FLAGS" IS 'Bitmap flags controlling each type of template.';
   COMMENT ON COLUMN "REPCAT$_TEMPLATE_TYPES"."SPARE1" IS 'Reserved for future expansion.';
   COMMENT ON TABLE "REPCAT$_TEMPLATE_TYPES"  IS 'Internal table for maintaining types of templates.';
--------------------------------------------------------
--  DDL for Table REPCAT$_USER_AUTHORIZATIONS
--------------------------------------------------------

  CREATE TABLE "REPCAT$_USER_AUTHORIZATIONS" 
   (	"USER_AUTHORIZATION_ID" NUMBER, 
	"USER_ID" NUMBER, 
	"REFRESH_TEMPLATE_ID" NUMBER
   ) ;

   COMMENT ON COLUMN "REPCAT$_USER_AUTHORIZATIONS"."USER_AUTHORIZATION_ID" IS 'Internal primary key of the REPCAT$_USER_AUTHORIZATIONS table.';
   COMMENT ON COLUMN "REPCAT$_USER_AUTHORIZATIONS"."USER_ID" IS 'Database user id.';
   COMMENT ON COLUMN "REPCAT$_USER_AUTHORIZATIONS"."REFRESH_TEMPLATE_ID" IS 'Internal primary key of the REPCAT$_REFRESH_TEMPLATES table.';
--------------------------------------------------------
--  DDL for Table REPCAT$_USER_PARM_VALUES
--------------------------------------------------------

  CREATE TABLE "REPCAT$_USER_PARM_VALUES" 
   (	"USER_PARAMETER_ID" NUMBER, 
	"TEMPLATE_PARAMETER_ID" NUMBER, 
	"USER_ID" NUMBER, 
	"PARM_VALUE" CLOB
   ) ;

   COMMENT ON COLUMN "REPCAT$_USER_PARM_VALUES"."USER_PARAMETER_ID" IS 'Internal primary key of the REPCAT$_USER_PARM_VALUES table.';
   COMMENT ON COLUMN "REPCAT$_USER_PARM_VALUES"."TEMPLATE_PARAMETER_ID" IS 'Internal primary key of the REPCAT$_TEMPLATE_PARMS table.';
   COMMENT ON COLUMN "REPCAT$_USER_PARM_VALUES"."USER_ID" IS 'Database user id.';
   COMMENT ON COLUMN "REPCAT$_USER_PARM_VALUES"."PARM_VALUE" IS 'Value of the parameter for this user.';
--------------------------------------------------------
--  DDL for Table SEMINAIRE
--------------------------------------------------------

  CREATE TABLE "SEMINAIRE" 
   (	"ID" NUMBER(*,0), 
	"NOM" VARCHAR2(50), 
	"ETAT" VARCHAR2(50), 
	"DATE_DEBUT" DATE, 
	"ID_DEPARTEMENT" NUMBER(*,0)
   ) ;
--------------------------------------------------------
--  DDL for Table TEST
--------------------------------------------------------

  CREATE TABLE "TEST" 
   (	"ID" NUMBER(*,0), 
	"NOM" VARCHAR2(50)
   ) ;
--------------------------------------------------------
--  DDL for Table VENDEURS
--------------------------------------------------------

  CREATE TABLE "VENDEURS" 
   (	"NUMVENDEUR" NUMBER(*,0), 
	"NOMVENDEUR" VARCHAR2(30) DEFAULT NULL, 
	"TELEPHONE" CHAR(8) DEFAULT NULL
   ) ;
--------------------------------------------------------
--  DDL for Table VENTES
--------------------------------------------------------

  CREATE TABLE "VENTES" 
   (	"REFPROD" NUMBER(*,0), 
	"NUMCLIENT" NUMBER(*,0), 
	"NUMVENDEUR" NUMBER(*,0), 
	"DATEVENTE" DATE, 
	"QUANTITE" NUMBER(*,0) DEFAULT NULL, 
	"MONTANT" FLOAT(126) DEFAULT NULL
   ) ;
REM INSERTING into DEPARTEMENT
SET DEFINE OFF;
REM INSERTING into DOMAINE
SET DEFINE OFF;
REM INSERTING into ETABLISSEMENT
SET DEFINE OFF;
Insert into ETABLISSEMENT (ID,NOM,LOCALITE) values ('10','ISCAE','NOUAKCHOTT');
Insert into ETABLISSEMENT (ID,NOM,LOCALITE) values ('11','ISCAE','NOUAKCHOTT');
REM INSERTING into PERSONNE
SET DEFINE OFF;
Insert into PERSONNE (ID,NOM,PRENOM,TEL,SPECIALITE,TYPE) values ('2','mohamed','beirouk','37419845','IG','etudiant');
REM INSERTING into PRESENTATION
SET DEFINE OFF;
REM INSERTING into SEMINAIRE
SET DEFINE OFF;
--------------------------------------------------------
--  Constraints for Table LOGMNR_IND$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_IND$" ADD CONSTRAINT "LOGMNR_IND$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#") DISABLE;
  ALTER TABLE "LOGMNR_IND$" MODIFY ("OBJ#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNRC_DBNAME_UID_MAP
--------------------------------------------------------

  ALTER TABLE "LOGMNRC_DBNAME_UID_MAP" ADD CONSTRAINT "LOGMNRC_DBNAME_UID_MAP_PK" PRIMARY KEY ("GLOBAL_NAME") ENABLE;
  ALTER TABLE "LOGMNRC_DBNAME_UID_MAP" MODIFY ("GLOBAL_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_GROUPED_COLUMN
--------------------------------------------------------

  ALTER TABLE "REPCAT$_GROUPED_COLUMN" ADD CONSTRAINT "REPCAT$_GROUPED_COLUMN_PK" PRIMARY KEY ("SNAME", "ONAME", "GROUP_NAME", "COLUMN_NAME", "POS") ENABLE;
--------------------------------------------------------
--  Constraints for Table REPCAT$_REPCATLOG
--------------------------------------------------------

  ALTER TABLE "REPCAT$_REPCATLOG" ADD CONSTRAINT "REPCAT$_REPCATLOG_PRIMARY" PRIMARY KEY ("ID", "SOURCE", "ROLE", "MASTER") ENABLE;
  ALTER TABLE "REPCAT$_REPCATLOG" ADD CONSTRAINT "REPCAT$_REPCATLOG_STATUS" CHECK (status IN (0, 1, 2, 3, 4)) ENABLE;
  ALTER TABLE "REPCAT$_REPCATLOG" ADD CONSTRAINT "REPCAT$_REPCATLOG_TYPE" CHECK (type IN (-1, 0, 1, 2, 4, 5, 7, 8, 9, 11, 12, -3,
                                    13, 14, 32, 33)) ENABLE;
  ALTER TABLE "REPCAT$_REPCATLOG" ADD CONSTRAINT "REPCAT$_REPCATLOG_REQUEST" CHECK (request IN (-1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
                                       11, 12, 13, 14, 15, 16, 17,
                                       18, 19, 20, 21, 22, 23, 24, 25)) ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGSTDBY$EDS_TABLES
--------------------------------------------------------

  ALTER TABLE "LOGSTDBY$EDS_TABLES" ADD CONSTRAINT "LOGSTDBY$EDS_TABLES_PKEY" PRIMARY KEY ("OWNER", "TABLE_NAME") ENABLE;
--------------------------------------------------------
--  Constraints for Table REPCAT$_REPSCHEMA
--------------------------------------------------------

  ALTER TABLE "REPCAT$_REPSCHEMA" ADD CONSTRAINT "REPCAT$_REPSCHEMA_PRIMARY" PRIMARY KEY ("SNAME", "DBLINK", "GOWNER") ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_TAB$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_TAB$" ADD CONSTRAINT "LOGMNR_TAB$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#") DISABLE;
  ALTER TABLE "LOGMNR_TAB$" MODIFY ("OBJ#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_OPQTYPE$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_OPQTYPE$" ADD CONSTRAINT "LOGMNR_OPQTYPE$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "INTCOL#") DISABLE;
  ALTER TABLE "LOGMNR_OPQTYPE$" MODIFY ("OBJ#" NOT NULL ENABLE);
  ALTER TABLE "LOGMNR_OPQTYPE$" MODIFY ("INTCOL#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_TEMPLATE_SITES
--------------------------------------------------------

  ALTER TABLE "REPCAT$_TEMPLATE_SITES" ADD CONSTRAINT "REPCAT$_TEMPLATE_SITES_U1" UNIQUE ("REFRESH_TEMPLATE_NAME", "USER_NAME", "SITE_NAME", "REPAPI_SITE_ID") ENABLE;
  ALTER TABLE "REPCAT$_TEMPLATE_SITES" ADD CONSTRAINT "REPCAT$_TEMPLATE_SITES_PK" PRIMARY KEY ("TEMPLATE_SITE_ID") ENABLE;
  ALTER TABLE "REPCAT$_TEMPLATE_SITES" ADD CONSTRAINT "REPCAT$_TEMPLATE_SITES_C2" CHECK ((site_name is not null and repapi_site_id is null) or
   (site_name is null and repapi_site_id is not null)) ENABLE;
  ALTER TABLE "REPCAT$_TEMPLATE_SITES" ADD CONSTRAINT "REPCAT$_TEMPLATE_SITES_C1" CHECK (status in (-100,-1,0,1)) ENABLE;
  ALTER TABLE "REPCAT$_TEMPLATE_SITES" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_TEMPLATE_SITES" MODIFY ("USER_NAME" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_TEMPLATE_SITES" MODIFY ("REFRESH_TEMPLATE_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_DICTSTATE$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_DICTSTATE$" ADD CONSTRAINT "LOGMNR_DICTSTATE$_PK" PRIMARY KEY ("LOGMNR_UID") DISABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_LOG$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_LOG$" ADD CONSTRAINT "LOGMNR_LOG$_PK" PRIMARY KEY ("SESSION#", "THREAD#", "SEQUENCE#", "FIRST_CHANGE#", "DB_ID", "RESETLOGS_CHANGE#", "RESET_TIMESTAMP") ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_KOPM$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_KOPM$" ADD CONSTRAINT "LOGMNR_KOPM$_PK" PRIMARY KEY ("LOGMNR_UID", "NAME") DISABLE;
  ALTER TABLE "LOGMNR_KOPM$" MODIFY ("NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_ELIGIBLE
--------------------------------------------------------

  ALTER TABLE "MVIEW$_ADV_ELIGIBLE" ADD CONSTRAINT "MVIEW$_ADV_ELIGIBLE_PK" PRIMARY KEY ("SUMOBJN#", "RUNID#") ENABLE;
  ALTER TABLE "MVIEW$_ADV_ELIGIBLE" MODIFY ("FREQUENCY" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_ELIGIBLE" MODIFY ("FLAGS" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_ELIGIBLE" MODIFY ("BYTECOST" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_ELIGIBLE" MODIFY ("RUNID#" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_ELIGIBLE" MODIFY ("SUMOBJN#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_AUDIT_ATTRIBUTE
--------------------------------------------------------

  ALTER TABLE "REPCAT$_AUDIT_ATTRIBUTE" ADD CONSTRAINT "REPCAT$_AUDIT_ATTRIBUTE_PK" PRIMARY KEY ("ATTRIBUTE") ENABLE;
  ALTER TABLE "REPCAT$_AUDIT_ATTRIBUTE" ADD CONSTRAINT "REPCAT$_AUDIT_ATTRIBUTE_C1" CHECK ((data_type_id in (2, 4, 5, 6, 7) and
                  data_length is not null)
              or (data_type_id not in (2, 4, 5, 6, 7) and
                  data_length is null)
                 ) ENABLE;
  ALTER TABLE "REPCAT$_AUDIT_ATTRIBUTE" MODIFY ("SOURCE" CONSTRAINT "REPCAT$_AUDIT_ATTRIBUTE_NN2" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_AUDIT_ATTRIBUTE" MODIFY ("DATA_TYPE_ID" CONSTRAINT "REPCAT$_AUDIT_ATTRIBUTE_NN1" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_USER_PARM_VALUES
--------------------------------------------------------

  ALTER TABLE "REPCAT$_USER_PARM_VALUES" ADD CONSTRAINT "REPCAT$_USER_PARM_VALUES_U1" UNIQUE ("TEMPLATE_PARAMETER_ID", "USER_ID") ENABLE;
  ALTER TABLE "REPCAT$_USER_PARM_VALUES" ADD CONSTRAINT "REPCAT$_USER_PARM_VALUES_PK" PRIMARY KEY ("USER_PARAMETER_ID") ENABLE;
  ALTER TABLE "REPCAT$_USER_PARM_VALUES" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_USER_PARM_VALUES" MODIFY ("TEMPLATE_PARAMETER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_REPOBJECT
--------------------------------------------------------

  ALTER TABLE "REPCAT$_REPOBJECT" ADD CONSTRAINT "REPCAT$_REPOBJECT_PRIMARY" PRIMARY KEY ("SNAME", "ONAME", "TYPE") ENABLE;
  ALTER TABLE "REPCAT$_REPOBJECT" ADD CONSTRAINT "REPCAT$_REPOBJECT_GENTRIGGER" CHECK (gentrigger IN (0, 1, 2)) ENABLE;
  ALTER TABLE "REPCAT$_REPOBJECT" ADD CONSTRAINT "REPCAT$_REPOBJECT_GENPACKAGE" CHECK (genpackage IN (0, 1, 2)) ENABLE;
  ALTER TABLE "REPCAT$_REPOBJECT" ADD CONSTRAINT "REPCAT$_REPOBJECT_STATUS" CHECK (status IN (0, 1, 2, 3, 4, 5, 6)) ENABLE;
  ALTER TABLE "REPCAT$_REPOBJECT" ADD CONSTRAINT "REPCAT$_REPOBJECT_VERSION" CHECK (version# >= 0 AND version# < 65536) ENABLE;
  ALTER TABLE "REPCAT$_REPOBJECT" ADD CONSTRAINT "REPCAT$_REPOBJECT_TYPE" CHECK (type IN (-1, 1, 2, 4, 5, 7, 8, 9, 11, 12, -3,
                                      -4, 13, 14, 32, 33)) ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_INDCOMPART$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_INDCOMPART$" ADD CONSTRAINT "LOGMNR_INDCOMPART$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#") DISABLE;
  ALTER TABLE "LOGMNR_INDCOMPART$" MODIFY ("PART#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_TS$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_TS$" ADD CONSTRAINT "LOGMNR_TS$_PK" PRIMARY KEY ("LOGMNR_UID", "TS#") DISABLE;
  ALTER TABLE "LOGMNR_TS$" MODIFY ("BLOCKSIZE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DEPARTEMENT
--------------------------------------------------------

  ALTER TABLE "DEPARTEMENT" ADD CONSTRAINT "DEPARTEMENT_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "DEPARTEMENT" MODIFY ("ID_ETABLISSEMENT" NOT NULL ENABLE);
  ALTER TABLE "DEPARTEMENT" MODIFY ("NOM" NOT NULL ENABLE);
  ALTER TABLE "DEPARTEMENT" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ETABLISSEMENT
--------------------------------------------------------

  ALTER TABLE "ETABLISSEMENT" ADD CONSTRAINT "ETABLISSEMENT_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "ETABLISSEMENT" MODIFY ("LOCALITE" NOT NULL ENABLE);
  ALTER TABLE "ETABLISSEMENT" MODIFY ("NOM" NOT NULL ENABLE);
  ALTER TABLE "ETABLISSEMENT" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_RESOLUTION_STATISTICS
--------------------------------------------------------

  ALTER TABLE "REPCAT$_RESOLUTION_STATISTICS" MODIFY ("PRIMARY_KEY_VALUE" CONSTRAINT "REPCAT$_RESOLUTION_STATS_NN8" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_RESOLUTION_STATISTICS" MODIFY ("RESOLVED_DATE" CONSTRAINT "REPCAT$_RESOLUTION_STATS_NN7" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_RESOLUTION_STATISTICS" MODIFY ("FUNCTION_NAME" CONSTRAINT "REPCAT$_RESOLUTION_STATS_NN6" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_RESOLUTION_STATISTICS" MODIFY ("METHOD_NAME" CONSTRAINT "REPCAT$_RESOLUTION_STATS_NN5" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_RESOLUTION_STATISTICS" MODIFY ("REFERENCE_NAME" CONSTRAINT "REPCAT$_RESOLUTION_STATS_NN4" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_RESOLUTION_STATISTICS" MODIFY ("CONFLICT_TYPE_ID" CONSTRAINT "REPCAT$_RESOLUTION_STATS_NN3" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_RESOLUTION_STATISTICS" MODIFY ("ONAME" CONSTRAINT "REPCAT$_RESOLUTION_STATS_NN2" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_RESOLUTION_STATISTICS" MODIFY ("SNAME" CONSTRAINT "REPCAT$_RESOLUTION_STATS_NN1" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_JOURNAL
--------------------------------------------------------

  ALTER TABLE "MVIEW$_ADV_JOURNAL" ADD CONSTRAINT "MVIEW$_ADV_JOURNAL_PK" PRIMARY KEY ("RUNID#", "SEQ#") ENABLE;
  ALTER TABLE "MVIEW$_ADV_JOURNAL" MODIFY ("FLAGS" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_JOURNAL" MODIFY ("TIMESTAMP" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_JOURNAL" MODIFY ("SEQ#" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_JOURNAL" MODIFY ("RUNID#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_SEED$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_SEED$" ADD CONSTRAINT "LOGMNR_SEED$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "INTCOL#") DISABLE;
  ALTER TABLE "LOGMNR_SEED$" MODIFY ("NULL$" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_TYPE$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_TYPE$" ADD CONSTRAINT "LOGMNR_TYPE$_PK" PRIMARY KEY ("LOGMNR_UID", "TOID", "VERSION#") DISABLE;
  ALTER TABLE "LOGMNR_TYPE$" MODIFY ("TOID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_COLUMN_GROUP
--------------------------------------------------------

  ALTER TABLE "REPCAT$_COLUMN_GROUP" ADD CONSTRAINT "REPCAT$_COLUMN_GROUP_PK" PRIMARY KEY ("SNAME", "ONAME", "GROUP_NAME") ENABLE;
  ALTER TABLE "REPCAT$_COLUMN_GROUP" MODIFY ("GROUP_NAME" CONSTRAINT "REPCAT$_COLUMN_GROUP_NN3" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_COLUMN_GROUP" MODIFY ("ONAME" CONSTRAINT "REPCAT$_COLUMN_GROUP_NN2" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_COLUMN_GROUP" MODIFY ("SNAME" CONSTRAINT "REPCAT$_COLUMN_GROUP_NN1" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_OUTPUT
--------------------------------------------------------

  ALTER TABLE "MVIEW$_ADV_OUTPUT" ADD CONSTRAINT "MVIEW$_ADV_OUTPUT_PK" PRIMARY KEY ("RUNID#", "RANK#") ENABLE;
  ALTER TABLE "MVIEW$_ADV_OUTPUT" MODIFY ("BENEFIT_TO_COST_RATIO" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_OUTPUT" MODIFY ("OUTPUT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_OUTPUT" MODIFY ("RUNID#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_AJG
--------------------------------------------------------

  ALTER TABLE "MVIEW$_ADV_AJG" ADD CONSTRAINT "MVIEW$_ADV_AJG_PK" PRIMARY KEY ("AJGID#") ENABLE;
  ALTER TABLE "MVIEW$_ADV_AJG" MODIFY ("HASHVALUE" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_AJG" MODIFY ("AJGDES" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_AJG" MODIFY ("AJGDESLEN" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_AJG" MODIFY ("RUNID#" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_AJG" MODIFY ("AJGID#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_TABCOMPART$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_TABCOMPART$" ADD CONSTRAINT "LOGMNR_TABCOMPART$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#") DISABLE;
  ALTER TABLE "LOGMNR_TABCOMPART$" MODIFY ("PART#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table VENDEURS
--------------------------------------------------------

  ALTER TABLE "VENDEURS" ADD PRIMARY KEY ("NUMVENDEUR") ENABLE;
  ALTER TABLE "VENDEURS" MODIFY ("NUMVENDEUR" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_TEMPLATE_STATUS
--------------------------------------------------------

  ALTER TABLE "REPCAT$_TEMPLATE_STATUS" ADD CONSTRAINT "REPCAT$_TEMPLATE_STATUS_PK" PRIMARY KEY ("TEMPLATE_STATUS_ID") ENABLE;
  ALTER TABLE "REPCAT$_TEMPLATE_STATUS" MODIFY ("STATUS_TYPE_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DEF$_LOB
--------------------------------------------------------

  ALTER TABLE "DEF$_LOB" ADD CONSTRAINT "DEF$_LOB_PRIMARY" PRIMARY KEY ("ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_LOGMNR_BUILDLOG
--------------------------------------------------------

  ALTER TABLE "LOGMNR_LOGMNR_BUILDLOG" ADD CONSTRAINT "LOGMNR_LOGMNR_BUILDLOG_PK" PRIMARY KEY ("LOGMNR_UID", "INITIAL_XID") DISABLE;
  ALTER TABLE "LOGMNR_LOGMNR_BUILDLOG" MODIFY ("INITIAL_XID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_TEMPLATE_REFGROUPS
--------------------------------------------------------

  ALTER TABLE "REPCAT$_TEMPLATE_REFGROUPS" ADD CONSTRAINT "REPCAT$_TEMPLATE_REFGROUPS_PK" PRIMARY KEY ("REFRESH_GROUP_ID") ENABLE;
  ALTER TABLE "REPCAT$_TEMPLATE_REFGROUPS" MODIFY ("REFRESH_TEMPLATE_ID" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_TEMPLATE_REFGROUPS" MODIFY ("REFRESH_GROUP_NAME" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_TEMPLATE_REFGROUPS" MODIFY ("REFRESH_GROUP_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_UID$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_UID$" ADD CONSTRAINT "LOGMNR_UID$_PK" PRIMARY KEY ("SESSION#") ENABLE;
--------------------------------------------------------
--  Constraints for Table REPCAT$_TEMPLATE_TARGETS
--------------------------------------------------------

  ALTER TABLE "REPCAT$_TEMPLATE_TARGETS" ADD CONSTRAINT "TEMPLATE$_TARGETS_PK" PRIMARY KEY ("TEMPLATE_TARGET_ID") ENABLE;
  ALTER TABLE "REPCAT$_TEMPLATE_TARGETS" MODIFY ("TARGET_DATABASE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_KEY_COLUMNS
--------------------------------------------------------

  ALTER TABLE "REPCAT$_KEY_COLUMNS" ADD CONSTRAINT "REPCAT$_KEY_COLUMNS_PRIMARY" PRIMARY KEY ("SNAME", "ONAME", "COL") ENABLE;
--------------------------------------------------------
--  Constraints for Table REPCAT$_CONFLICT
--------------------------------------------------------

  ALTER TABLE "REPCAT$_CONFLICT" ADD CONSTRAINT "REPCAT$_CONFLICT_PK" PRIMARY KEY ("SNAME", "ONAME", "CONFLICT_TYPE_ID", "REFERENCE_NAME") ENABLE;
  ALTER TABLE "REPCAT$_CONFLICT" ADD CONSTRAINT "REPCAT$_CONFLICT_C1" CHECK (conflict_type_id in (1, 2, 3)) ENABLE;
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_WORKLOAD
--------------------------------------------------------

  ALTER TABLE "MVIEW$_ADV_WORKLOAD" ADD CONSTRAINT "MVIEW$_ADV_WORKLOAD_PK" PRIMARY KEY ("QUERYID#") ENABLE;
  ALTER TABLE "MVIEW$_ADV_WORKLOAD" MODIFY ("SQL_TEXTLEN" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_WORKLOAD" MODIFY ("SQL_TEXT" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_WORKLOAD" MODIFY ("UNAME" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_WORKLOAD" MODIFY ("COLLECTTIME" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_WORKLOAD" MODIFY ("COLLECTIONID#" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_WORKLOAD" MODIFY ("QUERYID#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_NTAB$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_NTAB$" ADD CONSTRAINT "LOGMNR_NTAB$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "INTCOL#") DISABLE;
  ALTER TABLE "LOGMNR_NTAB$" MODIFY ("OBJ#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_AUDIT_COLUMN
--------------------------------------------------------

  ALTER TABLE "REPCAT$_AUDIT_COLUMN" ADD CONSTRAINT "REPCAT$_AUDIT_COLUMN_PK" PRIMARY KEY ("COLUMN_NAME", "ONAME", "SNAME") ENABLE;
  ALTER TABLE "REPCAT$_AUDIT_COLUMN" MODIFY ("ATTRIBUTE" CONSTRAINT "REPCAT$_AUDIT_COLUMN_NN5" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_AUDIT_COLUMN" MODIFY ("BASE_REFERENCE_NAME" CONSTRAINT "REPCAT$_AUDIT_COLUMN_NN4" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_AUDIT_COLUMN" MODIFY ("BASE_CONFLICT_TYPE_ID" CONSTRAINT "REPCAT$_AUDIT_COLUMN_NN3" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_AUDIT_COLUMN" MODIFY ("BASE_ONAME" CONSTRAINT "REPCAT$_AUDIT_COLUMN_NN2" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_AUDIT_COLUMN" MODIFY ("BASE_SNAME" CONSTRAINT "REPCAT$_AUDIT_COLUMN_NN1" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNRC_GTCS
--------------------------------------------------------

  ALTER TABLE "LOGMNRC_GTCS" ADD CONSTRAINT "LOGMNRC_GTCS_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "OBJV#", "INTCOL#") ENABLE;
  ALTER TABLE "LOGMNRC_GTCS" MODIFY ("TYPE#" NOT NULL ENABLE);
  ALTER TABLE "LOGMNRC_GTCS" MODIFY ("COLNAME" NOT NULL ENABLE);
  ALTER TABLE "LOGMNRC_GTCS" MODIFY ("INTCOL#" NOT NULL ENABLE);
  ALTER TABLE "LOGMNRC_GTCS" MODIFY ("SEGCOL#" NOT NULL ENABLE);
  ALTER TABLE "LOGMNRC_GTCS" MODIFY ("OBJV#" NOT NULL ENABLE);
  ALTER TABLE "LOGMNRC_GTCS" MODIFY ("OBJ#" NOT NULL ENABLE);
  ALTER TABLE "LOGMNRC_GTCS" MODIFY ("LOGMNR_UID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGSTDBY$FLASHBACK_SCN
--------------------------------------------------------

  ALTER TABLE "LOGSTDBY$FLASHBACK_SCN" ADD PRIMARY KEY ("PRIMARY_SCN") ENABLE;
  ALTER TABLE "LOGSTDBY$FLASHBACK_SCN" MODIFY ("PRIMARY_SCN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_LEVEL
--------------------------------------------------------

  ALTER TABLE "MVIEW$_ADV_LEVEL" ADD CONSTRAINT "MVIEW$_ADV_LEVEL_PK" PRIMARY KEY ("RUNID#", "LEVELID#") ENABLE;
  ALTER TABLE "MVIEW$_ADV_LEVEL" MODIFY ("COLUMNLIST" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_LEVEL" MODIFY ("TBLOBJ#" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_LEVEL" MODIFY ("FLAGS" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_LEVEL" MODIFY ("LEVELID#" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_LEVEL" MODIFY ("RUNID#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_GENERATED
--------------------------------------------------------

  ALTER TABLE "REPCAT$_GENERATED" ADD CONSTRAINT "REPCAT$_REPGEN_PRIMARY" PRIMARY KEY ("SNAME", "ONAME", "TYPE", "BASE_SNAME", "BASE_ONAME", "BASE_TYPE") ENABLE;
  ALTER TABLE "REPCAT$_GENERATED" ADD CONSTRAINT "REPCAT$_GENERATED_OBJ" CHECK (reason IN (0, 1, 2, 3, 4, 5, 6, 7, 9, 10)) ENABLE;
--------------------------------------------------------
--  Constraints for Table REPCAT$_REPCAT
--------------------------------------------------------

  ALTER TABLE "REPCAT$_REPCAT" ADD CONSTRAINT "REPCAT$_REPCAT_PRIMARY" PRIMARY KEY ("SNAME", "GOWNER") ENABLE;
  ALTER TABLE "REPCAT$_REPCAT" ADD CONSTRAINT "REPCAT$_REPCAT_STATUS" CHECK (status IN (0, 1, 2)) ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_INDPART$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_INDPART$" ADD CONSTRAINT "LOGMNR_INDPART$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "BO#") DISABLE;
  ALTER TABLE "LOGMNR_INDPART$" MODIFY ("TS#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNRC_GTLO
--------------------------------------------------------

  ALTER TABLE "LOGMNRC_GTLO" ADD CONSTRAINT "LOGMNRC_GTLO_PK" PRIMARY KEY ("LOGMNR_UID", "KEYOBJ#", "BASEOBJV#") ENABLE;
  ALTER TABLE "LOGMNRC_GTLO" MODIFY ("START_SCN" NOT NULL ENABLE);
  ALTER TABLE "LOGMNRC_GTLO" MODIFY ("INTCOLS" NOT NULL ENABLE);
  ALTER TABLE "LOGMNRC_GTLO" MODIFY ("LVL0NAME" NOT NULL ENABLE);
  ALTER TABLE "LOGMNRC_GTLO" MODIFY ("OWNERNAME" NOT NULL ENABLE);
  ALTER TABLE "LOGMNRC_GTLO" MODIFY ("LVL0TYPE#" NOT NULL ENABLE);
  ALTER TABLE "LOGMNRC_GTLO" MODIFY ("BASEOBJV#" NOT NULL ENABLE);
  ALTER TABLE "LOGMNRC_GTLO" MODIFY ("BASEOBJ#" NOT NULL ENABLE);
  ALTER TABLE "LOGMNRC_GTLO" MODIFY ("LVLCNT" NOT NULL ENABLE);
  ALTER TABLE "LOGMNRC_GTLO" MODIFY ("KEYOBJ#" NOT NULL ENABLE);
  ALTER TABLE "LOGMNRC_GTLO" MODIFY ("LOGMNR_UID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_SITES_NEW
--------------------------------------------------------

  ALTER TABLE "REPCAT$_SITES_NEW" ADD CONSTRAINT "REPCAT$_SITES_NEW_PK" PRIMARY KEY ("EXTENSION_ID", "GOWNER", "GNAME", "DBLINK") ENABLE;
  ALTER TABLE "REPCAT$_SITES_NEW" ADD CONSTRAINT "REPCAT$_SITES_NEW_FULL_INST" CHECK (full_instantiation IN ('Y', 'N')) ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_SPILL$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_SPILL$" ADD CONSTRAINT "LOGMNR_SPILL$_PK" PRIMARY KEY ("SESSION#", "XIDUSN", "XIDSLT", "XIDSQN", "CHUNK", "STARTIDX", "ENDIDX", "FLAG", "SEQUENCE#") ENABLE;
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_LOG
--------------------------------------------------------

  ALTER TABLE "MVIEW$_ADV_LOG" ADD CONSTRAINT "MVIEW$_ADV_LOG_PK" PRIMARY KEY ("RUNID#") ENABLE;
  ALTER TABLE "MVIEW$_ADV_LOG" MODIFY ("STATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DEF$_DEFAULTDEST
--------------------------------------------------------

  ALTER TABLE "DEF$_DEFAULTDEST" ADD CONSTRAINT "DEF$_DEFAULTDEST_PRIMARY" PRIMARY KEY ("DBLINK") ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_ICOL$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_ICOL$" ADD CONSTRAINT "LOGMNR_ICOL$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "INTCOL#") DISABLE;
  ALTER TABLE "LOGMNR_ICOL$" MODIFY ("INTCOL#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_REPPROP
--------------------------------------------------------

  ALTER TABLE "REPCAT$_REPPROP" ADD CONSTRAINT "REPCAT$_REPPROP_PRIMARY" PRIMARY KEY ("SNAME", "ONAME", "TYPE", "DBLINK") ENABLE;
  ALTER TABLE "REPCAT$_REPPROP" ADD CONSTRAINT "REPCAT$_REPPROP_HOW" CHECK (how IN (0, 1, 2, 3)) ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNRP_CTAS_PART_MAP
--------------------------------------------------------

  ALTER TABLE "LOGMNRP_CTAS_PART_MAP" ADD CONSTRAINT "LOGMNRP_CTAS_PART_MAP_PK" PRIMARY KEY ("LOGMNR_UID", "BASEOBJV#", "KEYOBJ#") ENABLE;
  ALTER TABLE "LOGMNRP_CTAS_PART_MAP" MODIFY ("PART#" NOT NULL ENABLE);
  ALTER TABLE "LOGMNRP_CTAS_PART_MAP" MODIFY ("KEYOBJ#" NOT NULL ENABLE);
  ALTER TABLE "LOGMNRP_CTAS_PART_MAP" MODIFY ("BASEOBJV#" NOT NULL ENABLE);
  ALTER TABLE "LOGMNRP_CTAS_PART_MAP" MODIFY ("BASEOBJ#" NOT NULL ENABLE);
  ALTER TABLE "LOGMNRP_CTAS_PART_MAP" MODIFY ("LOGMNR_UID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_REFCON$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_REFCON$" ADD CONSTRAINT "LOGMNR_REFCON$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "INTCOL#") DISABLE;
  ALTER TABLE "LOGMNR_REFCON$" MODIFY ("OBJ#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_BASETABLE
--------------------------------------------------------

  ALTER TABLE "MVIEW$_ADV_BASETABLE" MODIFY ("QUERYID#" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_BASETABLE" MODIFY ("COLLECTIONID#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DEF$_PROPAGATOR
--------------------------------------------------------

  ALTER TABLE "DEF$_PROPAGATOR" ADD CONSTRAINT "DEF$_PROPAGATOR_PRIMARY" PRIMARY KEY ("USERID") ENABLE;
  ALTER TABLE "DEF$_PROPAGATOR" MODIFY ("CREATED" NOT NULL ENABLE);
  ALTER TABLE "DEF$_PROPAGATOR" MODIFY ("USERNAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_TEMPLATE_OBJECTS
--------------------------------------------------------

  ALTER TABLE "REPCAT$_TEMPLATE_OBJECTS" ADD CONSTRAINT "REPCAT$_TEMPLATE_OBJECTS_U1" UNIQUE ("OBJECT_NAME", "OBJECT_TYPE", "REFRESH_TEMPLATE_ID", "SCHEMA_NAME", "DDL_NUM") ENABLE;
  ALTER TABLE "REPCAT$_TEMPLATE_OBJECTS" ADD CONSTRAINT "REPCAT$_TEMPLATE_OBJECTS_PK" PRIMARY KEY ("TEMPLATE_OBJECT_ID") ENABLE;
  ALTER TABLE "REPCAT$_TEMPLATE_OBJECTS" ADD CONSTRAINT "REPCAT$_TEMPLATE_OBJECTS_VER" CHECK (object_version# >= 0 AND object_version# < 65536) ENABLE;
  ALTER TABLE "REPCAT$_TEMPLATE_OBJECTS" MODIFY ("TEMPLATE_REFGROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_TEMPLATE_OBJECTS" MODIFY ("DDL_NUM" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_TEMPLATE_OBJECTS" MODIFY ("OBJECT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_TEMPLATE_OBJECTS" MODIFY ("OBJECT_NAME" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_TEMPLATE_OBJECTS" MODIFY ("REFRESH_TEMPLATE_ID" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_TEMPLATE_OBJECTS" MODIFY ("TEMPLATE_OBJECT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_ROLLUP
--------------------------------------------------------

  ALTER TABLE "MVIEW$_ADV_ROLLUP" ADD CONSTRAINT "MVIEW$_ADV_ROLLUP_PK" PRIMARY KEY ("RUNID#", "CLEVELID#", "PLEVELID#") ENABLE;
  ALTER TABLE "MVIEW$_ADV_ROLLUP" MODIFY ("FLAGS" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_ROLLUP" MODIFY ("PLEVELID#" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_ROLLUP" MODIFY ("CLEVELID#" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_ROLLUP" MODIFY ("RUNID#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_SESSION$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_SESSION$" ADD CONSTRAINT "LOGMNR_SESSION_UK1" UNIQUE ("SESSION_NAME") ENABLE;
  ALTER TABLE "LOGMNR_SESSION$" ADD CONSTRAINT "LOGMNR_SESSION_PK" PRIMARY KEY ("SESSION#") ENABLE;
  ALTER TABLE "LOGMNR_SESSION$" MODIFY ("SESSION_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNRT_MDDL$
--------------------------------------------------------

  ALTER TABLE "LOGMNRT_MDDL$" ADD CONSTRAINT "LOGMNRT_MDDL$_PK" PRIMARY KEY ("SOURCE_OBJ#", "SOURCE_ROWID") ENABLE;
  ALTER TABLE "LOGMNRT_MDDL$" MODIFY ("DEST_ROWID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNRC_GSII
--------------------------------------------------------

  ALTER TABLE "LOGMNRC_GSII" ADD CONSTRAINT "LOGMNRC_GSII_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#") ENABLE;
  ALTER TABLE "LOGMNRC_GSII" MODIFY ("INDTYPE#" NOT NULL ENABLE);
  ALTER TABLE "LOGMNRC_GSII" MODIFY ("BO#" NOT NULL ENABLE);
  ALTER TABLE "LOGMNRC_GSII" MODIFY ("OBJ#" NOT NULL ENABLE);
  ALTER TABLE "LOGMNRC_GSII" MODIFY ("LOGMNR_UID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_EXCEPTIONS
--------------------------------------------------------

  ALTER TABLE "REPCAT$_EXCEPTIONS" ADD CONSTRAINT "REPCAT$_EXCEPTIONS_PK" PRIMARY KEY ("EXCEPTION_ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_COLTYPE$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_COLTYPE$" ADD CONSTRAINT "LOGMNR_COLTYPE$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "INTCOL#") DISABLE;
  ALTER TABLE "LOGMNR_COLTYPE$" MODIFY ("OBJ#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRESENTATION
--------------------------------------------------------

  ALTER TABLE "PRESENTATION" ADD CONSTRAINT "PRESENTATION_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "PRESENTATION" MODIFY ("ID_DOMAINE" NOT NULL ENABLE);
  ALTER TABLE "PRESENTATION" MODIFY ("ID_PERSONNE" NOT NULL ENABLE);
  ALTER TABLE "PRESENTATION" MODIFY ("ID_SEMINAIRE" NOT NULL ENABLE);
  ALTER TABLE "PRESENTATION" MODIFY ("HEUREPRESENTATION" NOT NULL ENABLE);
  ALTER TABLE "PRESENTATION" MODIFY ("DATEPRESENTATION" NOT NULL ENABLE);
  ALTER TABLE "PRESENTATION" MODIFY ("SUJET" NOT NULL ENABLE);
  ALTER TABLE "PRESENTATION" MODIFY ("TITRE" NOT NULL ENABLE);
  ALTER TABLE "PRESENTATION" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DEF$_ERROR
--------------------------------------------------------

  ALTER TABLE "DEF$_ERROR" ADD CONSTRAINT "DEF$_ERROR_PRIMARY" PRIMARY KEY ("ENQ_TID") ENABLE;
--------------------------------------------------------
--  Constraints for Table DEF$_PUSHED_TRANSACTIONS
--------------------------------------------------------

  ALTER TABLE "DEF$_PUSHED_TRANSACTIONS" ADD CONSTRAINT "DEF$_PUSHED_TRAN_PRIMARY" PRIMARY KEY ("SOURCE_SITE_ID") ENABLE;
  ALTER TABLE "DEF$_PUSHED_TRANSACTIONS" ADD CHECK (disabled IN ('T', 'F')) ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_SESSION_ACTIONS$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_SESSION_ACTIONS$" ADD CONSTRAINT "LOGMNR_SESSION_ACTION$_PK" PRIMARY KEY ("LOGMNRSESSION#", "ACTIONNAME") ENABLE;
  ALTER TABLE "LOGMNR_SESSION_ACTIONS$" MODIFY ("ACTIONTYPE#" NOT NULL ENABLE);
  ALTER TABLE "LOGMNR_SESSION_ACTIONS$" MODIFY ("PROCESSROLE#" NOT NULL ENABLE);
  ALTER TABLE "LOGMNR_SESSION_ACTIONS$" MODIFY ("LOGMNRSESSION#" NOT NULL ENABLE);
  ALTER TABLE "LOGMNR_SESSION_ACTIONS$" MODIFY ("ACTIONNAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_OBJ$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_OBJ$" ADD CONSTRAINT "LOGMNR_OBJ$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#") DISABLE;
  ALTER TABLE "LOGMNR_OBJ$" MODIFY ("OBJ#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_PROCESSED_LOG$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_PROCESSED_LOG$" ADD CONSTRAINT "LOGMNR_PROCESSED_LOG$_PK" PRIMARY KEY ("SESSION#", "THREAD#") ENABLE;
--------------------------------------------------------
--  Constraints for Table REPCAT$_REPCOLUMN
--------------------------------------------------------

  ALTER TABLE "REPCAT$_REPCOLUMN" ADD CONSTRAINT "REPCAT$_REPCOLUMN_PK" PRIMARY KEY ("SNAME", "ONAME", "TYPE", "CNAME") ENABLE;
  ALTER TABLE "REPCAT$_REPCOLUMN" ADD CONSTRAINT "REPCAT$_REPCOLUMN_VERSION" CHECK (version# >= 0 AND version# < 65536) ENABLE;
--------------------------------------------------------
--  Constraints for Table PERSONNE
--------------------------------------------------------

  ALTER TABLE "PERSONNE" ADD CONSTRAINT "PERSONNE_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "PERSONNE" MODIFY ("TYPE" NOT NULL ENABLE);
  ALTER TABLE "PERSONNE" MODIFY ("SPECIALITE" NOT NULL ENABLE);
  ALTER TABLE "PERSONNE" MODIFY ("TEL" NOT NULL ENABLE);
  ALTER TABLE "PERSONNE" MODIFY ("PRENOM" NOT NULL ENABLE);
  ALTER TABLE "PERSONNE" MODIFY ("NOM" NOT NULL ENABLE);
  ALTER TABLE "PERSONNE" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_DICTIONARY$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_DICTIONARY$" ADD CONSTRAINT "LOGMNR_DICTIONARY$_PK" PRIMARY KEY ("LOGMNR_UID") DISABLE;
  ALTER TABLE "LOGMNR_DICTIONARY$" MODIFY ("DB_DICT_OBJECTCOUNT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_PARAMETERS
--------------------------------------------------------

  ALTER TABLE "MVIEW$_ADV_PARAMETERS" ADD CONSTRAINT "MVIEW$_ADV_PARAMETERS_PK" PRIMARY KEY ("PARAMETER_NAME") ENABLE;
  ALTER TABLE "MVIEW$_ADV_PARAMETERS" MODIFY ("PARAMETER_TYPE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_PARAMETER_COLUMN
--------------------------------------------------------

  ALTER TABLE "REPCAT$_PARAMETER_COLUMN" ADD CONSTRAINT "REPCAT$_PARAMETER_COLUMN_PK" PRIMARY KEY ("SNAME", "ONAME", "CONFLICT_TYPE_ID", "REFERENCE_NAME", "SEQUENCE_NO", "PARAMETER_TABLE_NAME", "PARAMETER_SEQUENCE_NO", "COLUMN_POS") ENABLE;
--------------------------------------------------------
--  Constraints for Table REPCAT$_INSTANTIATION_DDL
--------------------------------------------------------

  ALTER TABLE "REPCAT$_INSTANTIATION_DDL" ADD CONSTRAINT "REPCAT$_INSTANTIATION_DDL_PK" PRIMARY KEY ("REFRESH_TEMPLATE_ID", "PHASE", "DDL_NUM") ENABLE;
--------------------------------------------------------
--  Constraints for Table PRODUITS
--------------------------------------------------------

  ALTER TABLE "PRODUITS" ADD PRIMARY KEY ("REFPROD") ENABLE;
  ALTER TABLE "PRODUITS" MODIFY ("REFPROD" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CLIENTS
--------------------------------------------------------

  ALTER TABLE "CLIENTS" ADD PRIMARY KEY ("NUMCLIENT") ENABLE;
  ALTER TABLE "CLIENTS" MODIFY ("NUMCLIENT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_CCOL$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_CCOL$" ADD CONSTRAINT "LOGMNR_CCOL$_PK" PRIMARY KEY ("LOGMNR_UID", "CON#", "INTCOL#") DISABLE;
  ALTER TABLE "LOGMNR_CCOL$" MODIFY ("INTCOL#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_EXTENSION
--------------------------------------------------------

  ALTER TABLE "REPCAT$_EXTENSION" ADD PRIMARY KEY ("EXTENSION_ID") ENABLE;
  ALTER TABLE "REPCAT$_EXTENSION" ADD CONSTRAINT "REPCAT$_EXTENSION_PUSH_TO_NEW" CHECK (push_to_new IN ('Y', 'N')) ENABLE;
  ALTER TABLE "REPCAT$_EXTENSION" ADD CONSTRAINT "REPCAT$_EXTENSION_PUSH_TO_MDEF" CHECK (push_to_mdef IN ('Y', 'N')) ENABLE;
  ALTER TABLE "REPCAT$_EXTENSION" ADD CONSTRAINT "REPCAT$_EXTENSION_STATUS" CHECK (extension_status IN (0, 1, 2, 3, 4)) ENABLE;
  ALTER TABLE "REPCAT$_EXTENSION" ADD CONSTRAINT "REPCAT$_EXTENSION_EXPORTREQ" CHECK (export_required IN ('Y', 'N')) ENABLE;
  ALTER TABLE "REPCAT$_EXTENSION" ADD CONSTRAINT "REPCAT$_EXTENSION_CODE" CHECK (extension_code IN (0)) ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_SESSION_EVOLVE$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_SESSION_EVOLVE$" ADD CONSTRAINT "LOGMNR_SESSION_EVOLVE$_PK" PRIMARY KEY ("SESSION#", "DB_ID", "RESET_SCN", "RESET_TIMESTAMP") ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_LOB$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_LOB$" ADD CONSTRAINT "LOGMNR_LOB$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "INTCOL#") DISABLE;
  ALTER TABLE "LOGMNR_LOB$" MODIFY ("CHUNK" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DEF$_DESTINATION
--------------------------------------------------------

  ALTER TABLE "DEF$_DESTINATION" ADD CONSTRAINT "DEF$_DESTINATION_PRIMARY" PRIMARY KEY ("DBLINK", "CATCHUP") ENABLE;
  ALTER TABLE "DEF$_DESTINATION" MODIFY ("LAST_DELIVERED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_RESTART_CKPT_TXINFO$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_RESTART_CKPT_TXINFO$" ADD CONSTRAINT "LOGMNR_RESTART_CKPT_TXINFO$_PK" PRIMARY KEY ("SESSION#", "XIDUSN", "XIDSLT", "XIDSQN", "SESSION_NUM", "SERIAL_NUM", "EFFECTIVE_SCN") ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNRC_GSBA
--------------------------------------------------------

  ALTER TABLE "LOGMNRC_GSBA" ADD CONSTRAINT "LOGMNRC_GSBA_PK" PRIMARY KEY ("LOGMNR_UID", "AS_OF_SCN") ENABLE;
  ALTER TABLE "LOGMNRC_GSBA" MODIFY ("AS_OF_SCN" NOT NULL ENABLE);
  ALTER TABLE "LOGMNRC_GSBA" MODIFY ("LOGMNR_UID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_SUBCOLTYPE$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_SUBCOLTYPE$" ADD CONSTRAINT "LOGMNR_SUBCOLTYPE$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "INTCOL#", "TOID") DISABLE;
  ALTER TABLE "LOGMNR_SUBCOLTYPE$" MODIFY ("OBJ#" NOT NULL ENABLE);
  ALTER TABLE "LOGMNR_SUBCOLTYPE$" MODIFY ("VERSION#" NOT NULL ENABLE);
  ALTER TABLE "LOGMNR_SUBCOLTYPE$" MODIFY ("TOID" NOT NULL ENABLE);
  ALTER TABLE "LOGMNR_SUBCOLTYPE$" MODIFY ("INTCOL#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_PARTOBJ$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_PARTOBJ$" ADD CONSTRAINT "LOGMNR_PARTOBJ$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#") DISABLE;
  ALTER TABLE "LOGMNR_PARTOBJ$" MODIFY ("OBJ#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_COL$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_COL$" ADD CONSTRAINT "LOGMNR_COL$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "INTCOL#") DISABLE;
  ALTER TABLE "LOGMNR_COL$" MODIFY ("OBJ#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_RESOLUTION_METHOD
--------------------------------------------------------

  ALTER TABLE "REPCAT$_RESOLUTION_METHOD" ADD CONSTRAINT "REPCAT$_RESOL_METHOD_PK" PRIMARY KEY ("CONFLICT_TYPE_ID", "METHOD_NAME") ENABLE;
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_FILTERINSTANCE
--------------------------------------------------------

  ALTER TABLE "MVIEW$_ADV_FILTERINSTANCE" MODIFY ("RUNID#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_REFRESH_TEMPLATES
--------------------------------------------------------

  ALTER TABLE "REPCAT$_REFRESH_TEMPLATES" ADD CONSTRAINT "REPCAT$_REFRESH_TEMPLATES_U1" UNIQUE ("REFRESH_TEMPLATE_NAME") ENABLE;
  ALTER TABLE "REPCAT$_REFRESH_TEMPLATES" ADD CONSTRAINT "REPCAT$_REFRESH_TEMPLATES_PK" PRIMARY KEY ("REFRESH_TEMPLATE_ID") ENABLE;
  ALTER TABLE "REPCAT$_REFRESH_TEMPLATES" ADD CONSTRAINT "REFRESH_TEMPLATES_C1" CHECK ((public_template in ('Y','N'))
   or public_template is NULL) ENABLE;
  ALTER TABLE "REPCAT$_REFRESH_TEMPLATES" MODIFY ("TEMPLATE_STATUS_ID" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_REFRESH_TEMPLATES" MODIFY ("TEMPLATE_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_REFRESH_TEMPLATES" MODIFY ("REFRESH_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_REFRESH_TEMPLATES" MODIFY ("REFRESH_TEMPLATE_NAME" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_REFRESH_TEMPLATES" MODIFY ("REFRESH_GROUP_NAME" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_REFRESH_TEMPLATES" MODIFY ("OWNER" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_REFRESH_TEMPLATES" MODIFY ("REFRESH_TEMPLATE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGSTDBY$SKIP_SUPPORT
--------------------------------------------------------

  ALTER TABLE "LOGSTDBY$SKIP_SUPPORT" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "LOGSTDBY$SKIP_SUPPORT" MODIFY ("ACTION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_CDEF$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_CDEF$" ADD CONSTRAINT "LOGMNR_CDEF$_PK" PRIMARY KEY ("LOGMNR_UID", "CON#") DISABLE;
  ALTER TABLE "LOGMNR_CDEF$" MODIFY ("OBJ#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_FJG
--------------------------------------------------------

  ALTER TABLE "MVIEW$_ADV_FJG" ADD CONSTRAINT "MVIEW$_ADV_FJG_PK" PRIMARY KEY ("FJGID#") ENABLE;
  ALTER TABLE "MVIEW$_ADV_FJG" MODIFY ("HASHVALUE" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_FJG" MODIFY ("FJGDES" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_FJG" MODIFY ("FJGDESLEN" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_FJG" MODIFY ("AJGID#" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_FJG" MODIFY ("FJGID#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_INDSUBPART$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_INDSUBPART$" ADD CONSTRAINT "LOGMNR_INDSUBPART$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "POBJ#") DISABLE;
  ALTER TABLE "LOGMNR_INDSUBPART$" MODIFY ("TS#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_TABSUBPART$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_TABSUBPART$" ADD CONSTRAINT "LOGMNR_TABSUBPART$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "POBJ#") DISABLE;
  ALTER TABLE "LOGMNR_TABSUBPART$" MODIFY ("TS#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_INTEGRATED_SPILL$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_INTEGRATED_SPILL$" ADD CONSTRAINT "LOGMNR_INTEG_SPILL$_PK" PRIMARY KEY ("SESSION#", "XIDUSN", "XIDSLT", "XIDSQN", "CHUNK", "FLAG") ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_USER$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_USER$" ADD CONSTRAINT "LOGMNR_USER$_PK" PRIMARY KEY ("LOGMNR_UID", "USER#") DISABLE;
  ALTER TABLE "LOGMNR_USER$" MODIFY ("NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_ATTRCOL$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_ATTRCOL$" ADD CONSTRAINT "LOGMNR_ATTRCOL$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "INTCOL#") DISABLE;
  ALTER TABLE "LOGMNR_ATTRCOL$" MODIFY ("OBJ#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_FLAVOR_OBJECTS
--------------------------------------------------------

  ALTER TABLE "REPCAT$_FLAVOR_OBJECTS" ADD CONSTRAINT "REPCAT$_FLAVOR_OBJECTS_PK" PRIMARY KEY ("SNAME", "ONAME", "TYPE", "GNAME", "FLAVOR_ID", "GOWNER") ENABLE;
  ALTER TABLE "REPCAT$_FLAVOR_OBJECTS" ADD CONSTRAINT "REPCAT$_FLAVOR_OBJECTS_VERSION" CHECK (version# >= 0 AND version# < 65536) ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_PROPS$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_PROPS$" ADD CONSTRAINT "LOGMNR_PROPS$_PK" PRIMARY KEY ("LOGMNR_UID", "NAME") DISABLE;
  ALTER TABLE "LOGMNR_PROPS$" MODIFY ("NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_LOBFRAG$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_LOBFRAG$" ADD CONSTRAINT "LOGMNR_LOBFRAG$_PK" PRIMARY KEY ("LOGMNR_UID", "FRAGOBJ#") DISABLE;
  ALTER TABLE "LOGMNR_LOBFRAG$" MODIFY ("FRAG#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_OBJECT_TYPES
--------------------------------------------------------

  ALTER TABLE "REPCAT$_OBJECT_TYPES" ADD CONSTRAINT "REPCAT$_OBJECT_TYPE_PK" PRIMARY KEY ("OBJECT_TYPE_ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table DEF$_CALLDEST
--------------------------------------------------------

  ALTER TABLE "DEF$_CALLDEST" ADD CONSTRAINT "DEF$_CALLDEST_PRIMARY" PRIMARY KEY ("ENQ_TID", "DBLINK", "STEP_NO") ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_AGE_SPILL$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_AGE_SPILL$" ADD CONSTRAINT "LOGMNR_AGE_SPILL$_PK" PRIMARY KEY ("SESSION#", "XIDUSN", "XIDSLT", "XIDSQN", "CHUNK", "SEQUENCE#") ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_PARAMETER$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_PARAMETER$" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "LOGMNR_PARAMETER$" MODIFY ("SESSION#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SEMINAIRE
--------------------------------------------------------

  ALTER TABLE "SEMINAIRE" ADD CONSTRAINT "SEMINAIRE_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "SEMINAIRE" MODIFY ("ID_DEPARTEMENT" NOT NULL ENABLE);
  ALTER TABLE "SEMINAIRE" MODIFY ("DATE_DEBUT" NOT NULL ENABLE);
  ALTER TABLE "SEMINAIRE" MODIFY ("ETAT" NOT NULL ENABLE);
  ALTER TABLE "SEMINAIRE" MODIFY ("NOM" NOT NULL ENABLE);
  ALTER TABLE "SEMINAIRE" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_INFO
--------------------------------------------------------

  ALTER TABLE "MVIEW$_ADV_INFO" ADD CONSTRAINT "MVIEW$_ADV_INFO_PK" PRIMARY KEY ("RUNID#", "SEQ#") ENABLE;
  ALTER TABLE "MVIEW$_ADV_INFO" MODIFY ("INFOLEN" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_INFO" MODIFY ("TYPE" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_INFO" MODIFY ("SEQ#" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_INFO" MODIFY ("RUNID#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_USER_AUTHORIZATIONS
--------------------------------------------------------

  ALTER TABLE "REPCAT$_USER_AUTHORIZATIONS" ADD CONSTRAINT "REPCAT$_USER_AUTHORIZATIONS_U1" UNIQUE ("USER_ID", "REFRESH_TEMPLATE_ID") ENABLE;
  ALTER TABLE "REPCAT$_USER_AUTHORIZATIONS" ADD CONSTRAINT "REPCAT$_USER_AUTHORIZATIONS_PK" PRIMARY KEY ("USER_AUTHORIZATION_ID") ENABLE;
  ALTER TABLE "REPCAT$_USER_AUTHORIZATIONS" MODIFY ("REFRESH_TEMPLATE_ID" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_USER_AUTHORIZATIONS" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_USER_AUTHORIZATIONS" MODIFY ("USER_AUTHORIZATION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_TABPART$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_TABPART$" ADD CONSTRAINT "LOGMNR_TABPART$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "BO#") DISABLE;
  ALTER TABLE "LOGMNR_TABPART$" MODIFY ("BO#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_CLIQUE
--------------------------------------------------------

  ALTER TABLE "MVIEW$_ADV_CLIQUE" ADD CONSTRAINT "MVIEW$_ADV_CLIQUE_PK" PRIMARY KEY ("CLIQUEID#") ENABLE;
  ALTER TABLE "MVIEW$_ADV_CLIQUE" MODIFY ("NUMROWS" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_CLIQUE" MODIFY ("ROWSIZE" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_CLIQUE" MODIFY ("BYTECOST" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_CLIQUE" MODIFY ("FREQUENCY" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_CLIQUE" MODIFY ("HASHVALUE" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_CLIQUE" MODIFY ("CLIQUEDES" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_CLIQUE" MODIFY ("CLIQUEDESLEN" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_CLIQUE" MODIFY ("RUNID#" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_CLIQUE" MODIFY ("CLIQUEID#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_RESOLUTION
--------------------------------------------------------

  ALTER TABLE "REPCAT$_RESOLUTION" ADD CONSTRAINT "REPCAT$_RESOLUTION_PK" PRIMARY KEY ("SNAME", "ONAME", "CONFLICT_TYPE_ID", "REFERENCE_NAME", "SEQUENCE_NO") ENABLE;
  ALTER TABLE "REPCAT$_RESOLUTION" MODIFY ("FUNCTION_NAME" CONSTRAINT "REPCAT$_RESOLUTION_NN2" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_RESOLUTION" MODIFY ("METHOD_NAME" CONSTRAINT "REPCAT$_RESOLUTION_NN1" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_GC
--------------------------------------------------------

  ALTER TABLE "MVIEW$_ADV_GC" ADD CONSTRAINT "MVIEW$_ADV_GC_PK" PRIMARY KEY ("GCID#") ENABLE;
  ALTER TABLE "MVIEW$_ADV_GC" MODIFY ("HASHVALUE" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_GC" MODIFY ("GCDES" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_GC" MODIFY ("GCDESLEN" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_GC" MODIFY ("FJGID#" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_GC" MODIFY ("GCID#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_TEMPLATE_TYPES
--------------------------------------------------------

  ALTER TABLE "REPCAT$_TEMPLATE_TYPES" ADD CONSTRAINT "REPCAT$_TEMPLATE_TYPES_PK" PRIMARY KEY ("TEMPLATE_TYPE_ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table REPCAT$_OBJECT_PARMS
--------------------------------------------------------

  ALTER TABLE "REPCAT$_OBJECT_PARMS" ADD CONSTRAINT "REPCAT$_OBJECT_PARMS_PK" PRIMARY KEY ("TEMPLATE_PARAMETER_ID", "TEMPLATE_OBJECT_ID") ENABLE;
  ALTER TABLE "REPCAT$_OBJECT_PARMS" MODIFY ("TEMPLATE_OBJECT_ID" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_OBJECT_PARMS" MODIFY ("TEMPLATE_PARAMETER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_FLAVORS
--------------------------------------------------------

  ALTER TABLE "REPCAT$_FLAVORS" ADD CONSTRAINT "REPCAT$_FLAVORS_UNQ1" UNIQUE ("GNAME", "FLAVOR_ID", "GOWNER") ENABLE;
  ALTER TABLE "REPCAT$_FLAVORS" ADD CONSTRAINT "REPCAT$_FLAVORS_C2" CHECK (published is NULL or (published in ('Y','N','O'))) ENABLE;
  ALTER TABLE "REPCAT$_FLAVORS" MODIFY ("GNAME" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_FLAVORS" MODIFY ("FLAVOR_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGSTDBY$EVENTS
--------------------------------------------------------

  ALTER TABLE "LOGSTDBY$EVENTS" MODIFY ("EVENT_TIME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table VENTES
--------------------------------------------------------

  ALTER TABLE "VENTES" ADD PRIMARY KEY ("REFPROD", "NUMCLIENT", "NUMVENDEUR", "DATEVENTE") ENABLE;
  ALTER TABLE "VENTES" MODIFY ("DATEVENTE" NOT NULL ENABLE);
  ALTER TABLE "VENTES" MODIFY ("NUMVENDEUR" NOT NULL ENABLE);
  ALTER TABLE "VENTES" MODIFY ("NUMCLIENT" NOT NULL ENABLE);
  ALTER TABLE "VENTES" MODIFY ("REFPROD" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_ENC$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_ENC$" ADD CONSTRAINT "LOGMNR_ENC$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "OWNER#") DISABLE;
  ALTER TABLE "LOGMNR_ENC$" MODIFY ("MKEYID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_ATTRIBUTE$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_ATTRIBUTE$" ADD CONSTRAINT "LOGMNR_ATTRIBUTE$_PK" PRIMARY KEY ("LOGMNR_UID", "TOID", "VERSION#", "ATTRIBUTE#") DISABLE;
  ALTER TABLE "LOGMNR_ATTRIBUTE$" MODIFY ("TOID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_TEMPLATE_PARMS
--------------------------------------------------------

  ALTER TABLE "REPCAT$_TEMPLATE_PARMS" ADD CONSTRAINT "REPCAT$_TEMPLATE_PARMS_U1" UNIQUE ("REFRESH_TEMPLATE_ID", "PARAMETER_NAME") ENABLE;
  ALTER TABLE "REPCAT$_TEMPLATE_PARMS" ADD CONSTRAINT "REPCAT$_TEMPLATE_PARMS_PK" PRIMARY KEY ("TEMPLATE_PARAMETER_ID") ENABLE;
  ALTER TABLE "REPCAT$_TEMPLATE_PARMS" ADD CONSTRAINT "REPCAT$_TEMPLATE_PARMS_C1" CHECK (user_override in ('Y','N')) ENABLE;
  ALTER TABLE "REPCAT$_TEMPLATE_PARMS" MODIFY ("PARAMETER_NAME" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_TEMPLATE_PARMS" MODIFY ("REFRESH_TEMPLATE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_PRIORITY
--------------------------------------------------------

  ALTER TABLE "REPCAT$_PRIORITY" ADD CONSTRAINT "REPCAT$_PRIORITY_PK" PRIMARY KEY ("SNAME", "PRIORITY_GROUP", "PRIORITY") ENABLE;
  ALTER TABLE "REPCAT$_PRIORITY" MODIFY ("PRIORITY" CONSTRAINT "REPCAT$_PRIORITY_NN3" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_PRIORITY" MODIFY ("PRIORITY_GROUP" CONSTRAINT "REPCAT$_PRIORITY_NN2" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_PRIORITY" MODIFY ("SNAME" CONSTRAINT "REPCAT$_PRIORITY_NN1" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGSTDBY$APPLY_MILESTONE
--------------------------------------------------------

  ALTER TABLE "LOGSTDBY$APPLY_MILESTONE" MODIFY ("FETCHLWM_SCN" NOT NULL ENABLE);
  ALTER TABLE "LOGSTDBY$APPLY_MILESTONE" MODIFY ("PROCESSED_SCN" NOT NULL ENABLE);
  ALTER TABLE "LOGSTDBY$APPLY_MILESTONE" MODIFY ("EPOCH" NOT NULL ENABLE);
  ALTER TABLE "LOGSTDBY$APPLY_MILESTONE" MODIFY ("SYNCH_SCN" NOT NULL ENABLE);
  ALTER TABLE "LOGSTDBY$APPLY_MILESTONE" MODIFY ("COMMIT_SCN" NOT NULL ENABLE);
  ALTER TABLE "LOGSTDBY$APPLY_MILESTONE" MODIFY ("SESSION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HELP
--------------------------------------------------------

  ALTER TABLE "HELP" ADD CONSTRAINT "HELP_TOPIC_SEQ" PRIMARY KEY ("TOPIC", "SEQ") ENABLE;
  ALTER TABLE "HELP" MODIFY ("SEQ" NOT NULL ENABLE);
  ALTER TABLE "HELP" MODIFY ("TOPIC" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_RESOL_STATS_CONTROL
--------------------------------------------------------

  ALTER TABLE "REPCAT$_RESOL_STATS_CONTROL" ADD CONSTRAINT "REPCAT$_RESOL_STATS_CTRL_PK" PRIMARY KEY ("SNAME", "ONAME") ENABLE;
  ALTER TABLE "REPCAT$_RESOL_STATS_CONTROL" MODIFY ("STATUS_UPDATE_DATE" CONSTRAINT "REPCAT$_RESOL_STATS_CTRL_NN3" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_RESOL_STATS_CONTROL" MODIFY ("STATUS" CONSTRAINT "REPCAT$_RESOL_STATS_CTRL_NN2" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_RESOL_STATS_CONTROL" MODIFY ("CREATED" CONSTRAINT "REPCAT$_RESOL_STATS_CTRL_NN1" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_RESTART_CKPT$
--------------------------------------------------------

  ALTER TABLE "LOGMNR_RESTART_CKPT$" ADD CONSTRAINT "LOGMNR_RESTART_CKPT$_PK" PRIMARY KEY ("SESSION#", "CKPT_SCN", "XIDUSN", "XIDSLT", "XIDSQN", "SESSION_NUM", "SERIAL_NUM") ENABLE;
--------------------------------------------------------
--  Constraints for Table REPCAT$_REPGROUP_PRIVS
--------------------------------------------------------

  ALTER TABLE "REPCAT$_REPGROUP_PRIVS" ADD CONSTRAINT "REPCAT$_REPGROUP_PRIVS_UK" UNIQUE ("USERNAME", "GNAME", "GOWNER") ENABLE;
  ALTER TABLE "REPCAT$_REPGROUP_PRIVS" MODIFY ("CREATED" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_REPGROUP_PRIVS" MODIFY ("GLOBAL_FLAG" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_REPGROUP_PRIVS" MODIFY ("USERNAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DOMAINE
--------------------------------------------------------

  ALTER TABLE "DOMAINE" ADD CONSTRAINT "DOMAINE_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "DOMAINE" MODIFY ("NOM" NOT NULL ENABLE);
  ALTER TABLE "DOMAINE" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_PRIORITY_GROUP
--------------------------------------------------------

  ALTER TABLE "REPCAT$_PRIORITY_GROUP" ADD CONSTRAINT "REPCAT$_PRIORITY_GROUP_U1" UNIQUE ("SNAME", "PRIORITY_GROUP", "DATA_TYPE_ID", "FIXED_DATA_LENGTH") ENABLE;
  ALTER TABLE "REPCAT$_PRIORITY_GROUP" ADD CONSTRAINT "REPCAT$_PRIORITY_GROUP_PK" PRIMARY KEY ("PRIORITY_GROUP", "SNAME") ENABLE;
  ALTER TABLE "REPCAT$_PRIORITY_GROUP" ADD CONSTRAINT "REPCAT$_PRIORITY_GROUP_C2" CHECK ((data_type_id in (4, 7) and
                  fixed_data_length is not null)
              or (data_type_id in (1, 2, 3, 5, 6) and
                  fixed_data_length is null)) ENABLE;
  ALTER TABLE "REPCAT$_PRIORITY_GROUP" ADD CONSTRAINT "REPCAT$_PRIORITY_GROUP_C1" CHECK (data_type_id in (1, 2, 3, 4, 5, 6, 7)) ENABLE;
  ALTER TABLE "REPCAT$_PRIORITY_GROUP" MODIFY ("DATA_TYPE_ID" CONSTRAINT "REPCAT$_PRIORITY_GROUP_NN1" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_SITE_OBJECTS
--------------------------------------------------------

  ALTER TABLE "REPCAT$_SITE_OBJECTS" ADD CONSTRAINT "REPCAT$_SITE_OBJECTS_U1" UNIQUE ("TEMPLATE_SITE_ID", "ONAME", "OBJECT_TYPE_ID", "SNAME") ENABLE;
  ALTER TABLE "REPCAT$_SITE_OBJECTS" MODIFY ("OBJECT_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_SITE_OBJECTS" MODIFY ("ONAME" NOT NULL ENABLE);
  ALTER TABLE "REPCAT$_SITE_OBJECTS" MODIFY ("TEMPLATE_SITE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TEST
--------------------------------------------------------

  ALTER TABLE "TEST" ADD PRIMARY KEY ("ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_FILTER
--------------------------------------------------------

  ALTER TABLE "MVIEW$_ADV_FILTER" ADD CONSTRAINT "MVIEW$_ADV_FILTER_PK" PRIMARY KEY ("FILTERID#", "SUBFILTERNUM#") ENABLE;
  ALTER TABLE "MVIEW$_ADV_FILTER" MODIFY ("SUBFILTERTYPE" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_FILTER" MODIFY ("SUBFILTERNUM#" NOT NULL ENABLE);
  ALTER TABLE "MVIEW$_ADV_FILTER" MODIFY ("FILTERID#" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table DEF$_CALLDEST
--------------------------------------------------------

  ALTER TABLE "DEF$_CALLDEST" ADD CONSTRAINT "DEF$_CALL_DESTINATION" FOREIGN KEY ("DBLINK", "CATCHUP")
	  REFERENCES "DEF$_DESTINATION" ("DBLINK", "CATCHUP") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DEPARTEMENT
--------------------------------------------------------

  ALTER TABLE "DEPARTEMENT" ADD CONSTRAINT "DEPARTEMENT_ETABLISSEMENT_FK" FOREIGN KEY ("ID_ETABLISSEMENT")
	  REFERENCES "ETABLISSEMENT" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MVIEW$_ADV_AJG
--------------------------------------------------------

  ALTER TABLE "MVIEW$_ADV_AJG" ADD CONSTRAINT "MVIEW$_ADV_AJG_FK" FOREIGN KEY ("RUNID#")
	  REFERENCES "MVIEW$_ADV_LOG" ("RUNID#") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MVIEW$_ADV_BASETABLE
--------------------------------------------------------

  ALTER TABLE "MVIEW$_ADV_BASETABLE" ADD CONSTRAINT "MVIEW$_ADV_BASETABLE_FK" FOREIGN KEY ("QUERYID#")
	  REFERENCES "MVIEW$_ADV_WORKLOAD" ("QUERYID#") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MVIEW$_ADV_CLIQUE
--------------------------------------------------------

  ALTER TABLE "MVIEW$_ADV_CLIQUE" ADD CONSTRAINT "MVIEW$_ADV_CLIQUE_FK" FOREIGN KEY ("RUNID#")
	  REFERENCES "MVIEW$_ADV_LOG" ("RUNID#") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MVIEW$_ADV_ELIGIBLE
--------------------------------------------------------

  ALTER TABLE "MVIEW$_ADV_ELIGIBLE" ADD CONSTRAINT "MVIEW$_ADV_ELIGIBLE_FK" FOREIGN KEY ("RUNID#")
	  REFERENCES "MVIEW$_ADV_LOG" ("RUNID#") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MVIEW$_ADV_EXCEPTIONS
--------------------------------------------------------

  ALTER TABLE "MVIEW$_ADV_EXCEPTIONS" ADD CONSTRAINT "MVIEW$_ADV_EXCEPTION_FK" FOREIGN KEY ("RUNID#")
	  REFERENCES "MVIEW$_ADV_LOG" ("RUNID#") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MVIEW$_ADV_FILTERINSTANCE
--------------------------------------------------------

  ALTER TABLE "MVIEW$_ADV_FILTERINSTANCE" ADD CONSTRAINT "MVIEW$_ADV_FILTERINSTANCE_FK" FOREIGN KEY ("RUNID#")
	  REFERENCES "MVIEW$_ADV_LOG" ("RUNID#") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MVIEW$_ADV_FJG
--------------------------------------------------------

  ALTER TABLE "MVIEW$_ADV_FJG" ADD CONSTRAINT "MVIEW$_ADV_FJG_FK" FOREIGN KEY ("AJGID#")
	  REFERENCES "MVIEW$_ADV_AJG" ("AJGID#") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MVIEW$_ADV_GC
--------------------------------------------------------

  ALTER TABLE "MVIEW$_ADV_GC" ADD CONSTRAINT "MVIEW$_ADV_GC_FK" FOREIGN KEY ("FJGID#")
	  REFERENCES "MVIEW$_ADV_FJG" ("FJGID#") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MVIEW$_ADV_INFO
--------------------------------------------------------

  ALTER TABLE "MVIEW$_ADV_INFO" ADD CONSTRAINT "MVIEW$_ADV_INFO_FK" FOREIGN KEY ("RUNID#")
	  REFERENCES "MVIEW$_ADV_LOG" ("RUNID#") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MVIEW$_ADV_JOURNAL
--------------------------------------------------------

  ALTER TABLE "MVIEW$_ADV_JOURNAL" ADD CONSTRAINT "MVIEW$_ADV_JOURNAL_FK" FOREIGN KEY ("RUNID#")
	  REFERENCES "MVIEW$_ADV_LOG" ("RUNID#") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MVIEW$_ADV_LEVEL
--------------------------------------------------------

  ALTER TABLE "MVIEW$_ADV_LEVEL" ADD CONSTRAINT "MVIEW$_ADV_LEVEL_FK" FOREIGN KEY ("RUNID#")
	  REFERENCES "MVIEW$_ADV_LOG" ("RUNID#") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MVIEW$_ADV_OUTPUT
--------------------------------------------------------

  ALTER TABLE "MVIEW$_ADV_OUTPUT" ADD CONSTRAINT "MVIEW$_ADV_OUTPUT_FK" FOREIGN KEY ("RUNID#")
	  REFERENCES "MVIEW$_ADV_LOG" ("RUNID#") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MVIEW$_ADV_ROLLUP
--------------------------------------------------------

  ALTER TABLE "MVIEW$_ADV_ROLLUP" ADD CONSTRAINT "MVIEW$_ADV_ROLLUP_CFK" FOREIGN KEY ("RUNID#", "CLEVELID#")
	  REFERENCES "MVIEW$_ADV_LEVEL" ("RUNID#", "LEVELID#") ENABLE;
  ALTER TABLE "MVIEW$_ADV_ROLLUP" ADD CONSTRAINT "MVIEW$_ADV_ROLLUP_FK" FOREIGN KEY ("RUNID#")
	  REFERENCES "MVIEW$_ADV_LOG" ("RUNID#") ENABLE;
  ALTER TABLE "MVIEW$_ADV_ROLLUP" ADD CONSTRAINT "MVIEW$_ADV_ROLLUP_PFK" FOREIGN KEY ("RUNID#", "PLEVELID#")
	  REFERENCES "MVIEW$_ADV_LEVEL" ("RUNID#", "LEVELID#") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRESENTATION
--------------------------------------------------------

  ALTER TABLE "PRESENTATION" ADD CONSTRAINT "PRESENTATION_DOMAINE1_FK" FOREIGN KEY ("ID_DOMAINE")
	  REFERENCES "DOMAINE" ("ID") ENABLE;
  ALTER TABLE "PRESENTATION" ADD CONSTRAINT "PRESENTATION_PERSONNE0_FK" FOREIGN KEY ("ID_PERSONNE")
	  REFERENCES "PERSONNE" ("ID") ENABLE;
  ALTER TABLE "PRESENTATION" ADD CONSTRAINT "PRESENTATION_SEMINAIRE_FK" FOREIGN KEY ("ID_SEMINAIRE")
	  REFERENCES "SEMINAIRE" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_AUDIT_COLUMN
--------------------------------------------------------

  ALTER TABLE "REPCAT$_AUDIT_COLUMN" ADD CONSTRAINT "REPCAT$_AUDIT_COLUMN_F1" FOREIGN KEY ("ATTRIBUTE")
	  REFERENCES "REPCAT$_AUDIT_ATTRIBUTE" ("ATTRIBUTE") ENABLE;
  ALTER TABLE "REPCAT$_AUDIT_COLUMN" ADD CONSTRAINT "REPCAT$_AUDIT_COLUMN_F2" FOREIGN KEY ("BASE_SNAME", "BASE_ONAME", "BASE_CONFLICT_TYPE_ID", "BASE_REFERENCE_NAME")
	  REFERENCES "REPCAT$_CONFLICT" ("SNAME", "ONAME", "CONFLICT_TYPE_ID", "REFERENCE_NAME") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_DDL
--------------------------------------------------------

  ALTER TABLE "REPCAT$_DDL" ADD CONSTRAINT "REPCAT$_DDL_PRNT" FOREIGN KEY ("LOG_ID", "SOURCE", "ROLE", "MASTER")
	  REFERENCES "REPCAT$_REPCATLOG" ("ID", "SOURCE", "ROLE", "MASTER") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_FLAVOR_OBJECTS
--------------------------------------------------------

  ALTER TABLE "REPCAT$_FLAVOR_OBJECTS" ADD CONSTRAINT "REPCAT$_FLAVOR_OBJECTS_FK1" FOREIGN KEY ("GNAME", "GOWNER")
	  REFERENCES "REPCAT$_REPCAT" ("SNAME", "GOWNER") ON DELETE CASCADE ENABLE;
  ALTER TABLE "REPCAT$_FLAVOR_OBJECTS" ADD CONSTRAINT "REPCAT$_FLAVOR_OBJECTS_FK2" FOREIGN KEY ("GNAME", "FLAVOR_ID", "GOWNER")
	  REFERENCES "REPCAT$_FLAVORS" ("GNAME", "FLAVOR_ID", "GOWNER") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_FLAVORS
--------------------------------------------------------

  ALTER TABLE "REPCAT$_FLAVORS" ADD CONSTRAINT "REPCAT$_FLAVORS_FK1" FOREIGN KEY ("GNAME", "GOWNER")
	  REFERENCES "REPCAT$_REPCAT" ("SNAME", "GOWNER") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_GENERATED
--------------------------------------------------------

  ALTER TABLE "REPCAT$_GENERATED" ADD CONSTRAINT "REPCAT$_REPGEN_PRNT" FOREIGN KEY ("SNAME", "ONAME", "TYPE")
	  REFERENCES "REPCAT$_REPOBJECT" ("SNAME", "ONAME", "TYPE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "REPCAT$_GENERATED" ADD CONSTRAINT "REPCAT$_REPGEN_PRNT2" FOREIGN KEY ("BASE_SNAME", "BASE_ONAME", "BASE_TYPE")
	  REFERENCES "REPCAT$_REPOBJECT" ("SNAME", "ONAME", "TYPE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_GROUPED_COLUMN
--------------------------------------------------------

  ALTER TABLE "REPCAT$_GROUPED_COLUMN" ADD CONSTRAINT "REPCAT$_GROUPED_COLUMN_F1" FOREIGN KEY ("SNAME", "ONAME", "GROUP_NAME")
	  REFERENCES "REPCAT$_COLUMN_GROUP" ("SNAME", "ONAME", "GROUP_NAME") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_INSTANTIATION_DDL
--------------------------------------------------------

  ALTER TABLE "REPCAT$_INSTANTIATION_DDL" ADD CONSTRAINT "REPCAT$_INSTANTIATION_DDL_FK1" FOREIGN KEY ("REFRESH_TEMPLATE_ID")
	  REFERENCES "REPCAT$_REFRESH_TEMPLATES" ("REFRESH_TEMPLATE_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_KEY_COLUMNS
--------------------------------------------------------

  ALTER TABLE "REPCAT$_KEY_COLUMNS" ADD CONSTRAINT "REPCAT$_KEY_COLUMNS_PRNT" FOREIGN KEY ("SNAME", "ONAME", "TYPE")
	  REFERENCES "REPCAT$_REPOBJECT" ("SNAME", "ONAME", "TYPE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_OBJECT_PARMS
--------------------------------------------------------

  ALTER TABLE "REPCAT$_OBJECT_PARMS" ADD CONSTRAINT "REPCAT$_OBJECT_PARMS_FK1" FOREIGN KEY ("TEMPLATE_PARAMETER_ID")
	  REFERENCES "REPCAT$_TEMPLATE_PARMS" ("TEMPLATE_PARAMETER_ID") ENABLE;
  ALTER TABLE "REPCAT$_OBJECT_PARMS" ADD CONSTRAINT "REPCAT$_OBJECT_PARMS_FK2" FOREIGN KEY ("TEMPLATE_OBJECT_ID")
	  REFERENCES "REPCAT$_TEMPLATE_OBJECTS" ("TEMPLATE_OBJECT_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_PARAMETER_COLUMN
--------------------------------------------------------

  ALTER TABLE "REPCAT$_PARAMETER_COLUMN" ADD CONSTRAINT "REPCAT$_PARAMETER_COLUMN_F1" FOREIGN KEY ("SNAME", "ONAME", "CONFLICT_TYPE_ID", "REFERENCE_NAME", "SEQUENCE_NO")
	  REFERENCES "REPCAT$_RESOLUTION" ("SNAME", "ONAME", "CONFLICT_TYPE_ID", "REFERENCE_NAME", "SEQUENCE_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_PRIORITY
--------------------------------------------------------

  ALTER TABLE "REPCAT$_PRIORITY" ADD CONSTRAINT "REPCAT$_PRIORITY_F1" FOREIGN KEY ("PRIORITY_GROUP", "SNAME")
	  REFERENCES "REPCAT$_PRIORITY_GROUP" ("PRIORITY_GROUP", "SNAME") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_REFRESH_TEMPLATES
--------------------------------------------------------

  ALTER TABLE "REPCAT$_REFRESH_TEMPLATES" ADD CONSTRAINT "REPCAT$_REFRESH_TEMPLATES_FK1" FOREIGN KEY ("TEMPLATE_TYPE_ID")
	  REFERENCES "REPCAT$_TEMPLATE_TYPES" ("TEMPLATE_TYPE_ID") ENABLE;
  ALTER TABLE "REPCAT$_REFRESH_TEMPLATES" ADD CONSTRAINT "REPCAT$_REFRESH_TEMPLATES_FK2" FOREIGN KEY ("TEMPLATE_STATUS_ID")
	  REFERENCES "REPCAT$_TEMPLATE_STATUS" ("TEMPLATE_STATUS_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_REPCOLUMN
--------------------------------------------------------

  ALTER TABLE "REPCAT$_REPCOLUMN" ADD CONSTRAINT "REPCAT$_REPCOLUMN_FK" FOREIGN KEY ("SNAME", "ONAME", "TYPE")
	  REFERENCES "REPCAT$_REPOBJECT" ("SNAME", "ONAME", "TYPE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_REPGROUP_PRIVS
--------------------------------------------------------

  ALTER TABLE "REPCAT$_REPGROUP_PRIVS" ADD CONSTRAINT "REPCAT$_REPGROUP_PRIVS_FK" FOREIGN KEY ("GNAME", "GOWNER")
	  REFERENCES "REPCAT$_REPCAT" ("SNAME", "GOWNER") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_REPOBJECT
--------------------------------------------------------

  ALTER TABLE "REPCAT$_REPOBJECT" ADD CONSTRAINT "REPCAT$_REPOBJECT_PRNT" FOREIGN KEY ("GNAME", "GOWNER")
	  REFERENCES "REPCAT$_REPCAT" ("SNAME", "GOWNER") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_REPPROP
--------------------------------------------------------

  ALTER TABLE "REPCAT$_REPPROP" ADD CONSTRAINT "REPCAT$_REPPROP_PRNT" FOREIGN KEY ("SNAME", "ONAME", "TYPE")
	  REFERENCES "REPCAT$_REPOBJECT" ("SNAME", "ONAME", "TYPE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_REPSCHEMA
--------------------------------------------------------

  ALTER TABLE "REPCAT$_REPSCHEMA" ADD CONSTRAINT "REPCAT$_REPSCHEMA_DEST" FOREIGN KEY ("DBLINK", "EXTENSION_ID")
	  REFERENCES "DEF$_DESTINATION" ("DBLINK", "CATCHUP") ENABLE;
  ALTER TABLE "REPCAT$_REPSCHEMA" ADD CONSTRAINT "REPCAT$_REPSCHEMA_PRNT" FOREIGN KEY ("SNAME", "GOWNER")
	  REFERENCES "REPCAT$_REPCAT" ("SNAME", "GOWNER") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_RESOLUTION
--------------------------------------------------------

  ALTER TABLE "REPCAT$_RESOLUTION" ADD CONSTRAINT "REPCAT$_RESOLUTION_F1" FOREIGN KEY ("CONFLICT_TYPE_ID", "METHOD_NAME")
	  REFERENCES "REPCAT$_RESOLUTION_METHOD" ("CONFLICT_TYPE_ID", "METHOD_NAME") ENABLE;
  ALTER TABLE "REPCAT$_RESOLUTION" ADD CONSTRAINT "REPCAT$_RESOLUTION_F3" FOREIGN KEY ("SNAME", "ONAME", "CONFLICT_TYPE_ID", "REFERENCE_NAME")
	  REFERENCES "REPCAT$_CONFLICT" ("SNAME", "ONAME", "CONFLICT_TYPE_ID", "REFERENCE_NAME") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_SITE_OBJECTS
--------------------------------------------------------

  ALTER TABLE "REPCAT$_SITE_OBJECTS" ADD CONSTRAINT "REPCAT$_SITE_OBJECTS_FK1" FOREIGN KEY ("OBJECT_TYPE_ID")
	  REFERENCES "REPCAT$_OBJECT_TYPES" ("OBJECT_TYPE_ID") ENABLE;
  ALTER TABLE "REPCAT$_SITE_OBJECTS" ADD CONSTRAINT "REPCAT$_SITE_OBJECT_FK2" FOREIGN KEY ("TEMPLATE_SITE_ID")
	  REFERENCES "REPCAT$_TEMPLATE_SITES" ("TEMPLATE_SITE_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_SITES_NEW
--------------------------------------------------------

  ALTER TABLE "REPCAT$_SITES_NEW" ADD CONSTRAINT "REPCAT$_SITES_NEW_FK1" FOREIGN KEY ("EXTENSION_ID")
	  REFERENCES "REPCAT$_EXTENSION" ("EXTENSION_ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "REPCAT$_SITES_NEW" ADD CONSTRAINT "REPCAT$_SITES_NEW_FK2" FOREIGN KEY ("GNAME", "GOWNER")
	  REFERENCES "REPCAT$_REPCAT" ("SNAME", "GOWNER") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_TEMPLATE_OBJECTS
--------------------------------------------------------

  ALTER TABLE "REPCAT$_TEMPLATE_OBJECTS" ADD CONSTRAINT "REPCAT$_TEMPLATE_OBJECTS_FK1" FOREIGN KEY ("REFRESH_TEMPLATE_ID")
	  REFERENCES "REPCAT$_REFRESH_TEMPLATES" ("REFRESH_TEMPLATE_ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "REPCAT$_TEMPLATE_OBJECTS" ADD CONSTRAINT "REPCAT$_TEMPLATE_OBJECTS_FK3" FOREIGN KEY ("OBJECT_TYPE")
	  REFERENCES "REPCAT$_OBJECT_TYPES" ("OBJECT_TYPE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_TEMPLATE_PARMS
--------------------------------------------------------

  ALTER TABLE "REPCAT$_TEMPLATE_PARMS" ADD CONSTRAINT "REPCAT$_TEMPLATE_PARMS_FK1" FOREIGN KEY ("REFRESH_TEMPLATE_ID")
	  REFERENCES "REPCAT$_REFRESH_TEMPLATES" ("REFRESH_TEMPLATE_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_TEMPLATE_REFGROUPS
--------------------------------------------------------

  ALTER TABLE "REPCAT$_TEMPLATE_REFGROUPS" ADD CONSTRAINT "REPCAT$_TEMPLATE_REFGROUPS_FK1" FOREIGN KEY ("REFRESH_TEMPLATE_ID")
	  REFERENCES "REPCAT$_REFRESH_TEMPLATES" ("REFRESH_TEMPLATE_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_USER_AUTHORIZATIONS
--------------------------------------------------------

  ALTER TABLE "REPCAT$_USER_AUTHORIZATIONS" ADD CONSTRAINT "REPCAT$_USER_AUTHORIZATION_FK2" FOREIGN KEY ("REFRESH_TEMPLATE_ID")
	  REFERENCES "REPCAT$_REFRESH_TEMPLATES" ("REFRESH_TEMPLATE_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_USER_PARM_VALUES
--------------------------------------------------------

  ALTER TABLE "REPCAT$_USER_PARM_VALUES" ADD CONSTRAINT "REPCAT$_USER_PARM_VALUES_FK1" FOREIGN KEY ("TEMPLATE_PARAMETER_ID")
	  REFERENCES "REPCAT$_TEMPLATE_PARMS" ("TEMPLATE_PARAMETER_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SEMINAIRE
--------------------------------------------------------

  ALTER TABLE "SEMINAIRE" ADD CONSTRAINT "SEMINAIRE_DEPARTEMENT_FK" FOREIGN KEY ("ID_DEPARTEMENT")
	  REFERENCES "DEPARTEMENT" ("ID") ENABLE;
