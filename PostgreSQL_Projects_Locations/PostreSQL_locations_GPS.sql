		
SELECT 
	ESC.idx_id,
	ESC.pdx_id,
	ESC.priority,
	ESC."Fuze",
	ESC."KID",
	ESC."KID_Rank",
	ESC."SP_Eng",
	ESC."Description",
	ESC."Comments",
	ESC."Fuze_Status",
	ESC."Location",
	LOC.sentence[2] AS lat, 
	LOC.sentence[1] AS long 
FROM public.postgresql_locations_list ESC
JOIN
		(
		SELECT
			pdx_id,
			regexp_split_to_array(ST_AsX3D (point),E'\\s+') AS sentence
		FROM public.escalations_locations
		) LOC  ON ESC.pdx_id = LOC.pdx_id
ORDER BY ESC.idx_id 



********************************************************************************************************************

                    SELECT 
                        ESC.idx_id,
                        ESC.pdx_id,
                        ESC.priority,
                        ESC."Fuze",
                        ESC."KID",
                        ESC."KID_Rank",
                        ESC."SP_Eng",
                        ESC."Description",
                        ESC."Comments",
                        ESC."Fuze_Status",
                        ESC."Location",
                        RIGHT ((ST_AsX3D (LOC.point)),(LENGTH((ST_AsX3D (LOC.point))) - POSITION(' '  IN (ST_AsX3D (LOC.point))))) AS lat,
	                    LEFT((ST_AsX3D (LOC.point)),(POSITION(' '  IN (ST_AsX3D (LOC.point)))-1)) AS lon

                    FROM public.postgresql_locations_list ESC
                    JOIN public.escalations_locations LOC ON ESC.pdx_id = LOC.pdx_id
                    WHERE ESC.priority = 'L2_P1'
                    ORDER BY ESC."SP_Eng"

********************************************************************************************************************

SELECT 
	"Cluster Record" AS id,
	'HQ_Sunil' AS "Source",
	lat,
	lon,
	"Root Priority Rank" as "Rank"
FROM public."MTNPLNS_State_Root_SunilStateRoot_geo"

UNION

SELECT 
	"k_ID" :: TEXT AS id,
	'SGFI' AS "Source",
	lat,
	lon,
	"Previous_k_ID_SGP (Percentile) Rank" AS "Rank"
FROM public."Coverage_model_SPT_OPT_Jul2020_and_Jan2021_geo"
WHERE "State" IN ('UT','ID','MT')


********************************************************************************************************************

CREATE VIEW "MTNPLNS_SGFI_HQ_ROOT_1519_geo" AS
SELECT 
	"Cluster Record" AS id,
	'HQ_Root_1519' AS "Source",
	lat,
	lon,
	"Root Priority Rank v4" as "Rank",
	geometry
FROM public."MTNPLNS_2022_HQ_1519_LOCATIONS_geo"

UNION

SELECT 
	"k_ID" :: TEXT AS id,
	'SGFI' AS "Source",
	lat,
	lon,
	"Previous_k_ID_SGP (Percentile) Rank" AS "Rank",
	geometry
FROM public."Coverage_model_SPT_OPT_Jul2020_and_Jan2021_geo"
WHERE "State" IN ('UT','ID','MT')