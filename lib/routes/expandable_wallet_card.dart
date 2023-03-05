


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/color.dart';

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