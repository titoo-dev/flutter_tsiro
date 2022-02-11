import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Trending extends StatefulWidget {

  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Trending Today",
              style: GoogleFonts.playfairDisplay(
                color: Colors.white, 
                  fontSize: 28, 
                  fontWeight: FontWeight.w500
              ), 
                // style: TextStyle(color: Colors.white, 
                //   fontSize: 28, 
                //   fontWeight: FontWeight.w600
                // ),   
              ),
            ),
          ),
        ],
      ),
    );
  }
}