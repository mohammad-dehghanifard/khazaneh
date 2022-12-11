import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:khazaneh/constant/app_route.dart';
import 'package:khazaneh/constant/database_key.dart';
import 'package:khazaneh/controller/home/home_controller.dart';
import 'package:khazaneh/gen/fonts.gen.dart';
import 'package:khazaneh/model/transaction/transaction_model.dart';
import 'package:khazaneh/view/add_edit_transaction_screen.dart';
import 'package:khazaneh/view/home_screen.dart';
import 'package:khazaneh/view/main_screen.dart';
import 'package:khazaneh/view/register_screen.dart';
import 'package:khazaneh/view/splash_screen.dart';
import 'package:khazaneh/view/transaction_information_screen.dart';
import 'package:khazaneh/view/transaction_list_screen.dart';

import 'components/app_colors.dart';

void main() async {
  final HomeController homeController = Get.put(HomeController());
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionEntityAdapter());
  Hive.registerAdapter(TransactionTypeAdapter());
  Hive.openBox<TransactionEntity>(DataBaseKey.transactionHiveKey);
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const defaultFontFamily = FontFamily.iranSans;
    return GetMaterialApp(
        locale: const Locale("fa"),
        getPages: [
        GetPage(name: RouteAPP.routeHomeScreen, page: () =>  HomeScreen()),
        GetPage(name: RouteAPP.routeRegisterScreen, page: () =>  RegisterScreen()),
        GetPage(name: RouteAPP.routeAddOrEditTransactionScreen, page: () =>  AddOrEditTransaction()),
        GetPage(name: RouteAPP.routeTransactionListScreen, page: () =>  TransactionListScreen()),
        GetPage(name: RouteAPP.routeTransactionInformationScreen, page: () =>  TransactionInformation()),
        GetPage(name: RouteAPP.routeMainScreen, page: () => const MainScreen()),
        ],
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.appBtnColor))),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: AppColors.lightGrayColor,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(24)),
          ),
          textTheme:  const TextTheme(
              bodyText2: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
              bodyText1: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontSize: 18,
                  fontWeight: FontWeight.w200,
                  color: AppColors.lightGrayColor),
              headline1: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white
              ),
              headline2: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
              subtitle1: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.scaffoldColor),
              button: TextStyle(
                fontFamily: defaultFontFamily,
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
              caption: TextStyle(
                fontFamily: defaultFontFamily,
                fontSize: 14,
                fontWeight: FontWeight.w200,

              )

          ),
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen());
  }
}
