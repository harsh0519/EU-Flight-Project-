CREATE TABLE Airports (
    AirportID INT PRIMARY KEY AUTO_INCREMENT,
    AirportName VARCHAR(100) NOT NULL,
    IATACode VARCHAR(3) UNIQUE NOT NULL,
    ICAOCode VARCHAR(4) UNIQUE NOT NULL,
    Country VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Latitude DECIMAL(10, 6) NOT NULL,
    Longitude DECIMAL(10, 6) NOT NULL
);
CREATE TABLE Airlines (
    AirlineID INT PRIMARY KEY AUTO_INCREMENT,
    AirlineName VARCHAR(100) NOT NULL,
    IATACode VARCHAR(3) UNIQUE NOT NULL
);
CREATE TABLE Flights (
    FlightID INT PRIMARY KEY AUTO_INCREMENT,
    FlightNumber VARCHAR(10) UNIQUE NOT NULL,
    DepartureAirportID INT NOT NULL,
    ArrivalAirportID INT NOT NULL,
    AirlineID INT NOT NULL,
    DepartureTime DATETIME NOT NULL,
    ArrivalTime DATETIME NOT NULL,
    Status VARCHAR(20) NOT NULL,
    FOREIGN KEY (DepartureAirportID) REFERENCES Airports(AirportID),
    FOREIGN KEY (ArrivalAirportID) REFERENCES Airports(AirportID),
    FOREIGN KEY (AirlineID) REFERENCES Airlines(AirlineID)
);
CREATE TABLE FlightStatus (
    StatusID INT PRIMARY KEY AUTO_INCREMENT,
    FlightID INT NOT NULL,
    Status VARCHAR(20) NOT NULL,
    DelayDuration INT DEFAULT 0,
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
);
