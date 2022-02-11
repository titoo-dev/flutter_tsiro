import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
                  color: Colors.white,
                  child: Material(
                    elevation: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 260,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.black38),
                              hintText: "Search Recipe",
                              prefixIcon: Icon(Icons.search),               
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: (){
                            Scaffold.of(context).openEndDrawer();
                          },
                          icon: Icon(
                            Icons.menu, 
                            color: Colors.black54,
                            size: 28,
                          ),
                        )
                      ],
                    ),
                  ),
                );
  }
}