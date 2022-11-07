import os

from pymongo import MongoClient


client = MongoClient(os.getenv("MONGO_URI", "mongodb://127.0.0.1:27017"))
database = client.get_database(os.getenv("MONGO_DB", "breast_cancer"))
collection = database[os.getenv("MONGO_COLLECTION", "results")]
