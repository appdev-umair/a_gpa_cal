import 'package:a_gpa_cal/InputWidget.dart';
import 'package:a_gpa_cal/main.dart';

String calculateGPA() {
  double sumPC = 0;
  double sumCH = 0;
  qualityPoints.forEach((element) {
    sumPC += double.parse("0${element}");
  });
  creditHoursList.forEach((element) {
    sumCH += double.parse("0$element");
  });
  print("${sumPC}/${sumCH} = ${sumPC / sumCH}");

  return "${sumPC / sumCH}";
}
