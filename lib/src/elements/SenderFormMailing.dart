import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:markets/src/elements/InternlPhoneNumberField.dart';
import 'package:markets/src/elements/PackageSizeBox.dart';
import 'package:markets/src/elements/SimpleTextFormField.dart';
import 'package:intl/intl.dart';



class SenderFormMailing extends StatefulWidget {
  const SenderFormMailing({ Key key }) : super(key: key);

  @override
  _SenderFormMailingState createState() => _SenderFormMailingState();
}

class _SenderFormMailingState extends State<SenderFormMailing> {

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
              "Sender Name",
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Helvetica',
              ),
            ),
            SizedBox(height: 13),
            SimpleTextFormField(textController: _sendernameTextController, hintText: 'Enter Sender Name',),
            SizedBox( height: 27),
            const Text(
              "Departure Adress",
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Helvetica',
              ),
            ),
            SizedBox( height: 13,),
            SimpleTextFormField(textController: _adressTextController, hintText: 'Shipping Destination',),
            SizedBox( height: 27),
            const Text(
              "Sender Phone Number",
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Helvetica',
              ),
            ),
            SizedBox( height: 13),
            InternlPhoneNumberField(phonenumberController: _phonenumberController),
            SizedBox(height: 27,),
            const Text(
              "Package Type",
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Helvetica',
              ),
            ),
            SizedBox( height: 13,),
            InputDecorator(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                contentPadding: const EdgeInsets.all(10),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: dropdownValue,
                  isDense: true,
                  isExpanded: true,
                  items: dropdownItems
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 27,),
            const Text(
              "Package Size",
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Helvetica',
              ),
            ),
            SizedBox(height: 13,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const PackageSizeBox(imagePath: 'assets/img/lowweight.png', labelText: '<1kg'),
                SizedBox(width: 18),
                const PackageSizeBox(imagePath: 'assets/img/meanweight.png', labelText: '1kg - 10kg'),
                SizedBox(width: 18),
                const PackageSizeBox(imagePath: 'assets/img/highweight.png', labelText: '10kg - 26kg'),
              ],
            ),
            SizedBox(height: 27,),
            const Text(
              "Package Details",
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Helvetica',
              ),
            ),
            SizedBox( height: 13,),
            SimpleTextFormField(textController: _packageDetailController, hintText: 'Notes',),
            SizedBox(height: 27,),
            const Text(
              "Departure Date",
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Helvetica',
              ),
            ),
            SizedBox( height: 13,),
            InkWell(
              onTap: () async {
                DateTime date = await pickDate(context, departureTime);
                if(date != null) setState(() => departureTime = date);
              },
              child: TextFormField(
                enabled: false,
                validator: (input) => input.length < 1 ? "you should give a value": null,
                decoration: InputDecoration(
                  labelText: getText(departureTime, "Departure estimated"),
                  labelStyle: TextStyle(color: Colors.black),
                  contentPadding: EdgeInsets.all(12),
                  hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                  border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}