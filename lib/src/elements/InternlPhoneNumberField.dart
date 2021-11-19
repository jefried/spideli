import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';


class InternlPhoneNumberField extends StatefulWidget {
  final TextEditingController phonenumberController;
  const InternlPhoneNumberField({ Key key, this.phonenumberController }) : super(key: key);

  @override
  _InternlPhoneNumberFieldState createState() => _InternlPhoneNumberFieldState();
}

class _InternlPhoneNumberFieldState extends State<InternlPhoneNumberField> {

  String initialCountry = 'CM';
  PhoneNumber number = PhoneNumber(isoCode: 'CM');

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {

      },
      selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.DIALOG
      ),
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.disabled,
      selectorTextStyle: const TextStyle(color: Colors.black),
      initialValue: number,
      textFieldController: widget.phonenumberController,
      formatInput: false,
      keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
      inputDecoration: InputDecoration(
        hintText: 'Phone number',
        contentPadding: const EdgeInsets.fromLTRB(12, 5, 5, 12),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Color(0xFFDEDEDE))
        ),
        suffixIcon: widget.phonenumberController.text != '' ? const Icon(Icons.check, color: Colors.green) : null,
      ),
      textStyle: const TextStyle(
          fontFamily: 'Manrope-ExtraLight',
          fontSize: 16,
          fontWeight: FontWeight.w400
      ),
    );
  }
}