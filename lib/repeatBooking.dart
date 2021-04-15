import 'package:day_picker/day_picker.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class RepeatBooking extends StatefulWidget {
  @override
  _RepeatBookingState createState() => _RepeatBookingState();
}

class _RepeatBookingState extends State<RepeatBooking> {
  var type = "Day";
  int selectedBooking = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: new BoxDecoration(
          color: buttonTextColor,
          // color: Colors.buttonTextColore,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: boxShadowColor,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0)),
          ],
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () => setState(() => selectedBooking = 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedBooking == 0
                              ? primaryColor
                              : unSelectedButtonColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Repeat Weekly",
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
                      onTap: () => setState(() => selectedBooking = 1),
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedBooking == 1
                              ? primaryColor
                              : unSelectedButtonColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Monthly",
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
            selectedBooking == 0 ? weeklyRepeat(context) : SizedBox(),
            selectedBooking == 1 ? monthlyRepeat(context) : SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget monthlyRepeat(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Repeat Every: ",
                style: TextStyle(
                    fontSize: 16,
                    color: primaryColor,
                    fontWeight: FontWeight.w600),
              ),
              Container(
                height: 50.0,
                width: 50.0,
                child: Card(
                  color: cardColor,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Center(
                      child: Text(
                        "1",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            color: textColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(
                "Month",
                style: TextStyle(
                    fontSize: 16,
                    color: primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Repeat on:",
            style: TextStyle(
                fontSize: 16, color: primaryColor, fontWeight: FontWeight.w600),
          ),
        ),
        ListTile(
          title: Text("Day"),
          leading: Radio(
            activeColor: primaryColor,
            value: 'Day',
            groupValue: type,
            onChanged: (value) {
              setState(() {
                type = value;
              });
            },
          ),
          trailing: type == "Day"
              ? Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(8),
                      border: OutlineInputBorder(),
                    ),
                  ),
                )
              : SizedBox(),
        ),
        ListTile(
          title: Text("Week"),
          leading: Radio(
            activeColor: primaryColor,
            value: 'Week',
            groupValue: type,
            onChanged: (value) {
              setState(() {
                type = value;
              });
            },
          ),
          trailing: type == "Week"
              ? Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(8),
                      border: OutlineInputBorder(),
                    ),
                  ),
                )
              : SizedBox(),
        ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            height: 40,
            minWidth: double.infinity,
            onPressed: () {},
            color: primaryColor,
            child: Text(
              "Return",
              style: TextStyle(
                  fontSize: 16,
                  color: buttonTextColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
        )
      ],
    );
  }

  Widget weeklyRepeat(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Repeat Every: ",
                style: TextStyle(
                    fontSize: 16,
                    color: primaryColor,
                    fontWeight: FontWeight.w600),
              ),
              Container(
                height: 50.0,
                width: 50.0,
                child: Card(
                  color: cardColor,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Center(
                      child: Text(
                        "1",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            color: textColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(
                "Week",
                style: TextStyle(
                    fontSize: 16,
                    color: primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Repeat on:",
            style: TextStyle(
                fontSize: 16, color: primaryColor, fontWeight: FontWeight.w600),
          ),
        ),
        SelectWeekDays(
          selectedDayTextColor: buttonTextColor,
          unSelectedDayTextColor: primaryColor,
          daysFillColor: primaryColor,
          backgroundColor: buttonTextColor,
          daysBorderColor: textColor,
          padding: 10,
          onSelect: (values) => print(values),
        ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            height: 40,
            minWidth: double.infinity,
            onPressed: () {},
            color: primaryColor,
            child: Text(
              "Return",
              style: TextStyle(
                  fontSize: 16,
                  color: buttonTextColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
        )
      ],
    );
  }
}
