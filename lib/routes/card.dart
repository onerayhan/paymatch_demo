
import 'package:flutter/material.dart';

import '../model/orders.dart';
import '../utils/color.dart';
import '../utils/styles.dart';

class WaitingOrderCard extends StatelessWidget {
  TradeResult result;
  String listName;

  WaitingOrderCard({Key? key,required this.result,required this.listName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildWaitingOrderCard(context, result, listName);
  }
}

class WalletCard extends StatelessWidget {
  TradeResult result;
  String listName;
  void setCompanyName(){
    
  }
  
  WalletCard({Key? key,required this.result,required this.listName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildWalletCard(context, result, listName);
  }
}


Widget buildWaitingOrderCard(BuildContext context,TradeResult result, String listName) => Card(
  margin: EdgeInsets.all(0.0),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
  color: lightColorScheme.onPrimary,
  child: Padding(
    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: ClipOval(
            child: Image.network("https://play-lh.googleusercontent.com/8MCdyr0eVIcg8YVZsrVS_62JvDihfCB9qERUmr-G_GleJI-Fib6pLoFCuYsGNBtAk3c",
              width: 60.0,
              height: 60.0,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(width: 16.0,),
        Expanded(
          flex: 4,
          child: Column(
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
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Fiyat",
                style: kSymbolNameTextStyle,
              ),
              const SizedBox(height: 8.0,),
              Text("${(result.price)}"),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Pay",
                style: kSymbolNameTextStyle,
              ),
              const SizedBox(height: 8.0,),
              Text("${(result.volume)}"),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Toplam",
                style: kSymbolNameTextStyle,
              ),
              const SizedBox(height: 8.0,),
              Text("${(result.volume * result.price)}"),
            ],
          ),
        ),
      ],
    ),
  ),
);



Widget buildWalletCard(BuildContext context,TradeResult result, String listName) => Card(
  margin: EdgeInsets.all(0.0),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
  color: lightColorScheme.onPrimary,
  child: Padding(
    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: ClipOval(
            child: Image.network("https://play-lh.googleusercontent.com/8MCdyr0eVIcg8YVZsrVS_62JvDihfCB9qERUmr-G_GleJI-Fib6pLoFCuYsGNBtAk3c",
              width: 60.0,
              height: 60.0,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(width: 16.0,),
        Expanded(
          flex: 4,
          child: Column(
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

        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Payım",
                style: kSymbolNameTextStyle,
              ),
              const SizedBox(height: 8.0,),
              Text("${(result.volume)}"),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Kar/Zarar",
                style: kSymbolNameTextStyle,
              ),
              const SizedBox(height: 8.0,),
              Text("${((result.volume * result.price) - (result.volume * result.ask))}"),
            ],
          ),
        ),
      ],
    ),
  ),
);