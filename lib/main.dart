import 'package:a_gpa_cal/InputWidget.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Home());
}

List<String> grade = ["Grade"];
List<String> cHours = ["C.hours"];

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
          AnimatedSlide(
            duration: duration,
            offset: _showFab ? Offset(0, 0) : Offset(0, 0),
            child: AnimatedOpacity(
                duration: duration,
                opacity: _showFab ? 1 : 0,
                child: IconButton(
                    onPressed: () async {
                      if (_count >= 2) {
                        setState(() {
                          _count--;
                          _showField[_count - 1] = false;
                        });
                        await Future.delayed(Duration(seconds: 1));
                        grade.removeAt(_count - 1);
                        cHours.removeAt(_count - 1);
                      }
                    },
                    icon: Icon(
                      Icons.delete,
                      size: 25,
                    ))),
          ),
          AnimatedSlide(
            duration: duration,
            offset: _showFab ? Offset(0, 0) : Offset(0, 0),
            child: AnimatedOpacity(
                duration: duration,
                opacity: _showFab ? 1 : 0,
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (_count != 11) {
                          _showField[_count - 1] = true;
                          _showField.add(false);
                          grade.add("Grade");
                          cHours.add("C.hours");
                          _count++;
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            showCloseIcon: true,
                            closeIconColor: Colors.white,
                            content:
                                Text('Sorry, no more subjects will be added'),
                          ));
                        }
                      });
                    },
                    icon: Icon(
                      Icons.add,
                      size: 30,
                    ))),
          ),
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
    );
  }
}
