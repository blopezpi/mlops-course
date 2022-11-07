curl -d '{"concavity_mean": 0.3001, "concave_points_mean": 0.1471, "perimeter_se": 8.589, "area_se": 153.4, "texture_worst": 17.33, "area_worst": 2019.0}' \
-H "Content-Type: application/json" \
-X POST http://127.0.0.1:8000/predict
