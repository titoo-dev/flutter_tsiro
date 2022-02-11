
import 'package:design_et_animation/widget/page1/recipe_info.dart';
import 'package:design_et_animation/widget/page1/trending.dart';
import 'package:design_et_animation/widget/page1/trending_pageView.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({Key key}) : super(key : key);
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              RecipeInfo(),
              Trending()
            ],
          ),
          TrendingPageView(),
        ],
      ),
    );
  }
}