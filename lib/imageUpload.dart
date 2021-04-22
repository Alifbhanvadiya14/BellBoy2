import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'colors.dart';

class ImageUpload extends StatefulWidget {
  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  File image1File;
  File image2File;
  File image3File;

  ImagePicker picker = ImagePicker();

  int index;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text("Image Gallery",
                  style: TextStyle(
                      fontSize: 16,
                      color: textColor,
                      fontWeight: FontWeight.w600)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: primaryColor)),
                  height: 150,
                  width: double.infinity,
                  child: image1File == null
                      ? Center(
                          child: Icon(Icons.add),
                        )
                      : Image(
                          fit: BoxFit.contain,
                          image: FileImage(
                            image1File,
                          ),
                        ),
                ),
              ),
              Text(
                "1st Screen",
                textAlign: TextAlign.end,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: primaryColor)),
                  height: 150,
                  width: double.infinity,
                  child: image2File == null
                      ? Center(
                          child: Icon(Icons.add),
                        )
                      : Image(
                          fit: BoxFit.contain,
                          image: FileImage(
                            image2File,
                          ),
                        ),
                ),
              ),
              Text(
                "2nd Screen",
                textAlign: TextAlign.end,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: primaryColor)),
                  height: 150,
                  width: double.infinity,
                  child: image3File == null
                      ? Center(
                          child: Icon(Icons.add),
                        )
                      : Image(
                          fit: BoxFit.contain,
                          image: FileImage(
                            image3File,
                          ),
                        ),
                ),
              ),
              Text(
                "Large Screen",
                textAlign: TextAlign.end,
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
                          onTap: () {
                            setState(() => index = 0);
                            showImageUploadOptions(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: unSelectedButtonColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Upload \n1st Screen",
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
                            setState(() => index = 1);
                            showImageUploadOptions(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: unSelectedButtonColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Upload\n2nd Screen",
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
                            setState(() => index = 2);
                            showImageUploadOptions(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: unSelectedButtonColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Upload\nLarge Screen",
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
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Back",
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
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Next",
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
              )
            ],
          ),
        ),
      ),
    );
  }

  Future pickImage(ImageSource source) async {
    final pickedImage = await picker.getImage(source: source);

    if (index == 0) {
      setState(() {
        image1File = File(pickedImage.path);
      });
    } else if (index == 1) {
      setState(() {
        image2File = File(pickedImage.path);
      });
    } else if (index == 2) {
      setState(() {
        image3File = File(pickedImage.path);
      });
    }
  }

  showImageUploadOptions(BuildContext context) {
    pickImage(ImageSource.gallery);
    // return showModalBottomSheet(
    //   context: context,
    //   builder: (context) {
    //     return Container(
    //       height: 80,
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.only(
    //           topLeft: Radius.circular(12),
    //           topRight: Radius.circular(12),
    //         ),
    //       ),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         children: [
    //           ElevatedButton.icon(
    //               onPressed: () {
    //                 pickImage(ImageSource.camera).whenComplete(
    //                   () => Navigator.pop(context),
    //                 );
    //               },
    //               icon: Icon(Icons.camera_alt),
    //               label: Text("Camera")),
    //           ElevatedButton.icon(
    //             onPressed: () {
    //               pickImage(ImageSource.gallery).whenComplete(
    //                 () => Navigator.pop(context),
    //               );
    //             },
    //             icon: Icon(Icons.photo_sharp),
    //             label: Text("Gallery"),
    //           )
    //         ],
    //       ),
    //     );
    //   },
    // );
  }
}
