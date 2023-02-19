
import 'package:flutter/material.dart';
import 'package:healthapp/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class appointmentPage extends StatefulWidget {
  const appointmentPage({Key? key}) : super(key: key);

  @override
  _appointmentPageState createState() => _appointmentPageState();
}

class _appointmentPageState extends State<appointmentPage> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle,

  }) =>
      Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                urlImage,
              fit:BoxFit.cover,


            ),
            const SizedBox(height: 40),
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(),
                child:Text(
                  subtitle,
                  style: const TextStyle(color: Colors.black) ,

                )
              ),
          ],
        ),
      );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 40),
        child: PageView(

          controller: controller,
          onPageChanged: (index){
            setState(()=> isLastPage = index ==2);
          },

          children: [
            buildPage(
                color: Colors.white,
                urlImage: 'assets/doctor.png',
                title: 'Online Consultation',
                subtitle:
                ' Connect with experienced licensed \n      medical profissionals',


            ),

            buildPage(

              color: Colors.white,
              urlImage: (
                  'assets/doctor2.png'
              ),

              title: 'Hassle-free prescriptions',
              subtitle:
              ' Acess medical advice and treatment from \n        the comfort of your phone',
            ),

            buildPage(
              color: Colors.white,
              urlImage: 'assets/doctor1.png',
              title: 'Find Pharmacies',
              subtitle:
              ' Get medical care from the comfort \n          of your phone',
            ),



          ],

        ),
      ),


      bottomSheet: isLastPage
        ? TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          primary: Colors.white,
          backgroundColor: Colors.blue,
            minimumSize: const Size.fromHeight(50),

        ),

          child: const Text(
              "Get Started>>",
            style: TextStyle(fontSize: 16),
          ),
        onPressed: () async{
          //navigate directly to home page
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool('showHome', true);
          //creaty another page by clicking at get start bottum
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) =>HomePage(),
              ) );
        },

      )


      : Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => controller.jumpToPage(0),
              child: const Text('Skip'),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: WormEffect(
                  spacing: 16,
                  dotColor: Colors.black26,
                  activeDotColor: Colors.blue,

                ),
                onDotClicked: (index) =>
                    controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut),
              ),

            ),


            TextButton(
              onPressed: () =>
                  controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut),
              child: const Text('Next>>'),
            ),

          ],
        ),
      ),
    );
  }



}