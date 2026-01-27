import streamlit as st
import pandas as pd
import pickle
import numpy as np

# ================= LOAD ARTIFACTS =================
model = pickle.load(open('model.pkl', 'rb'))
oe = pickle.load(open('ordinal_encoders.pkl', 'rb'))  # OrdinalEncoder object
scaler = pickle.load(open('scaler.pkl', 'rb'))
columns = pickle.load(open('columns.pkl', 'rb'))

# ================= PAGE CONFIG =================
st.set_page_config(
    page_title="Laptop Price Predictor",
    layout="centered"
)

st.title("💻 Laptop Price Prediction")
st.write("Select laptop specifications to predict the price")

# ================= COLUMN ORDER (MUST MATCH TRAINING) =================
cat_cols = ['brand', 'harddisk', 'cpu', 'ram', 'OS', 'graphics']

# ================= INPUT DROPDOWNS =================
brand = st.selectbox("Brand", oe.categories_[0])
harddisk = st.selectbox("Hard Disk", oe.categories_[1])
cpu = st.selectbox("CPU", oe.categories_[2])
ram = st.selectbox("RAM", oe.categories_[3])
os = st.selectbox("Operating System", oe.categories_[4])
graphics = st.selectbox("Graphics", oe.categories_[5])

# ================= CREATE INPUT DATAFRAME =================
input_df = pd.DataFrame([{
    'brand': brand,
    'harddisk': harddisk,
    'cpu': cpu,
    'ram': ram,
    'OS': os,
    'graphics': graphics
}])

# ================= PREDICTION =================
if st.button("Predict Price 💰"):
    try:
        # Ordinal encode
        input_encoded = oe.transform(input_df)
        input_encoded = pd.DataFrame(input_encoded, columns=cat_cols)

        # Column safety
        input_encoded = input_encoded[columns]

        # Scale
        input_scaled = scaler.transform(input_encoded)

        # Predict
        prediction = model.predict(input_scaled)

        st.success(f"💵 Estimated Laptop Price: $ {prediction[0]:,.2f}")

    except Exception as e:
        st.error(f"Error: {e}")
