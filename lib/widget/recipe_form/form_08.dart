import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Form08 extends StatefulWidget {
  @override
  _Form08State createState() => _Form08State();
}

class _Form08State extends State<Form08> {

  File _image;

  void _pickImageFromGallery() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text("Finalisation :)",
              style: GoogleFonts.playfairDisplay(
                fontSize: 28
              ),
            ),
          ),
        ),

        SizedBox(height: 22,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: (_image == null) ? AssetImage("assets/image/recette.jpg") : FileImage(_image), 
                fit: BoxFit.cover
              ),
            ),
            height: 250,
            child: (_image == null) ? Center(
              child: InkWell(
                onTap: (){
                  _pickImageFromGallery();
                },
                child: Chip(
                  elevation: 5,
                  padding: EdgeInsets.all(10),
                  label: Text("Ajouter une Image")),
              ),
            ) : Container(),
          ),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              RaisedButton(
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: (){},
                child: Text("Confirmer l'envoie du formulaire"),
              )
            ],
          ),
        )
      ],
    );
  }
}