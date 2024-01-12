import 'package:flutter/material.dart';
import 'home_page.dart';

class CreateAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back when the icon is pressed
          },
        ),
        title: Text(
          'Create Account',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue, // Light blue color at the top
      ),
      body: Container(
        color: Colors.white, // White color in the middle part
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container with a red line above the form
              Container(
                height: 4,
                color: Colors.red,
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'First Name',
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Address',
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
                obscureText: true,
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
              ),
              SizedBox(height: 20),
              // Styled create account button
              ElevatedButton(
                onPressed: () {
                  // Implement create account logic
                  // For simplicity, navigate to the home page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Blue color for the button
                ),
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    color: Colors.white, // White color for the text
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
