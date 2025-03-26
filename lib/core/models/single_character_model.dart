class SingleCharacterModel {
  SingleCharacterModel({
    required this.id,
    required this.name,
    required this.ki,
    required this.maxKi,
    required this.race,
    required this.gender,
    required this.description,
    required this.image,
    required this.affiliation,
    required this.deletedAt,
    required this.originPlanet,
    required this.transformations,
  });

  final int? id;
  final String? name;
  final String? ki;
  final String? maxKi;
  final String? race;
  final String? gender;
  final String? description;
  final String? image;
  final String? affiliation;
  final dynamic deletedAt;
  final OriginPlanet? originPlanet;
  final List<Transformation> transformations;

  factory SingleCharacterModel.fromJson(Map<String, dynamic> json){
    return SingleCharacterModel(
      id: json["id"],
      name: json["name"],
      ki: json["ki"],
      maxKi: json["maxKi"],
      race: json["race"],
      gender: json["gender"],
      description: json["description"],
      image: json["image"],
      affiliation: json["affiliation"],
      deletedAt: json["deletedAt"],
      originPlanet: json["originPlanet"] == null ? null : OriginPlanet.fromJson(json["originPlanet"]),
      transformations: json["transformations"] == null ? [] : List<Transformation>.from(json["transformations"]!.map((x) => Transformation.fromJson(x))),
    );
  }

}

class OriginPlanet {
  OriginPlanet({
    required this.id,
    required this.name,
    required this.isDestroyed,
    required this.description,
    required this.image,
    required this.deletedAt,
  });

  final int? id;
  final String? name;
  final bool? isDestroyed;
  final String? description;
  final String? image;
  final dynamic deletedAt;

  factory OriginPlanet.fromJson(Map<String, dynamic> json){
    return OriginPlanet(
      id: json["id"],
      name: json["name"],
      isDestroyed: json["isDestroyed"],
      description: json["description"],
      image: json["image"],
      deletedAt: json["deletedAt"],
    );
  }

}

class Transformation {
  Transformation({
    required this.id,
    required this.name,
    required this.image,
    required this.ki,
    required this.deletedAt,
  });

  final int? id;
  final String? name;
  final String? image;
  final String? ki;
  final dynamic deletedAt;

  factory Transformation.fromJson(Map<String, dynamic> json){
    return Transformation(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      ki: json["ki"],
      deletedAt: json["deletedAt"],
    );
  }

}
