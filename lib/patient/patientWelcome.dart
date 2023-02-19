

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class PatientWelcome extends StatefulWidget {
  const PatientWelcome({Key? key}) : super(key: key);

  @override
  _PatientWelcomeState createState() => _PatientWelcomeState();
}

class _PatientWelcomeState extends State<PatientWelcome> {
  DateTime dateTime = DateTime(2022, 12, 24);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(

            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Setup Account",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        height: 5,
                      ),
                    ),
                    LinearProgressIndicator(
                      value: 0.05,
                      backgroundColor: Colors.blue.shade100,
                      minHeight: 5,
                      valueColor: AlwaysStoppedAnimation(Colors.blue),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Text(
                          "Basic info",
                          style: TextStyle(
                            fontSize: 12,


                          ),
                        ),
                      ],
                    ),

                    Text(
                      "Full Name",
                      style: TextStyle(
                          fontSize: 16,
                          height: 5
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 358,
                      height: 56,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none
                        ),

                      ),
                    ),


                    Row(
                      children: <Widget>[
                        Text(
                          'Sex',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 16,
                              height: 2
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 170)),
                        Text(
                          'Date of Birth',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            height: 2,
                          ),
                        ),
                      ],
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                borderRadius: BorderRadius.circular(10),
                              ),

                              width: 167,
                              height: 56,
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                            Container(
                              child: SizedBox(
                                  height: 30,
                                  width: 24,
                              ),

                            ),
                            ElevatedButton(
                              child: Text('${dateTime.year}/${dateTime
                                  .month}/${dateTime.day}'),
                              onPressed: () async {
                                final date = await pickDate();

                              },
                            ),
                          ]
                      ),
                    ),

                  ],

                ),
              ),
            ]
        ),

      ),
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),

      );
}
