import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sapa_mata/core/constants/color_constants.dart';
import 'package:sapa_mata/core/utils/context_ext.dart';

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
