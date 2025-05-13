import 'package:express_ease/utils/mystyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpField extends StatefulWidget {
  const OtpField({
    super.key,
    required this.onSubmitOtp,
  });

  final Function(String) onSubmitOtp;

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  String? errorText;

  void _validateAndSubmitOtp(String otp) {
    if (otp.length == 4) {
      setState(() {
        errorText = ''; 
      });
      widget.onSubmitOtp(otp);
    } else {
      setState(() {
        errorText = 'OTP must be 4 digits';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OtpTextField(
          numberOfFields: 4,
          fieldHeight: 45,
          borderColor: Colors.purple,
          focusedBorderColor: Colors.orange,
          showFieldAsBox: true,
          keyboardType: TextInputType.number,
          onCodeChanged: _validateAndSubmitOtp,
          onSubmit: (value) {
            _validateAndSubmitOtp(value); 
          },
        ),
        if (errorText != null && errorText!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              errorText!,
              style: error.copyWith(fontSize: 12, color: Colors.red),
            ),
          ),
      ],
    );
  }
}
