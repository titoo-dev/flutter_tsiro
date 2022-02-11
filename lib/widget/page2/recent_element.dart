import 'package:design_et_animation/view/recipe_more_info.dart';
import 'package:flutter/material.dart';

class RecentElement extends StatefulWidget {
  final String id;
  final String title;
  final int rate;
  final String imagePath;

  RecentElement({this.id, this.title, this.rate, this.imagePath});

  @override
  _RecentElementState createState() => _RecentElementState();
}

class _RecentElementState extends State<RecentElement> {
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return InfoPage(id: widget.id, image: widget.imagePath,);
        }));
      },
      child: Container(
        height: 100,
        margin: EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              child: Hero(
                tag: widget.id,
                child: Image.asset(widget.imagePath, fit: BoxFit.cover,)),
            ),
            Stack(
              children: <Widget>[
                Container(
                  width: 230,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Column(
                      children: <Widget>[

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(widget.title, 
                            style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),

                        SizedBox(height: 6,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Skillet Recipe",
                            style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 75,
                  left: 18,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.star, size: 20, color: Colors.amber,),
                          Icon(Icons.star, size: 20, color: Colors.amber,),
                          Icon(Icons.star, size: 20, color: Colors.amber,),
                          Icon(Icons.star, size: 20, color: Colors.amber,),
                          Icon(Icons.star, size: 20, color: Colors.grey[200],),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

