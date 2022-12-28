// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionEntityAdapter extends TypeAdapter<TransactionEntity> {
  @override
  final int typeId = 1;

  @override
  TransactionEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionEntity()
      ..title = fields[0] as String
      ..price = fields[1] as int
      ..date = fields[2] as String
      ..transactionType = fields[3] as TransactionType;
  }

  @override
  void write(BinaryWriter writer, TransactionEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.transactionType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TransactionTypeAdapter extends TypeAdapter<TransactionType> {
  @override
  final int typeId = 2;

  @override
  TransactionType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TransactionType.payment;
      case 1:
        return TransactionType.receipt;
      default:
        return TransactionType.payment;
    }
  }

  @override
  void write(BinaryWriter writer, TransactionType obj) {
    switch (obj) {
      case TransactionType.payment:
        writer.writeByte(0);
        break;
      case TransactionType.receipt:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
