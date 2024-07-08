from pymongo import MongoClient


def insert_locations():
    """ Connect to MongoDB and insert data """
    client = MongoClient("mongodb://localhost:27017")
    db = client["Water_qualityDB"]
    locations_collection = db["locations"]

    locations_data = [
        {
            "location_name": "Nairobi",
            "latitude": -1.286389,
            "longitude": 36.817223
        },
        {
            "location_name": "Mombasa",
            "latitude": -4.043333,
            "longitude": 39.663056
        },
        {
            "location_name": "Kisumu",
            "latitude": -0.102222,
            "longitude": 34.761111
        },
        {
            "location_name": "Nakuru",
            "latitude": -0.307222,
            "longitude": 36.072222
        },
        {
            "location_name": "Eldoret",
            "latitude": 0.514277,
            "longitude": 35.269780
        }
    ]

    locations_collection.insert_many(locations_data)
    print("Locations inserted successfully")


if __name__ == "__main__":
    insert_locations()
