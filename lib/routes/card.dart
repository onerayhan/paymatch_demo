
import 'package:flutter/material.dart';
import 'package:paymatch_demo/model/fundings_model.dart';
import 'package:paymatch_demo/routes/details.dart';

import '../model/orders.dart';
import '../utils/color.dart';
import '../utils/styles.dart';
/*
class WaitingOrderCard extends StatelessWidget {
  TradeResult result;
  String listName;

  WaitingOrderCard({Key? key,required this.result,required this.listName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return buildWaitingOrderCard(context, result, listName , height,);
  }
}*/

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

Widget buildFundingsCard(BuildContext context, Funding funding, double height, double width) => Container(
  height: height * 0.55,
  child:   Card(
    margin: EdgeInsets.all(8.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
    color: lightColorScheme.onPrimary,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child:
            Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                      padding: EdgeInsets.fromLTRB(6.0, 30.0, 0, 0),
                      width: width,
                      height: height * 0.35,
                      decoration: BoxDecoration(color: Colors.white,
                        borderRadius: BorderRadius.circular(6.0),
                        image: DecorationImage(
                          image: AssetImage("assets/logo.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child:
                      Text("A1 Capital",
                      style: kLabelLightTextStyle,)
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0,),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                    child: Text("A1 Capital; Hisse Senedi ve VİOP işlemlerine aracılık, Yatırım Danışmanlığı, Portföy Yönetimi, Halka Arz, Borçlanma Aracı İhraçları, Şirket Değerlemesi, Şirket Satın Alma ve Birleşme, Proje Finansmanı..."))
              ],
            ),
          ),
          SizedBox(height: 16.0,),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
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
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(funding.symbol,
                          style: kSymbolNameTextStyle),
                      const SizedBox(height: 8.0,),
                      Text((funding.fullName).length < 20 ? funding.fullName : "${funding.fullName.substring(0,20)}...",
                        style: kSymbolTextStyle,),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0,),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                //USED Stack instead of linear progress indicator
                //TODO:: solve text bug(percentage is not fully visible when less than 20%)
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        width: width,
                        height: double.maxFinite,
                        decoration: BoxDecoration(
                          color: lightColorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        //color: lightColorScheme.primaryContainer,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        padding: EdgeInsets.all(2.0),
                        height: double.maxFinite,
                        width: width * funding.fundedPercentage,
                        decoration: BoxDecoration(
                          color: lightColorScheme.inversePrimary,
                          borderRadius: BorderRadius.circular(8.0),
                        ),

                      ),
                      Center(
                        child: Text( "${(funding.fundedPercentage) * 100}%",
                          style: kLabelUnoTextStyle,
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0,),
          Expanded(
              flex: 1,
              child: Text(" Kalan Hedef ${(funding.volumeRemaining * funding.price)}₺",
              ),
          ),
          SizedBox(height: 16.0,),
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          width: 1.0,
                          color: Colors.green),),
                      onPressed: () {

                      },
                      child: Text("Yatırım Yap",
                          style: kChangeGreenTextStyle,
                      ),
                  ),
                ),
                SizedBox(width: 16.0,),
                Expanded(
                  flex: 1,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        width: 1.0,
                        color: lightColorScheme.onPrimaryContainer),),
                    onPressed: () {
                      _gotoDetailsView(context);
                    },
                    child: Text("İncele",
                      style: kButtonTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
);

class FundingsCard extends StatelessWidget {
  Funding funding;


  FundingsCard({Key? key,required this.funding});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return buildFundingsCard(context, funding, height, width);
  }
}


/*
Widget buildWaitingOrderCard(BuildContext context,TradeResult result, String listName , double height) => Container(
  height: height * 0.20,
  child:   Card(
    margin: EdgeInsets.all(0.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
    color: lightColorScheme.onSecondary,
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
              mainAxisAlignment: MainAxisAlignment.center,
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
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Fiyat",
                            style: kSymbolNameTextStyle,
                          ),
                          Divider(height: 16.0, thickness: 1.5, indent: 10.0, endIndent: 10.0, color: lightColorScheme.inversePrimary,),
                          Text("${(result.price)}₺"),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Pay",
                            style: kSymbolNameTextStyle,
                          ),
                          Divider(height: 16.0, thickness: 1.5, indent: 10.0, endIndent: 10.0, color: lightColorScheme.inversePrimary,),
                          Text("${(result.volume)}₺"),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Toplam",
                            style: kSymbolNameTextStyle,
                          ),
                          Divider(height: 16.0, thickness: 1.5, indent: 10.0, endIndent: 10.0, color: lightColorScheme.inversePrimary,),
                          Text("${(result.volume * result.price)}₺"),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(height: 8.0,thickness: 1.5, indent: 10.0, endIndent: 10.0),
                //SizedBox(height: 8.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 1,
                        child: Text("Al", style: kChangeGreenTextStyle,),
                    ),

                    Expanded(
                      flex: 6,
                      child: Text(
                      "02.04.2001"
                      ),
                    ),
                  ],

                ),

              ],
            ),
          ),


        ],
      ),
    ),
  ),
);

*/

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


//class StockHeader
/*

Widget buildWalletCard2(BuildContext context,TradeResult result, String listName, height) => Container(
  height: height * 0.45,
  width: double.infinity,
  child:   Card(
    margin: EdgeInsets.all(0.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
    color: lightColorScheme.onPrimary,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //StockHeader
          Container(
            //width: ,
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: lightColorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(8),
              //border: Border.all(width: 8),
            ),
            child: Expanded(
              flex: 2,
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
                    flex: 4,
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
                ],
              ),
            ),
          ),
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
  ),
);
*/

//class StockHeader

void _gotoDetailsView(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsView()));
}

