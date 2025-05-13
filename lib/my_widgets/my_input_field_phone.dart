import 'package:country_code_picker/country_code_picker.dart';
import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/res/icons/icons.dart';
import 'package:express_ease/res/validations/validation.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:express_ease/utils/size_config.dart';
import 'package:flutter/material.dart';

class MyInputFieldPhone extends StatefulWidget {
  const MyInputFieldPhone({
    required this.textController,
    this.validate,
    this.focusNode,
    this.readOnly = false,
    this.errorText,
    this.height,
    this.hint,
    this.title,
    this.titleStyle,
    this.isValidate,
    this.initialCountryCode = '+92',
    this.onCountryCodeChanged,
    super.key,
  });

  final TextEditingController textController;
  final String? Function(String?)? validate;
  final bool? readOnly;
  final String? errorText;
  final double? height;
  final String? hint;
  final String? title;
  final TextStyle? titleStyle;
  final bool? isValidate;
  final FocusNode? focusNode;
  final String? initialCountryCode;
  final Function(String)? onCountryCodeChanged;

  @override
  State<MyInputFieldPhone> createState() => _MyInputFieldPhoneState();
}

class _MyInputFieldPhoneState extends State<MyInputFieldPhone> {
  String? _errorMessage;
  bool? _isValidate;
  late String _selectedCountryCode;

  @override
  void initState() {
    super.initState();
    _selectedCountryCode = widget.initialCountryCode!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Text(
            widget.title!,
            style:
                widget.titleStyle ?? inputText5.copyWith(color: kblackOpacity),
          ),
        SizedBox(height: getHeight(8)),
        Container(
          height: widget.height ?? getHeight(48),
          padding: const EdgeInsets.only(left: 4),
          decoration: BoxDecoration(
            border: Border.all(
              width: .7,
              color: _isValidate == null
                  ? kblack
                  : (_isValidate! ? kblack : kerrorRed),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: getWidth(101),
                padding: const EdgeInsets.only(left: 8),
                child: CountryCodePicker(
                  enabled: !widget.readOnly!,
                  onChanged: (code) {
                    setState(() {
                      _selectedCountryCode = code.dialCode!;
                    });

                    if (widget.onCountryCodeChanged != null) {
                      widget.onCountryCodeChanged!(_selectedCountryCode);
                    }
                  },
                  showDropDownButton: true,
                  initialSelection: widget.initialCountryCode,
                  padding: EdgeInsets.zero,
                  showFlag: true,
                  alignLeft: true,
                  favorite: const ['+1', '+92'],
                  showOnlyCountryWhenClosed: true,
                  builder: (country) => Row(
                    children: [
                      Image.asset(
                        height: getHeight(19),
                        width: getWidth(22),
                        country!.flagUri!,
                        package: 'country_code_picker',
                        fit: BoxFit.fitHeight,
                      ),
                      SizedBox(width: getWidth(8)),
                      Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Text(
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          country.dialCode!,
                          style: inputText8.copyWith(
                            fontSize: getFont(12),
                            color: const Color.fromARGB(73, 0, 0, 0),
                          ),
                        ),
                      ),
                      SizedBox(width: getWidth(8)),
                      Image.asset(
                        dropDownIcon,
                        height: getHeight(6),
                        width: getWidth(8),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 4),
                color: _isValidate == null
                    ? kblack
                    : (_isValidate! ? kblack : kerrorRed),
                width: .7,
                height: double.infinity,
              ),
              Expanded(
                child: TextFormField(
                  controller: widget.textController,
                  validator: Validation().validatePhone,
                  onChanged: (value) {
                    setState(() {
                      _errorMessage = Validation()
                          .validatePhone(widget.textController.text);
                      _isValidate = Validation()
                              .validatePhone(widget.textController.text) ==
                          null;
                    });
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.phone,
                  textAlign: TextAlign.start,
                  cursorHeight: 18,
                  readOnly: widget.readOnly ?? false,
                  decoration: InputDecoration(
                    hintText: widget.hint ?? 'XXX XXX XXXX',
                    errorStyle: const TextStyle(fontSize: 0.0),
                    contentPadding: const EdgeInsets.only(bottom: 8),
                    hintStyle: inputText2.copyWith(
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(75, 0, 0, 0)),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            _errorMessage ?? '',
            style: error.copyWith(fontSize: getFont(10), color: kerrorRed),
          ),
        ),
      ],
    );
  }
}
