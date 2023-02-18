


import 'package:flutter/cupertino.dart';

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
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isExpanded = !widget.isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: new Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
        child: widget.isExpanded ? widget.expandedChild : widget.collapsedChild,
      ),
    );
  }
}