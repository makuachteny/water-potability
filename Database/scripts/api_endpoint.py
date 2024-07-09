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
    return jsonify(str(water_samples))

#Get request with the id parameter
@app.route('/<id>', methods=['GET'])
# def get_water_sample(id):
#     sample = water_samples_collection.find_one({'_id': str(ObjectId(id))})
#     if sample:
#         sample['_id'] = str(sample['_id'])
#         return jsonify(sample)
#     else:
#         return jsonify({'error': 'Water quality sample not found, try another'}), 404

# #Post request
# @app.route('/', methods=['POST'])
# def create_water_sample():
#     data = request.get_json()
#     result = water_samples_collection.insert_one(data)
#     return jsonify({'id': str(result.inserted_id)}), 201

# #Inserting request
# @app.route('/<id>', methods=['PUT'])
# def update_water_sample(id):
#     data = request.get_json()
#     result = water_samples_collection.update_one({'_id': str(ObjectId(id))}, {'$set': data})
#     if result.modified_count == 1:
#         return '', 204
#     else:
#         return jsonify({'error': 'Water sample not found'}), 404

# #Deleting request
# @app.route('/<id>', methods=['DELETE'])
# def delete_water_sample(id):
#     result = water_samples_collection.delete_one({'_id': str(ObjectId(id))})
#     if result.deleted_count == 1:
#         return '', 204
#     else:
#         return jsonify({'error': 'Water quality sample not found'}), 404


if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000, debug=True)
