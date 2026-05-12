import 'package:flutter/material.dart';
import 'package:sapa_mata/core/constants/color_constants.dart';
import 'package:sapa_mata/core/utils/context_ext.dart';
import 'package:sapa_mata/core/utils/context_extensions.dart';
import 'package:sapa_mata/features/auth_page/presentation/sign_up_page.dart';
import 'package:sapa_mata/features/auth_page/presentation/widgets/auth_text_fields.dart';

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
