import requests
import pandas as pd
from sklearn.externals import joblib

url = "https://api.example.com/data"
response = requests.get(url)
data = response.json()

df = pd.DataFrame(data)

X = df[['ph', 'Hardness', 'Solids','Chloramines','Sulfate','Conductivity','Organic_carbon','Trihalomethanes', 'Turbidity', 'Potability']] 


model = joblib.load('models/potability_model.keras')


y_pred = model.predict(X)


print(y_pred)