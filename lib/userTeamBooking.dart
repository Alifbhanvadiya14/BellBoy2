import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class UserTeamBooking extends StatefulWidget {
  @override
  _UserTeamBookingState createState() => _UserTeamBookingState();
}

class _UserTeamBookingState extends State<UserTeamBooking> {
  int expandedIndexToday = -1;

  int expandedIndexWeek = -1;
  double height = 100.0;
  bool isexp = false;

  double maxHeight = 250;
  double minHeight = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.primaryColor,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            // begin: ,
            colors: [
              primaryColor,
              gradientSecondaryColor,
            ],
          )),
        ),
        title: Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "  Search...",
                fillColor: buttonTextColor,
                filled: true,
                contentPadding: EdgeInsets.all(6),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon: Icon(Icons.more_vert),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(icon: Icon(Icons.notifications), onPressed: () {})
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 4),
        child: GestureDetector(
          onTap: () {
            print("other area");
            setState(() {
              expandedIndexToday = -1;
            });
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            // color: Colors.red,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                  child: Text(
                    "User Teams",
                    style: GoogleFonts.lato(
                        fontSize: 16,
                        color: textColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Container(
                    //height: 100,
                    decoration: BoxDecoration(
                      color: buttonTextColor,
                      boxShadow: [BoxShadow(blurRadius: 0.2)],
                      borderRadius: BorderRadius.circular(8),
                      shape: BoxShape.rectangle,
                    ),
                    child: TextField(
                      cursorHeight: 24,
                      readOnly: true,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(Icons.add_circle_outline),
                            onPressed: () {}),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // listTile(context),
                // SizedBox(height: 10),
                // listTile(context),
                Container(
                  // height: 200,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      // cardKeyList.add(GlobalKey(debugLabel: "index :$index"));
                      return GestureDetector(
                        onTap: () {
                          // setState(() {
                          //   isexp = !isexp;

                          // });
                          print(expandedIndexToday.toString() +
                              " index is $index");

                          if (index == expandedIndexToday) {
                            setState(() {
                              expandedIndexToday = -1;
                            });
                          } else if (index != expandedIndexToday) {
                            setState(() {
                              expandedIndexToday = index;
                            });
                          }
                          print(expandedIndexToday.toString() +
                              " index is $index");
                        },
                        child: AnimatedContainer(
                          height: expandedIndexToday == index
                              ? maxHeight
                              : minHeight,

                          margin:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                          duration: Duration(milliseconds: 10),
                          curve: Curves.fastOutSlowIn,
                          //height:100,
                          width: MediaQuery.of(context).size.width,
                          child: expandedIndexToday == index
                              ? expandedListTile(context)
                              : listTile(context, "Team A"),
                        ),
                      );
                    },
                  ),
                ),
                Center(
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Return"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget listTile(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        //height: 100,
        decoration: BoxDecoration(
          color: buttonTextColor,
          boxShadow: [BoxShadow(blurRadius: 0.2)],
          borderRadius: BorderRadius.circular(8),
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.group_outlined),
                  SizedBox(width: 16),
                  Text(
                    title,
                    style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: textColor,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget expandedListTile(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: buttonTextColor,
        // boxShadow: [BoxShadow(blurRadius: 0.2)],
        borderRadius: BorderRadius.circular(8),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          //height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: buttonTextColor,
                  boxShadow: [BoxShadow(blurRadius: 0.2)],
                  borderRadius: BorderRadius.circular(8),
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //SizedBox(height: 10),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width: 10),
                        Icon(Icons.group_outlined),
                        SizedBox(width: 16),
                        Text(
                          "Team A",
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              color: textColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 4),
              Container(
                height: 150,
                width: double.infinity,
                // color: Colors.primaryColor.withOpacity(0.1),
                color: containerColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Team Members",
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            color: tileTextColor,
                            fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 8),
                        child: Column(
                          children: [
                            Text("Member 1"),
                            Text("Member 2"),
                            Text("Member 3"),
                            Text("Member 4"),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
