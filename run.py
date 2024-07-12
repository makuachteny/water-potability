import requests
import pandas as pd
import json
import tensorflow as tf
import numpy as np

def predict_water_potability(url, model_path):
    """
    Predicts the potability of water based on the last row
    of data from a local API endpoint.
    Args:
        url (str): The URL of the local API endpoint.
        model_path (str): The file path of the pre-trained model.
    Returns:
        numpy.ndarray: The prediction result.
    """
    print("Fetching data from the API...")
    response = requests.get(url)
    data = response.json()
    df = pd.DataFrame(data)
    last_row = df.iloc[-1]

    print("Loading the pre-trained model...")
    model = tf.keras.models.load_model(model_path)

    print("Preprocessing the data...")
    last_row = last_row.drop(axis=0, labels=['_id', 'location_id', 'potability'])
    last_row_values = last_row.values.astype('float32')
    last_row_values = np.expand_dims(last_row_values, axis=0)

    print("Making predictions...")
    y_pred = model.predict(last_row_values)

    # Interprete the prediction result
    if y_pred[0][0] == 0:
        result = "The water is not potable."
    else:
        result = "The water is potable."
    
    print(result)
    return y_pred

print(predict_water_potability('http://127.0.0.1:5000/','./Models/potability_model.keras'))
