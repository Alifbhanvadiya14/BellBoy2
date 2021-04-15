import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../colors.dart';

class CustomDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0.0,
      backgroundColor: dialogBgColor,
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
            24.height,
            Text('Delete Booking?',
                style: boldTextStyle(
                    // color: appStore.textPrimaryColor,

                    color: textColor,
                    size: 18)),
            16.height,
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text("This will delete booking permanently",
                  style: secondaryTextStyle(

                      // color: appStore.textSecondaryColor
                      color: textColor)),
            ),
            16.height,
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: boxDecoration(
                          color: dialogColor,
                          radius: 8,
                          bgColor: buttonTextColor),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Icon(Icons.close,
                                          color: dialogColor, size: 18))),
                              TextSpan(
                                  text: "Cancel",
                                  style: TextStyle(
                                    fontSize: 16.0, color: dialogColor,
                                    // fontFamily: fontRegular
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ).onTap(() {
                      finish(context);
                    }),
                  ),
                  16.width,
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration:
                          boxDecoration(bgColor: dialogColor, radius: 8),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Icon(Icons.delete,
                                          color: buttonTextColor, size: 18))),
                              TextSpan(
                                  text: "Delete",
                                  style: TextStyle(
                                    fontSize: 16.0, color: buttonTextColor,
                                    // fontFamily: fontRegular
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ).onTap(() {
                      toast("Successfully Deleted");
                      finish(context);
                    }),
                  )
                ],
              ),
            ),
            16.height,
          ],
        ),
      ),
    );
  }
}

BoxDecoration boxDecoration(
    {double radius = 2,
    Color color = Colors.transparent,
    Color bgColor,
    var showShadow = false}) {
  return BoxDecoration(
    color: bgColor,
    boxShadow: showShadow
        ? defaultBoxShadow(shadowColor: shadowColorGlobal)
        : [BoxShadow(color: dialogBgColor)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}
