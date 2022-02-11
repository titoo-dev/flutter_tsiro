import 'package:design_et_animation/view/recipe_form.dart';
import 'package:flutter/material.dart';

class AddRecipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation){
              return RecipeForm();
            },
            transitionsBuilder: (context, animation, secondaryAnimation, child){
              var begin = Offset(-1.0, 0.0);
              var end = Offset(0.0, 0.0);
              var curve = Curves.ease;
              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            }
          )
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 8, top: 5),
        color: Colors.grey[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.add, color: Colors.teal,size: 35,),
            Text("Ajouter une recette", 
              style: TextStyle(
                color: Colors.blueGrey
              ),
            )
          ],
        ),
      ),
    );
  }
}