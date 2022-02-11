import 'dart:io';
import 'package:design_et_animation/widget/user_profil/custom_tabView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {

  File _image;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[

          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding:  EdgeInsets.only(top: height * 0.1, left: 20, right: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    height: height * 0.2,
                    child: Row(
                      children: <Widget>[



                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: Offset(6, 12),
                                blurRadius: 8,
                              )
                            ]
                          ),
                          child: InkWell(
                            onTap: _pickImageFromGallery,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50,
                              child: CircleAvatar(
                                backgroundImage: (_image == null ) ? AssetImage("assets/image/recette.jpg") : FileImage(_image),
                                radius: 47,
                                backgroundColor: Colors.grey[200],
                              ),
                            ),
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Container(
                            width: 202,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Titosy Manankasina", 
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22
                                    ),   
                                  ),
                                ),
                                SizedBox(height: 6,),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Cuisinier", 
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16
                                    ),   
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 12,
                  ),

                  Container(
                    height: height * 0.12,
                    child: Material(
                      borderRadius: BorderRadius.circular(5),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("353", 
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22
                                  ),       
                                ),

                                SizedBox(height: 5,),

                                Text("Recipes", 
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16
                                  ),       
                                ),

                              ],
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("12K", 
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22
                                  ),       
                                ),
                                SizedBox(height: 5,),

                                Text("Views", 
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16
                                  ),       
                                ),

                              ],
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("1.4K", 
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22
                                  ),       
                                ),

                                SizedBox(height: 5,),

                                Text("Followers", 
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16
                                  ),       
                                ),

                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 16,),

                  MyCustomTabView(),

                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.more_horiz),
                )
              ],
            ),
          ),
        ],
      ),     
    );
  }

  void _pickImageFromGallery() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }
}




