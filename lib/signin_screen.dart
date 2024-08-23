import 'package:flutter/material.dart';
import 'package:one_ant/signup_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String _selectedCountryCode = '+91'; // Default country code
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _otpController = TextEditingController();
  FocusNode _phoneNumberFocusNode = FocusNode();
  FocusNode _otpFocusNode = FocusNode();
  bool _isOtpSent = false;

  @override
  void initState() {
    super.initState();
    // Automatically focus on the phone number field when the screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_phoneNumberFocusNode);
    });
  }

  void _showCountryPicker() async {
    // Show the country picker as a bottom sheet
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return CountryPickerDialog(
          onCountrySelected: (String countryCode) {
            setState(() {
              _selectedCountryCode = countryCode;
            });
          },
        );
      },
    );
  }

  void _sendOtp() {
    setState(() {
      _isOtpSent = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        FocusScope.of(context).requestFocus(_otpFocusNode);
      });
    });
  }

  void _verifyOtp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/events.jpg'), // Replace with your background image asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Bottom Sheet
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Sign In or Sign Up',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  if (!_isOtpSent)
                    Column(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: _showCountryPicker,
                              child: Row(
                                children: [
                                  Text(
                                    _selectedCountryCode,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Icon(Icons.arrow_drop_down),
                                ],
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                controller: _phoneNumberController,
                                focusNode: _phoneNumberFocusNode,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  hintText: 'Phone number',
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        Divider(color: Colors.grey),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _sendOtp,
                          child: Text('Continue'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            minimumSize:
                                Size(double.infinity, 50), // Full-width button
                          ),
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        Text(
                          'Enter the code we\'ve sent by SMS to ${_phoneNumberController.text}:',
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: _otpController,
                          focusNode: _otpFocusNode,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Enter OTP',
                            border: InputBorder.none,
                          ),
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        Divider(color: Colors.grey),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _verifyOtp,
                          child: Text('Continue'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            minimumSize:
                                Size(double.infinity, 50), // Full-width button
                          ),
                        ),
                        SizedBox(height: 8),
                        TextButton(
                          onPressed: _sendOtp,
                          child: Text('Send again'),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CountryPickerDialog extends StatelessWidget {
  final Function(String) onCountrySelected;

  CountryPickerDialog({required this.onCountrySelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.flag),
                  title: Text('India'),
                  onTap: () {
                    onCountrySelected('+91');
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.flag),
                  title: Text('Sri Lanka'),
                  onTap: () {
                    onCountrySelected('+94');
                    Navigator.of(context).pop();
                  },
                ),
                // Add more countries here
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class _SignInScreenState extends State<SignInScreen> {
// final TextEditingController phoneController = TextEditingController();
// String _selectedCountry = 'India';
// String _countryCode = '+91';

// @override
// void initState() {
//   super.initState();
//   WidgetsBinding.instance.addPostFrameCallback((_) {
//     _openFullScreenModal(context);
//   });
// }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Stack(
//       children: [
//         // Background Image
//         Positioned.fill(
//           child: Image.asset(
//             'assets/events.jpg', // Update with your background image path
//             fit: BoxFit.cover,
//           ),
//         ),
//       ],
//     ),
//   );
// }

// void _openFullScreenModal(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     backgroundColor: Colors.transparent, // Make the background transparent
//     builder: (BuildContext context) {
//       return FullScreenModal(
//         selectedCountry: _selectedCountry,
//         countryCode: _countryCode,
//         onCountryChanged: (String country, String code) {
//           setState(() {
//             _selectedCountry = country;
//             _countryCode = code;
//           });
//         },
//         phoneController: phoneController,
//         onContinue: () {
//           Navigator.pop(context); // Close the current modal
//           _openOtpConfirmationScreen(
//               context); // Open the OTP confirmation modal
//         },
//       );
//     },
//   );
// }

// void _openOtpConfirmationScreen(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     backgroundColor: Colors.transparent, // Make the background transparent
//     builder: (BuildContext context) {
//       return OtpConfirmationModal(
//         onOtpConfirmed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => SignUpScreen()),
//           );
//         },
//       );
//     },
//   );
// }

// }

class FullScreenModal extends StatelessWidget {
  final String selectedCountry;
  final String countryCode;
  final Function(String, String) onCountryChanged;
  final TextEditingController phoneController;
  final VoidCallback onContinue;

  FullScreenModal({
    required this.selectedCountry,
    required this.countryCode,
    required this.onCountryChanged,
    required this.phoneController,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: true,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9), // Slight transparency
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Center(
                    child: Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Sign in or Sign up',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      _openCountrySelector(context);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Text(
                            countryCode,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              selectedCountry,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Phone number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: onContinue,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                      ),
                      child: Text('Continue'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _openCountrySelector(BuildContext context) async {
    final result = await showModalBottomSheet<Map<String, String>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return CountrySelectorModal(
          onCountrySelected: (String country, String code) {
            Navigator.pop(context, {'country': country, 'code': code});
          },
        );
      },
    );
    if (result != null) {
      onCountryChanged(result['country']!, result['code']!);
    }
  }
}

class OtpConfirmationModal extends StatelessWidget {
  final Function onOtpConfirmed;

  OtpConfirmationModal({required this.onOtpConfirmed});

  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false, // Set expand to false for better control
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9), // Slight transparency
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 16.0,
              bottom: MediaQuery.of(context).viewInsets.bottom +
                  16.0, // Padding to account for keyboard
            ),
            child: ListView(
              controller: scrollController,
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
                    onOtpConfirmed();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
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
      },
    );
  }
}

class CountrySelectorModal extends StatelessWidget {
  final Function(String, String) onCountrySelected;

  CountrySelectorModal({required this.onCountrySelected});

  final List<Map<String, String>> countries = [
    {'country': 'India', 'code': '+91'},
    {'country': 'USA', 'code': '+1'},
    {'country': 'Canada', 'code': '+1'},
    {'country': 'Australia', 'code': '+61'},
    // Add more countries here
  ];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.9,
      minChildSize: 0.3,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
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
                  controller: scrollController,
                  itemCount: countries.length,
                  itemBuilder: (context, index) {
                    final country = countries[index];
                    return ListTile(
                      leading: Icon(Icons.flag), // Placeholder for flag
                      title: Text(country['country']!),
                      trailing: Text(country['code']!),
                      onTap: () {
                        onCountrySelected(
                            country['country']!, country['code']!);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
