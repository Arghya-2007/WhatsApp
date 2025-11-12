import 'package:app_project_flutter/Widgets/uihelper.dart';
import 'package:app_project_flutter/tabs/otpScreen/otpScreen.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class loginScreen extends StatefulWidget {
  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  String selectedCountry = "INDIA";

  List<String> countries = [
    "AMERICA",
    "ITALY",
    "FRANCE",
    "GERMANY",
    "RUSSIA",
    "INDIA",
  ];

  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      iconTheme: IconThemeData(color: Colors.black),
        title: Text("Login with Phone Number"), centerTitle: true,
      ),

      body: Column(
        children: [
          SizedBox(height: 70),
          Center(
            child: UiHelper.customText(
              text: "Enter Your Phone Number",
              size: 20,
              fontWeight: FontWeight.bold,
              color: Color(0XFF00A884),
            ),
          ),
          SizedBox(height: 30),

          UiHelper.customText(
            text: "WhatsApp will need to verify your phone",
            size: 16,
            color: Colors.black,
          ),
          SizedBox(height: 5),
          UiHelper.customText(
            text: "numbers Carrier charges may apply.",
            size: 16,
            color: Colors.black,
          ),
          SizedBox(height: 8),
          UiHelper.customText(
            text: "What's my number?",
            size: 16,
            color: Color(0XFF00A884),
          ),

          SizedBox(height: 30),
          DropdownButton<String>(
            value: countries.contains(selectedCountry) ? selectedCountry : null,
            hint: Text("INDIA"),
            icon: Icon(
              FontAwesomeIcons.angleDown,
              color: Color(0XFF00A884),
              size: 20,
            ),
            style: TextStyle(color: Colors.black, fontSize: 16),
            dropdownColor: Colors.white70,
            padding: EdgeInsets.only(left: 60, right: 60),
            items: countries.map((String country) {
              return DropdownMenuItem<String>(
                value: country,
                child: Text(country),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                selectedCountry = value!;
              });
            },
            isExpanded: true,
            underline: Container(
              height: 2,
              color: Color(0XFF00A884),
              padding: EdgeInsets.only(left: 16, right: 16),
            ),
          ),
          SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "+91",
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF00A884)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF00A884)),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(width: 10),
              SizedBox(
                width: 220,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: phoneController,
                  decoration: InputDecoration(
                    hintText: "Enter Phone Number",
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF00A884)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

      floatingActionButton: UiHelper.customButton(
        callback: () {
          login(phoneController.text.trim());
        },
        buttonName: "Next",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void login(String phoneNumber) {
    if (phoneNumber.trim().isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => otpScreen(
            phonenumber: phoneNumber,
            phoneNumber: '+91$phoneNumber',
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid Phone Number"),
          backgroundColor: Colors.green,
        ),
      );
    }
  }
}
