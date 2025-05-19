import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tezgel_app/screens/home_screen.dart';
import 'package:tezgel_app/services/verify_email_service.dart';

class VerifyEmailScreen extends StatefulWidget {
  final String token;

  const VerifyEmailScreen({super.key, required this.token});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final VerifyEmailService _verifyEmailService = VerifyEmailService();
  List<String> codeDigits = ["", "", "", "", "", ""]; // 6 hane
  late Timer _timer;
  int _secondsRemaining = 60;
  bool isResendAvailable = false;

  final List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());

  @override
  void initState() {
    super.initState();
    _sendVerificationCode();
    startTimer();
  }

  Future<void> _sendVerificationCode() async {
    try {
      await _verifyEmailService.sendCode(widget.token);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    }
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

  Future<void> verifyCode() async {
    String enteredCode = codeDigits.join();
    if (enteredCode.length == 6) {
      try {
        final result = await _verifyEmailService.verifyCode(widget.token, enteredCode);
        if (result.isSuccess == true) {
          if (mounted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HomeScreen()),
            );
          }
        } else {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Doğrulama kodu hatalı')),
            );
          }
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString())),
          );
        }
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen 6 haneli kodu girin')),
      );
    }
  }

  void resendCode() async {
    try {
      await _verifyEmailService.sendCode(widget.token);
      setState(() {
        codeDigits = ["", "", "", "", "", ""];
        for (final controller in _controllers) {
          controller.clear();
        }
        isResendAvailable = false;
      });
      startTimer();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Yeni kod gönderildi!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    }
  }

  Widget _buildCodeBox(TextEditingController controller, int index) {
    return Container(
      width: 48,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12),
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
              if (index < 5) {
                FocusScope.of(context).nextFocus();
              }
            } else {
              codeDigits[index] = "";
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    for (final controller in _controllers) {
      controller.dispose();
    }
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
                  children: List.generate(6, (i) => _buildCodeBox(_controllers[i], i)),
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
