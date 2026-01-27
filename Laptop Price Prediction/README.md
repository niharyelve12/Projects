# 💻 Laptop Price Prediction App

A Machine Learning–based web application that predicts laptop prices based on hardware specifications. The project compares multiple regression models, selects the best-performing one, and deploys it using **Streamlit**.

This repository includes:
- Jupyter notebooks for EDA, preprocessing, and model comparison
- Trained regression model
- CSV datasets
- Two Streamlit apps (Free selection & Controlled selection)
- Screenshots of the application UI

---

## 🚀 Project Features

### 🔹 Model Training & Selection
- Trains and evaluates **multiple regression models**
- Compares models using performance metrics (R², MAE, RMSE, etc.)
- Automatically selects the **best-performing model** for deployment

### 🔹 Streamlit Applications

#### **App 1 – Free Configuration**
- Mix and match **any laptop components** freely
- Example: Any brand with any CPU, RAM, GPU, etc.
- Useful for experimentation and exploration

#### **App 2 – Controlled Configuration**
- Enforces **real-world constraints**
- Example:
  - Apple → Only Apple A-series processors
  - No invalid brand–CPU combinations
- Produces more **realistic price predictions**

---

## 📂 Project Structure

```
Laptop-Price-Prediction/
│
├── notebooks/
│   ├── Final-LaptopPricePrediction.ipynb
│   └── model_training.ipynb
│
├── data/
│   ├── laptop_data.csv
│   └── processed_data.csv
│
├── streamlit_apps/
│   ├── app_free.py        # App 1: Free selection
│   └── app_controlled.py  # App 2: Controlled selection
│
├── screenshots/
│   └── app_ui.png
│
├── requirements.txt
├── README.md
└── .gitignore
```

---

## 🧠 Tech Stack

- **Python 3.9+**
- **Pandas, NumPy** – Data handling
- **Scikit-learn** – Model training & evaluation
- **Matplotlib / Seaborn** – Visualization
- **Streamlit** – Web app deployment

---

## 🛠️ How to Run the Project (VS Code)

### 1️⃣ Clone the Repository
```bash
git clone <your-repo-url>
cd Laptop-Price-Prediction
```

### 2️⃣ Create a Virtual Environment (Recommended)

#### Windows
```bash
python -m venv venv
venv\Scripts\activate
```

#### macOS / Linux
```bash
python3 -m venv venv
source venv/bin/activate
```

### 3️⃣ Install Dependencies
```bash
pip install -r requirements.txt
```

### 4️⃣ Run Streamlit App

#### Free Selection App
```bash
streamlit run streamlit_apps/app_free.py
```

#### Controlled Selection App
```bash
streamlit run streamlit_apps/app_controlled.py
```

The app will open automatically in your browser 🌐

---

## 📊 Dataset
- Contains laptop specifications such as:
  - Brand
  - CPU
  - RAM
  - Storage
  - GPU
  - Operating System
- Target variable: **Laptop Price**

All CSV files are included in the repository.

---

## 📸 Screenshots
Screenshots of the Streamlit UI are available in the `screenshots/` folder.

---

## ⚠️ Notes
- Always activate the **virtual environment** before running the app
- Ensure compatible Python version is installed
- Predictions are **estimates**, not exact market prices

---

## 🤝 Contributions
Feel free to fork the repository, open issues, or submit pull requests.

---

## 📜 License
This project is for **educational and learning purposes**.

---

✨ Happy Predicting!

