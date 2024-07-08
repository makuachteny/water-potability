from fastapi import FastAPI, Depends
from pydantic import BaseModel, Field
import numpy as np
import tensorflow as tf

# Load the machine learning model
model = tf.keras.models.load_model('./models/potability_model.keras')

# FastAPI decorator to create the app object
app = FastAPI()

# Define the Pydantic model for request body


class InputData(BaseModel):
    ph: float = Field(..., gt=0, lt=14, description="pH value")
    Hardness: float = Field(..., gt=0, lt=300, description="Hardness value")
    Solids: float = Field(..., gt=0, lt=200000, description="Solids value")
    Chloramines: float = Field(..., gt=0, lt=30,
                               description="Chloramines value")
    Sulfate: float = Field(..., gt=0, lt=500, description="Sulfate value")
    Conductivity: float = Field(..., gt=0, lt=500,
                                description="Conductivity value")
    Organic_carbon: float = Field(..., gt=0, lt=30,
                                  description="Organic carbon value")
    Trihalomethanes: float = Field(..., gt=0,
                                   lt=200, description="Trihalomethanes value")
    Turbidity: float = Field(..., gt=0, lt=200, description="Turbidity value")

# Define the root route


@app.get("/")
def root():
    return {"message": "Hello World"}

# Define the predict route


@app.post("/predict")
def predict(data: InputData = Depends()):
    # Extract features from input data
    features = np.array([[
        data.ph, data.Hardness, data.Solids, data.Chloramines, data.Sulfate,
        data.Conductivity, data.Organic_carbon, data.Trihalomethanes, data.Turbidity
    ]]).reshape(1, -1)

    # Make prediction
    prediction = model.predict(features)[0]

    # Assuming the prediction is a probability, convert it to a binary class
    predicted_class = int(prediction >= 0.5)  # Change this threshold as needed

    # Return prediction
    return {"prediction": predicted_class}


if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8000)
