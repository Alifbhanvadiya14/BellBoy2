// import 'package:application/screen2/booking.dart';
// import 'package:application/screen2/dialogs.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// import 'package:intl/intl.dart';

// class HomeScreen2 extends StatefulWidget {
//   @override
//   _HomeScreen2State createState() => _HomeScreen2State();
// }

// class _HomeScreen2State extends State<HomeScreen2> {
//   List<PopupMenuItem> list = [
//     PopupMenuItem(
//       child: Text("Day"),
//       value: "day",
//     ),
//     PopupMenuItem(
//       child: Text("Range"),
//       value: "range",
//     ),
//   ];
//   String _selectedDate = '';
//   String _dateCount = '';
//   String _range = '';
//   String _rangeCount = '';

//   /// The method for [DateRangePickerSelectionChanged] callback, which will be
//   /// called whenever a selection changed on the date picker widget.
//   void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
//     /// The argument value will return the changed date as [DateTime] when the
//     /// widget [SfDateRangeSelectionMode] set as single.
//     ///
//     /// The argument value will return the changed dates as [List<DateTime>]
//     /// when the widget [SfDateRangeSelectionMode] set as multiple.
//     ///
//     /// The argument value will return the changed range as [PickerDateRange]
//     /// when the widget [SfDateRangeSelectionMode] set as range.
//     ///
//     /// The argument value will return the changed ranges as
//     /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
//     /// multi range.
//     setState(() {
//       if (args.value is PickerDateRange) {
//         _range =
//             DateFormat('dd/MM/yyyy').format(args.value.startDate).toString() +
//                 ' - ' +
//                 DateFormat('dd/MM/yyyy')
//                     .format(args.value.endDate ?? args.value.startDate)
//                     .toString();
//       } else if (args.value is DateTime) {
//         _selectedDate = args.value;
//       } else if (args.value is List<DateTime>) {
//         _dateCount = args.value.length.toString();
//       } else {
//         _rangeCount = args.value.length.toString();
//       }
//     });
//   }

//   int selectedIndex = 0;

//   Color _selectedColor = Colors.blue;
//   Color _unselectedColor = Colors.grey;

//   DateTime _focusedDay = DateTime.now();
//   DateTime _selectedDay;
//   DateRangePickerSelectionMode a = DateRangePickerSelectionMode.single;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer(),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: MaterialButton(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           color: Colors.blue,
//           elevation: 0,
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (_) => Booking(),
//               ),
//             );
//           },
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 16.0),
//             child: Text(
//               "Make a Booking",
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   letterSpacing: 1,
//                   fontWeight: FontWeight.w600),
//             ),
//           ),
//         ),
//       ),
//       appBar: AppBar(
//         // backgroundColor: Colors.blue,
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//             // begin: ,
//             colors: [
//               Colors.blue,
//               Colors.blue.shade700,
//             ],
//           )),
//         ),
//         title: Container(
//           margin: EdgeInsets.symmetric(vertical: 15),
//           child: Padding(
//             padding: EdgeInsets.symmetric(vertical: 8.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: "  Search...",
//                 fillColor: Colors.white,
//                 filled: true,
//                 contentPadding: EdgeInsets.all(6),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 suffixIcon: Icon(Icons.more_vert),
//               ),
//             ),
//           ),
//         ),
//         actions: [
//           IconButton(icon: Icon(Icons.notifications), onPressed: () {})
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(4.0),
//                 child: Center(
//                   child: Text(
//                     "Hello",
//                     //textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(4.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: InkWell(
//                           onTap: () => setState(() => selectedIndex = 0),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: selectedIndex == 0
//                                   ? _selectedColor
//                                   : _unselectedColor,
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(10.0),
//                               child: Text(
//                                 "Today",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     fontSize: 16,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: InkWell(
//                           onTap: () => setState(() => selectedIndex = 1),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: selectedIndex == 1
//                                   ? _selectedColor
//                                   : _unselectedColor,
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(10.0),
//                               child: Text(
//                                 "Week",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     fontSize: 16,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: InkWell(
//                           onTap: () => setState(() => selectedIndex = 2),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: selectedIndex == 2
//                                   ? _selectedColor
//                                   : _unselectedColor,
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(10.0),
//                               child: Text(
//                                 "Month",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     fontSize: 16,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               selectedIndex == 0 ? todayList(context) : SizedBox(),
//               selectedIndex == 1 ? weekList(context) : SizedBox(),
//               selectedIndex == 2 ? monthList(context) : SizedBox(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget todayList(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 8.0, top: 4),
//       child: Column(
//         // mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Monday, March 22,2021",
//             style: GoogleFonts.lato(
//                 fontSize: 16,
//                 color: Color(0xff353bf0),
//                 fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 10),
//           listTile(context),
//           SizedBox(height: 10),
//           listTile(context),
//         ],
//       ),
//     );
//   }

//   Widget weekList(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 8.0, top: 4),
//       child: Column(
//         // mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Monday, March 22,2021",
//             style: GoogleFonts.lato(
//                 fontSize: 16,
//                 color: Color(0xff353bf0),
//                 fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 10),
//           listTile(context),
//           SizedBox(height: 10),
//           listTile(context),
//           SizedBox(height: 16),
//           Text(
//             "Wednesday, March 24,2021",
//             style: GoogleFonts.lato(
//                 fontSize: 16,
//                 color: Color(0xff353bf0),
//                 fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 10),
//           listTile(context),
//           SizedBox(height: 10),
//           listTile(context),
//           SizedBox(height: 16),
//           Text(
//             "Friday, March 26,2021",
//             style: GoogleFonts.lato(
//                 fontSize: 16,
//                 color: Color(0xff353bf0),
//                 fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 10),
//           listTile(context),
//           SizedBox(height: 10),
//           listTile(context),
//           SizedBox(height: 16),
//           Text(
//             "Saturday, March 27,2021",
//             style: GoogleFonts.lato(
//                 fontSize: 16,
//                 color: Color(0xff353bf0),
//                 fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 10),
//           listTile(context),
//         ],
//       ),
//     );
//   }

//   Widget monthList(BuildContext context) {
//     return Column(
//       children: [
//         PopupMenuButton(
//           elevation: 2.0,
//           onSelected: (index) {
//             print(index.toString());
//             if (index == "day") {
//               setState(() {
//                 a = DateRangePickerSelectionMode.multiple;
//               });
//             } else {
//               setState(() {
//                 a = DateRangePickerSelectionMode.range;
//               });
//             }
//           },
//           child: Center(child: Text('Select Days/Range')),
//           itemBuilder: (context) {
//             return list;
//           },
//         ),
//         Container(
//             height: MediaQuery.of(context).size.height * 0.70,
//             child: Stack(
//               children: <Widget>[
//                 Positioned(
//                   left: 10,
//                   top: 20,
//                   right: 10,
//                   bottom: 20,
//                   child: SfDateRangePicker(
//                     view: DateRangePickerView.month,
//                     //backgroundColor: Colors.yellow,
//                     allowViewNavigation: false,
//                     enablePastDates: false,
//                     minDate: DateTime.now(),
//                     maxDate: DateTime.now().add(const Duration(days: 100)),
//                     onSelectionChanged: _onSelectionChanged,
//                     todayHighlightColor: Colors.blue,
//                     selectionMode: a,
//                   ),
//                 )
//               ],
//             )),
//       ],
//     );
//   }

//   _showPopupMenu(Offset offset) async {
//     double left = offset.dx;
//     double top = offset.dy;

//     await showMenu(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       context: context,
//       position: RelativeRect.fromLTRB(left, top, 0, 0),
//       items: [
//         PopupMenuItem<Widget>(
//           child: MaterialButton(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(6),
//               side: BorderSide(width: 2, color: Colors.grey),
//             ),
//             onPressed: () {},
//             child: Text(
//               "Edit",
//               style: TextStyle(
//                   color: Colors.blue[800],
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600),
//             ),
//           ),
//         ),
//         PopupMenuItem<Widget>(
//           child: MaterialButton(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(6),
//               side: BorderSide(width: 2, color: Colors.grey),
//             ),
//             onPressed: () {
//               // dialog(context);
//               //
//               showDialog(
//                 context: context,
//                 builder: (BuildContext context) => CustomDelete(),
//               );
//             },
//             child: Text(
//               "Delete",
//               style: TextStyle(
//                   color: Colors.red, fontSize: 16, fontWeight: FontWeight.w600),
//             ),
//           ),
//         ),
//       ],
//       elevation: 8.0,
//     );
//   }

//   dialog(BuildContext context) {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return Dialog(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(30),
//                   topRight: Radius.circular(30)),
//             ),
//             child: Container(
//               height: 150,
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Are you sure?",
//                       style: TextStyle(
//                           color: Colors.red,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w700),
//                     ),
//                     SizedBox(height: 10),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         SizedBox(
//                           child: MaterialButton(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(6),
//                               side: BorderSide(width: 2, color: Colors.grey),
//                             ),
//                             onPressed: () {},
//                             child: Text(
//                               "YES",
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 10),
//                         SizedBox(
//                           child: MaterialButton(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(6),
//                               side: BorderSide(width: 2, color: Colors.grey),
//                             ),
//                             onPressed: () {},
//                             child: Text(
//                               "NO",
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }

//   Widget listTile(BuildContext context) {
//     return Slidable(
//       actionPane: SlidableDrawerActionPane(),
//       actionExtentRatio: 0.25,
//       secondaryActions: [
//         IconSlideAction(
//           iconWidget: GestureDetector(
//               onTapDown: ((TapDownDetails details) {
//                 // _showPopupMenu(details.globalPosition);
//               }),
//               // child: Icon(Icons.settings),.
//               child: PopupMenuButton(
//                 icon: Icon(
//                   Icons.settings,
//                   // color: appStore.textPrimaryColor,
//                   color: Colors.black,
//                 ),
//                 onSelected: (value) {
//                   // toast(value);
//                   if (value == "Delete") {
//                     showDialog(
//                       context: context,
//                       builder: (BuildContext context) => CustomDelete(),
//                     );
//                   }
//                 },
//                 itemBuilder: (context) {
//                   var list = [];
//                   list.add(
//                     PopupMenuItem(
//                       child: Text("Edit"),
//                       value: 'Edit',
//                     ),
//                   );
//                   list.add(
//                     PopupMenuItem(
//                       child: Text("Delete"),
//                       value: 'Delete',
//                     ),
//                   );

//                   return list;
//                 },
//               )),
//         )
//       ],
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [BoxShadow(blurRadius: 0.2)],
//           borderRadius: BorderRadius.circular(8),
//           shape: BoxShape.rectangle,
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Digital Dispute Room",
//                 style: GoogleFonts.roboto(
//                     fontSize: 16,
//                     color: Color(0xff353bf0),
//                     fontWeight: FontWeight.w600),
//               ),
//               SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text(
//                     "8 AM - 12:30 PM",
//                     style: GoogleFonts.roboto(
//                         fontSize: 12,
//                         color: Color(0xff353bf0),
//                         fontWeight: FontWeight.w600),
//                   ),
//                   VerticalDivider(),
//                   Text(
//                     "32-145 NW Corner",
//                     style: GoogleFonts.roboto(
//                         fontSize: 12,
//                         color: Color(0xff353bf0),
//                         fontWeight: FontWeight.w600),
//                   ),
//                   VerticalDivider(),
//                   Text(
//                     "TOR",
//                     style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w600),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }