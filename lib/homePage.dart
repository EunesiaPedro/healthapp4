

import 'package:flutter/material.dart';
import 'package:healthapp/doctor/doctorAccount.dart';
import 'package:healthapp/patient/patientAccount.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Sign up as:",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        height: 5,

                    ),
                  ),
                  Image.asset(
                    'assets/patient.png',

                  ),

                  const SizedBox(height: 10),
                  MaterialButton(
                    height: 48,
                    minWidth:330,
                    color: Colors.blue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setBool('showHome', true);
                        //opening another page
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) =>PatientAccount(),
                            ) );


                      },
                    child: const Text(
                        'PATIENT',
                      style: TextStyle(color: Colors.white),
                    ),

                  ),
              Column(
                children: <Widget>[
                  Image.asset(
                    'assets/doctors.png',
                  ),
                  const SizedBox(height: 10),
                  MaterialButton(
                    height: 48,
                    minWidth:330,
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool('showHome', true);
                      //opening another page
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) =>DoctrorAccount(),
                          ) );


                    },
                    child: const Text(
                      'DOCTOR',
                      style: TextStyle(color: Colors.white),
                    ),

                  ),

                ],

              ),

             ]
            ),

           ),

          ],
        ) ,

      )

    );
  }
}
