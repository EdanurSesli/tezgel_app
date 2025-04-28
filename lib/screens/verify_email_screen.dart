import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tezgel_app/screens/home_screen.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  List<String> codeDigits = ["", "", "", ""];
  late Timer _timer;
  int _secondsRemaining = 60;
  bool isResendAvailable = false;

  final TextEditingController _digit1Controller = TextEditingController();
  final TextEditingController _digit2Controller = TextEditingController();
  final TextEditingController _digit3Controller = TextEditingController();
  final TextEditingController _digit4Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _secondsRemaining = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_secondsRemaining == 0) {
        setState(() {
          isResendAvailable = true;
          timer.cancel();
        });
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  void resendCode() {
    setState(() {
      codeDigits = ["", "", "", ""];
      _digit1Controller.clear();
      _digit2Controller.clear();
      _digit3Controller.clear();
      _digit4Controller.clear();
      isResendAvailable = false;
    });
    startTimer();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Yeni kod gönderildi!')),
    );
  }

  void verifyCode() {
    String enteredCode = codeDigits.join();
    if (enteredCode.length == 4) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen 4 haneli kodu girin')),
      );
    }
  }

  Widget _buildCodeBox(TextEditingController controller, int index) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: TextField(
          controller: controller,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          style: const TextStyle(fontSize: 24),
          decoration: const InputDecoration(
            counterText: "",
            border: InputBorder.none,
          ),
          onChanged: (value) {
            if (value.isNotEmpty) {
              codeDigits[index] = value;
              if (index < 3) {
                FocusScope.of(context).nextFocus();
              }
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _digit1Controller.dispose();
    _digit2Controller.dispose();
    _digit3Controller.dispose();
    _digit4Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Enter your verification code',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.green, width: 2),
                  ),
                  child: const Center(
                    child: Icon(Icons.mail_outline, color: Colors.green, size: 40),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "We've sent the code to the email on your device",
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCodeBox(_digit1Controller, 0),
                    _buildCodeBox(_digit2Controller, 1),
                    _buildCodeBox(_digit3Controller, 2),
                    _buildCodeBox(_digit4Controller, 3),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "Code expires in : 00:${_secondsRemaining.toString().padLeft(2, '0')}",
                  style: const TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                isResendAvailable
                    ? TextButton(
                        onPressed: resendCode,
                        child: const Text(
                          "Resend Code",
                          style: TextStyle(color: Colors.orange),
                        ),
                      )
                    : TextButton(
                        onPressed: null,
                        child: const Text(
                          "Didn't receive code?",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: verifyCode,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Email Doğrula'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
