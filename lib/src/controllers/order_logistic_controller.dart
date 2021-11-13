import 'package:flutter/material.dart';
import 'package:markets/src/models/address.dart';
import 'package:markets/src/models/order_logistic.dart';
import 'package:markets/src/models/order_status.dart';
import 'package:markets/src/models/payment.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/l10n.dart';
import '../models/order.dart';
import '../repository/order_repository.dart';

class OrderLogisticController extends ControllerMVC {
  List<OrderLogistic> orders = <OrderLogistic>[];
  GlobalKey<ScaffoldState> scaffoldKey;

  OrderLogisticController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
    listenForOrders();
  }

  void listenForOrders({String message}) {
    OrderLogistic order = OrderLogistic();
    order.active = true;
    order.payment = Payment('cash on Delivery');
    order.masse = 2045;
    order.departTime = DateTime.now();
    order.arrivalTime = DateTime.now();
    order.departAddress = Address();
    order.departAddress.address = "Melen";
    order.arrivalAddress = Address();
    order.arrivalAddress.address = "Jouvence";
    order.orderStatus = OrderStatus();
    order.orderStatus.status = 'Delivered';
    order.id = "1";
    order.createdAt = DateTime.now();
    order.truckType = "tanker truck";
    order.amountTruck = 3;
    order.nameSender = "sondi";
    order.surnameSender = "hugo";
    order.numberPhoneSender = 654871038;
    orders.add(order);
  }

  void doCancelOrder(OrderLogistic order) {

  }

  Future<void> refreshOrders() async {
    orders.clear();
    listenForOrders();
  }
}
