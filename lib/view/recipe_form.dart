import 'package:design_et_animation/widget/recipe_form/form_01.dart';
import 'package:design_et_animation/widget/recipe_form/form_02.dart';
import 'package:design_et_animation/widget/recipe_form/form_03.dart';
import 'package:design_et_animation/widget/recipe_form/form_04.dart';
import 'package:design_et_animation/widget/recipe_form/form_05.dart';
import 'package:design_et_animation/widget/recipe_form/form_06.dart';
import 'package:design_et_animation/widget/recipe_form/form_07.dart';
import 'package:design_et_animation/widget/recipe_form/form_08.dart';
import 'package:flutter/material.dart';

class RecipeForm extends StatefulWidget {
  @override
  _RecipeFormState createState() => _RecipeFormState();
}

class _RecipeFormState extends State<RecipeForm> {
  int currentPage = 1;
  PageController _controller = PageController(initialPage: 0);

  @override
  void initState() {
    _controller..addListener((){
      setState(() {
        currentPage = _controller.page.toInt() + 1;
      });
    });
    super.initState();
  }
  final pages = [
    Form01(),
    Form02(),
    Form03(),
    Form04(),
    Form05(),
    Form06(),
    Form07(),
    Form08()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: pages.length,
            controller: _controller,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return pages[index];
            },
          ),

          Positioned(
            right: 20,
            bottom: 20,
            child: Container(
              height: 50,
              child: Material(
                elevation: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        _controller.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          border: Border(right: BorderSide(color: Colors.white70))
                        ),
                        child: Icon(Icons.keyboard_arrow_up, color: Colors.white,),
                        width: 50,
                        height: 50,
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        _controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                        ),
                        width: 50,
                        height: 50,
                        child: Icon(Icons.keyboard_arrow_down, color: Colors.white,),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.more_horiz),
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}
