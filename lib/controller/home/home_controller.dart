import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:khazaneh/constant/database_key.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:khazaneh/model/transaction/transaction_model.dart';

class HomeController extends GetxController{
  final box = GetStorage();

 String loadUserName(){
   return box.read(DataBaseKey.saveUsernameKey);
 }

 String loadUserImage(){
   return box.read(DataBaseKey.saveUserImageKey);
 }

 hiveDataBaseInit() async {
   await Hive.initFlutter();
   Hive.registerAdapter(TransactionEntityAdapter());
   Hive.openBox<TransactionEntity>(DataBaseKey.transactionHiveKey);
 }

}