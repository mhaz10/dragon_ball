class CharactersModel {
  CharactersModel({
    required this.items,
    required this.meta,
    required this.links,
  });

  final List<Item> items;
  final Meta? meta;
  final Links? links;

  factory CharactersModel.fromJson(Map<String, dynamic> json){
    return CharactersModel(
      items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      links: json["links"] == null ? null : Links.fromJson(json["links"]),
    );
  }

}

class Item {
  Item({
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

  factory Item.fromJson(Map<String, dynamic> json){
    return Item(
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
    );
  }

}

class Links {
  Links({
    required this.first,
    required this.previous,
    required this.next,
    required this.last,
  });

  final String? first;
  final String? previous;
  final String? next;
  final String? last;

  factory Links.fromJson(Map<String, dynamic> json){
    return Links(
      first: json["first"],
      previous: json["previous"],
      next: json["next"],
      last: json["last"],
    );
  }

}

class Meta {
  Meta({
    required this.totalItems,
    required this.itemCount,
    required this.itemsPerPage,
    required this.totalPages,
    required this.currentPage,
  });

  final int? totalItems;
  final int? itemCount;
  final int? itemsPerPage;
  final int? totalPages;
  final int? currentPage;

  factory Meta.fromJson(Map<String, dynamic> json){
    return Meta(
      totalItems: json["totalItems"],
      itemCount: json["itemCount"],
      itemsPerPage: json["itemsPerPage"],
      totalPages: json["totalPages"],
      currentPage: json["currentPage"],
    );
  }

}