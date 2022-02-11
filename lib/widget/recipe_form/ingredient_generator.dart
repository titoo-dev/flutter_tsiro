import 'package:flutter/material.dart';

class IngredientGenerator extends StatefulWidget {
  @override
  _IngredientGeneratorState createState() => _IngredientGeneratorState();
}

class _IngredientGeneratorState extends State<IngredientGenerator> {
  final _listKey = GlobalKey<AnimatedListState>();
  TextEditingController controller = TextEditingController();


  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  AnimatedListRemovedItemBuilder builder = (context, animation){
    var tween = Tween(begin: 1.0, end: 0.0).chain(CurveTween(curve: Curves.ease));
    return FadeTransition(
      opacity: animation.drive(tween),
      child: Container(),
    );
  };


  var ingredients = [];

  void _loadItems(){
    final fetchedList = [
      _buildIngredientTile("04 Carotte"),
      _buildIngredientTile("1 kg Haricot Vert"),
      _buildIngredientTile("400 g de farine"),
      _buildIngredientTile("06 cuillère de soja"),


    ];

    var future = Future((){});
    for(var i = 0; i < fetchedList.length; i++){
      future = future.then((_){
        return Future.delayed(Duration(milliseconds: 300), (){
          ingredients.add(fetchedList[i]);
          _listKey.currentState.insertItem(ingredients.length - 1);
        });
      });
    }
  }

  Widget _buildIngredientTile(String ingredient){
    return Align(
      alignment: Alignment.centerLeft,
      child: Chip(
        backgroundColor: Colors.lightBlue,
        labelPadding: EdgeInsets.symmetric(horizontal: 12),
        labelStyle: TextStyle(
          color: Colors.white,
          fontSize: 18),
        deleteIconColor: Colors.black,
        deleteIcon: Icon(Icons.close,),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        label: Text(ingredient)
      ),
    ); 
  }



  Future _addIngredient() async {
            await showDialog(
              context: context,
              builder: (BuildContext context){
                return SimpleDialog(
                  elevation: 5,
                  contentPadding: EdgeInsets.symmetric(horizontal: 26),
                  title: Text("Entrez un ingredient", 
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  children: <Widget>[
                    SizedBox(height: 20,),
                    TextField(
                      textCapitalization: TextCapitalization.none,

                      controller: controller,
                      cursorColor: Colors.black87,
                      maxLength: 70,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w300
                      ),
                      decoration: InputDecoration(
                        hintText: "Ex: Tomate",
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w300
                        )
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          color: Colors.greenAccent,
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                          child: Text("Ajouter",
                            style: TextStyle(fontSize: 18, 
                              color: Colors.black87
                            ),
                          ),
                        )
                      ],
                    ),

                    SizedBox(height: 12,),

                  ],
                );
              }
            );
          }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 50, top: 200, right: 20),
            child: Container(
              height: 440,
              child: AnimatedList(  
                key: _listKey,               
                initialItemCount: ingredients.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index, animation){
                  var myTween = Tween<double>(begin: 0.0, end: 1.0).chain(CurveTween(
                    curve: Curves.easeOut
                  ));
                  return FadeTransition(
                    opacity: animation.drive(myTween),
                    child: ingredients[index],
                  );
                },
              ),
            ),
          ),

          Positioned(
            top: 120,
            left: 20,
            child: InkWell(
              onTap: (){
                _addIngredient().then((onValue){
                  if(controller.text != ""){
                    ingredients.add(
                      _buildIngredientTile(controller.text)
                    );
                    _listKey.currentState.insertItem(ingredients.length - 1);
                    controller.text = "";
                  }
                });
              },
              child: Chip(
                elevation: 5,
                backgroundColor: Colors.amber,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                labelPadding: EdgeInsets.symmetric(horizontal: 10),
                labelStyle: TextStyle(fontSize: 20),
                label: Text("Ajouter un Ingerdient"),
                avatar: Icon(Icons.add, color: Colors.white,),
              ),
            ),
          )
        ],
      )
    );
  }
}