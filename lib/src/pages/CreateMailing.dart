import 'package:flutter/material.dart';
import 'package:markets/src/controllers/create_order_logistic_controller.dart';
import 'package:markets/src/controllers/order_logistic_controller.dart';
import 'package:markets/src/elements/BlockButtonWidget.dart';
import 'package:markets/src/elements/DrawerWidget.dart';
import 'package:markets/src/elements/ReceiverForm.dart';
import 'package:markets/src/elements/ReviewForm.dart';
import 'package:markets/src/elements/ReviewFormMailing.dart';
import 'package:markets/src/elements/SenderForm.dart';
import 'package:markets/src/elements/SenderFormMailing.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:intl/intl.dart';

class CreateOrderMailingWidget extends StatefulWidget {

  @override
  _CreateOrderMailingWidgetState createState() => _CreateOrderMailingWidgetState();
}


class _CreateOrderMailingWidgetState extends StateMVC<CreateOrderMailingWidget> {
  CreateOrderLogisticController _con;
  DateTime dateTime = DateTime.now();
  DateTime departureTime = DateTime.now();
  DateTime arrivalTime = DateTime.now();
  int currentStep = 0;

  _CreateOrderMailingWidgetState(): super(CreateOrderLogisticController()) {
    _con = controller;
  }

  String getText(DateTime date, String text) {
    if(dateTime == null) {
      return text;
    } else {
      return DateFormat('dd/MM/yyyy').format(date);
    }
  }

  Future<DateTime> pickDateTime(BuildContext context) async {
    final date = await pickDate(context, dateTime);
    if (date == null) return null;

    final time = await pickTime(context);
    if (time == null) return null;

    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }

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

  Future<TimeOfDay> pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: dateTime != null
          ? TimeOfDay(hour: dateTime.hour, minute: dateTime.minute)
          : initialTime,
    );

    if(newTime == null) return null;

    return newTime;
  }

  List<Step> getSteps() => [
    Step(
      state: currentStep > 0 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 0,
      title: Text("Shipment"),
      content: SenderFormMailing(),
    ),
    Step(
      state: currentStep > 1 ? StepState.complete : StepState.indexed,
      isActive: currentStep >=1,
      title: Text("Recipient"),
      content: ReceiverForm(),
    ),
    Step(
      isActive: currentStep >=2,
      title: Text("Review"),
      content: ReviewFormMailing(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _con.scaffoldKey,
        drawer: DrawerWidget(),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                color: Theme.of(context).accentColor,
                height: 140 ,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Positioned(
              left: 165,
              top: -57 ,
              child: Container(
                width: 262,
                height: 262 ,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).accentColor.withOpacity(0.2),
                ),
              ),
            ),
            Positioned(
              top: 45,
              child: IconButton(
                icon: new Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),//_con.scaffoldKey.currentState.openDrawer(),
              ),
            ),
            Positioned(
              top: 57 ,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    "Create Mailing Order",
                    style: TextStyle(
                        fontFamily: "Manrope-ExtraLight",
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 100,
              child: Container(
                height: MediaQuery.of(context).size.height - 100,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    )
                ),
                child: Padding(
                    padding: EdgeInsets.only(
                      top: 25,
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(primary: Theme.of(context).accentColor),
                      ),
                      child: Stepper(
                        type: StepperType.horizontal,
                        steps: getSteps(),
                        currentStep: currentStep,
                        onStepContinue: (){
                          final isLastStep = currentStep == getSteps().length - 1;
                          if(isLastStep) {
                            print("Completed");
                          }else {
                            setState(() => currentStep += 1);
                          }
                        },
                        onStepTapped: (step) => setState(() => currentStep = step),
                        onStepCancel: currentStep == 0 ? null : () => setState(() => currentStep -= 1),
                        controlsBuilder: (context, {onStepContinue, onStepCancel}) {
                          final isLastStep = currentStep == getSteps().length - 1;

                          return Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  currentStep != 0?BlockButtonWidget(
                                      text: Text(
                                        "BACK",
                                        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14),
                                      ),
                                      color: Theme.of(context).accentColor,
                                      onPressed: onStepCancel
                                  ):Container(),
                                  BlockButtonWidget(
                                      text: Text(
                                        isLastStep?"CREATE ORDER":"NEXT",
                                        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14),
                                      ),
                                      color: Theme.of(context).accentColor,
                                      onPressed: onStepContinue
                                  ),
                                ],
                              )
                          );
                        },
                      ),
                    )
                ),
              ),
            )
          ],
        )
    );

  }
}