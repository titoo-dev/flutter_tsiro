import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Form01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: ListTile(
            leading: Icon(Icons.looks_one),
            title: Text("Nom de la recette *",
              style: GoogleFonts.playfairDisplay(
                fontSize: 22,
                color: Colors.black87
              ),
            ),
          ),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(left: 72, right: 20),
          child: Container(
            height: 60,
            child: TextField(
              cursorColor: Colors.black87,
              maxLength: 22,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w300

              ),
              decoration: InputDecoration(
                hintText: "Ex: Pizza",
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w300
                )
              ),
            ),
          ),
        )
      ],
    );
  }
}