from pymongo import MongoClient
from datetime import datetime


def insert_water_samples():
    """ Connect to MongoDB and insert water sample data """
    try:
        client = MongoClient("mongodb://localhost:27017")
        db = client["Water_qualityDB"]
        water_samples_collection = db["water_quality_samples"]
        locations_collection = db["locations"]

        # Fetch location IDs in the specific order of location names
        location_ids = {}
        location_names = ["Nairobi", "Mombasa", "Kisumu", "Nakuru", "Eldoret"]

        # Fetch and sort locations by location_name
        sorted_locations = list(locations_collection.find(
            {"location_name": {"$in": location_names}}).sort("location_name"))

        # Create a mapping of location_name to _id
        location_ids = {loc["location_name"]: loc["_id"]
                        for loc in sorted_locations}

        # Predefined water samples for each location in the specific order
        samples_data = [
            {
                "location_id": location_ids.get("Nairobi"),
                "ph": 7.2,
                "hardness": 150.5,
                "solids": 500.25,
                "chloramines": 4.5,
                "sulfate": 250.7,
                "conductivity": 450.3,
                "organic_carbon": 10.1,
                "trihalomethanes": 70.2,
                "turbidity": 3.5,
                "potability": 1
            },
            {
                "location_id": location_ids.get("Mombasa"),
                "ph": 7.1,
                "hardness": 145.3,
                "solids": 495.20,
                "chloramines": 4.3,
                "sulfate": 248.5,
                "conductivity": 447.8,
                "organic_carbon": 9.9,
                "trihalomethanes": 68.7,
                "turbidity": 3.4,
                "potability": 1
            },
            {
                "location_id": location_ids.get("Kisumu"),
                "ph": 6.8,
                "hardness": 120.4,
                "solids": 480.30,
                "chloramines": 3.8,
                "sulfate": 220.5,
                "conductivity": 400.1,
                "organic_carbon": 9.5,
                "trihalomethanes": 65.1,
                "turbidity": 3.0,
                "potability": 1
            },
            {
                "location_id": location_ids.get("Nakuru"),
                "ph": 6.9,
                "hardness": 125.2,
                "solids": 485.10,
                "chloramines": 4.0,
                "sulfate": 225.0,
                "conductivity": 405.5,
                "organic_carbon": 9.7,
                "trihalomethanes": 66.0,
                "turbidity": 3.1,
                "potability": 1
            },
            {
                "location_id": location_ids.get("Eldoret"),
                "ph": 7.0,
                "hardness": 130.0,
                "solids": 490.0,
                "chloramines": 4.2,
                "sulfate": 230.0,
                "conductivity": 410.0,
                "organic_carbon": 10.0,
                "trihalomethanes": 67.0,
                "turbidity": 3.2,
                "potability": 1
            },
        ]

        water_samples_collection.insert_many(samples_data)
        print("Water samples inserted successfully")

    except Exception as e:
        print(f"An error occurred: {e}")


if __name__ == "__main__":
    insert_water_samples()
