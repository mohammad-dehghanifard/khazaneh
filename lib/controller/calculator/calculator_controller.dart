import 'package:get/state_manager.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculateController extends GetxController{
RxString userInput = "0".obs;
RxString userOutput = "".obs;

final List<String> operators = [
  "C",
  "DEL",
  "%",
  "/",
  "9",
  "8",
  "7",
  "x",
  "6",
  "5",
  "4",
  "-",
  "3",
  "2",
  "1",
  "+",
  "0",
  ".",
  "^",
  "=",
];

// محسابه کردن
calculate(){
  try{
    String result = userOutput.value;
    result = result.replaceAll("x", "*");
    Parser parser = Parser();
    Expression expression = parser.parse(result);
    ContextModel contextModel = ContextModel();
    double calculateResult = expression.evaluate(EvaluationType.REAL, contextModel);
    userOutput.value = calculateResult.toString();
  }catch(e){

  }
}
//حذف تمام اطلاعات
clearInputAndOutPut(){
  userInput.value = '';
  userOutput.value = '';
}
//حذف اخرین عدد ورودی کاربر
deleteLastNumber(){
  if(userInput.isNotEmpty){
    //از اولین کاراکتر تا کاراکتر یکی مونده به اخر رو جدا میکنه
    userInput.value = userInput.substring(0,userInput.value.length - 1);
  }
}
//فشرده شدن دکمه ها
onBtnPressed(int index) => userInput.value += operators[index];


}