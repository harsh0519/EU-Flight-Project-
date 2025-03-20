INSERT INTO Airports (AirportName, IATACode, ICAOCode, Country, City, Latitude, Longitude)
VALUES
('Indira Gandhi International Airport', 'DEL', 'VIDP', 'India', 'New Delhi', 28.5562, 77.1000),
('Chhatrapati Shivaji Maharaj International Airport', 'BOM', 'VABB', 'India', 'Mumbai', 19.0896, 72.8656),
('Kempegowda International Airport', 'BLR', 'VOBL', 'India', 'Bangalore', 13.1986, 77.7066),
('Chennai International Airport', 'MAA', 'VOMM', 'India', 'Chennai', 12.9941, 80.1700),
('Netaji Subhas Chandra Bose International Airport', 'CCU', 'VECC', 'India', 'Kolkata', 22.6547, 88.4467);

INSERT INTO Airlines (AirlineName, IATACode)
VALUES
('Air India', 'AI'),
('IndiGo', '6E'),
('Vistara', 'UK');

INSERT INTO Flights (FlightNumber, DepartureAirportID, ArrivalAirportID, AirlineID, DepartureTime, ArrivalTime, Status)
VALUES
('AI101', 1, 2, 1, '2025-03-20 06:00:00', '2025-03-20 08:30:00', 'On Time'),
('AI102', 2, 3, 1, '2025-03-20 09:00:00', '2025-03-20 11:30:00', 'Delayed'),
('6E201', 3, 4, 2, '2025-03-20 12:00:00', '2025-03-20 14:30:00', 'On Time'),
('UK301', 4, 5, 3, '2025-03-20 15:00:00', '2025-03-20 17:30:00', 'Delayed'),
('AI103', 5, 1, 1, '2025-03-20 18:00:00', '2025-03-20 20:30:00', 'On Time');

INSERT INTO FlightStatus (FlightID, Status, DelayDuration)
VALUES
(2, 'Delayed', 150), 
(4, 'Delayed', 180); 
