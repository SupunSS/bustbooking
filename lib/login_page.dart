import 'package:flutter/material.dart';
import 'create_account_page.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red, // Set the background color to red
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue, // Light blue color at the top
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white, // White color in the middle part
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Container with a red line above the image
                Container(
                  height: 4,
                  color: Colors.red,
                ),
                SizedBox(height: 10),
                // Image widget to display the picture above the username area
                Image.asset(
                  'images/sltb_logo.png', // Provide the path to your image asset
                  width: 200, // Adjust the width as needed
                  height: 200, // Adjust the height as needed
                ),
                SizedBox(height: 10),
                // Container with a red line below the image
                Container(
                  height: 4,
                  color: Colors.red,
                ),
                SizedBox(height: 10),
                // Container to fill the space between the two red lines with red color
                Container(
                  height: 10, // Adjust the height as needed
                  color: Colors.red,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                  obscureText: true,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                ),
                SizedBox(height: 20),
                // Styled login button
                ElevatedButton(
                  onPressed: () {
                    // Get the values from the text fields
                    String username = _usernameController.text.trim();
                    String password = _passwordController.text.trim();

                    // Check if username and password are not empty
                    if (username.isNotEmpty && password.isNotEmpty) {
                      // Implement login logic
                      // For simplicity, navigate to the home page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    } else {
                      // Display an error message if either username or password is empty
                      _showErrorMessage(context, 'You should add username and password to proceed');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Blue color for the button
                  ),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      color: Colors.white, // White color for the text
                      fontWeight: FontWeight.bold, // Bold text
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    // Navigate to the Create Account page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateAccountPage()),
                    );
                  },
                  child: Text('Create a New Account'),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
