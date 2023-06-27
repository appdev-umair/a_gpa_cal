import 'package:a_gpa_cal/InputWidget.dart';
import 'package:flutter/material.dart';

import 'logics.dart';

void main(List<String> args) {
  runApp(const Home());
}

List<String> grade = ["Grade"];
List<String> cHours = ["C.hours"];
List<String> subjects = [
  "0",
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "10"
];
List<double> qualityPoints = [];
TextEditingController currentCGPA = TextEditingController();
TextEditingController totalCreditHours = TextEditingController();
List<TextEditingController> pointsController = [
  TextEditingController(text: "")
];
String sgpa = "0";
String cgpa = "0";
GPA gpa = GPA();

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _count = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GPA Cal"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () {
                  setState(() {
                    sgpa = gpa.calculateGPA();
                    cgpa = gpa.calculateGPA();
                    Future.delayed(Duration.zero, () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            actionsAlignment: MainAxisAlignment.center,
                            actionsPadding: EdgeInsets.all(0),
                            buttonPadding: EdgeInsets.all(0),
                            iconPadding: EdgeInsets.all(0),
                            content: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.deepPurple, width: 2),
                                  borderRadius: BorderRadius.circular(20)),
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("SGPA: $sgpa",
                                            style: TextStyle(
                                                color: Colors.deepPurple,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("CGPA: $cgpa",
                                            style: TextStyle(
                                                color: Colors.deepPurple,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    )
                                  ]),
                            ),
                            actions: <Widget>[
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.deepPurple,
                                ),
                                child: const Text(
                                  'Close',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    });
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: Text(
                  "Calculate",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Center(
                  child: Text(
                "Enter CGPA & Total Credit Hours Below\n (1st Semester Students Can Ignore It)",
                style: TextStyle(color: Colors.grey),
              )),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: currentCGPA,
                      decoration: InputDecoration(
                          labelText: "CGPA",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: totalCreditHours,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                          labelText: "Credit Hours",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: _count,
              itemBuilder: (context, index) {
                grade.add("Grade");
                cHours.add("C.hours");
                pointsController.add(TextEditingController(text: ""));
                creditHoursList.add(0);
                qualityPoints.add(0);
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
                  child: InputWidget(
                    index: index,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        color: Color(0xFF673AB7),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                tooltip: "Delete Subject",
                color: Colors.white,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                disabledColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () async {
                  if (_count >= 1) {
                    setState(() {
                      _count--;
                      grade.removeAt(_count);
                      cHours.removeAt(_count);
                      pointsController.removeAt(_count);
                      creditHoursList.removeAt(_count);
                      qualityPoints.removeAt(_count);
                    });
                  }
                },
                icon: const Icon(
                  Icons.delete,
                  size: 25,
                )),
            IconButton(
                tooltip: "Add Subject",
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                disabledColor: Colors.transparent,
                color: Colors.white,
                highlightColor: Colors.transparent,
                onPressed: () {
                  setState(() {
                    if (_count != 10) {
                      _count++;
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        showCloseIcon: true,
                        closeIconColor: Colors.white,
                        content: Text('Sorry, no more subjects will be added'),
                      ));
                    }
                  });
                },
                icon: const Icon(
                  Icons.add,
                  size: 30,
                )),
          ],
        ),
      )),
    );
  }
}
