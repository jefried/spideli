import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:markets/src/models/order_logistic.dart';

import '../../generated/l10n.dart';
import '../helpers/helper.dart';
import '../models/order.dart';
import '../models/route_argument.dart';
import 'ProductOrderItemWidget.dart';

class OrderLogisticItemWidget extends StatefulWidget {
  final bool expanded;
  final OrderLogistic order;
  final ValueChanged<void> onCanceled;

  OrderLogisticItemWidget({Key key, this.expanded, this.order, this.onCanceled}) : super(key: key);

  @override
  _OrderLogisticItemWidgetState createState() => _OrderLogisticItemWidgetState();
}

class _OrderLogisticItemWidgetState extends State<OrderLogisticItemWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: widget.order.active ? 1 : 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 14),
                padding: EdgeInsets.only(top: 20, bottom: 5),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.9),
                  boxShadow: [
                    BoxShadow(color: Theme.of(context).focusColor.withOpacity(0.1), blurRadius: 5, offset: Offset(0, 2)),
                  ],
                ),
                child: Theme(
                  data: theme,
                  child: ExpansionTile(
                    initiallyExpanded: widget.expanded,
                    title: Column(
                      children: <Widget>[
                        Text('${S.of(context).order_id}: #${widget.order.id}'),
                        Text(
                          DateFormat('dd-MM-yyyy | HH:mm').format(widget.order.createdAt),
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Helper.getPrice(225.59, context, style: Theme.of(context).textTheme.headline4),
                        Text(
                          '${widget.order.payment.method}',
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    "weight",
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                Text(widget.order.masse.toString() + " g",)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    "departure estimated",
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                Text(
                                  DateFormat('dd-MM-yyyy | HH:mm').format(widget.order.departTime),
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    "arrival estimated",
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                Text(
                                  DateFormat('dd-MM-yyyy | HH:mm').format(widget.order.arrivalTime),
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    "from",
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                Text(widget.order.departAddress.address)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    "to",
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                Text(widget.order.arrivalAddress.address)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    "recipient",
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                Text(widget.order.nameReceiver)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    "phone number",
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                Text(widget.order.numberPhoneReceiver.toString())
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    S.of(context).delivery_fee,
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                Helper.getPrice(widget.order.deliveryFee, context, style: Theme.of(context).textTheme.subtitle1)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    '${S.of(context).tax} (${widget.order.tax}%)',
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                Helper.getPrice(7.08, context, style: Theme.of(context).textTheme.subtitle1)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    S.of(context).total,
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                Helper.getPrice(225.59, context, style: Theme.of(context).textTheme.headline4)
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Wrap(
                  alignment: WrapAlignment.end,
                  children: <Widget>[
                    MaterialButton(
                      elevation: 0,
                      onPressed: () {
                        //Navigator.of(context).pushNamed('/Tracking', arguments: RouteArgument(id: widget.order.id));
                      },
                      textColor: Theme.of(context).hintColor,
                      child: Wrap(
                        children: <Widget>[Text(S.of(context).view)],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 0),
                    ),
                    if (widget.order.canCancelOrder())
                      MaterialButton(
                        elevation: 0,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              // return object of type Dialog
                              return AlertDialog(
                                title: Wrap(
                                  spacing: 10,
                                  children: <Widget>[
                                    Icon(Icons.report_outlined, color: Colors.orange),
                                    Text(
                                      S.of(context).confirmation,
                                      style: TextStyle(color: Colors.orange),
                                    ),
                                  ],
                                ),
                                content: Text(S.of(context).areYouSureYouWantToCancelThisOrder),
                                contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                                actions: <Widget>[
                                  MaterialButton(
                                    elevation: 0,
                                    child: new Text(
                                      S.of(context).yes,
                                      style: TextStyle(color: Theme.of(context).hintColor),
                                    ),
                                    onPressed: () {
                                      widget.onCanceled(widget.order);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  MaterialButton(
                                    elevation: 0,
                                    child: new Text(
                                      S.of(context).close,
                                      style: TextStyle(color: Colors.orange),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        textColor: Theme.of(context).hintColor,
                        child: Wrap(
                          children: <Widget>[Text(S.of(context).cancel + " ")],
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(start: 20),
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 28,
          width: 140,
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(100)), color: widget.order.active ? Theme.of(context).accentColor : Colors.redAccent),
          alignment: AlignmentDirectional.center,
          child: Text(
            widget.order.active ? '${widget.order.orderStatus.status}' : S.of(context).canceled,
            maxLines: 1,
            overflow: TextOverflow.fade,
            softWrap: false,
            style: Theme.of(context).textTheme.caption.merge(TextStyle(height: 1, color: Theme.of(context).primaryColor)),
          ),
        ),
      ],
    );
  }
}
