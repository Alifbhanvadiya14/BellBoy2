import 'package:application/Shared/dialogs.dart';
import 'package:application/Shared/drawer.dart';
import 'package:application/teamBooking.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedMode = 0;
  List<PopupMenuItem> list = [
    PopupMenuItem(
      child: Text("Day"),
      value: "day",
    ),
    PopupMenuItem(
      child: Text("Range"),
      value: "range",
    ),
  ];
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  /// The method for [DateRangePickerSelectionChanged] callback, which will be
  /// called whenever a selection changed on the date picker widget.
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range =
            DateFormat('dd/MM/yyyy').format(args.value.startDate).toString() +
                ' - ' +
                DateFormat('dd/MM/yyyy')
                    .format(args.value.endDate ?? args.value.startDate)
                    .toString();
      } else if (args.value is DateTime) {
        _selectedDate = args.value;
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  int selectedIndex = 0;

  // Color _selectedColor = Colors.primaryColor;
  // Color _unselectedColor = Colors.unSelectedButtonColor;

  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay;
  DateRangePickerSelectionMode a = DateRangePickerSelectionMode.single;

  int expandedIndexToday = -1;

  int expandedIndexWeek = -1;
  double height = 100.0;
  bool isexp = false;

  double maxHeight = 300;
  double minHeight = 80;

  final List<GlobalKey<ExpansionTileCardState>> cardKeyList = [];

  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();

  int _expandedItem = -1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: drawer(context),
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
                  builder: (_) => Booking(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
              ),
              child: Text(
                "Make a Booking",
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
                  child: Center(
                    child: Text(
                      "Hello",
                      //textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
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
                                  "Today",
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
                                color: selectedIndex == 1
                                    ? primaryColor
                                    : unSelectedButtonColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Week",
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
                            onTap: () => setState(() => selectedIndex = 2),
                            child: Container(
                              decoration: BoxDecoration(
                                color: selectedIndex == 2
                                    ? primaryColor
                                    : unSelectedButtonColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Month",
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
                selectedIndex == 0 ? todayList(context) : SizedBox(),
                selectedIndex == 1 ? weekList(context) : SizedBox(),
                selectedIndex == 2 ? monthList(context) : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget todayList(BuildContext context) {
    return Padding(
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
              Text(
                "Monday, March 22,2021",
                style: GoogleFonts.lato(
                    fontSize: 16,
                    color: tileTextColor,
                    fontWeight: FontWeight.bold),
              ),
              // SizedBox(height: 10),
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

                            margin: EdgeInsets.symmetric(vertical: 8),
                            duration: Duration(milliseconds: 10),
                            curve: Curves.fastOutSlowIn,
                            //height:100,
                            width: MediaQuery.of(context).size.width,
                            child: expandedIndexToday == index
                                ? expandedListTile(context)
                                : listTile(context),
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }

  Widget completeListTile(int index, int expandedIndex) {
    return GestureDetector(
      onTap: () {
        // setState(() {
        //   isexp = !isexp;

        // });
        print(expandedIndex.toString() + " index is $index");

        if (index == expandedIndex) {
          setState(() {
            expandedIndex = -1;
          });
        } else if (index != expandedIndex) {
          setState(() {
            expandedIndex = index;
          });
        }
        print(expandedIndex.toString() + " index is $index");
      },
      child: AnimatedContainer(
        height: expandedIndex == index ? maxHeight : minHeight,

        margin: EdgeInsets.symmetric(vertical: 8),
        duration: Duration(milliseconds: 10),
        curve: Curves.fastOutSlowIn,
        //height:100,
        width: MediaQuery.of(context).size.width,
        child: expandedIndex == index
            ? expandedListTile(context)
            : listTile(context),
      ),
    );
  }

  Widget weekList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 4),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Monday, March 22,2021",
            style: GoogleFonts.lato(
              fontSize: 16,
              color: tileTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Container(
              // height: 200,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    // cardKeyList.add(GlobalKey(debugLabel: "index :$index"));
                    return GestureDetector(
                      onTap: () {
                        // setState(() {
                        //   isexp = !isexp;

                        // });
                        print(
                            expandedIndexWeek.toString() + " index is $index");

                        if (index == expandedIndexWeek) {
                          setState(() {
                            expandedIndexWeek = -1;
                          });
                        } else if (index != expandedIndexWeek) {
                          setState(() {
                            expandedIndexWeek = index;
                          });
                        }
                        print(
                            expandedIndexWeek.toString() + " index is $index");
                      },
                      child: AnimatedContainer(
                        height:
                            expandedIndexWeek == index ? maxHeight : minHeight,

                        margin: EdgeInsets.symmetric(vertical: 8),
                        duration: Duration(milliseconds: 10),
                        curve: Curves.fastOutSlowIn,
                        //height:100,
                        width: MediaQuery.of(context).size.width,
                        child: expandedIndexWeek == index
                            ? expandedListTile(context)
                            : listTile(context),
                      ),
                    );
                  })),
          SizedBox(height: 16),
          Text(
            "Wednesday, March 24,2021",
            style: GoogleFonts.lato(
              fontSize: 16,
              color: tileTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Container(
              // height: 200,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    // cardKeyList.add(GlobalKey(debugLabel: "index :$index"));
                    return GestureDetector(
                      onTap: () {
                        // setState(() {
                        //   isexp = !isexp;

                        // });
                        print(
                            expandedIndexWeek.toString() + " index is $index");

                        if (index + 2 == expandedIndexWeek) {
                          setState(() {
                            expandedIndexWeek = -1;
                          });
                        } else if (index != expandedIndexWeek) {
                          setState(() {
                            expandedIndexWeek = index + 2;
                          });
                        }
                        print(
                            expandedIndexWeek.toString() + " index is $index");
                      },
                      child: AnimatedContainer(
                        height: expandedIndexWeek == index + 2
                            ? maxHeight
                            : minHeight,

                        margin: EdgeInsets.symmetric(vertical: 8),
                        duration: Duration(milliseconds: 10),
                        curve: Curves.fastOutSlowIn,
                        //height:100,
                        width: MediaQuery.of(context).size.width,
                        child: expandedIndexWeek == index + 2
                            ? expandedListTile(context)
                            : listTile(context),
                      ),
                    );
                  })),
          SizedBox(height: 16),
          Text(
            "Friday, March 26,2021",
            style: GoogleFonts.lato(
              fontSize: 16,
              color: tileTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
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
                        print(
                            expandedIndexWeek.toString() + " index is $index");

                        if (index + 4 == expandedIndexWeek) {
                          setState(() {
                            expandedIndexWeek = -1;
                          });
                        } else if (index != expandedIndexWeek) {
                          setState(() {
                            expandedIndexWeek = index + 4;
                          });
                        }
                        print(
                            expandedIndexWeek.toString() + " index is $index");
                      },
                      child: AnimatedContainer(
                        height: expandedIndexWeek == index + 4
                            ? maxHeight
                            : minHeight,

                        margin: EdgeInsets.symmetric(vertical: 8),
                        duration: Duration(milliseconds: 10),
                        curve: Curves.fastOutSlowIn,
                        //height:100,
                        width: MediaQuery.of(context).size.width,
                        child: expandedIndexWeek == index + 4
                            ? expandedListTile(context)
                            : listTile(context),
                      ),
                    );
                  })),
        ],
      ),
    );
  }

  // Widget monthList(BuildContext context) {
  //   return TableCalendar(
  //     firstDay: DateTime.utc(1960, 1, 1),
  //     lastDay: DateTime.utc(2070, 12, 31),
  //     focusedDay: _focusedDay,
  //     selectedDayPredicate: (day) {
  //       return isSameDay(_selectedDay, day);
  //     },
  //     onDaySelected: (selectedDay, focusedDay) {
  //       setState(() {
  //         _selectedDay = selectedDay;
  //         _focusedDay = focusedDay; // update `_focusedDay` here as well
  //       });
  //     },
  //     onPageChanged: (focusedDay) {
  //       _focusedDay = focusedDay;
  //     },
  //   );
  // }

  Widget monthList(BuildContext context) {
    return Column(
      children: [
        // PopupMenuButton(
        //   elevation: 2.0,
        //   onSelected: (index) {
        //     print(index.toString());
        //     if (index == "day") {
        //       setState(() {
        //         a = DateRangePickerSelectionMode.multiple;
        //       });
        //     } else {
        //       setState(() {
        //         a = DateRangePickerSelectionMode.range;
        //       });
        //     }
        //   },
        //   child: Center(child: Text('Select Days/Range')),
        //   itemBuilder: (context) {
        //     return list;
        //   },
        // ),

        Container(
            height: MediaQuery.of(context).size.height * 0.50,
            child: SfDateRangePicker(
              view: DateRangePickerView.month,
              //backgroundColor: Colors.yellow,
              allowViewNavigation: false,
              enablePastDates: false,
              minDate: DateTime.now(),
              maxDate: DateTime.now().add(const Duration(days: 100)),
              onSelectionChanged: _onSelectionChanged,
              todayHighlightColor: primaryColor,
              selectionMode: a,
            )),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      a = DateRangePickerSelectionMode.multiple;
                      selectedMode = 0;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedMode == 0
                          ? primaryColor
                          : unSelectedButtonColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Multiple",
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
                  onTap: () {
                    setState(() {
                      a = DateRangePickerSelectionMode.range;
                      selectedMode = 1;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedMode == 1
                          ? primaryColor
                          : unSelectedButtonColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Range",
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
      ],
    );
  }

  // _showPopupMenu(Offset offset) async {
  //   double left = offset.dx;
  //   double top = offset.dy;

  //   await showMenu(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(16),
  //     ),
  //     context: context,
  //     position: RelativeRect.fromLTRB(left, top, 0, 0),
  //     items: [
  //       PopupMenuItem<Widget>(
  //         child: MaterialButton(
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(6),
  //             side: BorderSide(width: 2, color: unSelectedButtonColor),
  //           ),
  //           onPressed: () {},
  //           child: Text(
  //             "Edit",
  //             style: TextStyle(
  //                 color: blue800, fontSize: 16, fontWeight: FontWeight.w600),
  //           ),
  //         ),
  //       ),
  //       PopupMenuItem<Widget>(
  //         child: MaterialButton(
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(6),
  //             side: BorderSide(width: 2, color: unSelectedButtonColor),
  //           ),
  //           onPressed: () {
  //             // dialog(context);
  //             //
  //             showDialog(
  //               context: context,
  //               builder: (BuildContext context) => CustomDelete(),
  //             );
  //           },
  //           child: Text(
  //             "Delete",
  //             style: TextStyle(
  //                 color: red, fontSize: 16, fontWeight: FontWeight.w600),
  //           ),
  //         ),
  //       ),
  //     ],
  //     elevation: 8.0,
  //   );
  // }

  // dialog(BuildContext context) {
  //   return showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return Dialog(
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.only(
  //                 bottomLeft: Radius.circular(30),
  //                 topRight: Radius.circular(30)),
  //           ),
  //           child: Container(
  //             height: 150,
  //             child: Padding(
  //               padding: const EdgeInsets.all(12.0),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     "Are you sure?",
  //                     style: TextStyle(
  //                         color: red,
  //                         fontSize: 20,
  //                         fontWeight: FontWeight.w700),
  //                   ),
  //                   SizedBox(height: 10),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.end,
  //                     children: [
  //                       SizedBox(
  //                         child: MaterialButton(
  //                           shape: RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(6),
  //                             side: BorderSide(
  //                                 width: 2, color: unSelectedButtonColor),
  //                           ),
  //                           onPressed: () {},
  //                           child: Text(
  //                             "YES",
  //                             style: TextStyle(color: textColor),
  //                           ),
  //                         ),
  //                       ),
  //                       SizedBox(width: 10),
  //                       SizedBox(
  //                         child: MaterialButton(
  //                           shape: RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(6),
  //                             side: BorderSide(
  //                                 width: 2, color: unSelectedButtonColor),
  //                           ),
  //                           onPressed: () {},
  //                           child: Text(
  //                             "NO",
  //                             style: TextStyle(color: textColor),
  //                           ),
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         );
  //       });
  // }

  Widget listTile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        secondaryActions: [
          IconSlideAction(
            iconWidget: GestureDetector(
                onTapDown: ((TapDownDetails details) {
                  // _showPopupMenu(details.globalPosition);
                }),
                // child: Icon(Icons.settings),.
                child: PopupMenuButton(
                  offset: Offset(0, 60),
                  icon: Icon(
                    Icons.settings,
                    // color: appStore.textPrimaryColor,
                    color: textColor,
                  ),
                  onSelected: (value) {
                    // toast(value);
                    if (value == "Delete") {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => CustomDelete(),
                      );
                    }
                  },
                  itemBuilder: (context) {
                    List<PopupMenuEntry<Object>> list = [];
                    list.add(
                      PopupMenuItem(
                        child: Text("Edit"),
                        value: 'Edit',
                      ),
                    );
                    list.add(
                      PopupMenuItem(
                        child: Text("Delete"),
                        value: 'Delete',
                      ),
                    );

                    return list;
                  },
                )),
          )
        ],
        child: Container(
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
                Text(
                  "Digital Dispute Room",
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: tileTextColor,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "8 AM - 12:30 PM",
                      style: GoogleFonts.roboto(
                          fontSize: 12,
                          color: tileTextColor,
                          fontWeight: FontWeight.w600),
                    ),
                    VerticalDivider(),
                    Text(
                      "32-145 NW Corner",
                      style: GoogleFonts.roboto(
                          fontSize: 12,
                          color: tileTextColor,
                          fontWeight: FontWeight.w600),
                    ),
                    VerticalDivider(
                      color: textColor,
                    ),
                    Text(
                      "TOR",
                      style: TextStyle(
                          fontSize: 14,
                          color: textColor,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget expandedListTile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        secondaryActions: [
          IconSlideAction(
            iconWidget: GestureDetector(
                onTapDown: ((TapDownDetails details) {
                  // _showPopupMenu(details.globalPosition);
                }),
                // child: Icon(Icons.settings),.
                child: PopupMenuButton(
                  icon: Icon(
                    Icons.settings,
                    // color: appStore.textPrimaryColor,
                    color: textColor,
                  ),
                  onSelected: (value) {
                    // toast(value);
                    if (value == "Delete") {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => CustomDelete(),
                      );
                    }
                  },
                  itemBuilder: (context) {
                    List<PopupMenuEntry<Object>> list = [];
                    list.add(
                      PopupMenuItem(
                        child: Text("Edit"),
                        value: 'Edit',
                      ),
                    );
                    list.add(
                      PopupMenuItem(
                        child: Text("Delete"),
                        value: 'Delete',
                      ),
                    );

                    return list;
                  },
                )),
          )
        ],
        child: Container(
          decoration: BoxDecoration(
            color: buttonTextColor,
            // boxShadow: [BoxShadow(blurRadius: 0.2)],
            borderRadius: BorderRadius.circular(8),
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Digital Dispute Room",
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            color: tileTextColor,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "8 AM - 12:30 PM",
                            style: GoogleFonts.roboto(
                                fontSize: 12,
                                color: tileTextColor,
                                fontWeight: FontWeight.w600),
                          ),
                          VerticalDivider(),
                          Text(
                            "32-145 NW Corner",
                            style: GoogleFonts.roboto(
                                fontSize: 12,
                                color: tileTextColor,
                                fontWeight: FontWeight.w600),
                          ),
                          VerticalDivider(),
                          Text(
                            "TOR",
                            style: TextStyle(
                                fontSize: 14,
                                color: textColor,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  // color: Colors.primaryColor.withOpacity(0.1),
                  color: containerColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Booking Details",
                              style: descContent.copyWith(
                                  fontWeight: FontWeight.w500)),
                          Text("Digital Dispute Rooms",
                              style: descContent.copyWith(
                                  fontWeight: FontWeight.w600))
                        ],
                      ),
                      Divider(
                        thickness: 2,
                        color: primaryColor,
                        endIndent: 10,
                        indent: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Start Date", style: descContent),
                                Text("March 22,2021", style: descContent),
                                Text("8 AM", style: descContent),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Location", style: descContent),
                                Text("32-145 NW Corner", style: descContent),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("End Date", style: descContent),
                                Text("March 22,2021", style: descContent),
                                Text("12:30 PM", style: descContent),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Locker Location", style: descContent),
                                Text("32", style: descContent),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle descContent = GoogleFonts.roboto(
      color: primaryColor, fontSize: 15, fontWeight: FontWeight.w500);
}
