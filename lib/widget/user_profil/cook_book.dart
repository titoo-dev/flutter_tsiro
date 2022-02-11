import 'package:design_et_animation/view/recipe_more_info.dart';
import 'package:flutter/material.dart';

class CookBook extends StatefulWidget {
  final String id;
  final String imagePath;
  final String title;
  CookBook({this.id, this.imagePath, this.title});

  @override
  _CookBookState createState() => _CookBookState();
}

class _CookBookState extends State<CookBook> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return InfoPage(id: widget.id, image: widget.imagePath,);
        }));
      },
      child: Container(
        margin: EdgeInsets.only(right: 8, top: 5), 
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              child: Hero(
                tag: widget.id,
                child: Image.asset(widget.imagePath, fit: BoxFit.cover,)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(widget.title, 
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black87
                      )
                    ),
                  ),
                  SizedBox(height: 5,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("9 avis", 
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black38
                      )
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}