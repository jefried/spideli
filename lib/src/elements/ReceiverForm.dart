import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:markets/src/elements/InternlPhoneNumberField.dart';
import 'package:markets/src/elements/PackageSizeBox.dart';
import 'package:markets/src/elements/SimpleTextFormField.dart';
import 'package:intl/intl.dart';



class ReceiverForm extends StatefulWidget {
  const ReceiverForm({ Key key }) : super(key: key);

  @override
  _ReceiverFormState createState() => _ReceiverFormState();
}

class _ReceiverFormState extends State<ReceiverForm> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _sendernameTextController = TextEditingController();
  final TextEditingController _adressTextController = TextEditingController();
  final TextEditingController _packageDetailController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();
  bool _isNameValid = false;
  String dropdownValue = 'Drugs';
  String dropdownValueTruck = 'Tanker Truck';
  List<String> dropdownItems = ['Drugs', 'Foods',];
  List<String> dropdownItemsTruck = ['Tanker Truck', 'Dump Truck'];
  String initialCountry = 'CM';
  PhoneNumber number = PhoneNumber(isoCode: 'CM');
  DateTime departureTime = DateTime.now();
  int numberPhoneSender;

  Future<DateTime> pickDate(BuildContext context, DateTime date) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: date ?? initialDate,
      firstDate:  DateTime(DateTime.now().year - 5),
      lastDate:  DateTime(DateTime.now().year + 5),
    );

    if(newDate == null) return null;

    return newDate;
  }

  String getText(DateTime date, String text) {
    if(departureTime == null) {
      return text;
    } else {
      return DateFormat('dd/MM/yyyy').format(date);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            const Text(
              "Recipient Name",
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Helvetica',
              ),
            ),
            SizedBox(height: 13),
            SimpleTextFormField(textController: _sendernameTextController, hintText: 'Enter Recipient Name',),
            SizedBox( height: 27),
            const Text(
              "Arrival Adress",
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Helvetica',
              ),
            ),
            SizedBox( height: 13,),
            SimpleTextFormField(textController: _adressTextController, hintText: 'Shipping Destination',),
            SizedBox( height: 27),
            const Text(
              "Recipient Phone Number",
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Helvetica',
              ),
            ),
            SizedBox( height: 13),
            InternlPhoneNumberField(phonenumberController: _phonenumberController),
            SizedBox(height: 27,),
            const Text(
              "Additional notes",
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Helvetica',
              ),
            ),
            SizedBox( height: 13,),
            SimpleTextFormField(textController: _packageDetailController, hintText: 'Notes',),
            SizedBox(height: 27,),
          ],
        ),
      ),
    );

  }
}