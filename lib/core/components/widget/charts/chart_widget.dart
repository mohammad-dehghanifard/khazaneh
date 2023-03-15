import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:khazaneh/core/constant/colors/app_colors.dart';
import 'package:khazaneh/controller/transaction/transaction_controller.dart';

class AppChart extends StatefulWidget {
  const AppChart({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;
  final TransactionController transactionController = Get.put(TransactionController());
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return AspectRatio(
      aspectRatio: 1.3,
      child: Container(
        color: AppColors.scaffoldColor,
        child: Row(
          children: <Widget>[
            const SizedBox(
              height: 18,
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget>[
                Indicator(
                  color: AppColors.greenColor,
                  text: 'دریافتی امسال',
                  textTheme: textTheme,
                  isSquare: false,
                ),
                SizedBox(
                  height: 6,
                ),
                Indicator(
                  color: AppColors.redColor,
                  text: 'پرداختی های امسال',
                  textTheme: textTheme,
                  isSquare: false,
                ),
                SizedBox(
                  height: 64,
                ),
              ],
            ),
            const SizedBox(width: 32),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      },
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 40,
                    sections: showingSections(),
                  ),
                ),
              ),
            ),

            const SizedBox(
              width: 28,
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColors.greenColor,
            value: transactionController.receiptYearCalculator().toDouble(),
            title: '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.redColor,
            value: transactionController.paymentYearCalculator().toDouble(),
            title: '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );

        default:
          throw Error();
      }
    });
  }
}


class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
    required this.textTheme,
    required this.isSquare,
    this.size = 16,
  });
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final  textTheme;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          text,
          style: textTheme.bodyText1,
        )
      ],
    );
  }
}