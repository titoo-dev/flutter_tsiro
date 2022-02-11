import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class InfoPage extends StatefulWidget {
  final String id;
  final String image;
  InfoPage({this.id, this.image});

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  var ingredients = [
    "5 Tomates",
    "3 Ognions",
    "1 cuillère à soupe de Sauce soja",
    "1 Pate",
    "1 kg de Farine",
    "500 g de Sucre",
    "Huile d'Olive"
  ];

  var directions = [
    "Couper les Tomates et les ognions en double tranchant",
    "Faire buillir la pate à 120 °C pendant 6 minutes",
    "Faire cuir les tomates et les ognions précedement coupés en y ajoutant la sauce soja",
    "Ajouter de la farine à notre cuisson pour avoir comme beigne avec la sauce tomate et ognion",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: Hero(
                        tag: widget.id,
                        child: Image.asset(widget.image, fit: BoxFit.cover,)),
                    ),
                    

                    Positioned(
                      top: 10,
                      right: 5,
                      child: IconButton(
                        icon: Icon(Icons.more_vert, color: Colors.white,), 
                        onPressed: null
                      )
                    )
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 40),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Slow cooker vegetable lasagne", 
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 40,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),

                      SizedBox(height: 40,),
                      
                      Container(
                        height: 26,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 250,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: SmoothStarRating(
                                      size: 20,
                                      rating: 3,
                                      color: Colors.amber,
                                      borderColor: Colors.grey,
                                      allowHalfRating: false,
                                      starCount: 5,
                                      defaultIconData: Icons.star_border,
                                      halfFilledIconData: Icons.star_half,
                                      filledIconData: Icons.star,
                                    ),
                                  ),

                                  SizedBox(width: 20,),    
                                  Text("2 avis", 
                                    style: TextStyle(fontSize: 18),
                                  )
                                
                                ],
                              ),
                            ),
                          ),
                      ),
                      SizedBox(height: 48,),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 170,
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Time:", style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400
                              ),),
                              Text("Makes:", style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400
                              ),)
                            ],
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 208,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("45 min", style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500

                              ),),
                              Text("4 servings", style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500

                              ),)
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),

                      Divider(thickness: 1,),

                      SizedBox(height: 10,),

                      Align(alignment: Alignment.centerLeft,
                        child: Text("Ingredients", 
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 32,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),

                      Column(
                        children: <Widget>[
                          _buildIngredient(ingredients[0]),
                          _buildIngredient(ingredients[1]),
                          _buildIngredient(ingredients[2]),
                          _buildIngredient(ingredients[3]),
                          _buildIngredient(ingredients[4]),
                        ],
                      ),

                      SizedBox(height: 10,),

                      Divider(thickness: 1,),

                      SizedBox(height: 10,),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Directions", 
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 32,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),


                      Column(
                        children: <Widget>[
                          _buildDirection(directions[0], 1),
                          _buildDirection(directions[1], 2),
                          _buildDirection(directions[2], 3),
                          _buildDirection(directions[3], 4),
                        ],
                      ),

                      SizedBox(height: 10,),

                      Divider(thickness: 1,),

                      SizedBox(height: 10,),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: 10,
              child: IconButton(
                color: Colors.white,
                onPressed: (){
                  Navigator.pop(context);
                },
              icon: Icon(Icons.arrow_back),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildIngredient(String ingredient){
    return ListTile(
      title: Text(ingredient, 
        style: TextStyle(
          fontSize: 18
        ),
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget _buildDirection(String direction, int step){
    return ListTile(
      leading: Text("$step",
        style: GoogleFonts.playfairDisplay(
          color: Colors.amber,
          fontSize: 50,
          fontWeight: FontWeight.w500
        )
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 22),
        child: Text(direction, 
          style: TextStyle(          
            fontSize: 18
          ),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}