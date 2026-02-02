import streamlit as st
import pandas as pd
import pickle
import numpy as np

# ================= LOAD ARTIFACTS =================
model = pickle.load(open('model.pkl', 'rb'))
label_encoders = pickle.load(open('label_encoders.pkl', 'rb'))  # dict
scaler = pickle.load(open('scaler.pkl', 'rb'))
columns = pickle.load(open('columns.pkl', 'rb'))

# ================= PAGE CONFIG =================
st.set_page_config(
    page_title="Laptop Price Predictor",
    layout="centered"
)

st.title("💻 Laptop Price Prediction")
st.write("Select laptop specifications to predict the price")

# ================= CATEGORICAL COLUMNS =================
cat_cols = ['brand', 'harddisk', 'cpu', 'ram', 'OS', 'graphics']

# ================= INPUT DROPDOWNS =================
brand = st.selectbox("Brand", label_encoders['brand'].classes_)
harddisk = st.selectbox("Hard Disk", label_encoders['harddisk'].classes_)
cpu = st.selectbox("CPU", label_encoders['cpu'].classes_)
ram = st.selectbox("RAM", label_encoders['ram'].classes_)
os = st.selectbox("Operating System", label_encoders['OS'].classes_)
graphics = st.selectbox("Graphics", label_encoders['graphics'].classes_)

# ================= CREATE INPUT DATAFRAME =================
input_df = pd.DataFrame([{
    'brand': brand,
    'harddisk': harddisk,
    'cpu': cpu,
    'ram': ram,
    'OS': os,
    'graphics': graphics
}])

# ================= SAFE LABEL ENCODING =================
def safe_label_encode(le, value):
    return le.transform([value])[0] if value in le.classes_ else -1

# ================= PREDICTION =================
if st.button("Predict Price 💰"):
    try:
        # Encode each column
        for col in cat_cols:
            input_df[col] = safe_label_encode(label_encoders[col], input_df[col][0])

        # Ensure column order
        input_df = input_df[columns]

        # Scale
        input_scaled = scaler.transform(input_df)

        # Predict
        prediction = model.predict(input_scaled)

        st.success(f"💵 Estimated Laptop Price: $ {prediction[0]:,.2f}")

    except Exception as e:
        st.error(f"Error: {e}")
