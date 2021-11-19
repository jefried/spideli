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
      key: this.scaffoldKey,
      drawer: DrawerWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/CreateLogistic");
        },
        child: const Icon(Icons.add),
        backgroundColor: Theme.of(context).accentColor,
      ),
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
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Positioned(
            top: 57 ,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  "Logistic Orders",
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
            top: 110,
            child: Container(
              height: MediaQuery.of(context).size.height - 110,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                  )
              ),
              child: Column(
                children: [
                  Container(
                    height: 20,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 40,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              onProgress = true;
                            });
                          },
                          child: Container(
                            child: Text(
                              "On Progress",
                              style: TextStyle(
                                  fontFamily: "Manrope-ExtraLight",
                                  fontWeight: FontWeight.bold,
                                  color: onProgress?Theme.of(context).accentColor: Colors.black,
                                  fontSize: 14
                              ),
                            ),
                          )
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              onProgress = false;
                            });
                          },
                          child: Container(
                            child: Text(
                              "Complete",
                              style: TextStyle(
                                  fontFamily: "Manrope-ExtraLight",
                                  fontWeight: FontWeight.bold,
                                  color: !onProgress?Theme.of(context).accentColor: Colors.black,
                                  fontSize: 14
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 150,
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: SingleChildScrollView(
                        child: currentUser.value.apiToken == null
                            ? PermissionDeniedWidget()
                            : onProgress
                            ? ordersOnProgress.isEmpty
                            ? EmptyOrdersWidget()
                            : RefreshIndicator(
                          onRefresh: _con.refreshOrders,
                          child: SingleChildScrollView(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                SizedBox(height: 5,),
                                ListView.separated(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  primary: false,
                                  itemCount: ordersOnProgress.length,
                                  itemBuilder: (context, index) {
                                    var _order = ordersOnProgress.elementAt(index);
                                    return OrderLogisticItemWidget(
                                      expanded: index == 0 ? true : false,
                                      order: _order,
                                      onCanceled: (e) {
                                        _con.doCancelOrder(_order);
                                      },
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(height: 20);
                                  },
                                ),
                                SizedBox(height: 70),
                              ],
                            ),
                          ),
                        )
                        :ordersCompleted.isEmpty
                          ? EmptyOrdersWidget()
                          : RefreshIndicator(
                      onRefresh: _con.refreshOrders,
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            SizedBox(height: 5,),
                            ListView.separated(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              primary: false,
                              itemCount: ordersCompleted.length,
                              itemBuilder: (context, index) {
                                var _order = ordersCompleted.elementAt(index);
                                return OrderLogisticItemWidget(
                                  expanded: index == 0 ? true : false,
                                  order: _order,
                                  onCanceled: (e) {
                                    _con.doCancelOrder(_order);
                                  },
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 20);
                              },
                            ),
                            SizedBox(height: 70),
                          ],
                        ),
                      ),
                    ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
