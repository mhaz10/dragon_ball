import 'package:hive/hive.dart';

part 'single_character_model.g.dart';

@HiveType(typeId: 0)
class SingleCharacterModel extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? ki;

  @HiveField(3)
  String? maxKi;

  @HiveField(4)
  String? race;

  @HiveField(5)
  String? gender;

  @HiveField(6)
  String? description;

  @HiveField(7)
  String? image;

  @HiveField(8)
  String? affiliation;

  @HiveField(9)
  dynamic deletedAt;

  @HiveField(10)
  OriginPlanet? originPlanet;

  @HiveField(11)
  List<Transformation> transformations;

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


@HiveType(typeId: 1)
class OriginPlanet extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  bool? isDestroyed;

  @HiveField(3)
  String? description;

  @HiveField(4)
  String? image;

  @HiveField(5)
  dynamic deletedAt;

  OriginPlanet({
    required this.id,
    required this.name,
    required this.isDestroyed,
    required this.description,
    required this.image,
    required this.deletedAt,
  });

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


@HiveType(typeId: 2)
class Transformation extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? image;

  @HiveField(3)
  String? ki;

  @HiveField(4)
  dynamic deletedAt;

  Transformation({
    required this.id,
    required this.name,
    required this.image,
    required this.ki,
    required this.deletedAt,
  });

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
