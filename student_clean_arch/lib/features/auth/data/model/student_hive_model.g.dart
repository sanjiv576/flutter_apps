// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentHiveModelAdapter extends TypeAdapter<StudentHiveModel> {
  @override
  final int typeId = 0;

  @override
  StudentHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentHiveModel(
      studentId: fields[0] as String?,
      fname: fields[1] as String,
      lname: fields[2] as String,
      phone: fields[3] as String,
      batch: fields[4] as BatchHiveModel,
      courses: (fields[5] as List).cast<CourseHiveModel>(),
      username: fields[6] as String,
      password: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StudentHiveModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.studentId)
      ..writeByte(1)
      ..write(obj.fname)
      ..writeByte(2)
      ..write(obj.lname)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.batch)
      ..writeByte(5)
      ..write(obj.courses)
      ..writeByte(6)
      ..write(obj.username)
      ..writeByte(7)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
