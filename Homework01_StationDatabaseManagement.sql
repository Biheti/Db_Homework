--1
CREATE DATABASE TrainStationDB;

--2
USE TrainStationDB; 
CREATE TABLE Stations (
	StationID int,
	StationName nvarchar (50),
	City nvarchar (50)
)
CREATE TABLE Trains (
	TrainID int,
	TrainName nvarchar (50),
	TrainType nvarchar (50),
	DepartureTime time,
	ArrivalTime time,
	StationID int
)
--3
INSERT INTO Stations (StationID, StationName, City)
  VALUES
  (1, 'Buggibba Bay 1', 'Buggibba'),
  (2, 'Chalet', 'Sliema'),
  (3, 'Kastilja', 'Valletta'),
  (4, 'Melqart', 'Marsaxlokk' );

 INSERT INTO Trains (TrainID, TrainName, TrainType, DepartureTime, ArrivalTime, StationID)
VALUES
  (01, 'Wanderer', 'Double-decker bus', '12:00:00.0000000', '13:00:00.0000000', 1),
  (02, 'Galavant', 'Single-decker bus', '13:00:00.0000000', '14:00:00.0000000', 1),
  (03, 'Roadster', 'Double-decker bus', '14:00:00.0000000', '15:00:00.0000000', 4),
  (04, 'Ronin', 'Minibus', '15:00:00.0000000', '16:00:00.0000000', 2),
  (05, 'Highlander', 'Single-decker bus', '16:00:00.0000000', '17:00:00.0000000', 3);

--4
DELETE  FROM  Trains
WHERE TrainID = 01;

DELETE  FROM  Stations
WHERE StationID = 4;

--5
DROP TABLE  Trains;

