import 'package:flutter/material.dart';

class UpdateProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              Text(
                "User Profile",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.person_outline,
                      size: 40,
                    ),
                    radius: 46,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(width: 16),
                  Text(
                    "Didhiti Bhoumik",
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Change Profile Picture",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  IconButton(icon: Icon(Icons.edit), onPressed: () {}),
                ],
              ),
              SizedBox(height: 10),
              Text("Name"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Didhiti Bhoumik",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  IconButton(icon: Icon(Icons.edit), onPressed: () {}),
                ],
              ),
              SizedBox(height: 10),
              Text("Email"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "abc@gmail.com",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  IconButton(icon: Icon(Icons.edit), onPressed: () {}),
                ],
              ),
              SizedBox(height: 10),
              Text("Phone Number"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "555-000-111",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  IconButton(icon: Icon(Icons.edit), onPressed: () {}),
                ],
              ),
              SizedBox(height: 10),
              Text("Images"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Image Gallery",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  IconButton(icon: Icon(Icons.edit), onPressed: () {}),
                ],
              ),
              SizedBox(height: 16),
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
    );
  }
}
