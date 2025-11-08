import 'package:app_project_flutter/Widgets/uihelper.dart';
import 'package:flutter/material.dart';

class otpScreen extends StatelessWidget {
  String phonenumber;
  otpScreen({required this.phonenumber, required String phoneNumber});

  TextEditingController otpController1 = TextEditingController();
  TextEditingController otpController2 = TextEditingController();
  TextEditingController otpController3 = TextEditingController();
  TextEditingController otpController4 = TextEditingController();
  TextEditingController otpController5 = TextEditingController();
  TextEditingController otpController6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OTP Verification"), centerTitle: true),

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 60),
            UiHelper.customText(
              text: "Verifying your number",
              size: 24,
              fontWeight: FontWeight.w700,
              color: Color(0XFF00A884),
            ),
            SizedBox(height: 20),
            UiHelper.customText(
              text: "You've tried to register with +91 $phonenumber",
              size: 16,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 6),
            UiHelper.customText(
              text: "recently. Wait before requesting an SMS or a Call",
              size: 15,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiHelper.customText(
                  text: "with your code.",
                  size: 16,
                  fontWeight: FontWeight.w400,
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: UiHelper.customText(
                    text: "Wrong Number?",
                    size: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0XFF00A884),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiHelper.customContainer(otpController1),
                SizedBox(width: 10),
                UiHelper.customContainer(otpController2),
                SizedBox(width: 10),
                UiHelper.customContainer(otpController3),
                SizedBox(width: 10),
                UiHelper.customContainer(otpController4),
                SizedBox(width: 10),
                UiHelper.customContainer(otpController5),
                SizedBox(width: 10),
                UiHelper.customContainer(otpController6),
              ],
            ),
            SizedBox(height: 30),
            UiHelper.customText(text: "Didn't receive the code?", size: 15, color: Color(0XFF00A884)),
          ],
        ),
      ),
      floatingActionButton: UiHelper.customButton(callback: (){

      }, buttonName: "Verify Now"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
