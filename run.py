import requests
import pandas as pd
from sklearn.externals import joblib

url = ""
response = requests.get(url)

df = pd.DataFrame(data)

X = df[['ph', 'Hardness', 'Solids','Chloramines','Sulfate','Conductivity','Organic_carbon','Trihalomethanes', 'Turbidity', 'Potability']] 
last_row = X.iloc[-1]

model = joblib.load('models/potability_model.keras')


y_pred = model.predict(last_row)


print(y_pred)