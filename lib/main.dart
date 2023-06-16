import 'package:a_gpa_cal/InputWidget.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Home());
}

List<String> grade = ["Grade"];
List<String> cHours = ["C.H"];

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
  var _count = 0;
  TextEditingController currentCGPA = TextEditingController();
  TextEditingController totalCreditHours = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 300);

    return Scaffold(
        appBar: AppBar(
          title: const Text("GPA Cal"),
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
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: InputWidget(
                      index: index,
                    ),
                  );
                },
              ),
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
              backgroundColor: Colors.white,
              foregroundColor: Colors.deepPurple,
              label: Text("Subject"),
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  grade.add("Grade");
                  cHours.add("C.H");
                  _count++;
                });
              },
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
        bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  border: Border.all(width: 3, color: Colors.deepPurple),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              height: MediaQuery.of(context).size.height * 0.08,
            )));
  }
}
