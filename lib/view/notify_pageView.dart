import 'package:design_et_animation/view/page1.dart';
import 'package:design_et_animation/view/page2.dart';
import 'package:flutter/material.dart';

class NotifyPageView extends StatefulWidget {
  final ValueNotifier notifier;


  NotifyPageView({Key key, this.notifier}) : super(key : key);


  @override
  _NotifyPageViewState createState() => _NotifyPageViewState();
}

class _NotifyPageViewState extends State<NotifyPageView> {

  PageController _pageController;


  void _onScroll(){
    widget.notifier ?.value = _pageController.page.abs();
  }

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Page1(),
        Page2(),
      ],
    );
  }
}