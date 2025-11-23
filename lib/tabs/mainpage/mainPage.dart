import 'package:app_project_flutter/Widgets/uihelper.dart';
import 'package:app_project_flutter/tabs/mainpage/Calls/callScreen.dart';
import 'package:app_project_flutter/tabs/mainpage/Camera/cameraScreen.dart';
import 'package:app_project_flutter/tabs/mainpage/Chats/chatsScreen.dart';
import 'package:app_project_flutter/tabs/mainpage/Status/statusScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class mainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(FontAwesomeIcons.camera, color: Colors.white)),
              Tab(text: "CHATS"),
              Tab(text: "STATUS"),
              Tab(text: "CALLS"),
            ],
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            labelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 18),
          ),
          title: UiHelper.customText(
            text: "WhatsApp",
            size: 20,
            color: Colors.white,
          ),

          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: IconButton(
                onPressed: () {},
                icon: Image.asset("assets/images/Search.png"),
              ),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            cameraScreen(),
            chatsScreen(),
            StatusScreen(),
            callScreen(),
          ],
        ),
      ),
    );
  }
}
