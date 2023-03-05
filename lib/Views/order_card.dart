
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/transaction.dart';
import '../utils/color.dart';
import '../utils/styles.dart';

class ExpandableWaitingOrderCard extends StatefulWidget {

  bool isExpanded = false;
  final Widget collapsedChild;
  final Widget expandedChild;
  ExpandableWaitingOrderCard({Key? key ,required this.collapsedChild, required this.expandedChild,}) : super(key: key);
  //const ExpandableWaitingOrderCard({Key? key,required this.result}) : super(key: key);

  @override
  _ExpandableWaitingOrderCardState createState() => _ExpandableWaitingOrderCardState();
}

class _ExpandableWaitingOrderCardState extends State<ExpandableWaitingOrderCard> {


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isExpanded = !(widget.isExpanded);
        });
      },
      child: AnimatedContainer(

        duration: new Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
        child: widget.isExpanded
            ? Container(
              height: height * 0.65,
              child: Column(
                children: [
                  Container(
                    height: height * 0.15,
                    child: widget.collapsedChild,
                  ),
                  Container(
                    height: height * 0.45,
                    child: widget.expandedChild
                  ),
                  Container(
                    height: height * 0.05,
                    child: IconButton(
                      icon: Icon(Icons.arrow_drop_up),
                      onPressed: () {
                        setState(() {
                          widget.isExpanded = !(widget.isExpanded);
                        });
                      },
                    )
                  ),
                ],
              ),
            )
            : Container(
                height: height * 0.20,
                child: Column(
                  children: [
                    Container(
                        height: height * 0.15,
                        child: widget.collapsedChild
                    ),
                    Container(
                      height: height * 0.05,
                      child: IconButton(
                        icon: Icon(Icons.arrow_drop_down),
                        onPressed: () {
                          setState(() {
                            widget.isExpanded = !(widget.isExpanded);
                          });
                        },
                      )
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}


class WaitingOrderCard extends StatelessWidget {
  final Transaction result;
  const WaitingOrderCard({Key? key,required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return buildWaitingOrderCard(context, result ,height);
  }
  Widget buildWaitingOrderCard(BuildContext context,Transaction result, double height) => Container(
    height: height * 0.45,
    margin: EdgeInsets.all(0.0),
    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
    color: lightColorScheme.onSecondary,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Toplam Tutar",
                  style: kSymbolNameTextStyle,
                ),
                const SizedBox(width: 8.0,),
                Text("${(result.price * result.price)} ₺",
                  style: kPriceTextStyle,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Pay Miktarım",
                  style: kSymbolNameTextStyle,
                ),
                const SizedBox(width: 8.0,),
                Text("${(result.price)} Adet",
                  style: kPriceTextStyle,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Son Fiyat",
                  style: kSymbolNameTextStyle,
                ),
                const SizedBox(width: 8.0,),
                Text("${(result.price)} ₺",
                  style: kPriceTextStyle,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Maliyet",
                  style: kSymbolNameTextStyle,
                ),
                const SizedBox(width: 8.0,),
                Text("${(result.price)} ₺",
                  style: kPriceTextStyle,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Kar/Zarar",
                  style: kSymbolNameTextStyle,
                ),
                const SizedBox(width: 8.0,),
                Text("${((result.price) - (result.price))} ₺",
                  style: kPriceTextStyle,),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Getiri",
                  style: kSymbolNameTextStyle,
                ),
                const SizedBox(width: 8.0,),
                Text("${((result.price)) / ((result.price)) * 100}",
                  style: kPriceTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  Widget _showType(BuildContext ctx,TransType type){
    String txt="";
    TextStyle style=kChangeGreenTextStyle;
    switch(type){
      case TransType.buy:
      // TODO: Handle this case.
        txt="AL";
        style=kChangeGreenTextStyle;
        break;
      case TransType.sell:
      // TODO: Handle this case.
        txt="SAT";
        style=kChangeRedTextStyle;
        break;
      case TransType.buyLimit:
      // TODO: Handle this case.
        txt="AL";
        style=kChangeGreenTextStyle;
        break;
      case TransType.sellLimit:
      // TODO: Handle this case.
        txt="SAT";
        style=kChangeRedTextStyle;
        break;
    }
    return Text(txt,
      style: style,
      textAlign: TextAlign.center,);
  }
}

class WaitingOrderCardCollapsed extends StatelessWidget {
  final Transaction result;
  const WaitingOrderCardCollapsed({Key? key,required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return buildCollapsedCard(context, result ,height, width);
  }

  Widget buildCollapsedCard(BuildContext context, Transaction result, double height, double width) => Container(
    height: height * 0.15,
    width: width,
    color: lightColorScheme.onSecondary,
    child: Padding(
      padding: EdgeInsets.fromLTRB(width * 0.03, height * 0.02, width * 0.03, height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(height * 0.005),
              decoration: BoxDecoration(
                color: lightColorScheme.primaryContainer,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(height * 0.01),
                  bottomLeft: Radius.circular(height * 0.01),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: ClipOval(
                      child: Image.asset(
                        "assets/a1bg.jpg",
                        width: width * 0.15,
                        //height: height * 0.8,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01,),
                  Expanded(
                      flex: 1,
                      child: ((result.symbolName).length > 15)
                          ?
                      Text("AL",
                        style: kChangeGreenTextStyle,
                        textAlign: TextAlign.start,)
                          :
                      Text("SAT",
                        style: kChangeRedTextStyle,
                        textAlign: TextAlign.start,)
                  ),
                ],
              ),
            ),
          ),
          //const SizedBox(width: 16.0,),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(height * 0.005),
              decoration: BoxDecoration(
                color: lightColorScheme.primaryContainer,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(height * 0.01),
                  bottomRight: Radius.circular(height * 0.01),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(result.symbol,
                        style: kSymbolNameTextStyle),
                  ),
                  const SizedBox(height: 8.0,),
                  Expanded(
                    flex: 2,
                    child: Text((result.symbolName).length < 20 ? result.symbolName : "${result.symbolName.substring(0,20)}...",
                      style: kSymbolTextStyle,),
                  ),
                  //const SizedBox(height: 8.0,),
                  /**/
                ],
              ),
            ),
          ),
          //VerticalDivider(width: 8.0, thickness: 1.0, indent: (height * 0.04), endIndent: (height * 0.04), color: lightColorScheme.inversePrimary,),
          Expanded(
            flex: 1,
            child: Text("120",
              textAlign: TextAlign.center,
            ),
          ),
          VerticalDivider(width: 1.0, thickness: 1.0, indent: (height * 0.04), endIndent: (height * 0.04), color: lightColorScheme.inversePrimary,),
          Expanded(
            flex: 1,
            child: Text("200",
              textAlign: TextAlign.center,
            ),
          ),
          VerticalDivider(width: 1.0, thickness: 1.0, indent: (height * 0.04), endIndent: (height * 0.04), color: lightColorScheme.inversePrimary,),
          Expanded(
            flex: 2,
            child: Text("300.78",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
  );
}

class SimpleWaitingOrderCard extends StatelessWidget {
  Transaction result;
  SimpleWaitingOrderCard({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return buildSimpleWaitingOrderCard(context, result,  height, width);
  }
  Widget buildSimpleWaitingOrderCard(BuildContext context, Transaction result, double height, double width) => Container(
    height: height * 0.10,
    width: width,
    color: lightColorScheme.onSecondary,
    padding: EdgeInsets.fromLTRB(width * 0.03, height * 0.02, width * 0.03, height * 0.02),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Text("${result.symbol}",
            textAlign: TextAlign.center,
            style: kSymbolTextStyle,
          ),
        ),
        Expanded(
          child: (result.symbolName).length > 15
          ? Text("AL",
            textAlign: TextAlign.center,
            style: kChangeGreenTextStyle,)
          : Text(
            ("SAT"),
            textAlign: TextAlign.center,
            style: kChangeRedTextStyle,),
        ),
        Expanded(
          child: Text("${result.remaining}",
            textAlign: TextAlign.center,
            style: kSymbolNameTextStyle,
          ),
        ),
        VerticalDivider(width: width * 0.003, thickness: width * 0.003, indent: (height * 0.02), endIndent: (height * 0.02), color: lightColorScheme.inversePrimary,),
        Expanded(
          child: Text("${result.amount}",
            textAlign: TextAlign.center,
            style: kSymbolNameTextStyle,
          ),
        ),
        VerticalDivider(width: width * 0.003, thickness: width * 0.003, indent: (height * 0.02), endIndent: (height * 0.02), color: lightColorScheme.inversePrimary,),
        Expanded(
          child: Text("${result.price}",
            textAlign: TextAlign.center,
            style: kSymbolNameTextStyle,
          ),
        ),
      ],
    ),
  );
}

class WaitingOrdersHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: lightColorScheme.primaryContainer,
      padding: EdgeInsets.fromLTRB(width * 0.03, height * 0.02, width * 0.03, height * 0.02),
      child: Row(
        //backgroundColor: lightColorScheme.primaryContainer,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 1,
            child: Text("Sembol",
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(flex: 1,
            child: Text("Emir",
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(flex: 1,
            child: Text("Kalan Pay",
              textAlign: TextAlign.center,
            ),
          ),
          //VerticalDivider(width: width * 0.1, thickness: width * 0.1,  color: Colors.black,),
          Expanded( flex: 1,
            child: Text("Miktar",
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(flex: 1,
            child: Text("Fiyat",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
