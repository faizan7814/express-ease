import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/res/validations/validation.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';

class MyInputField extends StatefulWidget {
  const MyInputField({
    required this.textController,
    this.validate,
    this.onChanged,
    this.readOnly,
    this.errorText,
    this.onSaved,
    this.prefixIcon,
    this.tilteStyle,
    this.titlePadding,
    this.keyboardType,
    this.title,
    this.height,
    required this.hint,
    this.sufixText,
    this.maxLines,
    super.key,
  });

  final TextEditingController textController;
  final String? Function(String?)? validate;
  final Function(String)? onChanged;
  final bool? readOnly;
  final String? errorText;
  final void Function(String?)? onSaved;
  final String hint;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final String? sufixText;
  final String? title;
  final EdgeInsetsGeometry? titlePadding;
  final int? maxLines;
  final TextStyle? tilteStyle;

  final double? height;

  @override
  State<MyInputField> createState() => _MyInputFieldState();
}

class _MyInputFieldState extends State<MyInputField> {
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Padding(
            padding:
                widget.titlePadding ?? EdgeInsets.only(bottom: getHeight(10)),
            child: Text(
              widget.title!,
              style: widget.tilteStyle ??
                  inputText5.copyWith(color: kblackOpacity),
            ),
          ),
        SizedBox(
          height: widget.height ?? getHeight(48),
          child: TextFormField(
            controller: widget.textController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.validate ??
                (value) {
                  final validationMessage = widget.validate?.call(value) ??
                      Validation().validateField(value);

                  // Ensure state updates when the form is validated
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
                final validationMessage = widget.validate?.call(value);
                _errorMessage = validationMessage;
                if (widget.onChanged != null) {
                  widget.onChanged!(value);
                }
              });
            },
            onSaved: (value) {
              setState(() {
                final validationMessage = widget.validate?.call(value);
                _errorMessage = validationMessage;
              });
            },
            readOnly: widget.readOnly ?? false,
            keyboardType: widget.keyboardType,
            textAlign: TextAlign.start,
            maxLines: widget.maxLines ?? 1,
            cursorHeight: 16,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              suffixText: widget.sufixText ?? '',
              suffixStyle: inputText8.copyWith(color: kblackOpacity),
              errorStyle: error.copyWith(fontSize: 0),
              hintStyle: inputText4.copyWith(
                  fontSize: getFont(14),
                  fontWeight: FontWeight.w400,
                  color: kblackLow),
              hintText: widget.hint,
              helperStyle: error,
              helperMaxLines: 4,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(width: 0.7),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: kpurple, width: 1.3),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: kerrorRed, width: .7),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: kerrorRed, width: 1.3),
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
          child: Text(
            _errorMessage ?? '',
            textAlign: TextAlign.start,
            style: error.copyWith(fontSize: getFont(10), color: kerrorRed),
          ),
        )
      ],
    );
  }
}
