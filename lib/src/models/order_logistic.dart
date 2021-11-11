import '../models/address.dart';
import '../models/order_status.dart';
import '../models/payment.dart';
import '../models/product_order.dart';
import '../models/user.dart';

class OrderLogistic {
  String id;
  bool active;
  Payment payment;
  double tax;
  double deliveryFee;
  DateTime createdAt;
  DateTime updatedAt;
  String productType;
  double masse;
  String description;
  Address departAddress;
  Address arrivalAddress;
  int amountTruck;
  String truckType;
  DateTime departTime;
  DateTime arrivalTime;
  String nameReceiver;
  String surnameReceiver;
  int numberPhoneReceiver;
  OrderStatus orderStatus;
  String locationStatus;

  OrderLogistic();

  OrderLogistic.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'].toString();
      active = jsonMap['active'];
      tax = jsonMap['tax'];
      deliveryFee = jsonMap['deliveryFee'];
      createdAt = jsonMap['createdAt'];
      updatedAt = jsonMap['updatedAt'];
      productType = jsonMap['productType'].toString();
      masse = jsonMap['masse'];
      description = jsonMap['description'].toString();
      departAddress = jsonMap['departAddress'];
      arrivalAddress = jsonMap['arrivalAddress'];
      amountTruck = jsonMap['amountTruck'];
      truckType = jsonMap['truckType'];
      departTime = jsonMap['departTime'];
      arrivalTime = jsonMap['arrivalTime'];
      nameReceiver = jsonMap['nameReceiver'].toString();
      surnameReceiver = jsonMap['surnameReceiver'].toString();
      numberPhoneReceiver = jsonMap['numberPhoneReceiver'];
      orderStatus = jsonMap['status'];
      locationStatus = jsonMap['locationStatus'].toString();
      payment = jsonMap['payment'];

    } catch (e) {
      productType = '';
      masse = 0;
      description = '';
      nameReceiver = '';
      surnameReceiver = '';
    }
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map['active'] = active;
    map["tax"] = tax;
    map["deliveryFee"] = deliveryFee;
    map["createdAt"] = createdAt;
    map["updatedAt"] = updatedAt;
    map["productType"] = productType;
    map["masse"] = masse;
    map["description"] = description;
    map["departAddress"] = departAddress;
    map['arrivalAddress'] = arrivalAddress;
    map['amountTruck'] = amountTruck;
    map['truckType'] = truckType;
    map['departTime'] = departTime;
    map['arrivalTime'] = arrivalTime;
    map["nameReceiver"] = nameReceiver;
    map["surnameReceiver"] = surnameReceiver;
    map["numberPhoneReceiver"] = numberPhoneReceiver;
    map["status"] = orderStatus;
    map["locationStatus"] = locationStatus;
    map["payment"] = payment;
    return map;
  }

  bool canCancelOrder() {
    return this.active == true && this.orderStatus.id == '1'; // 1 for order received status
  }
}
