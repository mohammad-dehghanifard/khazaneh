import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:khazaneh/constant/database_key.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:khazaneh/model/transaction/transaction_model.dart';
import 'package:share_plus/share_plus.dart';

class HomeController extends GetxController{
  final box = GetStorage();

shareApp() => Share.share('سلام من برای مدیریت مالی هزینه های شخصی خودم از خزانه استفاده میکنم. به تو هم پیشنهاد میکنم ازش استفاده کنی!');

 hiveDataBaseInit() async {
   await Hive.initFlutter();
   Hive.registerAdapter(TransactionEntityAdapter());
   Hive.openBox<TransactionEntity>(DataBaseKey.transactionHiveKey);
 }

}