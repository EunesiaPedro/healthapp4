
import 'package:flutter/material.dart';
import 'package:healthapp/patient/patientWelcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientSign extends StatelessWidget {
  const PatientSign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Welcome",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 5,
                    ),
                  ),
                  Text(
                    "Log in to continue",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Email Address',
                    style: TextStyle(
                      fontSize: 16,
                      height: 3,

                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),

                      width: 349,
                      height: 56,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none
                        ),

                      ),
                    ),
                  ),
                  Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 16,
                      height: 3,

                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),

                    width: 349,
                    height: 56,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.visibility,

                        ),
                        border: InputBorder.none,

                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                  MaterialButton(
                    height: 48,
                    minWidth:350,
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool('showHome', true);
                      //opening another page
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => PatientWelcome(),
                          ));
                    },
                    child: const Text(
                      'Log in',
                      style: TextStyle(color: Colors.white),
                    ),

                  ),
                  Container(
                    child: Text(
                      '___________________________Ag________________________',
                      style: TextStyle(
                          color: Colors.grey.shade500
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    margin: EdgeInsets.symmetric(),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            width: 200,
                            child: Image.asset(
                              'assets/google.png',

                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            height: 100,
                            child: Image.asset(
                              'assets/facebook.png',
                            ),
                          ),

                        ),
                        const SizedBox(height: 15),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            height: 100,
                            child: Image.asset(
                              'assets/apple.png',

                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

