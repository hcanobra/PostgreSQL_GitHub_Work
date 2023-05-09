CREATE EXTENSION postgis;

CREATE TABLE test (
	geo_id SERIAL PRIMARY KEY,
	record_id TEXT, 
	Name TEXT,
	Description TEXT)
	
CREATE TABLE Point (
	geo_id SERIAL PRIMARY KEY,
	record_id TEXT, 
	Name TEXT,
	Description TEXT,
	SP_Eng TEXT,
	Status TEXT,
	point GEOMETRY(Point,4326))
	
CREATE TABLE LineSgring (
	geo_id SERIAL PRIMARY KEY,
	record_id TEXT, 
	Name TEXT,
	Description TEXT,
	point GEOMETRY(LINESTRING,4326))

CREATE TABLE POLYGON (
	geo_id SERIAL PRIMARY KEY,
	record_id TEXT, 
	Name TEXT,
	Description TEXT,
	point GEOMETRY(POLYGON,4326))

SELECT name, ST_AsText(point) FROM point;


select * from point
select * from lineSgring
select * from polygon


select * from point2
select * from test

INSERT INTO test (geo_id,record_id,Name, Description) VALUES (1,'m1','hello','no')

INSERT INTO point (
                geo_id,
                record_id,
                Name, 
                Description, 
                point) 
        VALUES (
                83,
                'm1',
                'hello',
                'no',
                ST_PointFromText('POINT(-111.86630 40.4938784)', 4326)
                )



************
CREATE TABLE Ziyad_Escalations_Locations (
	geo_id SERIAL PRIMARY KEY,
	record_id TEXT, 
	Name TEXT,
	Description TEXT,
	SP_Eng TEXT,
	Status TEXT,
	point GEOMETRY(Point,4326))

CREATE TABLE Ziyad_Escalations_Polygons (
	geo_id SERIAL PRIMARY KEY,
	record_id TEXT, 
	Name TEXT,
	Description TEXT,
	point GEOMETRY(POLYGON,4326))



########################
CREATE SEQUENCE THAT LATER WE CAN USE IT AS PRIMARY KEY AUTO GENERATION.

CREATE SEQUENCE escalation_polygon_id_seq
start 1
INCREMENT 1

nextval('pdx_id_seq'::regclass)