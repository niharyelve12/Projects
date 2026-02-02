import streamlit as st
import pandas as pd
import pickle

# ================= PAGE CONFIG =================
st.set_page_config(
    page_title="Laptop Price Predictor",
    layout="centered"
)

st.title("💻 Laptop Price Prediction")
st.write("Select laptop specifications to predict the price")

# ================= LOAD MODEL ARTIFACTS =================
model = pickle.load(open("model.pkl", "rb"))
label_encoders = pickle.load(open("label_encoders.pkl", "rb"))  # dict
scaler = pickle.load(open("scaler.pkl", "rb"))
columns = pickle.load(open("columns.pkl", "rb"))

# ================= LOAD TRAINING DATA =================
df = pd.read_csv("cleanlaptop.csv")

# ================= CREATE DEPENDENCY MAPS =================
brand_cpu_map = df.groupby("brand")["cpu"].unique().to_dict()
brand_ram_map = df.groupby("brand")["ram"].unique().to_dict()
brand_os_map = df.groupby("brand")["OS"].unique().to_dict()
brand_graphics_map = df.groupby("brand")["graphics"].unique().to_dict()
brand_harddisk_map = df.groupby("brand")["harddisk"].unique().to_dict()

# ================= INPUT DROPDOWNS =================
brand = st.selectbox("Brand", sorted(df["brand"].unique()))

cpu = st.selectbox(
    "CPU",
    sorted(map(str, brand_cpu_map.get(brand, [])))
)

ram = st.selectbox(
    "RAM",
    sorted(map(str, brand_ram_map.get(brand, [])))
)

harddisk = st.selectbox(
    "Hard Disk",
    sorted(map(str, brand_harddisk_map.get(brand, [])))
)

os = st.selectbox(
    "Operating System",
    sorted(map(str, brand_os_map.get(brand, [])))
)

graphics = st.selectbox(
    "Graphics",
    sorted(map(str, brand_graphics_map.get(brand, [])))
)

# ================= INPUT DATAFRAME =================
input_df = pd.DataFrame([{
    "brand": brand,
    "harddisk": harddisk,
    "cpu": cpu,
    "ram": ram,
    "OS": os,
    "graphics": graphics
}])

# ================= SAFE LABEL ENCODING =================
def safe_label_encode(le, value):
    return le.transform([value])[0] if value in le.classes_ else -1

# ================= PREDICTION =================
if st.button("Predict Price 💰"):
    try:
        # Encode categorical columns one by one
        for col in columns:
            input_df[col] = safe_label_encode(label_encoders[col], input_df[col][0])

        # Scale
        input_scaled = scaler.transform(input_df)

        # Predict
        prediction = model.predict(input_scaled)

        st.success(f"💵 Estimated Laptop Price: $ {prediction[0]:,.2f}")

    except Exception as e:
        st.error(f"Prediction failed: {e}")
