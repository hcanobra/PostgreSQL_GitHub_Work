SELECT * FROM public.truecall_presto_views_f_truecall_lsr_raw_v0_mk12
LIMIT 10

SELECT COUNT (*)  FROM public.truecall_presto_views_f_truecall_lsr_raw_v0_mk12
WHERE rsrp_dbm < -124

LIMIT 10



SELECT 
DISTINCT (trans_dt),
hr 
FROM public.truecall_presto_views_f_truecall_lsr_raw_v0_mk12
GROUP BY trans_dt,hr
LIMIT 10

SELECT COUNT (*) FROM public.truecall_presto_views_f_truecall_lsr_raw_v0_mk13
WHERE rsrp_dbm < -124



public."SaltLakeCity-UT_2022-1H_All_Mobile-to-Mobile_Tests"




***********************************************************************************************************************************
QUERY TO CALCULATE THE AMOUNT TO DATA USED PER 5G BAND

select 
	COUNT(*) AS "Number_of_test",
	"Network",
	'5G NW' AS "5G Network",
	"Data_Direction",
	"Network_Types",
	SUM ("Amount_of_Traffic") AS "Total_BW"
from public."SaltLakeCity_UT_2022_1H_All_Data_Throughput_Tests"
WHERE 
	"Data_Direction" = 'Download'  
	AND 
	"Network_Types" IS NOT NULL
	and
	"5G_Band_CC1" = 5
	and
	"Network" = 'Verizon'
	and 
	"Network_Types" = 'NR NSA'GROUP BY 
	"Network",
	"Data_Direction",
	"Network_Types"

UNION

select 
	COUNT(*) AS "Number_of_test",
	"Network",
	'C Band' AS "5G Network",
	"Data_Direction",
	"Network_Types",
	SUM ("Amount_of_Traffic") AS "Total_BW"
from public."SaltLakeCity_UT_2022_1H_All_Data_Throughput_Tests"
WHERE 
	"Data_Direction" = 'Download'  
	AND 
	"Network_Types" IS NOT NULL
	and
	"5G_Band_CC1" = 77
	and
	"Network" = 'Verizon'
	and 
	"Network_Types" = 'NR NSA'

GROUP BY 
	"Network",
	"Data_Direction",
	"Network_Types"

UNION

select 
	COUNT(*) AS "Number_of_test",
	"Network",
	'5G mmW' AS "5G Network",
	"Data_Direction",
	"Network_Types",
	SUM ("Amount_of_Traffic") AS "Total_BW"
from public."SaltLakeCity_UT_2022_1H_All_Data_Throughput_Tests"
WHERE 
	"Data_Direction" = 'Download'  
	AND 
	"Network_Types" IS NOT NULL
	and
	"5G_Band_CC1" = 261
	and
	"Network" = 'Verizon'
	and 
	"Network_Types" = 'NR NSA'

GROUP BY 
	"Network",
	"Data_Direction",
	"Network_Types"
	
UNION

select 
	COUNT(*) AS "Number_of_test",
	"Network",
	'5G mmW/5G UWB' AS "5G Network",
	"Data_Direction",
	"Network_Types",
	SUM ("Amount_of_Traffic") AS "Total_BW"
from public."SaltLakeCity_UT_2022_1H_All_Data_Throughput_Tests"
WHERE 
	"Data_Direction" = 'Download'  
	AND 
	"Network_Types" IS NOT NULL
	and
	"5G_Band_CC1" IS NULL
	and
	"Network" = 'Verizon'
	and 
	"Network_Types" = 'NR NSA'

GROUP BY 
	"Network",
	"Data_Direction",
	"Network_Types"
	
***********************************************************************************************************************************