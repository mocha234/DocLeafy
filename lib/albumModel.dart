class Album {
  // final List tagId;
  //final String tagName;
  
  final String id;
  final String project;
  final String iteration;
  final String created;
  final List<dynamic> predictions;

  Album({this.id, this.project, this.iteration, this.created, this.predictions});

  factory Album.fromJson(Map<String, dynamic> json) {
    var list = json['predictions'] as List;
    print(list.runtimeType); //returns List<dynamic>
    List<Predictions> predictionList =
        list.map((i) => Predictions.fromJson(i)).toList();

   

    return Album(
      id: json['id'],
      project: json['project'],
      iteration: json['iteration'],
      created: json['created'],
      predictions: predictionList,
    );

  }
}

class Predictions {
  final double probability;
  final String tagId;
  final String tagName;
  Predictions({this.probability, this.tagId, this.tagName});

  factory Predictions.fromJson(Map<String, dynamic> json) {
    return Predictions(
        probability: json['probability'],
        tagId: json['tagId'],
        tagName: json['tagName']);
  }
}

//Ref: https://medium.com/flutter-community/parsing-complex-json-in-flutter-747c46655f51
