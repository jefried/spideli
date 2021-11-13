import 'package:flutter/material.dart';
import 'package:markets/src/controllers/create_order_logistic_controller.dart';
import 'package:markets/src/controllers/order_logistic_controller.dart';
import 'package:markets/src/elements/BlockButtonWidget.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:intl/intl.dart';

class CreateOrderLogisticWidget extends StatefulWidget {

  @override
  _CreateOrderLogisticWidgetState createState() => _CreateOrderLogisticWidgetState();
}


class _CreateOrderLogisticWidgetState extends StateMVC<CreateOrderLogisticWidget> {
  CreateOrderLogisticController _con;
  DateTime dateTime = DateTime.now();
  DateTime departureTime = DateTime.now();
  DateTime arrivalTime = DateTime.now();
  int currentStep = 0;

  _CreateOrderLogisticWidgetState(): super(CreateOrderLogisticController()) {
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
      title: Text("Product information"),
      content: Container(
        height: 280,
        margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.all(Radius.circular(10)), boxShadow: [
          BoxShadow(
            blurRadius: 50,
            color: Theme.of(context).hintColor.withOpacity(0.2),
          )
        ]),
        child: Form(
          key: _con.orderProductFormKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  onSaved: (input) => _con.order.productType = input,
                  validator: (input) => input.length < 1 ? "you must give a value": null,
                  decoration: InputDecoration(
                    labelText: "Product Type",
                    labelStyle: TextStyle(color: Theme.of(context).accentColor),
                    contentPadding: EdgeInsets.all(12),
                    hintText: "Product Type",
                    hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                    prefixIcon: Icon(Icons.all_inbox, color: Theme.of(context).accentColor),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                  ),
                ),
                SizedBox(height: 30,),
                TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (input) => _con.order.masse = double.parse(input),
                  validator: (input) => input.length < 1 ? "you must give a value": null,
                  decoration: InputDecoration(
                    labelText: "Product mass(kg)",
                    labelStyle: TextStyle(color: Theme.of(context).accentColor),
                    contentPadding: EdgeInsets.all(12),
                    hintText: "50",
                    hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                    prefixIcon: Icon(Icons.line_weight, color: Theme.of(context).accentColor),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                  ),
                ),
                SizedBox(height: 30,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  onSaved: (input) => _con.order.description = input,
                  validator: (input) => input.length < 1 ? "you must give a value": null,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: "Product description",
                    labelStyle: TextStyle(color: Theme.of(context).accentColor),
                    contentPadding: EdgeInsets.all(12),
                    hintText: "description product",
                    hintMaxLines: 4,
                    hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                    prefixIcon: Icon(Icons.text_snippet, color: Theme.of(context).accentColor),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                  ),
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    ),
    Step(
      state: currentStep > 1 ? StepState.complete : StepState.indexed,
      isActive: currentStep >=1,
      title: Text("Truck information"),
      content: Container(
        height: 170,
        margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.all(Radius.circular(10)), boxShadow: [
          BoxShadow(
            blurRadius: 50,
            color: Theme.of(context).hintColor.withOpacity(0.2),
          )
        ]),
        child: Form(
          key: _con.orderTruckFormKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  onSaved: (input) => _con.order.truckType = input,
                  validator: (input) => input.length < 1 ? "you must enter a truck type": null,
                  decoration: InputDecoration(
                    labelText: "Truck Type",
                    labelStyle: TextStyle(color: Theme.of(context).accentColor),
                    contentPadding: EdgeInsets.all(12),
                    hintText: "tanker truck",
                    hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                    prefixIcon: Icon(Icons.airport_shuttle_outlined, color: Theme.of(context).accentColor),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                  ),
                ),
                SizedBox(height: 30,),
                TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (input) => _con.order.amountTruck = int.parse(input),
                  validator: (input) => input.length < 1 ? "you must enter a truck type": null,
                  decoration: InputDecoration(
                    labelText: "Number of trucks",
                    labelStyle: TextStyle(color: Theme.of(context).accentColor),
                    contentPadding: EdgeInsets.all(12),
                    hintText: "12",
                    hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                    prefixIcon: Icon(Icons.airport_shuttle_outlined, color: Theme.of(context).accentColor),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    Step(
      state: currentStep > 2 ? StepState.complete : StepState.indexed,
      isActive: currentStep >=2,
      title: Text("Route information"),
      content: Container(
        height: 320,
        margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.all(Radius.circular(10)), boxShadow: [
          BoxShadow(
            blurRadius: 50,
            color: Theme.of(context).hintColor.withOpacity(0.2),
          )
        ]),
        child: Form(
          key: _con.orderRouteFormKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10,),
                InkWell(
                  onTap: () async {
                    DateTime date = await pickDate(context, departureTime);
                    if(date != null) setState(() => departureTime = date);
                  },
                  child: TextFormField(
                    enabled: false,
                    onSaved: (input) => _con.order.departTime = departureTime,
                    validator: (input) => input.length < 1 ? "you should give a value": null,
                    decoration: InputDecoration(
                      labelText: getText(departureTime, "Departure estimated"),
                      labelStyle: TextStyle(color: Theme.of(context).accentColor),
                      contentPadding: EdgeInsets.all(12),
                      hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                      prefixIcon: Icon(Icons.date_range, color: Theme.of(context).accentColor),
                      border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                InkWell(
                  onTap: () async{
                    DateTime date = await pickDate(context, arrivalTime);
                    if(date != null) setState(() => arrivalTime = date);
                  },
                  child: TextFormField(
                    enabled: false,
                    onSaved: (input) => _con.order.arrivalTime = arrivalTime,
                    validator: (input) => input.length < 1 ? "you should give a value": null,
                    decoration: InputDecoration(
                      labelText: getText(arrivalTime,"Arrival estimated"),
                      labelStyle: TextStyle(color: Theme.of(context).accentColor),
                      contentPadding: EdgeInsets.all(12),
                      hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                      prefixIcon: Icon(Icons.date_range, color: Theme.of(context).accentColor),
                      border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                InkWell(
                  onTap: (){},
                  child: TextFormField(
                    enabled: false,
                    onSaved: (input) => _con.order.masse = double.parse(input),
                    validator: (input) => input.length < 1 ? "you should give a value": null,
                    decoration: InputDecoration(
                      labelText: "from",
                      labelStyle: TextStyle(color: Theme.of(context).accentColor),
                      contentPadding: EdgeInsets.all(12),
                      hintText: "26 g",
                      hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                      prefixIcon: Icon(Icons.location_on_outlined, color: Theme.of(context).accentColor),
                      border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                InkWell(
                  onTap: (){},
                  child: TextFormField(
                    enabled: false,
                    onSaved: (input) => _con.order.masse = double.parse(input),
                    validator: (input) => input.length < 1 ? "you should give a value": null,
                    decoration: InputDecoration(
                      labelText: "to",
                      labelStyle: TextStyle(color: Theme.of(context).accentColor),
                      contentPadding: EdgeInsets.all(12),
                      hintText: "26 g",
                      hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                      prefixIcon: Icon(Icons.location_on_outlined, color: Theme.of(context).accentColor),
                      border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    ),
    Step(
      state: currentStep > 3 ? StepState.complete : StepState.indexed,
      isActive: currentStep >=3,
      title: Text("Sender information"),
      content: Container(
        height: 240,
        margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.all(Radius.circular(10)), boxShadow: [
          BoxShadow(
            blurRadius: 50,
            color: Theme.of(context).hintColor.withOpacity(0.2),
          )
        ]),
        child: Form(
          key: _con.orderSenderFormKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  onSaved: (input) => _con.order.nameSender = input,
                  validator: (input) => input.length < 1 ? "you should add a name": null,
                  decoration: InputDecoration(
                    labelText: "Sender's name",
                    labelStyle: TextStyle(color: Theme.of(context).accentColor),
                    contentPadding: EdgeInsets.all(12),
                    hintText: "Sondi",
                    hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                    prefixIcon: Icon(Icons.person_outline, color: Theme.of(context).accentColor),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                  ),
                ),
                SizedBox(height: 30,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  onSaved: (input) => _con.order.surnameSender = input,
                  validator: (input) => input.length < 1 ? "you should add a surname": null,
                  decoration: InputDecoration(
                    labelText: "Sender's surname",
                    labelStyle: TextStyle(color: Theme.of(context).accentColor),
                    contentPadding: EdgeInsets.all(12),
                    hintText: "Hugo",
                    hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                    prefixIcon: Icon(Icons.person_outline, color: Theme.of(context).accentColor),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                  ),
                ),
                SizedBox(height: 30,),
                TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (input) => _con.order.numberPhoneSender = int.parse(input),
                  validator: (input) => input.length < 8 ? "give 8 digit at minimum": null,
                  decoration: InputDecoration(
                    labelText: "Phone number",
                    labelStyle: TextStyle(color: Theme.of(context).accentColor),
                    contentPadding: EdgeInsets.all(12),
                    hintText: "654800038",
                    hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                    prefixIcon: Icon(Icons.phone_android, color: Theme.of(context).accentColor),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    Step(
      isActive: currentStep >=4,
      title: Text("All information"),
      content: Container(),
    ),
    /*BlockButtonWidget(
              text: Text(
                "create order",
                style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 18),
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {
                if (_con.orderFormKey.currentState.validate()) {
                  _con.orderFormKey.currentState.save();
                  _con.createOrder();
                }
              },
            ),*/
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      appBar: AppBar(
        title: Text("Create Logistic Order",style: TextStyle(color: Theme.of(context).accentColor),),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(primary: Theme.of(context).accentColor),
        ),
        child: Stepper(
          type: StepperType.vertical,
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
                        "NEXT",
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
    );

  }

}