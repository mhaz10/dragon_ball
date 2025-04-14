// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_character_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SingleCharacterModelAdapter extends TypeAdapter<SingleCharacterModel> {
  @override
  final int typeId = 0;

  @override
  SingleCharacterModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SingleCharacterModel(
      id: fields[0] as int?,
      name: fields[1] as String?,
      ki: fields[2] as String?,
      maxKi: fields[3] as String?,
      race: fields[4] as String?,
      gender: fields[5] as String?,
      description: fields[6] as String?,
      image: fields[7] as String?,
      affiliation: fields[8] as String?,
      deletedAt: fields[9] as dynamic,
      originPlanet: fields[10] as OriginPlanet?,
      transformations: (fields[11] as List).cast<Transformation>(),
    );
  }

  @override
  void write(BinaryWriter writer, SingleCharacterModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.ki)
      ..writeByte(3)
      ..write(obj.maxKi)
      ..writeByte(4)
      ..write(obj.race)
      ..writeByte(5)
      ..write(obj.gender)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.image)
      ..writeByte(8)
      ..write(obj.affiliation)
      ..writeByte(9)
      ..write(obj.deletedAt)
      ..writeByte(10)
      ..write(obj.originPlanet)
      ..writeByte(11)
      ..write(obj.transformations);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SingleCharacterModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OriginPlanetAdapter extends TypeAdapter<OriginPlanet> {
  @override
  final int typeId = 1;

  @override
  OriginPlanet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OriginPlanet(
      id: fields[0] as int?,
      name: fields[1] as String?,
      isDestroyed: fields[2] as bool?,
      description: fields[3] as String?,
      image: fields[4] as String?,
      deletedAt: fields[5] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, OriginPlanet obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.isDestroyed)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.deletedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OriginPlanetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TransformationAdapter extends TypeAdapter<Transformation> {
  @override
  final int typeId = 2;

  @override
  Transformation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Transformation(
      id: fields[0] as int?,
      name: fields[1] as String?,
      image: fields[2] as String?,
      ki: fields[3] as String?,
      deletedAt: fields[4] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Transformation obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.ki)
      ..writeByte(4)
      ..write(obj.deletedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransformationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
