import 'package:express_ease/res/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

const Color headerColor = Color(0xFF344054);

class CustomTextFormField extends StatelessWidget {
  final String? headerText;
  final bool readOnly;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Function()? onTap;
  final int maxLine;
  final Color hintColor;
  final bool obscureText;
  final double horizntalPadding;
  final double verticalPadding;
  final double height;
  final String? hintText;
  final String? labelText;
  final Color filledColor;
  final String? errorText;
  final Widget? suffixIcon;
  final Function()? suffixOnTap;
  final Widget? prefixIcon;
  final Color suffixIconColor;
  final Color headerTextColor;
  final List<TextInputFormatter>? inputFormatter;
  final FormFieldValidator<String>? validator;

  const CustomTextFormField({
    super.key,
    this.horizntalPadding = 8.0,
    this.verticalPadding = 8.0,
    this.maxLine = 1,
    this.headerText,
    this.headerTextColor = headerColor,
    this.height = 50,
    this.controller,
    this.readOnly = false,
    this.focusNode,
    this.inputType,
    this.inputAction,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.obscureText = false,
    this.hintText,
    this.labelText,
    this.errorText,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixOnTap,
    this.suffixIconColor = Colors.black45,
    this.inputFormatter,
    this.validator,
    this.hintColor = Colors.black45,
    this.filledColor = Colors.black45,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headerText == null
            ? const SizedBox()
            : Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: headerText == null ? 0.0 : 4.0,
                  vertical: headerText == null ? 0.0 : 0.0,
                ),
                child: Text(
                  headerText!,
                  style: GoogleFonts.nunitoSans(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: headerTextColor),
                ),
              ),
        Container(
          // height: height,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textAlign: TextAlign.left,
            style: GoogleFonts.nunitoSans(
                fontSize: 14.0, fontWeight: FontWeight.w500, color: kblack),
            readOnly: readOnly,
            onTap: onTap,
            inputFormatters: inputFormatter,
            controller: controller,
            focusNode: focusNode,
            maxLines: maxLine,
            textInputAction: inputAction,
            keyboardType: inputType,
            onChanged: onChanged,
            onFieldSubmitted: onSubmitted,
            obscureText: obscureText,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(
                    vertical: verticalPadding, horizontal: horizntalPadding),
                hintText: hintText,
                hintStyle: GoogleFonts.nunitoSans(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: hintColor),
                labelText: labelText,
                errorText: errorText,
                errorStyle: const TextStyle(color: Colors.red, fontSize: 10.0),
                errorMaxLines: 3,
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10.0)),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black12),
                    borderRadius: BorderRadius.circular(10.0)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black12),
                    borderRadius: BorderRadius.circular(10.0))),
            validator: validator,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
