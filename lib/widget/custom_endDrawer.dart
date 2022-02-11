import 'dart:ui';

import 'package:design_et_animation/view/user_profil.dart';
import 'package:flutter/material.dart';

class CustomEndDrawer extends StatefulWidget {
  @override
  _CustomEndDrawerState createState() => _CustomEndDrawerState();
}

class _CustomEndDrawerState extends State<CustomEndDrawer> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.black87
        ),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 200,
                  color: Colors.white70,
                  child: Center(
                    child: Icon(Icons.restaurant_menu, color: Colors.black87, size: 50,),
                  ),
                ),
                SizedBox(height: 50,),
                ListTile(
                  onTap: (){

                  },
                  leading: Icon(Icons.home,color: Colors.white),
                  title: Text("Accueil", style: TextStyle(color: Colors.white),),
                ),
                ListTile(leading: Icon(Icons.timelapse, color: Colors.white),
                  title: Text("Recent", style: TextStyle(color: Colors.white),),
                ),
                ListTile(
                  onTap: (){
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation){
                          return Profil();
                        },
                        transitionsBuilder: (context, animation, secondaryAnimation, child){
                          var begin = Offset(1.0, 0.0);
                          var end = Offset.zero;
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
                  leading: Icon(Icons.person, color: Colors.white),
                  title: Text("Profil", style: TextStyle(color: Colors.white),),
                ),
                ListTile(leading: Icon(Icons.exit_to_app, color: Colors.white),
                  title: Text("Déconnection", style: TextStyle(color: Colors.white),),
                ),
                
              ],
            ),

            Positioned(
              top: 160,
              left: 60,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.black87,
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  child: FlutterLogo(
                    colors: Colors.grey,
                    size: 30,
                  ),
                ),
              ))
          ],
        ),
      ),
    );
  }
}