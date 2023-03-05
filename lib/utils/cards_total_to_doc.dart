
import 'package:flutter/material.dart';
import 'package:paymatch_demo/utils/styles.dart';

import '../model/orders.dart';
import '../model/transaction.dart';
import 'color.dart';

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



class ExpandableWalletCard extends StatefulWidget {
  bool isExpanded;
  final Widget collapsedChild;
  final Widget expandedChild;

  ExpandableWalletCard(
      { Key? key, required this.isExpanded, required this.collapsedChild, required this.expandedChild})
      : super(key: key);

  @override
  State<ExpandableWalletCard> createState() =>
      _ExpandableWalletCardState();


}

class _ExpandableWalletCardState extends State<ExpandableWalletCard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isExpanded = !widget.isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: new Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
        child: widget.isExpanded
          ? Container(
            height: height * 0.62,
            child: Column(
              children: [
                Container(
                  height: height * 0.12,
                  child: widget.collapsedChild,
                ),
                Container(
                    height: height * 0.45,
                    child: widget.expandedChild
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.isExpanded = !(widget.isExpanded);
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    height: height * 0.05,
                    color: lightColorScheme.onPrimary,
                    child: Center(
                      child: Icon(Icons.arrow_drop_up),
                    ),
                  ),
                ),
              ],
            ),
          )
          : Container(
            height: height * 0.15,
            child: Column(
              children: [
                Container(
                    height: height * 0.12,
                    child: widget.collapsedChild
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.isExpanded = !(widget.isExpanded);
                    });
                  },
                  child: Container(
                    //margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    height: height * 0.03,
                    color: lightColorScheme.onPrimary,
                    child: Center(
                      child: Icon(Icons.arrow_drop_down),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



//uses TradeResult and listName
//change to asset and delete listName from here and from buildWalletCard2
class WalletCard extends StatelessWidget {
  TradeResult result;
  String listName;

  void setCompanyName(){

  }

  WalletCard({Key? key,required this.result,required this.listName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return buildWalletCard2(context, result, listName, height);
  }
}

Widget buildWalletCard2(BuildContext context,TradeResult result, String listName, height) => Container(
  height: height * 0.45,
  width: double.infinity,
  color:lightColorScheme.onPrimary,
  child: Padding(
    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: Column(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //StockHeader
        //const SizedBox(width: 16.0,),
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
              Text("${(result.volume * result.ask)} ₺",
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
              Text("${(result.volume)} Adet",
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
              Text("${(result.ask)} ₺",
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
              Text("${((result.volume * result.price) - (result.volume * result.ask))} ₺",
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
              Text("${((result.volume * result.price) - (result.volume * result.ask)) / ((result.volume * result.ask)) * 100}",
                style: kPriceTextStyle,
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);



//uses TradeResult and listName
//change to asset and delete listName from here and from buildWalletCard2
class WalletCardNonExpanded extends StatelessWidget {
  TradeResult result;
  String listName;
  WalletCardNonExpanded({Key? key,required this.result, required this.listName}) : super(key: key);
  //String listName;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.10,
      color: lightColorScheme.onPrimary,
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: lightColorScheme.primaryContainer,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0)),
              //border: Border.all(width: 8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: ClipOval(
                    child: Image.network("https://play-lh.googleusercontent.com/8MCdyr0eVIcg8YVZsrVS_62JvDihfCB9qERUmr-G_GleJI-Fib6pLoFCuYsGNBtAk3c",
                      width: 40.0,
                      height: 60.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(width: 8.0,),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(result.symbol,
                          style: kSymbolNameTextStyle),
                      const SizedBox(height: 8.0,),
                      Text((result.fullName).length < 20 ? result.fullName : "${result.fullName.substring(0,20)}...",
                        style: kSymbolTextStyle,),
                    ],
                  ),
                ),
                Expanded(flex: 1,
                  child: IconButton(
                    icon: Icon(Icons.info_outline_rounded),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}