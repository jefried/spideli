import 'package:flutter/material.dart';

class SimpleTextFormField extends StatefulWidget {
  final TextEditingController textController;
  final TextStyle textStyle;
  final String hintText;
  const SimpleTextFormField({
    Key key,
    this.textController,
    this.hintText,
    this.textStyle = const TextStyle(
        fontFamily: 'Helvetica',
        fontSize: 16
    )
  }) : super(key: key);

  @override
  _SimpleTextFormFieldState createState() => _SimpleTextFormFieldState();
}

class _SimpleTextFormFieldState extends State<SimpleTextFormField> {

  bool _isNameValid = false;

  @override
  Widget build(BuildContext context) {

    return  TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: _isNameValid ? const Icon(Icons.check, color: Colors.green) : null,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Color(0xFFDEDEDE))
          ),
          contentPadding: const EdgeInsets.fromLTRB(12, 5, 12, 5)
      ),
      style: widget.textStyle,
      keyboardType: TextInputType.text,
      controller: widget.textController,
      onChanged: (value) {
        if (value.trim() == ''){
          setState(() {
            _isNameValid = false;
          });
        }
        else {
          setState(() {
            _isNameValid = true;
          });
        }
      },
      validator: (value) {
        if(value == null || value.trim() == ''){
          return 'This field must not be empty!';
        }
      },
    );
  }
}