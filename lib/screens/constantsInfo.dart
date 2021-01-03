// Plant and their indices
// 0 -> Tomato
// 1 -> Strawberry

const Map<int, Map<String, int>> diseaseIndexMapping = {
  0: {
    "Bacterial Spot": 0,
    "Early Blight": 1,
    "Late Blight": 2,
    "Leaf Mold": 3,
    "Mosaic Virus": 4,
    "Septoria Leaf Spot": 5,
    "Spider Mites": 6,
    "Target Spot": 7,
    "Yellow Leaf Curl Virus": 8,
    "Healthy": 9
  },
  1: {
    "Bacterial Spot": 0,
    "Early Blight": 1,
    "Late Blight": 2,
    "Leaf Mold": 3,
    "Mosaic Virus": 4,
    "Septoria Leaf Spot": 5,
    "Spider Mites": 6,
    "Target Spot": 7,
    "Yellow Leaf Curl Virus": 8,
    "Healthy": 9
  }
};

const Map<int, Map<String, String>> projectAPI = {
  //Index must match categoriesMap

  0: {
    "APIEndpoint":
        "https://southcentralus.api.cognitive.microsoft.com/customvision/v3.0/Prediction/c1e64998-1818-447c-aaaf-c843556c689d/classify/iterations/Iteration1/image",
    "Prediction-Key": "c7b138e5496f410ca88bafff534d13da",
    "Content-Type": "application/octet-stream"
  },
  1:
      //placeholder while waiting for real straberry's API Endpoint
      {
    "APIEndpoint":
        "https://southcentralus.api.cognitive.microsoft.com/customvision/v3.0/Prediction/c1e64998-1818-447c-aaaf-c843556c689d/classify/iterations/Iteration1/image",
    "Prediction-Key": "c7b138e5496f410ca88bafff534d13da",
    "Content-Type": "application/octet-stream"
  }
};

const String jsonInfoApi = "https://jsonkeeper.com/b/LOHJ";

const Map<int, Map<String, String>> plantName = {
  0: {"name": "Tomato", "imagePath": "assets/images/tomatoIcon.png"},
  1: {"name": "Strawberry", "imagePath": "assets/images/strawberryIcon.png"}
};
