import 'dart:io';

import 'package:digitization/const/const.dart';
import 'package:digitization/pages/about_us.dart';
import 'package:digitization/pages/notes_download.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

void _launchURL(String url) async {
  // ignore: deprecated_member_use
  if (!await launch(url)) throw 'Could not launch $url';
}

Widget myDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        const UserAccountsDrawerHeader(
          // decoration: BoxDecoration(color: Colors.grey[100]),
          currentAccountPicture: CircleAvatar(
            child: Image(
              image: AssetImage(
                'assets/drawerlogo.png',
              ),
            ),
            backgroundColor: Colors.blueGrey,
          ),
          accountName: Text(
            "SJ Computer Center",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.lightBlue
                // fontFamily:
                ),
          ),
          accountEmail: Text(
            "Perfect for IT World",
            style: TextStyle(
              fontSize: 10, fontWeight: FontWeight.w600,
              color: Colors.blue,
              // fontFamily:
            ),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pop(context);
          },
          leading: Icon(
            Icons.space_dashboard_rounded,
            color: primaryColor,
          ),
          title: const Text("Dashboard"),
        ),
        ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NotesDownload()));
          },
          leading: Icon(
            Icons.download,
            color: primaryColor,
          ),
          title: const Text("Download Notes"),
        ),
        const Divider(),
        ListTile(
          onTap: () {
            _launchURL("https://www.facebook.com/vipcoding/");
            // print('Saroj');
          },
          leading: Icon(
            Icons.facebook_sharp,
            color: primaryColor,
          ),
          title: const Text("Facebook Page"),
        ),
        const Divider(),
        ListTile(
          onTap: () {
            _launchURL("https://forms.gle/fH3zF3PZQ3fDth6y7");
            // print('Saroj');
          },
          leading: Icon(
            Icons.feedback_rounded,
            color: primaryColor,
          ),
          title: const Text("Feedback"),
        ),
        ListTile(
          title: const Text("About us"),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AboutUsPage()));
          },
          leading: Icon(
            Icons.info_outline,
            color: primaryColor,
          ),
        ),
        const Divider(),
        const ListTile(
          leading: Text(
            "v",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22,
                color: Colors.blueGrey),
          ),
          title: Text("Version"),
          subtitle: Text("1.0.0"),
        ),
        const Divider(),
        ListTile(
          title: const Text("Exit"),
          onTap: () {
            if (Platform.isAndroid) {
              SystemNavigator.pop();
            }
          },
          leading: Icon(
            Icons.logout,
            color: primaryColor,
          ),
        ),
      ],
    ),
  );
}
