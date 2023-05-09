/*
Creates a sequences for indexing
*/

CREATE SEQUENCE DMPL_4G_XLPT_KPI_WEBSERVICES_id_seq
start 1
INCREMENT 1

nextval('DMPL_4G_XLPT_KPI_WEBSERVICES_id_seq'::regclass)


/*
Creates a view with the variables for 4G xLPT
*/
DROP VIEW IF EXISTS Public."DMPL_XLPT_JUN";
CREATE VIEW public."DMPL_XLPT_JUN" AS 
SELECT 
	"DAY",
	"MARKET",
	"ENODEB",
	"SITE",
	SUM ("Peak_#_UE_In_Connected_Mode") AS "Peak_#_UE_In_Connected_Mode",
	AVG ("UE_DL_Throughput_Mbps") AS "UE_DL_Throughput_Mbps",
	AVG ("Cell_Throughput_Mbps") AS "Cell_Throughput_Mbps",
	AVG ("Cell_Availability") AS "Cell_Availability",
	SUM ("SIP_SC_Call_Attempts") AS "SIP_SC_Call_Attempts",
	SUM ("SIP_SC_Call_Completions") AS "SIP_SC_Call_Completions",
	SUM ("SIP_SC_Short_Calls") AS "SIP_SC_Short_Calls",
	/* Setup_Fail% */

			(NULLIF((SUM(NULLIF("Setup_Failpct_Num",0) :: FLOAT)),0)) AS "Setup_Failpct_Num",
			(NULLIF((SUM(NULLIF("Setup_Failpct_Den",0) :: FLOAT)),0)) AS "Setup_Failpct_Den",

	/* Context_Drop% */
	(
		(
			(NULLIF((SUM(NULLIF("Context_Droppct_Num",0) :: FLOAT)),0))
		/
			(NULLIF((SUM(NULLIF("Context_Droppct_Den",0) :: FLOAT)),0))
		)*100
	)AS "Context_Droppct",
	/*RRC_Setup_Failure%*/
	(		
		(	
			(NULLIF((SUM(NULLIF("RRC_Setup_Failurepct_Num",0) :: FLOAT)),0))
		/	
			(NULLIF((SUM(NULLIF("RRC_Setup_Failurepct_Den",0) :: FLOAT)),0))
		)*100	
	)AS "RRC_Setup_Failurepct",
	/*Bearer_Setup_Failure%*/		
	(		
		(	
			(NULLIF((SUM(NULLIF("Bearer_Setup_Failurepct_Num",0) :: FLOAT)),0))
		/	
			(NULLIF((SUM(NULLIF("Bearer_Setup_Failurepct_Den",0) :: FLOAT)),0))
		)*100	
	)AS "Bearer_Setup_Failurepct",
	/*Bearer_Drop%*/		
	(		
		(	
			(NULLIF((SUM(NULLIF("Bearer_Droppct_Num",0) :: FLOAT)),0))
		/	
			(NULLIF((SUM(NULLIF("Bearer_Droppct_Den",0) :: FLOAT)),0))
		)*100	
	)AS "Bearer_Droppct",
	/*Context_Setup_Failure%*/		
	(		
		(	
			(NULLIF((SUM(NULLIF("Context_Setup_Failurepct_Num",0) :: FLOAT)),0))
		/	
			(NULLIF((SUM(NULLIF("Context_Setup_Failurepct_Den",0) :: FLOAT)),0))
		)*100	
	)AS "Context_Setup_Failurepct",
	/*S1U_SIP_SC_CallSetupFailure%*/		
	(		
		(	
			(NULLIF((SUM(NULLIF("SIP_SC_Call_Setup_Failures",0) :: FLOAT)),0))
		/	
			(NULLIF((SUM(NULLIF("SIP_SC_Call_Attempts",0) :: FLOAT)),0))
		)*100	
	)AS "S1U_SIP_SC_CallSetupFailurepct",
	/*S1U_SIP_SC_CallDrop%*/		
	(		
		(	
			(NULLIF((SUM(NULLIF("SIP_SC_Call_Drops",0) :: FLOAT)),0))
		/	
			(NULLIF((SUM(NULLIF("SIP_SC_Call_Completions",0) :: FLOAT)),0))
		)*100	
	)AS "S1U_SIP_SC_CallDroppct",

	SUM ("Downlink_Data_Volume_MB_Test") AS "Downlink_Data_Volume_MB_Test",
	AVG ("Downlink_Throughput_in_Mbps") AS "Downlink_Throughput_in_Mbps",
	SUM ("DL_Data_Vol_MAC_in_MB") AS "DL_Data_Vol_MAC_in_MB",
	SUM ("UL_Data_Vol_MAC_in_Mb") AS "UL_Data_Vol_MAC_in_Mb"


FROM public."DMPL_XLPT_ALL_JUN"

WHERE 
	"FREQ" IS NOT NULL
	AND 
	"HR" = ANY (ARRAY['6'::text, '7'::text, '8'::text, '9'::text, '10'::text, '11'::text, '12'::text, '13'::text, '14'::text, '15'::text, '16'::text, '17'::text, '18'::text, '19'::text, '20'::text])
GROUP BY 
		"ENODEB",
		"DAY",
		"MARKET",
		"SITE"

ORDER BY
	"DAY",
	"ENODEB";

/*
##################################################################################################################################
##################################################################################################################################
##################################################################################################################################
*/
DROP VIEW IF EXISTS Public."DMPL_XLPT_LAST30";
CREATE VIEW public."DMPL_XLPT_LAST30" AS 
SELECT * FROM FROM public."DMPL_XLPT_DAY"
UNION 
SELECT * FROM FROM public."DMPL_XLPT_JUN"


/*
##################################################################################################################################
##################################################################################################################################
##################################################################################################################################
*/
SELECT distinct("DAY") from public."DMPL_XLPT_ALL_VER2"
ORDER BY "DAY"

/*

*/

CREATE TABLE "DMPL_XLPT_ALL_TMP" AS
SELECT * FROM public."DMPL_XLPT_ALL_VER2"
ORDER BY "DAY"


select * from public."MTPL_all"
select * from public."DMPL_XLPT_ALL_VER2"
limit 2

select distinct("DAY") from public."DMPL_XLPT_ALL_VER2"
select distinct("MARKET") from public."DMPL_XLPT_ALL_VER2"


select * from public."MTPL_all2"
limit 2

DELETE FROM public."DMPL_XLPT_ALL_VER2"
	WHERE "HR" != '*';

select * from public."MTPL_all1"



CREATE TABLE public."MTPL_all" AS
	select * from public."MTPL_all1"
	
	
INSERT INTO 
	 public."MTPL_all1" ("DAY", "HR", "MMEPOOL", "SITE", "ENODEB")
VALUES
	('5/31/22', '0', 'Mountain_IoT', 'AIRPORT_ROAD', '10262')
	
CREATE TABLE public."MTPL_all_temp" AS
	select * from public."MTPL_all"
	union 
	select * from public."MTPL_all2";
	
DROP TABLE IF EXISTS public."MTPL_all";

CREATE TABLE public."MTPL_all" AS
	SELECT * from public."MTPL_all_temp"
	ORDER BY "DAY","HR","MARKET","ENODEB","EUTRANCELL";
DROP TABLE IF EXISTS public."MTPL_all_temp";

DROP TABLE IF EXISTS public."MTPL_all2";

DELETE FROM public."MTPL_all"
	WHERE "HR" = '*';

###
CREATE TABLE public."MTPL_all_temp" AS
	select * from public."DMPL_XLPT_ALL_VER2"
	union 
	select * from public."MTPL_all2";
DROP TABLE IF EXISTS public."DMPL_XLPT_ALL_VER2";
CREATE TABLE public."DMPL_XLPT_ALL_VER2" AS
	SELECT * from public."MTPL_all_temp"
	ORDER BY "DAY","HR","MARKET","ENODEB","EUTRANCELL";
DROP TABLE IF EXISTS public."MTPL_all_temp";
DROP TABLE IF EXISTS public."MTPL_all2";
DELETE FROM public."DMPL_XLPT_ALL_VER2"
		WHERE "HR" = '*';


UPDATE public."DMPL_XLPT_ALL_VER2" SET "MARKET" = 'MKT10'
WHERE "MARKET" IN ('10','010');
UPDATE public."DMPL_XLPT_ALL_VER2" SET "MARKET" = 'MKT11'
WHERE "MARKET" IN ('11','011');
UPDATE public."DMPL_XLPT_ALL_VER2" SET "MARKET" = 'MKT12'
WHERE "MARKET" IN ('12','012');
UPDATE public."DMPL_XLPT_ALL_VER2" SET "MARKET" = 'MKT13'
WHERE "MARKET" IN ('13','013');

###

SELECT DISTINCT "HR"
FROM public."MTPL_all"
WHERE "DAY" = '06/02/2022'
ORDER BY "HR"

SELECT DISTINCT ("DAY") FROM public."MTPL_all"

6/4/2022	Verizon	Ogden-UT_2022-1H	353388681689610	311480673694877	4253655157
6/4/2022	Verizon	Ogden-UT_2022-1H	353388681687747	311480673631019	4253655148



select * from public."MTPL_all"
where 
	"ENODEB" = '11088'
	and
	"Cell_Availability" < 100 
	and 
	"DAY" = '06/02/2022'
limit 2



####################################################################################
select 
	count (*),
	"MARKET",
	"EUTRANCELL",
	"SITE"
from public."MTPL_all"
where 
	"Cell_Availability" < 100 
	and 
	"DAY" = '06/02/2022'
	AND
	"DAY" NOT IN ('0','1','2','3','4','5','22','23')

GROUP BY "MARKET","SITE","EUTRANCELL"
ORDER BY "MARKET", count (*) 
####################################################################################
SELECT 
	"MARKET",
	"DAY",
	"ENODEB",
	"SITE",
	 AVG ("Cell_Availability")
FROM public."DMPL_XLPT_ALL_VER2"

WHERE 
	"ENODEB" = '10322'
	AND
	"SITE" = 'RAILROAD'
	AND
	"DAY" = '05/31/2022'
	AND 
	"Cell_Availability" != 0

	
GROUP BY 
	"MARKET",
	"DAY",
	"ENODEB",
	"SITE"

ORDER BY 
	"SITE",
	"MARKET",
	"DAY"
	
SELECT * FROM public."DMPL_XLPT_ALL_VER2" 
WHERE 
	"ENODEB" = '10322'
	AND
	"SITE" = 'RAILROAD'
	AND
	"DAY" = '05/31/2022'
"FREQ"

CREATE TABLE public."DMPL_XLPT_ALL" AS 

SELECT 
	*
FROM public."DMPL_XLPT_ALL_VER2"
limit 200


select distinct ("DAY") from public."DMPL_XLPT_ALL"
delete from public."DMPL_XLPT_ALL" where "DAY" = '6/6/22'

SELECT * FROM public.animals
DELETE FROM public.animals WHERE "animal" = 'fish'

select distinct ("DAY") from public."DMPL_XLPT_ALL_VER2"

select 
	distinct ("HR"),
	"DAY"
from public."DMPL_XLPT_ALL_VER2"
GROUP BY "HR","DAY"
ORDER  BY "HR","DAY"
limit 3

select distinct ("DAY") from public."DMPL_XLPT_ALL_VER3"
select distinct ("HR") from public."DMPL_XLPT_ALL_VER3"



CREATE TABLE public."DMPL_XLPT_ALL_VER3_1" AS
select * from public."DMPL_XLPT_ALL_VER3"
where 
	"DAY" = 06/0/2022
	"HR" IN ('6','7','8','9','10','11','12','13','14','15','16','17','18','19','20')
ORDER BY "DAY", "HR" :: INTEGER, "MARKET", "SITE", "ENODEB", "EUTRANCELL"

select * from public."DMPL_XLPT_ALL_VER3_1"
where 
	"DAY" = '05/31/2022'
ORDER BY "DAY", "HR" :: INTEGER, "MARKET", "SITE", "ENODEB", "EUTRANCELL"


DELETE FROM public."DMPL_XLPT_ALL_VER2" 
WHERE
	"HR" IN ('0','1','2','3','4','5','21','22','23')

select * from public."DMPL_XLPT_ALL_VER2" LIMIT 5
select distinct ("DAY") from public."DMPL_XLPT_ALL_VER2"
select distinct ("HR") from public."DMPL_XLPT_ALL_VER2"
CREATE TABLE public."DMPL_XLPT_ALL_VER2_1" AS
select * from public."DMPL_XLPT_ALL_VER2"
where 
	"HR" IN ('6','7','8','9','10','11','12','13','14','15','16','17','18','19','20')
ORDER BY "DAY", "HR" :: INTEGER, "MARKET", "SITE", "ENODEB", "EUTRANCELL"


select distinct ("DAY") from public."DMPL_XLPT_5G_CBand_ALL_VER2"
select distinct ("HR") from public."DMPL_XLPT_5G_CBand_ALL_VER2"
select * from public."DMPL_XLPT_5G_CBand_ALL_VER2"
limit 5
DELETE FROM  public."DMPL_XLPT_5G_CBand_ALL_VER2"
WHERE
	"HR" = '*'

























/#INVESTIGAGTE : 
 1) THE FORMULA FOR VOLTE IA%
 2) FORMULA FOR QCI1 BEARER DROP%
 2) Formla for S1U_SIP_SC_SEER"









############################################################################################################################################
############################################################################################################################################
############################################################################################################################################
############################################################################################################################################
############################################################################################################################################
############################################################################################################################################






DROP TABLE IF EXISTS Public."DMPL_XLPT_JUNE";
CREATE VIEW public."DMPL_XLPT_DAY" AS 
SELECT 
	"DAY",
	"MARKET",
	"ENODEB",
	"SITE",
	SUM ("Peak_#_UE_In_Connected_Mode") AS "Peak_#_UE_In_Connected_Mode",
	AVG ("UE_DL_Throughput_Mbps") AS "UE_DL_Throughput_Mbps",
	AVG ("Cell_Throughput_Mbps") AS "Cell_Throughput_Mbps",
	AVG ("Cell_Availability") AS "Cell_Availability",
	SUM ("SIP_SC_Call_Attempts") AS "SIP_SC_Call_Attempts",
	SUM ("SIP_SC_Call_Completions") AS "SIP_SC_Call_Completions",
	SUM ("SIP_SC_Short_Calls") AS "SIP_SC_Short_Calls",
	/* Setup_Fail% */

			(NULLIF((SUM(NULLIF("Setup_Fail%_Num",0) :: FLOAT)),0)) AS "Setup_Fail%_Num",
			(NULLIF((SUM(NULLIF("Setup_Fail%_Den",0) :: FLOAT)),0)) AS "Setup_Fail%_Den",

	/* Context_Drop% */
	(
		(
			(NULLIF((SUM(NULLIF("Context_Drop%_Num",0) :: FLOAT)),0))
		/
			(NULLIF((SUM(NULLIF("Context_Drop%_Den",0) :: FLOAT)),0))
		)*100
	)AS "Context_Drop%",
	/*RRC_Setup_Failure%*/
	(		
		(	
			(NULLIF((SUM(NULLIF("RRC_Setup_Failure%_Num",0) :: FLOAT)),0))
		/	
			(NULLIF((SUM(NULLIF("RRC_Setup_Failure%_Den",0) :: FLOAT)),0))
		)*100	
	)AS "RRC_Setup_Failure%",
	/*Bearer_Setup_Failure%*/		
	(		
		(	
			(NULLIF((SUM(NULLIF("Bearer_Setup_Failure%_Num",0) :: FLOAT)),0))
		/	
			(NULLIF((SUM(NULLIF("Bearer_Setup_Failure%_Den",0) :: FLOAT)),0))
		)*100	
	)AS "Bearer_Setup_Failure%",
	/*Bearer_Drop%*/		
	(		
		(	
			(NULLIF((SUM(NULLIF("Bearer_Drop%_Num",0) :: FLOAT)),0))
		/	
			(NULLIF((SUM(NULLIF("Bearer_Drop%_Den",0) :: FLOAT)),0))
		)*100	
	)AS "Bearer_Drop%",
	/*Context_Setup_Failure%*/		
	(		
		(	
			(NULLIF((SUM(NULLIF("Context_Setup_Failure%_Num",0) :: FLOAT)),0))
		/	
			(NULLIF((SUM(NULLIF("Context_Setup_Failure%_Den",0) :: FLOAT)),0))
		)*100	
	)AS "Context_Setup_Failure%",
	/*S1U_SIP_SC_CallSetupFailure%*/		
	(		
		(	
			(NULLIF((SUM(NULLIF("SIP_SC_Call_Setup_Failures",0) :: FLOAT)),0))
		/	
			(NULLIF((SUM(NULLIF("SIP_SC_Call_Attempts",0) :: FLOAT)),0))
		)*100	
	)AS "S1U_SIP_SC_CallSetupFailure%",
	/*S1U_SIP_SC_CallDrop%*/		
	(		
		(	
			(NULLIF((SUM(NULLIF("SIP_SC_Call_Drops",0) :: FLOAT)),0))
		/	
			(NULLIF((SUM(NULLIF("SIP_SC_Call_Completions",0) :: FLOAT)),0))
		)*100	
	)AS "S1U_SIP_SC_CallDrop%",

	SUM ("Downlink_Data_Volume_MB_Test") AS "Downlink_Data_Volume_MB_Test",
	AVG ("Downlink_Throughput_in_Mbps") AS "Downlink_Throughput_in_Mbps",
	SUM ("DL_Data_Vol_MAC_in_MB") AS "DL_Data_Vol_MAC_in_MB",
	SUM ("UL_Data_Vol_MAC_in_Mb") AS "UL_Data_Vol_MAC_in_Mb"


FROM public."DMPL_XLPT_ALL_VER2"

WHERE 
	"FREQ" IS NOT NULL
	AND 
	"HR" = ANY (ARRAY['6'::text, '7'::text, '8'::text, '9'::text, '10'::text, '11'::text, '12'::text, '13'::text, '14'::text, '15'::text, '16'::text, '17'::text, '18'::text, '19'::text, '20'::text])
GROUP BY 
		"ENODEB",
		"DAY",
		"MARKET",
		"SITE"

ORDER BY
	"DAY",
	"ENODEB";