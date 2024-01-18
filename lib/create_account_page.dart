import 'package:flutter/material.dart';
import 'login_page.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _showErrorMessage = false;
  bool _showPhoneNumberError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back when the icon is pressed
          },
        ),
        title: const Text(
          'Create Account',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue, // Light blue color at the top
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.lightBlue, Colors.white],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                // Text boxes without frames
                buildTextField(_firstNameController, 'First Name'),
                const SizedBox(height: 10),
                buildTextField(_lastNameController, 'Last Name'),
                const SizedBox(height: 10),
                buildPhoneNumberField(_phoneNumberController),
                const SizedBox(height: 10),
                buildTextField(_addressController, 'Address'),
                const SizedBox(height: 10),
                buildTextField(_usernameController, 'Username'),
                const SizedBox(height: 10),
                buildTextField(_passwordController, 'Password',
                    isPassword: true),
                const SizedBox(height: 20),
                // Error message
                if (_showErrorMessage)
                  const Text(
                    'Invalid phone number',
                    style: TextStyle(color: Colors.red),
                  ),
                const SizedBox(height: 20),
                // Styled create account button
                ElevatedButton(
                  onPressed: () {
                    if (_isValidPhoneNumber()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    } else {
                      setState(() {
                        _showErrorMessage = true;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Blue color for the button
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Make the button round
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15), // Adjust padding
                  ),
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                      color: Colors.white, // White color for the text
                      fontWeight: FontWeight.bold, // Bold text
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String labelText,
      {bool isPassword = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        onTap: () {
          setState(() {
            _showErrorMessage = false;
          });
        },
        onChanged: (_) {
          setState(() {
            _showErrorMessage = false;
          });
        },
        decoration: InputDecoration(
          labelText: labelText,
          // Customize the border properties
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.blue, // Set the border color to blue
              width: 2.0, // Set the border width
            ),
          ),
          // Customize the content padding
          contentPadding: const EdgeInsets.all(10),
          // Set the filled property to true
          filled: true,
          // Set the fill color to white
          fillColor: Colors.white,
        ),
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }

  Widget buildPhoneNumberField(TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.phone,
        onTap: () {
          setState(() {
            _showPhoneNumberError = false;
          });
        },
        onChanged: (_) {
          setState(() {
            _showPhoneNumberError = false;
          });
        },
        decoration: InputDecoration(
          labelText: 'Phone Number',
          // Customize the border properties
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: _showPhoneNumberError
                  ? Colors
                      .red // Set the border color to red if there's an error
                  : Colors
                      .blue, // Set the border color to blue if there's no error
              width: 2.0, // Set the border width
            ),
          ),
          // Customize the content padding
          contentPadding: const EdgeInsets.all(10),
          // Set the filled property to true
          filled: true,
          // Set the fill color to white
          fillColor: Colors.white,
          // Error message
          errorText: _showPhoneNumberError ? 'Invalid phone number' : null,
        ),
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }

  bool _isValidPhoneNumber() {
    String phoneNumber = _phoneNumberController.text.trim();
    return phoneNumber.length == 10 && int.tryParse(phoneNumber) != null;
  }
}
