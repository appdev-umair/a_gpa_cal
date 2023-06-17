import 'package:a_gpa_cal/InputWidget.dart';
import 'package:a_gpa_cal/logics.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Home());
}

List<String> grade = ["Grade"];
List<String> cHours = ["C.hours"];
List<double> qualityPoints = [];

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String sgpa = "0";
  List<bool> _showField = [false];
  var _count = 1;
  TextEditingController currentCGPA = TextEditingController();
  TextEditingController totalCreditHours = TextEditingController();
  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 300);

    return Scaffold(
      appBar: AppBar(
        title: const Text("GPA Cal"),
        actions: [
          IconButton(
              onPressed: () async {
                if (_count >= 2) {
                  setState(() {
                    _count--;
                    _showField[_count - 1] = false;
                  });
                  await Future.delayed(Duration(milliseconds: 300));
                  setState(() {
                    grade.removeAt(_count - 1);
                    cHours.removeAt(_count - 1);
                    qualityPoints.removeAt(_count - 1);
                    creditHoursList.removeAt(_count - 1);
                    pointsController[_count - 1].text = "";
                  });
                }
              },
              icon: Icon(
                Icons.delete,
                size: 25,
              )),
          IconButton(
              onPressed: () {
                setState(() {
                  if (_count != 11) {
                    _showField[_count - 1] = true;
                    _showField.add(false);
                    grade.add("Grade");
                    cHours.add("C.hours");
                    pointsController.add(TextEditingController(text: ""));
                    creditHoursList.add(0);
                    _count++;
                    qualityPoints.add(0);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      showCloseIcon: true,
                      closeIconColor: Colors.white,
                      content: Text('Sorry, no more subjects will be added'),
                    ));
                  }
                });
              },
              icon: Icon(
                Icons.add,
                size: 30,
              )),
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: currentCGPA,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                          labelText: "Current CGPA",
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
                          labelText: "Total Credit Hours",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: _count,
              itemBuilder: (context, index) {
                return AnimatedSlide(
                    duration: duration,
                    offset: _showField[index] ? Offset(0, 0) : Offset(0, 2),
                    child: AnimatedOpacity(
                        duration: duration,
                        opacity: _showField[index] ? 1 : 0,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10, bottom: 10),
                          child: InputWidget(
                            index: index,
                          ),
                        )));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        foregroundColor: Colors.deepPurple,
        onPressed: () {
          setState(() {
            sgpa = calculateGPA();
          });
        },
        label: Text("Calculate"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      bottomNavigationBar: BottomAppBar(
          child: Container(
        color: Colors.deepPurple,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "SGPA: ${sgpa}",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        ]),
        height: 50,
      )),
    );
  }
}
