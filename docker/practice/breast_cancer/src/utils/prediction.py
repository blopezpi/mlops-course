from model.model import model


def predict(X, model):
    prediction = model.predict(X)[0]
    return prediction


def get_model_response(input):
    prediction = predict(input, model)
    if prediction == 1:
        label = "M"
    else:
        label = "B"
    return {
        'label': label,
        'prediction': int(prediction)
    }
