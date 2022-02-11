import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.only(left: 22, right: 22, top: 140, bottom: 60),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Pumpkin Soup with Garnet", 
                  style: GoogleFonts.playfairDisplay(
                      color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.w500
                  )
                ),
              ),

              SizedBox(height: 14,),

              Align(
                alignment: Alignment.centerLeft,
                child: Text("This is a classic, easy pumpkin soup made with fresh pumpkin that is very fast to make", 
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ),

              SizedBox(height: 22,),

              InkWell(
                onTap: (){
                  Scaffold.of(context).openDrawer();
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Chip(
                    label: Text("Read More", style: TextStyle(color: Colors.white),), 
                    backgroundColor: Colors.amber,
                    labelPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  ),
                ),
              )
            ],
          ),
        );
  }
}