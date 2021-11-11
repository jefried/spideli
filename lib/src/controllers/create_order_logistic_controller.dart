import 'package:flutter/material.dart';
import 'package:markets/src/models/address.dart';
import 'package:markets/src/models/order_logistic.dart';
import 'package:markets/src/models/order_status.dart';
import 'package:markets/src/models/payment.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/l10n.dart';
import '../models/order.dart';
import '../repository/order_repository.dart';

class CreateOrderLogisticController extends ControllerMVC {
  OrderLogistic order = OrderLogistic();
  GlobalKey<FormState> orderFormKey;
  GlobalKey<ScaffoldState> scaffoldKey;

  CreateOrderLogisticController() {
    orderFormKey = new GlobalKey<FormState>();
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }
}
