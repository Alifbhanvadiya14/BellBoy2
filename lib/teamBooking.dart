import 'package:application/imageUpload.dart';
import 'package:application/repeatBooking.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'colors.dart';

class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  int selectedIndex = 0;
  int selected = 0;
  int selectedBooking = 0;

  var type;
  bool value1 = false;
  bool value2 = true;
  bool value3 = true;

  String selectedTeamName;

  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: primaryColor,
          elevation: 0,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ImageUpload(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              "Submit Booking",
              style: TextStyle(
                  color: buttonTextColor,
                  fontSize: 18,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () => setState(() => selectedIndex = 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: selectedIndex == 0
                                  ? primaryColor
                                  : unSelectedButtonColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Individual Booking",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: buttonTextColor,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () => setState(() => selectedIndex = 1),
                          child: Container(
                            decoration: BoxDecoration(
                              color: selectedIndex == 1 || selectedIndex == 2
                                  ? primaryColor
                                  : unSelectedButtonColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: selectedIndex == 0 || selectedIndex == 1
                                  ? Text(
                                      "Team Booking",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: buttonTextColor,
                                          fontWeight: FontWeight.w600),
                                    )
                                  : Text(
                                      "$selectedTeamName's Booking",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: buttonTextColor,
                                          fontWeight: FontWeight.w600),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              selectedIndex == 0 ? individualBooking(context) : SizedBox(),
              selectedIndex == 1 || selectedIndex == 2
                  ? teamBooking(context)
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget individualBooking(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          firstDay: DateTime.now(),
          lastDay: DateTime.now().add(const Duration(days: 100)),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay; // update `_focusedDay` here as well
            });
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () => setState(() => selected = 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: selected == 0
                            ? primaryColor
                            : unSelectedButtonColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Full Day",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              color: buttonTextColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () => setState(() => selected = 1),
                    child: Container(
                      decoration: BoxDecoration(
                        color: selected == 1
                            ? primaryColor
                            : unSelectedButtonColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Morning",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              color: buttonTextColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () => setState(() => selected = 2),
                    child: Container(
                      decoration: BoxDecoration(
                        color: selected == 2
                            ? primaryColor
                            : unSelectedButtonColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Evening",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              color: buttonTextColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        MaterialButton(
          height: 50,
          minWidth: double.infinity,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: primaryColor, width: 2),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => RepeatBooking(),
            );
          },
          child: Text(
            "Repeat Booking",
            style: TextStyle(
                fontSize: 16, color: textColor, fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }

  Widget teamBooking(BuildContext context) {
    return selectedIndex == 2
        ? selectedTeamBooking(context)
        : Column(
            children: [
              teamTile(context, "Team A"),
              teamTile(context, "Team B"),
              teamTile(context, "Team C"),
              teamTile(context, "Team X"),
            ],
          );
  }

  Widget teamTile(BuildContext context, String team) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedTeamName = team;
            selectedIndex = 2;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: buttonTextColor,
            boxShadow: [
              BoxShadow(blurRadius: 0.2),
            ],
            borderRadius: BorderRadius.circular(8),
            shape: BoxShape.rectangle,
          ),
          child: ListTile(
            leading: Icon(
              Icons.group,
              color: primaryColor,
            ),
            title: Text(
              team,
              style: TextStyle(
                  fontSize: 18, color: textColor, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }

  Widget selectedTeamBooking(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            selectedTeamName,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18, color: textColor, fontWeight: FontWeight.w600),
          ),
          ListTile(
            title: Text("Digital Dispute Room"),
            leading: Radio(
              activeColor: primaryColor,
              value: 'Digital Dispute Room',
              groupValue: type,
              onChanged: (value) {
                setState(() {
                  type = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text("Huddle Room"),
            leading: Radio(
              activeColor: primaryColor,
              value: 'Huddle Room',
              groupValue: type,
              onChanged: (value) {
                setState(() {
                  type = value;
                });
              },
            ),
          ),
          teamMember(context),
        ],
      ),
    );
  }

  Widget teamMember(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        children: [
          ListTile(
            leading: Checkbox(
              value: value1,
              onChanged: (value) => setState(() => value1 = !value),
            ),
            title: Text("Member 1"),
          ),
          ListTile(
            leading: Checkbox(
              value: value2,
              onChanged: (value) => setState(() => value2 = !value),
            ),
            title: Text("Member 2"),
          ),
          ListTile(
            leading: Checkbox(
              value: value3,
              onChanged: (value) => setState(() => value3 = !value),
            ),
            title: Text("Member 3"),
          )
        ],
      ),
    );
  }
}
