import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tezgel_app/models/login_models/login_response_model.dart';
import 'package:tezgel_app/services/login_service.dart';
import 'package:tezgel_app/services/verify_email_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../blocs/login/login_bloc.dart';
import '../blocs/login/login_event.dart';
import '../blocs/login/login_state.dart';
import '../models/login_models/login_response_model.dart';
import 'forgot_password_screen.dart';
import 'register_screen.dart';
import 'verify_email_screen.dart';
import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      prefixIcon: label == 'Email'
          ? const Icon(Icons.email_outlined, color: Colors.green)
          : const Icon(Icons.lock_outline, color: Colors.green),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(loginService: LoginService()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: BlocListener<LoginBloc, LoginState>(
              listener: (context, state) async {
                if (state is LoginFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }
                if (state is LoginSuccess) {
                  // if (state.loginResponse.data?.emailConfirmed == false) {
                  //   // Email doğrulama gerekli, doğrulama ekranına yönlendir
                  //   final verifyService = VerifyEmailService();
                  //   try {
                  //     verifyService.sendCode(state.loginResponse.data!.accessToken!).then((_) {
                  //       Navigator.pushReplacement(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (_) => VerifyEmailScreen(
                  //             token: state.loginResponse.data!.accessToken!,
                  //           ),
                  //         ),
                  //       );
                  //     });
                  //   } catch (e) {
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       SnackBar(content: Text(e.toString())),
                  //     );
                  //   }
                  // } else {
                    // Save token and role to SharedPreferences
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setString('accessToken', state.loginResponse.data!.accessToken!);
                    await prefs.setString('role', state.loginResponse.data!.role ?? '');

                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (_) => const MainScreen(),
                      ),
                      (route) => false,
                    );
                  // }
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  const Text('LOGO', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text('Welcome! sign in to your account.',
                      style: TextStyle(fontSize: 16, color: Colors.grey)),
                  const SizedBox(height: 40),
                  TextField(
                    controller: emailController,
                    decoration: _inputDecoration('Email'),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: _inputDecoration('Password'),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()));
                      },
                      child: const Text('Forgot Password?', style: TextStyle(color: Colors.orange)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: state is LoginLoading
                            ? null
                            : () {
                                context.read<LoginBloc>().add(LoginButtonPressed(
                                    email: emailController.text,
                                    password: passwordController.text));
                              },
                        child: state is LoginLoading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text('Login'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: const [
                      Expanded(child: Divider(thickness: 1)),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: Text('or sign in with')),
                      Expanded(child: Divider(thickness: 1)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Google ile Giriş Yap'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const RegisterSelectionScreen()));
                    },
                    child: const Text('Kayıt Ol'),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      foregroundColor: Colors.orange,
                      side: const BorderSide(color: Colors.orange),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
