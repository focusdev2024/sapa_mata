import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sapa_mata/core/constants/color_constants.dart';
import 'package:sapa_mata/core/utils/context_ext.dart';
import 'package:sapa_mata/core/utils/context_extensions.dart';
import 'package:sapa_mata/features/auth_page/presentation/sign_up_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  TextEditingController get _phoneNumberController => TextEditingController();
  TextEditingController get _passwordController => TextEditingController();

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
                      Text(context.languageLoc.signin, style: context.headline),
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

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpPage(),
                              ),
                            );
                          },
                          child: Text(
                            context.languageLoc.forgotPassword,
                            style: context.labelSmall,
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
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
                              builder: (context) => const SignUpPage(),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(context.languageLoc.dontHaveAccount),
                            Text(
                              context.languageLoc.signup,
                              style: context.bodyMedium.copyWith(
                                color: ColorConstants.primaryGreen,
                              ),
                            ),
                          ],
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

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({super.key, required this.phoneNumberController});

  final TextEditingController phoneNumberController;

  void textFieldClear() {
    phoneNumberController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: phoneNumberController,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        LengthLimitingTextInputFormatter(9),
        FilteringTextInputFormatter.digitsOnly,
        _PhoneNumberFormatter(),
      ],
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: ColorConstants.primaryGrey),
        ),
        labelText: context.languageLoc.phoneNumber,
        prefix: const Text('+993 '),
        //hintText: '+993 -- -- -- -- --',
        suffix: GestureDetector(
          onTap: textFieldClear,
          child: const Icon(Icons.clear_rounded),
        ),
      ),
    );
  }
}

class _PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var newText = newValue.text;

    if (newText.length > 2 && !newText.contains(' ')) {
      newText = '${newText.substring(0, 2)} ${newText.substring(2)}';
    }

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, required this.passwordController});

  final TextEditingController passwordController;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureController = true;

  void obscure() {
    obscureController = !obscureController;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureController,
      controller: widget.passwordController,
      inputFormatters: [
        LengthLimitingTextInputFormatter(6),
        //FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: ColorConstants.primaryGrey),
        ),

        labelText: context.languageLoc.password,
        suffix: GestureDetector(
          onTap: () {
            setState(() {
              obscure();
            });
          },
          child: obscureController
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
        ),
      ),
    );
  }
}
