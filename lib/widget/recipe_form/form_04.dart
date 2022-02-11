import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Form04 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: ListTile(
            leading: Icon(Icons.timer),
            title: Text("Temps de préparation *",
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
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 60,
              height: 50,
              child: TextField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.black87,
                maxLength: 2,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w300

                ),
                decoration: InputDecoration(
                  hintText: "00 min",
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w300
                  )
                ),
              ),
            ),
          ),
        ),

        SizedBox(height: 20,),

        Align(
          alignment: Alignment.centerLeft,
          child: ListTile(
            leading: Icon(Icons.timer),
            title: Text("Temps de Cuisson *",
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
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 60,
              height: 50,
              child: TextField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.black87,
                maxLength: 2,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w300

                ),
                decoration: InputDecoration(
                  hintText: "00 min",
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w300
                  )
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}