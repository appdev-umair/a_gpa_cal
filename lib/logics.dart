import 'package:a_gpa_cal/InputWidget.dart';
import 'package:a_gpa_cal/main.dart';

class GPA {
  late double sumPC;
  late double sumCH;

  String calculateGPA() {
    sumPC = 0;
    sumCH = 0;

    qualityPoints.forEach((element) {
      sumPC += double.parse("0${element}");
    });

    creditHoursList.forEach((element) {
      sumCH += double.parse("0$element");
    });
    String gpa = "0.0";
    try {
      gpa = (sumPC / sumCH).toString().substring(0, 4);
    } catch (e) {
      gpa = "${sumPC / sumCH}";
      gpa = (gpa.contains("NaN")) ? "0.0" : gpa;
    }
    return gpa;
  }

  String calCGPA() {
    double oldQualityPoints = double.parse("0${currentCGPA.text}") *
        double.parse("0${totalCreditHours.text}");

    double newQualityPoints = double.parse(calculateGPA()) * sumCH;
    String cgpa = "0.0";
    try {
      cgpa =
          "0${((oldQualityPoints + newQualityPoints) / (sumCH + double.parse("0${totalCreditHours.text}"))).toString().substring(0, 4)}";
    } catch (e) {
      cgpa =
          "0${((oldQualityPoints + newQualityPoints) / (sumCH + double.parse("0${totalCreditHours.text}")))}";
    }

    return cgpa;
  }
}
