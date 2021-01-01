class Info {
  final List<dynamic> diseaseInfos;

  Info({this.diseaseInfos});

  factory Info.fromJson(Map<String, dynamic> json) {
    var list = json['disease'] as List;
    print(list.runtimeType); //returns List<dynamic>
    List<DiseaseInfo> diseaseInfosList =
        list.map((i) => DiseaseInfo.fromJson(i)).toList();

    return Info(
      diseaseInfos: diseaseInfosList,
    );
  }
}

class DiseaseInfo {
  final String name;
  final String intro;
  final String cause1;
  final String cause2;
  final String cause3;
  final String solution1;
  final String solution2;
  final String solution3;

  DiseaseInfo(
      {this.name,
      this.intro,
      this.cause1,
      this.cause2,
      this.cause3,
      this.solution1,
      this.solution2,
      this.solution3});

  factory DiseaseInfo.fromJson(Map<String, dynamic> json) {
    return DiseaseInfo(
      name: json['name'],
      intro: json['intro'],
      cause1: json['cause1'],
      cause2: json['cause2'],
      cause3: json['cause3'],
      solution1: json['solution1'],
      solution2: json['solution2'],
      solution3: json['solution3'],
    );
  }
}

//Ref: https://medium.com/flutter-community/parsing-complex-json-in-flutter-747c46655f51
