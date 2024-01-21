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

  String _firstNameError = '';
  String _lastNameError = '';
  String _phoneNumberError = '';
  String _addressError = '';
  String _usernameError = '';
  String _passwordError = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Create Account',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
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
                buildTextField(
                    _firstNameController, 'First Name', _firstNameError),
                const SizedBox(height: 10),
                buildTextField(
                    _lastNameController, 'Last Name', _lastNameError),
                const SizedBox(height: 10),
                buildPhoneNumberField(
                    _phoneNumberController, _phoneNumberError),
                const SizedBox(height: 10),
                buildTextField(_addressController, 'Address', _addressError),
                const SizedBox(height: 10),
                buildTextField(_usernameController, 'Username', _usernameError),
                const SizedBox(height: 10),
                buildTextField(_passwordController, 'Password', _passwordError,
                    isPassword: true),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _validateFields();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                  ),
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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

  Widget buildTextField(
      TextEditingController controller, String labelText, String errorText,
      {bool isPassword = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: controller,
            obscureText: isPassword,
            onChanged: (_) {
              setState(() {
                errorText = ''; // Clear the error when the user starts typing
              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
              contentPadding: const EdgeInsets.all(10),
              filled: true,
              fillColor: Colors.white,
            ),
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
          ),
          if (errorText.isNotEmpty)
            Text(
              errorText,
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget buildPhoneNumberField(
      TextEditingController controller, String errorText) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Phone Number',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: controller,
            keyboardType: TextInputType.phone,
            onChanged: (_) {
              setState(() {
                errorText = ''; // Clear the error when the user starts typing
              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: errorText.isNotEmpty ? Colors.red : Colors.blue,
                  width: 2.0,
                ),
              ),
              contentPadding: const EdgeInsets.all(10),
              filled: true,
              fillColor: Colors.white,
            ),
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
          ),
          if (errorText.isNotEmpty)
            Text(
              errorText,
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  void _validateFields() {
    setState(() {
      _firstNameError =
          _firstNameController.text.isEmpty ? 'First name is required' : '';
      _lastNameError =
          _lastNameController.text.isEmpty ? 'Last name is required' : '';
      _phoneNumberError = _isValidPhoneNumber() ? '' : 'Invalid phone number';
      _addressError =
          _addressController.text.isEmpty ? 'Address is required' : '';
      _usernameError =
          _isValidUsername() ? '' : 'Username must be at least 4 characters';
      _passwordError =
          _isStrongPassword() ? '' : 'Password must be at least 6 characters';
    });

    if (_firstNameError.isEmpty &&
        _lastNameError.isEmpty &&
        _phoneNumberError.isEmpty &&
        _addressError.isEmpty &&
        _usernameError.isEmpty &&
        _passwordError.isEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    }
  }

  bool _isValidPhoneNumber() {
    String phoneNumber = _phoneNumberController.text.trim();
    return phoneNumber.length == 10 && int.tryParse(phoneNumber) != null;
  }

  bool _isStrongPassword() {
    return _passwordController.text.length >= 6;
  }

  bool _isValidUsername() {
    return _usernameController.text.length >= 4;
  }
}
