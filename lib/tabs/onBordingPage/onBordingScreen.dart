import 'package:app_project_flutter/Widgets/uihelper.dart';
import 'package:app_project_flutter/tabs/login/loginscreen.dart';
import 'package:flutter/material.dart';

class onBordingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Welcome to WhatsApp"),
        centerTitle: true,
      ),

      body: Center(
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 140,
            backgroundImage: AssetImage('assets/images/bording.png'),
          ),
          SizedBox(height: 20,),

          UiHelper.customText(text: "Welcome to WhatsApp", size: 20, fontWeight: FontWeight.bold, color: Colors.black),

          SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            UiHelper.customText(text: "Read Out", size: 16, fontWeight: FontWeight.bold, color: Colors.black),
            UiHelper.customText(text: " Privacy Policy", size: 16, fontWeight: FontWeight.bold, color: Colors.blue),
            UiHelper.customText(text: " Tap 'Agree and Continue' ", size: 16, fontWeight: FontWeight.bold, color: Colors.black),

          ],),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              UiHelper.customText(text: " to accept the ", size: 16, fontWeight: FontWeight.bold, color: Colors.black),
              UiHelper.customText(text: "Terms of Service", size: 16, fontWeight: FontWeight.bold, color: Colors.blue),


            ],
          )

        ],
      ),
      ),

      floatingActionButton: UiHelper.customButton(
        callback: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 500),
              pageBuilder: (context, animation, secondaryAnimation) => loginScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                final curvedAnimation = CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                );

                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0), // Slide from right
                    end: Offset.zero,
                  ).animate(curvedAnimation),
                  child: child,
                );
              },
            ),
          );
        },
        buttonName: "Agree and Continue",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
  
}
