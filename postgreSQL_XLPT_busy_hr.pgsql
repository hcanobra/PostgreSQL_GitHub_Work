SELECT 
    "DAY","MARKET","ENODEB","SITE","Peak_#_UE_In_Connected_Mode","UE_DL_Throughput_Mbps","Cell_Availability","Setup_Fail%_Num","Setup_Fail%_Den","Context_Droppct_Num","Context_Droppct_Den","RRC_Setup_Failurepct_Num","RRC_Setup_Failurepct_Den","Bearer_Setup_Failurepct_Num","Bearer_Droppct_Den","Context_Setup_Failurepct_Num","Context_Setup_Failurepct_Den","SIP_SC_Call_Attempts","SIP_SC_Call_Setup_Failures","SIP_SC_Call_Completions","SIP_SC_Call_Drops","Downlink_Data_Volume_MB_Test","Downlink_Throughput_in_Mbps","DL_Data_Vol_MAC_in_MB","UL_Data_Vol_MAC_in_Mb"
FROM public."DMPL_XLPT_DAY"
WHERE "DAY" = '07/04/2022'
AND
"ENODEB" IN ('11300','10330','10349','11163','10023','13204','13210')


SELECT 
    to_date("DMPL_XLPT_ALL_VER2"."DAY", 'mm/dd/yyy'::text) AS "DAY",
    "DMPL_XLPT_ALL_VER2"."MARKET",
    "DMPL_XLPT_ALL_VER2"."ENODEB",
    "DMPL_XLPT_ALL_VER2"."SITE",
    sum("DMPL_XLPT_ALL_VER2"."Peak_#_UE_In_Connected_Mode"::integer) AS "Peak_#_UE_In_Connected_Mode",
    avg("DMPL_XLPT_ALL_VER2"."UE_DL_Throughput_Mbps") AS "UE_DL_Throughput_Mbps",
    avg("DMPL_XLPT_ALL_VER2"."Cell_Throughput_Mbps") AS "Cell_Throughput_Mbps",
    avg("DMPL_XLPT_ALL_VER2"."Cell_Availability") AS "Cell_Availability",
    sum("DMPL_XLPT_ALL_VER2"."SIP_SC_Short_Calls"::double precision) AS "SIP_SC_Short_Calls",
    NULLIF(sum(NULLIF("DMPL_XLPT_ALL_VER2"."Setup_Failpct_Num", 0)::double precision), 0::double precision) AS "Setup_Failpct_Num",
    NULLIF(sum(NULLIF("DMPL_XLPT_ALL_VER2"."Setup_Failpct_Den", 0)::double precision), 0::double precision) AS "Setup_Failpct_Den",
    NULLIF(sum(NULLIF("DMPL_XLPT_ALL_VER2"."Context_Droppct_Num", 0)::double precision), 0::double precision) AS "Context_Droppct_Num",
    NULLIF(sum(NULLIF("DMPL_XLPT_ALL_VER2"."Context_Droppct_Den", 0)::double precision), 0::double precision) AS "Context_Droppct_Den",
    NULLIF(sum(NULLIF("DMPL_XLPT_ALL_VER2"."RRC_Setup_Failurepct_Num", 0)::double precision), 0::double precision) AS "RRC_Setup_Failurepct_Num",
    NULLIF(sum(NULLIF("DMPL_XLPT_ALL_VER2"."RRC_Setup_Failurepct_Den", 0)::double precision), 0::double precision) AS "RRC_Setup_Failurepct_Den",
    NULLIF(sum(NULLIF("DMPL_XLPT_ALL_VER2"."Bearer_Setup_Failurepct_Num", 0)::double precision), 0::double precision) AS "Bearer_Setup_Failurepct_Num",
    NULLIF(sum(NULLIF("DMPL_XLPT_ALL_VER2"."Bearer_Setup_Failurepct_Den", 0)::double precision), 0::double precision) AS "Bearer_Setup_Failurepct_Den",
    NULLIF(sum(NULLIF("DMPL_XLPT_ALL_VER2"."Bearer_Droppct_Num", 0)::double precision), 0::double precision) AS "Bearer_Droppct_Num",
    NULLIF(sum(NULLIF("DMPL_XLPT_ALL_VER2"."Bearer_Droppct_Den", 0)::double precision), 0::double precision) AS "Bearer_Droppct_Den",
    NULLIF(sum(NULLIF("DMPL_XLPT_ALL_VER2"."Context_Setup_Failurepct_Num", 0)::double precision), 0::double precision) AS "Context_Setup_Failurepct_Num",
    NULLIF(sum(NULLIF("DMPL_XLPT_ALL_VER2"."Context_Setup_Failurepct_Den", 0)::double precision), 0::double precision) AS "Context_Setup_Failurepct_Den",
    NULLIF(sum(NULLIF("DMPL_XLPT_ALL_VER2"."SIP_SC_Call_Setup_Failures", 0)::double precision), 0::double precision) AS "SIP_SC_Call_Setup_Failures",
    NULLIF(sum(NULLIF("DMPL_XLPT_ALL_VER2"."SIP_SC_Call_Attempts", 0)::double precision), 0::double precision) AS "SIP_SC_Call_Attempts",
    NULLIF(sum(NULLIF("DMPL_XLPT_ALL_VER2"."SIP_SC_Call_Drops", 0)::double precision), 0::double precision) AS "SIP_SC_Call_Drops",
    NULLIF(sum(NULLIF("DMPL_XLPT_ALL_VER2"."SIP_SC_Call_Completions", 0)::double precision), 0::double precision) AS "SIP_SC_Call_Completions",
    sum("DMPL_XLPT_ALL_VER2"."Downlink_Data_Volume_MB_Test") AS "Downlink_Data_Volume_MB_Test",
    avg("DMPL_XLPT_ALL_VER2"."Downlink_Throughput_in_Mbps") AS "Downlink_Throughput_in_Mbps",
    sum("DMPL_XLPT_ALL_VER2"."DL_Data_Vol_MAC_in_MB") AS "DL_Data_Vol_MAC_in_MB",
    sum("DMPL_XLPT_ALL_VER2"."UL_Data_Vol_MAC_in_Mb") AS "UL_Data_Vol_MAC_in_Mb"
FROM "DMPL_XLPT_ALL_VER2"
WHERE 
    "DMPL_XLPT_ALL_VER2"."FREQ" IS NOT NULL 
    AND 
    "DMPL_XLPT_ALL_VER2"."HR" IN ('6','7','8','9','10','11','12','13','14','15','16','17','18','19','20')
GROUP BY "DMPL_XLPT_ALL_VER2"."ENODEB", "DMPL_XLPT_ALL_VER2"."DAY", "DMPL_XLPT_ALL_VER2"."MARKET", "DMPL_XLPT_ALL_VER2"."SITE"
ORDER BY (to_date("DMPL_XLPT_ALL_VER2"."DAY", 'mm/dd/yyy'::text)), "DMPL_XLPT_ALL_VER2"."ENODEB";


SELECT 
    to_date("DMPL_XLPT_ALL_VER2"."DAY", 'mm/dd/yyy'::text) AS "DAY",
    "DMPL_XLPT_ALL_VER2"."MARKET",
    "DMPL_XLPT_ALL_VER2"."ENODEB",
    "DMPL_XLPT_ALL_VER2"."SITE",
    sum("DMPL_XLPT_ALL_VER2"."Peak_#_UE_In_Connected_Mode"::integer) AS "Peak_#_UE_In_Connected_Mode"
FROM "DMPL_XLPT_ALL_VER2"
WHERE 
    "DMPL_XLPT_ALL_VER2"."FREQ" IS NOT NULL 
    AND 
    "DMPL_XLPT_ALL_VER2"."HR" IN ('6','7','8','9','10','11','12','13','14','15','16','17','18','19','20')
    AND
    "DMPL_XLPT_ALL_VER2"."DAY" = '07/04/2022'
    AND
    "ENODEB" = '10023'
GROUP BY "DMPL_XLPT_ALL_VER2"."ENODEB", "DMPL_XLPT_ALL_VER2"."DAY", "DMPL_XLPT_ALL_VER2"."MARKET", "DMPL_XLPT_ALL_VER2"."SITE"
ORDER BY (to_date("DMPL_XLPT_ALL_VER2"."DAY", 'mm/dd/yyy'::text)), "DMPL_XLPT_ALL_VER2"."ENODEB";


SELECT 
    *
FROM "DMPL_XLPT_DAY"
WHERE 
    "DAY" = '07/04/2022'
    AND
    "ENODEB" IN ('11300','10330','10349','11163','10023','13204','13210')



SELECT distinct("DAY") from public."DMPL_XLPT_ALL_VER2"
ORDER BY "DAY"

