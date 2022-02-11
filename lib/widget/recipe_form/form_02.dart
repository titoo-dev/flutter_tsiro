import 'package:design_et_animation/widget/recipe_form/multi_select_chip.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Form02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: ListTile(
            leading: Icon(Icons.looks_two),
            title: Text("Difficulté *",
              style: GoogleFonts.playfairDisplay(
                fontSize: 22,
                color: Colors.black87
              ),
            ),
          ),
        ),
        SizedBox(height: 20,),
        
        Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Builder(
            builder: (context){
              List<String> levelList = [
                "Facile",
                "Moyen",
                "Difficile"
              ];
               return  MultiSelectChip(levelList: levelList,);
            }
          ),
        )  
      ],
    );
  }
}