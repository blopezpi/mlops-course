from pydantic import BaseModel, Field


# Input for data validation
class Input(BaseModel):
    concavity_mean: float = Field(..., gt=0)
    concave_points_mean: float = Field(..., gt=0)
    perimeter_se: float = Field(..., gt=0)
    area_se: float = Field(..., gt=0)
    texture_worst: float = Field(..., gt=0)
    area_worst: float = Field(..., gt=0)

    class Config:
        schema_extra = {
            "concavity_mean": 0.3001,
            "concave_points_mean": 0.1471,
            "perimeter_se": 8.589,
            "area_se": 153.4,
            "texture_worst": 17.33,
            "area_worst": 2019.0,
        }


# Ouput for data validation
class Output(BaseModel):
    label: str
    prediction: int
