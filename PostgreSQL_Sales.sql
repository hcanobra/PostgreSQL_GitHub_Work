#********************************************
#  Q1 Project List

regexp_split_to_array(ST_AsX3D (point),E'\\s+') AS sentence

/*
This query shows completed projects specified by the Projects_Activation_Month field
*/

SELECT  
	DISTINCT ("Dashboar_Project_subtype"),
	COUNT ("Dashboar_Project_subtype"),

	"Projects_local_market"

FROM public.vzw_fuze_qgis
WHERE 
	"Projects_Activation_Month" IN (4,5,6)
	AND 
	EXTRACT(YEAR FROM (TO_DATE ("Projects_activation_forecast_date",'mm/dd/yyyy'))) = 2022
	AND
	"Dashboar_Status" = '5-On Air'
     AND
    "Dashboar_Project_subtype" IN (
                                    '5G 28GHz - Carrier Add',
                                    '5G L-Sub6 - Carrier Add',
                                    '850 NR',
                                    'ANTMO',
                                    'Capacity Carrier Add',
                                    'iDAS - Mod',
                                    'iDAS - New',
                                    'iDAS/iRepeater Conversion',
                                    'Macro - Acquisition',
                                    'Macro - Capacity',
                                    'Macro - Roaming Coverage',
                                    'Macro - Save the License',
                                    'Macro - SGFI',
                                    'Small Cell - Mod',
                                    'Small Cell - New',
                                    'Software only 4G',
                                    'Software only 5G',
                                    'Software only C-band',
                                    'STL - Carrier Add',
                                    'Venue - Mod',
                                    'Venue - New',
                                    'AWS1 - Carrier Add',
                                    'AWS3 - Carrier Add',
                                    'AWS3 Prep'
                                 )    
GROUP BY "Projects_local_market","Dashboar_Project_subtype"
ORDER BY "Projects_local_market"


/*
This query shows the forecast pronjects for the quarter specified by the Projects_Activation_Month field
*/

SELECT  
	DISTINCT ("Dashboar_Project_subtype"),
	COUNT ("Dashboar_Project_subtype"),

	"Projects_local_market"

FROM public.vzw_fuze_qgis
WHERE 
	"Projects_Activation_Month" IN (7,8,9)
	AND 
	EXTRACT(YEAR FROM (TO_DATE ("Projects_activation_forecast_date",'mm/dd/yyyy'))) = 2022
     AND
    "Dashboar_Project_subtype" IN (
                                    '5G 28GHz - Carrier Add',
                                    '5G L-Sub6 - Carrier Add',
                                    '850 NR',
                                    'ANTMO',
                                    'Capacity Carrier Add',
                                    'iDAS - Mod',
                                    'iDAS - New',
                                    'iDAS/iRepeater Conversion',
                                    'Macro - Acquisition',
                                    'Macro - Capacity',
                                    'Macro - Roaming Coverage',
                                    'Macro - Save the License',
                                    'Macro - SGFI',
                                    'Small Cell - Mod',
                                    'Small Cell - New',
                                    'Software only 4G',
                                    'Software only 5G',
                                    'Software only C-band',
                                    'STL - Carrier Add',
                                    'Venue - Mod',
                                    'Venue - New',
                                    'AWS1 - Carrier Add',
                                    'AWS3 - Carrier Add',
                                    'AWS3 Prep'
                                 )    
GROUP BY "Projects_local_market","Dashboar_Project_subtype"
ORDER BY "Projects_local_market"

/*
This query all project in our 5Y plan that are active
*/

Select  
	DISTINCT ("Dashboar_Project_subtype"),
	COUNT ("Dashboar_Project_subtype"),

	"Projects_local_market"

from public.vzw_fuze_qgis
where "Projects_Status" = 'Active'
    AND
    "Dashboar_Project_subtype" IN (
                                    '5G 28GHz - Carrier Add',
                                    '5G L-Sub6 - Carrier Add',
                                    '850 NR',
                                    'ANTMO',
                                    'Capacity Carrier Add',
                                    'iDAS - Mod',
                                    'iDAS - New',
                                    'iDAS/iRepeater Conversion',
                                    'Macro - Acquisition',
                                    'Macro - Capacity',
                                    'Macro - Roaming Coverage',
                                    'Macro - Save the License',
                                    'Macro - SGFI',
                                    'Small Cell - Mod',
                                    'Small Cell - New',
                                    'Software only 4G',
                                    'Software only 5G',
                                    'Software only C-band',
                                    'STL - Carrier Add',
                                    'Venue - Mod',
                                    'Venue - New',
                                    'AWS1 - Carrier Add',
                                    'AWS3 - Carrier Add',
                                    'AWS3 Prep'
                                 )    
GROUP BY "Projects_local_market","Dashboar_Project_subtype"
ORDER BY "Projects_local_market"

/*
This query all project in our 5Y plan that are active with coordenates
*/

Select  
	"Dashboar_Project_subtype",
	"Projects_local_market",
	EXTRACT(YEAR FROM (TO_DATE ("Projects_activation_forecast_date",'mm/dd/yyyy'))) AS "Year",
	lat,
	lon
from public.vzw_fuze_qgis
where 
	"Projects_Status" = 'Active'
	AND
    "Dashboar_Project_subtype" IN (
                                    '5G 28GHz - Carrier Add',
                                    '5G L-Sub6 - Carrier Add',
                                    '850 NR',
                                    'ANTMO',
                                    'Capacity Carrier Add',
                                    'iDAS - Mod',
                                    'iDAS - New',
                                    'iDAS/iRepeater Conversion',
                                    'Macro - Acquisition',
                                    'Macro - Capacity',
                                    'Macro - Roaming Coverage',
                                    'Macro - Save the License',
                                    'Macro - SGFI',
                                    'Small Cell - Mod',
                                    'Small Cell - New',
                                    'Software only 4G',
                                    'Software only 5G',
                                    'Software only C-band',
                                    'STL - Carrier Add',
                                    'Venue - Mod',
                                    'Venue - New',
                                    'AWS1 - Carrier Add',
                                    'AWS3 - Carrier Add',
                                    'AWS3 Prep'
                                 )  
ORDER BY EXTRACT(YEAR FROM (TO_DATE ("Projects_activation_forecast_date",'mm/dd/yyyy'))),"Projects_local_market"

/*
   This query provide RootMarket result summary information, the data resides on PosgreSQL but is imported from SPAR WebSite > Score Trends > Market Scores

   Market Name	Carrier Name	HALF	Measure Name (group)	Measure Value	Rootscore Award
   BOISE, ID	T-Mobile	2022H1	Overall	97.0483	Lost
   BOISE, ID	Verizon	2022H1	Overall	98.5784	Tie
   BOISE, ID	AT&T	2022H1	Overall	98.0057	Tie
   OGDEN, UT	Verizon	2022H1	Overall	99.4597	Win
   OGDEN, UT	T-Mobile	2022H1	Overall	99.0813	Lost
   OGDEN, UT	AT&T	2022H1	Overall	99.021	Lost
   PROVO, UT	Verizon	2022H1	Overall	99.3085	Win
   PROVO, UT	AT&T	2022H1	Overall	97.8268	Lost
   PROVO, UT	T-Mobile	2022H1	Overall	98.3013	Lost
   SALT LAKE CITY, UT	AT&T	2022H1	Overall	97.7526	Lost
   SALT LAKE CITY, UT	Verizon	2022H1	Overall	98.9397	Win
   SALT LAKE CITY, UT	T-Mobile	2022H1	Overall	97.4433	Lost

*/

select 
	"Market Name",
	"Carrier Name",
	"HALF",
	"Measure Name (group)",
	"Measure Value",
	"Rootscore Award"
from public."Market_Scores_Full_Data_data"
where 
	"HALF" like ('%2022%')
	and
	"Measure Name (group)" = 'Overall'
	and
	"Market Name" in
					(
						'PROVO, UT',
						'SALT LAKE CITY, UT',
						'OGDEN, UT',
						'BOISE, ID'
					)

order by "Market Name"

##################

Select  

*
from public.vzw_fuze_qgis
where "Projects_Activation_Month" IN (1,2,3)
and EXTRACT(YEAR FROM (TO_DATE ("Projects_activation_forecast_date",'mm/dd/yyyy'))) = 2022
AND
"Projects_Status" = 'Active'