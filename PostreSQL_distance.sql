
select 
    "Combine Names",
    'SGFI_list' as "Source",
    lat,
    lon,
    "State",
    "k_ID",
    "Previous_k_ID_SGP (Percentile) Rank"
from public."Coverage_model_SPT_OPT_Jul2020_and_Jan2021_geo"
where "State" IN ('UT','ID','MT','WY')  




SELECT 
    "Crown Castle ID" :: TEXT as id,
    'CROWN' as "Source",
    lat,
    lon
FROM public."MTNPLNS_State_Root_crown_geo"

UNION 

SELECT 
    "Site Name" as id,
    'Leased' as "Source",
    lat,
    lon
from public."MTNPLNS_State_Root_leased_geo"




###################

select * from public."MTNPLNS_State_Root_crown_geo"
limit 3


select * from public."Coverage_model_SPT_OPT_Jul2020_and_Jan2021_geo"
where "State" IN ('UT','ID','MT','WY')  





SELECT 
    "Combine Names" :: TEXT as id,
    'SGFI' as "Source",
    lat,
    lon
FROM public."Coverage_model_SPT_OPT_Jul2020_and_Jan2021_geo"
where "State" IN ('UT','ID','MT','WY')  

UNION 

SELECT 
   "Cluster Record" :: TEXT as id,
    'HQ_Sunil' as "Source",
    lat,
    lon
FROM public."MTNPLNS_State_Root_SunilStateRoot_geo"



