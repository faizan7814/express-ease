import 'package:express_ease/res/colors/colors.dart';

import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';

class PasswordInputField extends StatefulWidget {
  const PasswordInputField({
    required this.textController,
    this.validate,
    this.errorText,
    this.onSaved,
    this.onObsecure,
    this.isObsecre,
    this.showIcon = true,
    this.title,
    this.height,
    required this.hint,
    super.key,
  });
  final TextEditingController textController;
  final String? Function(String?)? validate;
  final String? errorText;
  final void Function(String?)? onSaved;
  final void Function()? onObsecure;
  final bool? isObsecre;
  final bool showIcon;
  final String? title;
  final String hint;
  final double? height;

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? _errorMessage;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title != null
            ? Text(
                widget.title!,
                style: inputText5.copyWith(color: kblackOpacity),
              )
            : const SizedBox(),
        SizedBox(
          height: getHeight(10),
        ),
        SizedBox(
          height: widget.height ?? getHeight(48),
          child: TextFormField(
            controller: widget.textController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              final validationMessage =
                  widget.errorText ?? validatePassword(value);

              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted && _errorMessage != validationMessage) {
                  setState(() {
                    _errorMessage = validationMessage;
                  });
                }
              });

              return validationMessage;
            },
            onChanged: (value) {
              setState(() {
                _errorMessage = widget.errorText ?? validatePassword(value);
              });
            },
            onSaved: widget.onSaved,
            cursorHeight: 16,
            obscureText: widget.isObsecre ?? false,
            obscuringCharacter: '*',
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              suffixIcon: widget.showIcon
                  ? InkWell(
                      onTap: widget.onObsecure,
                      child: Icon(widget.isObsecre ?? false
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined),
                    )
                  : const SizedBox(),
              hintText: widget.hint,
              errorStyle: const TextStyle(fontSize: 0.0),
              helperStyle: error,
              hintStyle: inputText4.copyWith(color: kblackLow),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(width: 0.7),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: kpurple, width: 1),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: kerrorRed, width: .7),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: kerrorRed, width: 1),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(width: 0.7),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              Text(
                textAlign: TextAlign.start,
                _errorMessage ?? '',
                style: error.copyWith(fontSize: getFont(10), color: kerrorRed),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
