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


    OrderLogistic order1 = OrderLogistic();
    order1.active = true;
    order1.payment = Payment('cash on Delivery');
    order1.masse = 2045;
    order1.departTime = DateTime.now();
    order1.arrivalTime = DateTime.now();
    order1.departAddress = Address();
    order1.departAddress.address = "Melen";
    order1.arrivalAddress = Address();
    order1.arrivalAddress.address = "Jouvence";
    order1.orderStatus = OrderStatus();
    order1.orderStatus.status = 'On the Way';
    order1.id = "1";
    order1.createdAt = DateTime.now();
    order1.truckType = "tanker truck";
    order1.amountTruck = 3;
    order1.nameSender = "sondi";
    order1.surnameSender = "hugo";
    order1.numberPhoneSender = 654871038;
    orders.add(order);
    orders.add(order1);
  }

  void doCancelOrder(OrderLogistic order) {

  }

  Future<void> refreshOrders() async {
    orders.clear();
    listenForOrders();
  }
}
