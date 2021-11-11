import 'package:flutter/material.dart';
import 'package:markets/src/controllers/order_logistic_controller.dart';
import 'package:markets/src/elements/DrawerWidget.dart';
import 'package:markets/src/elements/EmptyOrdersWidget.dart';
import 'package:markets/src/elements/OrderLogisticItemWidget.dart';
import 'package:markets/src/elements/PermissionDeniedWidget.dart';
import 'package:markets/src/elements/SearchBarWidget.dart';
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
    print(_con.orders.length);
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
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.sort, color: Theme.of(context).hintColor),
          onPressed: () => this.scaffoldKey.currentState.openDrawer(),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Logistic orders",
          overflow: TextOverflow.fade,
          maxLines: 1,
          style: Theme.of(context).textTheme.headline6.merge(TextStyle(letterSpacing: 1.3)),
        ),
      ),
      body: currentUser.value.apiToken == null
          ? PermissionDeniedWidget()
          : _con.orders.isEmpty
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
              SizedBox(height: 20),
              ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                primary: false,
                itemCount: _con.orders.length,
                itemBuilder: (context, index) {
                  var _order = _con.orders.elementAt(index);
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
    );
  }
}
