import 'package:a_gpa_cal/HomeScreen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Home());
}

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
  bool _showFab = false;
  var _count = 1;
  List<bool> _showSubject = [false];
  TextEditingController currentCGPA = TextEditingController();
  TextEditingController totalCreditHours = TextEditingController();
  List<String> grade = ["Grade"];
  List<String> _gradeList = [
    'Grade',
    'A+',
    'A',
    'B+',
    'B',
    'B-',
    'C+',
    "C",
    "D",
    "F"
  ];
  List<String> cHours = ["C.H"];
  List<String> _cHoursList = ['C.H', '1', '2', '3', '4', '5', '6'];
  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 300);

    return Scaffold(
      appBar: AppBar(
        title: const Text("A GPA Cal"),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: currentCGPA,
                      onChanged: (value) {
                        setState(() {
                          currentCGPA;
                          if (currentCGPA.text.isEmpty ||
                              totalCreditHours.text.isEmpty) {
                            _showFab = false;
                          } else {
                            _showFab = true;
                          }
                        });
                      },
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
                      controller: totalCreditHours,
                      onChanged: (value) {
                        setState(() {
                          totalCreditHours;
                          if (totalCreditHours.text.isEmpty ||
                              currentCGPA.text.isEmpty) {
                            _showFab = false;
                          } else {
                            _showFab = true;
                          }
                        });
                      },
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
              itemCount: _count,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return AnimatedSlide(
                    duration: duration,
                    offset: _showSubject[index] ? Offset.zero : Offset(0, 2),
                    child: AnimatedOpacity(
                        duration: duration,
                        opacity: _showSubject[index] ? 1 : 0,
                        child: Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Center(
                                      child: Container(
                                        padding:
                                            EdgeInsets.only(left: 5, right: 5),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.deepPurple,
                                                width: 2),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: DropdownButton<String>(
                                          value: "${grade[index]}",
                                          focusColor: Colors.white,
                                          underline: Container(),
                                          dropdownColor: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          icon: Expanded(
                                            child: Icon(Icons.arrow_drop_down),
                                          ),
                                          onChanged: (newValue) {
                                            setState(() {
                                              String _selectedOption =
                                                  newValue!;
                                              grade[index] = _selectedOption;
                                            });
                                          },
                                          items:
                                              _gradeList.map((String option) {
                                            return DropdownMenuItem<String>(
                                              value: option,
                                              child: Expanded(
                                                child: Text(
                                                  option,
                                                  style: TextStyle(
                                                      color: Colors.deepPurple,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: "Points",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                  ),
                                )),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Container(
                                        padding:
                                            EdgeInsets.only(left: 5, right: 5),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.deepPurple,
                                                width: 2),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: DropdownButton<String>(
                                          value: "${cHours[index]}",
                                          focusColor: Colors.white,
                                          underline: Container(),
                                          dropdownColor: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          icon: Expanded(
                                            child: Icon(Icons.arrow_drop_down),
                                          ),
                                          onChanged: (newValue) {
                                            setState(() {
                                              String _selectedOption =
                                                  newValue!;
                                              cHours[index] = _selectedOption;
                                            });
                                          },
                                          items:
                                              _cHoursList.map((String option) {
                                            return DropdownMenuItem<String>(
                                              value: option,
                                              child: Expanded(
                                                child: Text(
                                                  option,
                                                  style: TextStyle(
                                                      color: Colors.deepPurple,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: "Points",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                  ),
                                )),
                              ],
                            ))));
              },
            )
          ],
        ),
      ),
      floatingActionButton: AnimatedSlide(
        duration: duration,
        offset: _showFab ? Offset.zero : Offset(0, 2),
        child: AnimatedOpacity(
          duration: duration,
          opacity: _showFab ? 1 : 0,
          child: FloatingActionButton.extended(
            label: Text("Subject"),
            icon: Icon(Icons.add),
            onPressed: () {
              setState(() {
                grade.add("Grade");
                cHours.add("C.H");
                _showSubject[_count - 1] = true;
                _showSubject.add(false);
                if (_count <= 9) {
                  _count++;
                } else {
                  Future<void> _showMyDialog() async {
                    return showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('AlertDialog Title'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text('This is a demo alert dialog.'),
                                Text(
                                    'Would you like to approve of this message?'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Approve'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
