import 'package:flutter/material.dart';
import 'package:one_ant/signup_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController phoneController = TextEditingController();
  String _selectedCountry = 'India';
  String _countryCode = '+91';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in or Sign up'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Country Selector Dropdown (Custom Design)
            GestureDetector(
              onTap: () {
                _openCountrySelector(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Text(
                      '$_countryCode',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        _selectedCountry,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Phone Number Input Field
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Continue Button
            ElevatedButton(
              onPressed: () {
                // Navigate to OTP confirmation screen (Frame 07)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OtpConfirmationScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }

  void _openCountrySelector(BuildContext context) async {
    final result = await showModalBottomSheet<Map<String, String>>(
      context: context,
      builder: (context) {
        return CountrySelectorModal();
      },
    );
    if (result != null) {
      setState(() {
        _selectedCountry = result['country']!;
        _countryCode = result['code']!;
      });
    }
  }
}

class CountrySelectorModal extends StatelessWidget {
  final List<Map<String, String>> countries = [
    {'country': 'India', 'code': '+91'},
    {'country': 'USA', 'code': '+1'},
    {'country': 'Canada', 'code': '+1'},
    {'country': 'Australia', 'code': '+61'},
    // Add more countries here
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Country',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) {
                final country = countries[index];
                return ListTile(
                  leading: Icon(Icons.flag), // Placeholder for flag
                  title: Text(country['country']!),
                  trailing: Text(country['code']!),
                  onTap: () {
                    Navigator.pop(context, country);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OtpConfirmationScreen extends StatefulWidget {
  @override
  _OtpConfirmationScreenState createState() => _OtpConfirmationScreenState();
}

class _OtpConfirmationScreenState extends State<OtpConfirmationScreen> {
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm your number'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter the code we've sent by SMS to 98765 43210:",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            // OTP Input Field
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: InputDecoration(
                labelText: '------',
                border: OutlineInputBorder(),
                counterText: "",
              ),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, letterSpacing: 32),
            ),
            SizedBox(height: 20),
            // Confirm Button
            ElevatedButton(
              onPressed: () {
                // Handle OTP verification and navigate to the signup page (Frame 08)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text('Confirm'),
            ),
            SizedBox(height: 10),
            // Resend SMS Option
            TextButton(
              onPressed: () {
                // Handle resend OTP
              },
              child: Text('Haven’t received an SMS? Send again'),
            ),
          ],
        ),
      ),
    );
  }
}
