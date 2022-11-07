import pandas as pd
import joblib

from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import Ridge


df = pd.read_csv("https://raw.githubusercontent.com/noahgift/functional_intro_to_python/master/data/mlb_weight_ht.csv")

df = df.dropna()

df.rename(index=str,
          columns={"Height(inches)": "Height", "Weight(pounds)": "Weight"},
          inplace=True)

df_positions = df.groupby("Position").median()
df_positions.reset_index(inplace=True)
df_positions

var = df['Height'].values

y = df['Height'].values
y = y.reshape(-1, 1)
X = df['Weight'].values
X = X.reshape(-1, 1)


scaler = StandardScaler()

X_scaler = scaler.fit(X)

X = X_scaler.transform(X)

y_scaler = scaler.fit(y)

y = y_scaler.transform(y)

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.1)

clf = Ridge()
model = clf.fit(X_train, y_train)
predictions = clf.predict(X_test)

df_predictions = pd.DataFrame(predictions)
df.describe()

model.score(X_test, y_test)

joblib.dump(model, 'model/height_model.joblib')
