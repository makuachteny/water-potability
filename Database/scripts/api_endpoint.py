from flask import Flask, jsonify, request
from pymongo import MongoClient
from bson.objectid import ObjectId

app = Flask(__name__)

# Connecting to MongoDB
client = MongoClient("mongodb://localhost:27017/")
db = client["Water_qualityDB"]
water_samples_collection = db["water_quality_samples"]
locations_collection = db["locations"]

#Get request
@app.route('/', methods=['GET'])
def get_water_samples():
    water_samples = list(water_samples_collection.find())
    for sample in  water_samples:
        sample['_id'] = str(sample['_id'])
        sample['location_id'] = str(sample['location_id'])
    return jsonify(water_samples)

# Get request with the id parameter to fetch a specific water sample
@app.route('/<id>', methods=['GET'])
def get_water_sample(id):
    try:
        sample = water_samples_collection.find_one({'_id': ObjectId(id)})
        if sample:
            sample['_id'] = str(sample['_id'])
            sample['location_id'] = str(sample['location_id'])
            return jsonify(sample)
        else:
            return jsonify({'error': 'Water quality sample not found, try another'}), 404
    except Exception as e:
        return jsonify({'error': str(e)}), 400

# Post request to create a new water sample
@app.route('/', methods=['POST'])
def create_water_sample():
    data = request.get_json()
    if not data:
        return jsonify({'error': 'No data provided'}), 400

    try:
        result = water_samples_collection.insert_one(data)
        return jsonify({'id': str(result.inserted_id)}), 201
    except Exception as e:
        return jsonify({'error': str(e)}), 400

# Put request to update an existing water sample
@app.route('/<id>', methods=['PUT'])
def update_water_sample(id):
    data = request.get_json()
    if not data:
        return jsonify({'error': 'No data provided'}), 400

    try:
        result = water_samples_collection.update_one({'_id': ObjectId(id)}, {'$set': data})
        if result.modified_count == 1:
            return '', 204
        else:
            return jsonify({'error': 'Water sample not found or no changes made'}), 404
    except Exception as e:
        return jsonify({'error': str(e)}), 400

# Delete request to remove a water sample
@app.route('/<id>', methods=['DELETE'])
def delete_water_sample(id):
    try:
        result = water_samples_collection.delete_one({'_id': ObjectId(id)})
        if result.deleted_count == 1:
            return '', 204
        else:
            return jsonify({'error': 'Water quality sample not found'}), 404
    except Exception as e:
        return jsonify({'error': str(e)}), 400

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000, debug=True)
