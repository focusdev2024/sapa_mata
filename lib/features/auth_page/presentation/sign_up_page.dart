import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sapa_mata/core/constants/color_constants.dart';
import 'package:sapa_mata/core/utils/context_ext.dart';
import 'package:sapa_mata/core/utils/context_extensions.dart';
import 'package:sapa_mata/features/auth_page/presentation/sing_in_page.dart';
import 'package:sapa_mata/features/auth_page/presentation/widgets/auth_text_fields.dart';
import 'package:sapa_mata/features/main_page/presentation/main_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController get _phoneNumberController => TextEditingController();

  TextEditingController get _passwordController => TextEditingController();

  bool _isLoading = false;
  int _secondsRemaining = 0;
  Timer? _timer;

  void _handleLogin() {
    setState(() {
      _isLoading = true;
    });

    // Simulate API Call
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _secondsRemaining = 60;
        });
        _startTimer();
      }
    });
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() => _secondsRemaining--);
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              minHeight:
                  MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 450),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      Text(
                        context.languageLoc.signup,
                        style: context.headline,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        context.languageLoc.welcomeText,
                        style: context.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),

                      // Input Fields
                      PhoneNumberTextField(
                        phoneNumberController: _phoneNumberController,
                      ),
                      const SizedBox(height: 20),
                      PasswordTextField(
                        passwordController: _passwordController,
                      ),

                      if (_secondsRemaining > 0)
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "${context.languageLoc.time}: $_secondsRemaining",
                            style: context.bodyMedium.copyWith(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                      const SizedBox(height: 30),

                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: (_isLoading || _secondsRemaining > 50)
                              ? () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomePage(),
                                    ),
                                  );
                                }
                              : _handleLogin,
                          child: _isLoading
                              ? const SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(
                                  context.languageLoc.singtap,
                                  style: context.titleLarge,
                                ),
                        ),
                      ),

                      const SizedBox(height: 30),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignInPage(),
                            ),
                          );
                        },
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: context.languageLoc.haveAccount,
                                style: context.bodyMedium,
                              ),
                              TextSpan(
                                text: context.languageLoc.signin,
                                style: context.bodyMedium.copyWith(
                                  color: ColorConstants.primaryGreen,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
