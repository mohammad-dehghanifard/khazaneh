import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:khazaneh/core/constant/colors/app_colors.dart';
import 'package:khazaneh/core/constant/routes/app_route.dart';
import 'package:khazaneh/controller/home/home_controller.dart';
import 'package:khazaneh/view/more_service/calculator/calculator_screen.dart';
import 'package:khazaneh/view/more_service/main_screen/more_service_main.dart';
import 'package:khazaneh/view/more_service/profit_calculation_screen/profit_calculation_screen.dart';
import 'package:khazaneh/view/splash/splash_screen.dart';
import 'package:khazaneh/view/transactions/add_edit_transaction_screen.dart';
import 'package:khazaneh/view/details/creator_screen.dart';
import 'package:khazaneh/view/details/help_screen/help_screen.dart';
import 'package:khazaneh/view/home/home_screen.dart';
import 'package:khazaneh/view/main/main_screen.dart';
import 'package:khazaneh/view/register/register_screen.dart';
import 'package:khazaneh/view/transactions/transaction_information_screen.dart';
import 'package:khazaneh/view/transactions/transaction_list_screen.dart';


void main() async {
  final HomeController homeController = Get.put(HomeController());
  homeController.initialHiveDatabase();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        locale: const Locale("fa"),
        getPages: [
        GetPage(name: RouteAPP.routeHomeScreen, page: () => const HomeScreen()),
        GetPage(name: RouteAPP.routeRegisterScreen, page: () =>  RegisterScreen()),
        GetPage(name: RouteAPP.routeAddOrEditTransactionScreen, page: () =>  const AddOrEditTransaction()),
        GetPage(name: RouteAPP.routeTransactionListScreen, page: () =>  TransactionListScreen()),
        GetPage(name: RouteAPP.routeTransactionInformationScreen, page: () =>  TransactionInformation()),
        GetPage(name: RouteAPP.routeMainScreen, page: () =>  MainScreen()),
        GetPage(name: RouteAPP.creatorMainScreen, page: () =>  CreatorScreen()),
        GetPage(name: RouteAPP.routeHelpScreen, page: () =>  HelpScreen()),
        GetPage(name: RouteAPP.moreServiceMainScreen, page: () => const MainMoreService()),
        GetPage(name: RouteAPP.calculateScreen, page: () => const CalculatorScreen()),
        GetPage(name: RouteAPP.profitCalculationScreen, page: () => const ProfitCalculationScreen()),
        ],
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.appBtnColor),
                  minimumSize: const MaterialStatePropertyAll(Size(335,37))
              )),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.primaryColor,width: 1)),
            enabledBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.primaryColor,width: 1)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primaryColor,width: 1),
              borderRadius: BorderRadius.circular(8),),
          ),

          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen());
  }
}
