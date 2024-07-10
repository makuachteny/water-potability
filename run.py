import requests
import pandas as pd
import json
import tensorflow as tf
import numpy as np

url = "http://127.0.0.1:5000/"
response = requests.get(url)

df = pd.DataFrame(data)

# Get the last row of the dataframe
last_row = df.iloc[-1]

# Load the model
model = tf.keras.models.load_model('./Models/potability_model.keras')

last_row = last_row.drop(axis=0, labels=['_id', 'location_id', 'potability'])

last_row_values = last_row.values.astype('float32')

last_row_values = np.expand_dims(last_row_values, axis=0)

y_pred = model.predict(last_row_values)

print(y_pred)
