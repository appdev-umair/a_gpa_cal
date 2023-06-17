import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'main.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({super.key, required this.index});
  final index;

  @override
  State<InputWidget> createState() => InputWidgetState();
}

class InputWidgetState extends State<InputWidget> {
  Color myColor = Colors.grey;
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
    "F",
  ];
  List<String> _cHoursList = [
    'C.hours',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.deepPurple, width: 3),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(4),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: (grade[widget.index] != "Grade") ? 2 : 1,
                        color: (grade[widget.index] != "Grade")
                            ? Colors.deepPurple
                            : Colors.grey),
                    borderRadius: BorderRadius.circular(20)),
                child: DropdownButton<String>(
                  value: "${grade[widget.index]}",
                  focusColor: Colors.white,
                  underline: Container(),
                  dropdownColor: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  icon: const Icon(Icons.arrow_drop_down),
                  onChanged: (newValue) {
                    setState(() {
                      String _selectedOption = newValue!;
                      grade[widget.index] = _selectedOption;
                    });
                  },
                  items: _gradeList.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(
                        option,
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(width: 3),
              Expanded(
                child: TextField(
                  style: TextStyle(color: Colors.deepPurple, fontSize: 16),
                  decoration: InputDecoration(
                    labelText: "Points",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 3),
              Container(
                padding: EdgeInsets.all(4),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: (cHours[widget.index] != "C.hours") ? 2 : 1,
                        color: (cHours[widget.index] != "C.hours")
                            ? Colors.deepPurple
                            : Colors.grey),
                    borderRadius: BorderRadius.circular(20)),
                child: DropdownButton<String>(
                  value: "${cHours[widget.index]}",
                  focusColor: Colors.white,
                  underline: Container(),
                  dropdownColor: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  icon: const Icon(Icons.arrow_drop_down),
                  onChanged: (newValue) {
                    setState(() {
                      String _selectedOption = newValue!;
                      cHours[widget.index] = _selectedOption;
                    });
                  },
                  items: _cHoursList.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(
                        option,
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Grade Points: 3.25",
              style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
