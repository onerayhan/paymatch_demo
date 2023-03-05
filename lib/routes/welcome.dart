import 'package:paymatch_demo/model/transaction.dart';
import 'package:paymatch_demo/routes/expandable_wallet_card.dart';
import 'package:paymatch_demo/routes/fundings.dart';
import 'package:paymatch_demo/utils/color.dart';
import 'package:paymatch_demo/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:paymatch_demo/utils/styles.dart';
import 'package:persistent_header_adaptive/adaptive_height_sliver_persistent_header.dart';

import '../model/orders.dart';
import 'card.dart';
import '../Views/order_card.dart';


class PortfolioView extends StatefulWidget {
  const PortfolioView({Key? key}) : super(key: key);

  @override
  State<PortfolioView> createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<PortfolioView> {

//fake instance
  List<Transaction> results = [
    Transaction(id: 40, symbol: "AAPL", amount: 260, remaining: 140, price: 345.30, expiration: 2023,time: 1345 ,status: TransStatus.success, transType: TransType.buy, symbolName: "Apple Inc."),
    Transaction(id: 40, symbol: "AMZN", amount: 260, remaining: 140, price: 345.30, expiration: 2023,time: 1345 ,status: TransStatus.success, transType: TransType.buy, symbolName: "Amazon Inc."),
    Transaction(id: 40, symbol: "EXXN", amount: 260, remaining: 140, price: 345.30, expiration: 2023, time: 1345 ,status: TransStatus.success, transType: TransType.buy, symbolName: "Exxon Mobile Oil Company Inc."),
    Transaction(id: 40, symbol: "TMNT", amount: 260, remaining: 140, price: 345.30, expiration: 2023,time: 1345 ,status: TransStatus.success, transType: TransType.buy, symbolName: "Teenage Mutant Ninja Turtles Incorporated."),
    Transaction(id: 40, symbol: "AAPL", amount: 260, remaining: 140, price: 345.30, expiration: 2023,time: 1345 ,status: TransStatus.success, transType: TransType.buy, symbolName: "Apple Inc."),
    Transaction(id: 40, symbol: "AAPL", amount: 260, remaining: 140, price: 345.30, expiration: 2023,time: 1345 ,status: TransStatus.success, transType: TransType.buy, symbolName: "Apple Inc."),


  ];
  List<TradeResult> results2 = [
    TradeResult("AMZN", "Amazon Inc.", RET_CODE.PLACED, 0, 150, 345.30, 345.31, 345.30),
    TradeResult("EXXN", "Exxon Mobile Oil Company Inc.", RET_CODE.PLACED, 0, 150, 345.30, 345.31, 345.30),
    TradeResult("TMNT", "Teenage Mutant Ninja Turtles Incorporated.", RET_CODE.PLACED, 0, 150, 345.30, 345.31, 345.30),
    TradeResult("AAPL", "Apple Inc.", RET_CODE.PLACED, 0, 150, 345.30, 345.31, 345.30),
    TradeResult("AAPL", "Apple Inc.", RET_CODE.PLACED, 0, 150, 345.30, 345.31, 345.30),
    TradeResult("AAPL", "Apple Inc.", RET_CODE.PLACED, 0, 150, 345.30, 345.31, 345.30),

  ];
  String listName = "FakeName";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, isScrolled) => [
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                    context),
                sliver: const SliverSafeArea(
                  top: false,
                  sliver: SliverAppBar(
                    pinned: true,
                    floating: true,
                    snap: true,
                    title: Text("portföy"),
                    centerTitle: true,
                    bottom: TabBar(
                      indicatorColor: Colors.white,
                      indicatorWeight: 5,
                      tabs: [
                        Tab(
                          icon: Icon(Icons.wallet),
                          text: "cüzdan",
                        ),
                        Tab(
                          icon: Icon(Icons.watch_later_outlined),
                          text: "emirler",
                        ),
                        Tab(
                          icon: Icon(Icons.request_page),
                          text: "işlemler",
                        ),
                        Tab(
                          icon: Icon(Icons.request_page),
                          text: "Fonlamalar",
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
            body: TabBarView(
              children: [
                buildWalletPage(results2, listName),
                buildOrdersPage(results),
                buildOrdersPage(results),
                FundingsView(),
              ],
            )),
      ),
    );
  }


  Widget buildOrdersPage(List<Transaction> results) => SafeArea(
    top: false,
    bottom: false,
    child: Builder(
      builder: (context) => CustomScrollView(
          slivers: [
            SliverOverlapInjector(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),

            AdaptiveHeightSliverPersistentHeader(
              floating: true,
              pinned: true,
              child: WaitingOrdersHeader(),),
            SliverPadding(
              padding: const EdgeInsets.all(0),
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Container(
                      //margin: const EdgeInsets.only(bottom: 12),
                      child: Column(
                        children: [
                          GestureDetector(
                            //onTap: () => gotoTradeView(context),
                            child: SimpleWaitingOrderCard(result: results[index],)
                          ),
                          Divider(height: 1,
                            indent: 50.0,
                            endIndent: 50.0,
                            color: lightColorScheme.primaryContainer,
                          ),
                        ],
                      ),
                    );
                  }, childCount: results.length)),
            )
          ]

      ),
    ),
  );

  Widget buildWalletPage(List<TradeResult> results, String listName) => SafeArea(
    top: false,
    bottom: false,
    child: Builder(
      builder: (context) => CustomScrollView(
        slivers: [
          SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20,10,20,10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Toplam Tutar"),
                      SizedBox(height: 4.0,),
                      Text("Toplam Kar/Zarar"),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("8661.65 ₺"),
                      SizedBox(height: 4.0,),
                      Text("+55000.47 ₺"),
                    ],
                  )
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(0),
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Container(
                    //margin: const EdgeInsets.only(bottom: 12),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                          },
                          child: ExpandableWalletCard(
                            expandedChild: WalletCard(result: results[index], listName: listName,),
                            collapsedChild:WalletCardNonExpanded(result: results[index], listName: listName,),
                            isExpanded: false,
                          ),
                        ),
                        /*Divider(height: 1,
                          indent: 50.0,
                          endIndent: 50.0,
                          color: lightColorScheme.primaryContainer,
                        ),*/
                      ],
                    ),
                  );
                }, childCount: results.length
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget buildPage(String text) => SafeArea(
    top: false,
    bottom: false,
    child: Builder(
      builder: (context)=> CustomScrollView(slivers: [
        SliverOverlapInjector(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
        SliverPadding(
          padding: const EdgeInsets.all(12),
          sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: buildCard(index),
                );
              }, childCount: 25)),
        )
      ]),
    ),
  );

  Widget buildCard(int index) => Card(
    child: Padding(
        padding: EdgeInsets.all(20),
        child: Center(child: Text("item$index"))),
  );
}
