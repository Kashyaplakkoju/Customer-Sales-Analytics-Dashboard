import pandas as pd
import numpy as np
import random
from datetime import datetime, timedelta

# Parameters
n = 1000
start_date = datetime(2024, 1, 1)
products = ["Laptop", "Headphones", "Keyboard", "Mouse", "Monitor", "Charger"]
categories = {
    "Laptop": "Electronics",
    "Headphones": "Accessories",
    "Keyboard": "Accessories",
    "Mouse": "Accessories",
    "Monitor": "Electronics",
    "Charger": "Accessories"
}

data = []
for i in range(1, n+1):
    order_id = i
    customer_id = random.randint(1000, 2000)
    order_date = start_date + timedelta(days=random.randint(0, 365))
    product = random.choice(products)
    category = categories[product]
    quantity = random.randint(1, 5)
    price = round(random.uniform(20, 1000), 2)
    revenue = quantity * price
    defect_status = np.random.choice(["No Defect", "Defective"], p=[0.9, 0.1])
    
    data.append([order_id, customer_id, order_date, product, category, quantity, price, revenue, defect_status])

df = pd.DataFrame(data, columns=["OrderID", "CustomerID", "OrderDate", "Product", "Category", "Quantity", "Price", "Revenue", "DefectStatus"])
df.to_csv("sales_data.csv", index=False)

print("✅ sales_data.csv generated with", len(df), "records.")
print(df.head())
