import requests
import json
import mysql.connector
API_KEY = '7545415ihbkibigbkhi7845411kjbiflo'
BASE_URL = 'https://aeroapi.flightaware.com/aeroapi'
DB_CONFIG = {
    'host': 'localhost',
    'user': 'root',
    'password': 'YOUR_DB_PASSWORD',
    'database': 'eu_flight_db'
}

def get_flight_data(flight_number):
    url = f'{BASE_URL}/flights/{flight_number}'
    headers = {'x-apikey': API_KEY}

    response = requests.get(url, headers=headers)
    
    if response.status_code == 200:
        data = response.json()
        print(json.dumps(data, indent=2))
        store_flight_data(data)
    else:
        print(f"Failed to fetch data: {response.status_code}")

def store_flight_data(data):
    try:
        conn = mysql.connector.connect(**DB_CONFIG)
        cursor = conn.cursor()

        flight = data['flights'][0]
        flight_number = flight['ident']
        departure_airport = flight['origin']['code']
        arrival_airport = flight['destination']['code']
        departure_time = flight['scheduled_out']
        arrival_time = flight['scheduled_in']
        status = flight['status']
        cursor.execute("SELECT AirportID FROM Airports WHERE IATACode = %s", (departure_airport,))
        departure_id = cursor.fetchone()
        cursor.execute("SELECT AirportID FROM Airports WHERE IATACode = %s", (arrival_airport,))
        arrival_id = cursor.fetchone()

        if departure_id and arrival_id:
            departure_id = departure_id[0]
            arrival_id = arrival_id[0]
            sql = """
                INSERT INTO Flights (FlightNumber, DepartureAirportID, ArrivalAirportID, AirlineID, DepartureTime, ArrivalTime, Status)
                VALUES (%s, %s, %s, %s, %s, %s, %s)
            """
            values = (flight_number, departure_id, arrival_id, 1, departure_time, arrival_time, status)
            cursor.execute(sql, values)
            conn.commit()
            print(f"Flight data inserted for flight {flight_number}")
        else:
            print("Airport not found in the database")

    except Exception as e:
        print(f"Error inserting data: {e}")

    finally:
        cursor.close()
        conn.close()

if __name__ == "__main__":
    flight_number = 'AI101'
    get_flight_data(flight_number)
