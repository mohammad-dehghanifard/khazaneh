import 'package:hive/hive.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 1)
class TransactionEntity extends HiveObject {
  @HiveField(0)
  String title = '';
  @HiveField(1)
  int price = 0;
  @HiveField(2)
  String date = '';
  @HiveField(3)
  TransactionType transactionType = TransactionType.receipt;
}
@HiveType(typeId: 2)
enum TransactionType{
  @HiveField(0)
  payment,
  @HiveField(1)
  receipt 
}