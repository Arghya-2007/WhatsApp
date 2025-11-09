import 'package:app_project_flutter/Widgets/uihelper.dart';
import 'package:app_project_flutter/tabs/mainpage/mainPage.dart';
import 'package:flutter/material.dart';

class profileScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();

  profileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 70),
            UiHelper.customText(
              text: "Profile info",
              size: 25,
              fontWeight: FontWeight.bold,
              color: Color(0XFF00A884),
            ),
            SizedBox(height: 20),
            UiHelper.customText(
              text: "Please provide your name and an optional",
              size: 17,
              color: Colors.grey,
            ),
            UiHelper.customText(
              text: "profile picture",
              size: 17,
              color: Colors.grey,
            ),
            SizedBox(height: 40),
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.grey,
              child: Image.asset("assets/images/appcam.png", fit: BoxFit.cover),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 350,
              child: TextField(
                keyboardType: TextInputType.name,
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Enter your name...",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 350,
              child: TextField(
                keyboardType: TextInputType.name,
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Enter your Email...",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),),
      floatingActionButton: UiHelper.customButton(callback: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => mainPage()));
      }, buttonName: "Next"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
