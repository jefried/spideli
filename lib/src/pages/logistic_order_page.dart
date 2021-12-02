import 'package:flutter/material.dart';
import 'package:markets/src/controllers/order_logistic_controller.dart';
import 'package:markets/src/elements/DrawerWidget.dart';
import 'package:markets/src/elements/EmptyOrdersWidget.dart';
import 'package:markets/src/elements/OrderLogisticItemWidget.dart';
import 'package:markets/src/elements/PermissionDeniedWidget.dart';
import 'package:markets/src/elements/SearchBarWidget.dart';
import 'package:markets/src/models/order_logistic.dart';
import 'package:markets/src/repository/order_repository.dart';
import 'package:markets/src/repository/user_repository.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class OrdersLogisticWidget extends StatefulWidget {

  OrdersLogisticWidget({Key key}) : super(key: key);

  @override
  _OrdersLogisticWidgetState createState() => _OrdersLogisticWidgetState();
}

class _OrdersLogisticWidgetState extends StateMVC<OrdersLogisticWidget> {

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  OrderLogisticController _con;
  bool onProgress = true;

  _OrdersLogisticWidgetState() : super(OrderLogisticController()) {
    _con = controller;
  }

  @override
  void initState() {
    _con.listenForOrders();
    _con.listenForOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<OrderLogistic> ordersCompleted = [];
    List<OrderLogistic> ordersOnProgress = [];
    _con.orders.forEach((e) {
      if(e.orderStatus.status == 'Delivered') {
        ordersCompleted.add(e);
      } else {
        ordersOnProgress.add(e);
      }
    });
    return Scaffold(
      body: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Theme.of(context).accentColor,
              title: Text("Logistic Orders"),
              bottom: TabBar(
                tabs: [
                  Tab(child: Text("On Progress"),),
                  Tab(child: Text("Complete"),)
                ],
              ),
            ),
            body: TabBarView(children: [
              Container(child: Text(""),),
              Container(child: Text(""),),
            ],),
          )
      ),
    );
  }
}
