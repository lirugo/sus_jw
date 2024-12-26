import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:local_auth/local_auth.dart';
import 'package:sus_jw/src/meetings/meetings_list_view.dart';

class SignInView extends StatefulWidget {
  static const routeName = '/sign-in';
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final String _pinCode = '140133';
  final List<String> _input = [];
  final int _pinLength = 6;
  final LocalAuthentication _localAuth = LocalAuthentication();

  void _onKeyPress(String value) {
    setState(() {
      if (_input.length < _pinLength) {
        _input.add(value);
      }
      if (_input.length == _pinLength) {
        _validatePIN();
      }
    });
  }

  void _onBackspace() {
    setState(() {
      if (_input.isNotEmpty) {
        _input.removeLast();
      }
    });
  }

  Future<void> _validatePIN() async {
    String enteredPin = _input.join();

    if (enteredPin == _pinCode) {
      Navigator.pushNamed(context, MeetingsListView.routeName);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid PIN. Try again.')),
      );
      setState(() {
        _input.clear();
      });
    }
  }

  Future<void> _authenticateBiometric() async {
    try {
      bool didAuthenticate = await _localAuth.authenticate(
        localizedReason: 'Use biometric authentication to sign in',
      );
      if (didAuthenticate) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Biometric Authenticated!')),
        );
        // Proceed to sign in
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _pinLength,
              (index) => Container(
                margin: const EdgeInsets.all(8),
                width: 16,
                height: 11,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index < _input.length
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.primaryContainer,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: 300,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 12,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  if (index == 9) {
                    return GestureDetector(
                      onTap: _authenticateBiometric,
                      child: const Text(''),
                    );
                  } else if (index == 10) {
                    return _buildKey("0");
                  } else if (index == 11) {
                    return GestureDetector(
                      onTap: _onBackspace,
                      child: const Icon(
                        Icons.backspace,
                        size: 36,
                      ),
                    );
                  }
                  return _buildKey("${index + 1}");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKey(String value) {
    return GestureDetector(
      onTap: () => _onKeyPress(value),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Text(
          value,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
