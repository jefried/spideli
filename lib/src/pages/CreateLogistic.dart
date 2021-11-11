import 'package:flutter/material.dart';
import 'package:markets/src/controllers/create_order_logistic_controller.dart';
import 'package:markets/src/controllers/order_logistic_controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class CreateOrderLogisticWidget extends StatefulWidget {

  @override
  _CreateOrderLogisticWidgetState createState() => _CreateOrderLogisticWidgetState();
}


class _CreateOrderLogisticWidgetState extends StateMVC<CreateOrderLogisticWidget> {
  CreateOrderLogisticController _con;

  _CreateOrderLogisticWidgetState(): super(CreateOrderLogisticController()) {
    _con = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      appBar: AppBar(
        title: Text("Create Logistic Order",style: TextStyle(color: Theme.of(context).accentColor),),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.all(Radius.circular(10)), boxShadow: [
          BoxShadow(
            blurRadius: 50,
            color: Theme.of(context).hintColor.withOpacity(0.2),
          )
        ]),
        child: Form(
          key: _con.orderFormKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30,),
                TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (input) => _con.order.masse = double.parse(input),
                  validator: (input) => input.length < 1 ? "you should give a value": null,
                  decoration: InputDecoration(
                    labelText: "masse",
                    labelStyle: TextStyle(color: Theme.of(context).accentColor),
                    contentPadding: EdgeInsets.all(12),
                    hintText: "26 g",
                    hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                    prefixIcon: Icon(Icons.person_outline, color: Theme.of(context).accentColor),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }

}