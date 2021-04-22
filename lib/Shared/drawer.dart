import 'package:application/updateProfile.dart';
import 'package:application/userTeamBooking.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

Widget drawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        UserAccountsDrawerHeader(
          accountName: Text(""),
          accountEmail: Text(""),
          currentAccountPicture: CircleAvatar(
            child: Icon(
              Icons.person_outline,
              size: 40,
            ),
            radius: 46,
            backgroundColor: Colors.white,
          ),
        ),
        drawerTile(
            context, "User Profile", Icon(Icons.person), UpdateProfile()),
        drawerTile(context, "Booking Preferences", Icon(Icons.book_online),
            UpdateProfile()),
        drawerTile(
            context, "User Favourites", Icon(Icons.star), UpdateProfile()),
        drawerTile(context, "User Teams", Icon(Icons.group), UserTeamBooking()),
        drawerTile(context, "Covid-19 Screening", Icon(Icons.list_alt),
            UpdateProfile()),
      ],
    ),
  );
}

Widget drawerTile(
    BuildContext context, String title, Icon icon, Widget screen) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: primaryColor, width: 1.5),
      ),
      child: Center(
        child: ListTile(
          enabled: true,
          dense: true,
          // shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(8),
          //     side: BorderSide(
          //         color: primaryColor, width: 5, style: BorderStyle.solid)),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
          },
          leading: icon,
          title: Text(title),
        ),
      ),
    ),
  );
}
