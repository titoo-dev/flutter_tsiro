import 'package:content_placeholder/content_placeholder.dart';
import 'package:design_et_animation/widget/user_profil/add_recipe.dart';
import 'package:design_et_animation/widget/user_profil/cook_book.dart';
import 'package:flutter/material.dart';

class MyCustomTabView extends StatefulWidget {

  @override
  _MyCustomTabViewState createState() => _MyCustomTabViewState();
}

class _MyCustomTabViewState extends State<MyCustomTabView> {
  bool _selected = false;

  @override
  void initState() {
    _selected = true;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: (){
                  setState(() {
                    _selected = true;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      color: Colors.grey
                    ),
                    color: _selected ? Colors.teal : Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5)
                    )
                  ),
                  width: 160,
                  child: Center(child: Text("Mes recettes", 
                    style: TextStyle(
                      color: _selected ? Colors.white : Colors.grey,
                      fontSize: 16
                    ),)),
                ),
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    _selected = false;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 160,
                  child: Center(child: Text("Collection", 
                    style: TextStyle(
                      fontSize: 16,
                      color: _selected ? Colors.grey : Colors.white
                    ),
                  )),
                  decoration: BoxDecoration(
                    color: _selected ? Colors.white : Colors.teal,
                    border: Border.all(
                      width: 0.5,
                      color: Colors.grey
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5)
                    )
                  ),
                ),
              )
            ],
          ),
        ),

        SizedBox(height: 12,),
        Divider(),

        Container(
          height: 400,
          child: Builder(
            builder: (context){
              var books = [
                AddRecipe(),
                CookBook(
                  id: "1",
                  imagePath: "assets/image/recette.jpg",
                  title: "Crème glacé",
                ),
                CookBook(
                  id: "2",
                  imagePath: "assets/image/recette.jpg",
                  title: "Sauce soja",
                ),
                CookBook(
                  id: "3",
                  imagePath: "assets/image/recette.jpg",
                  title: "Pizza framboise",
                ),
                CookBook(
                  id: "4",
                  imagePath: "assets/image/recette.jpg",
                  title: "Spagetti",
                ),
                CookBook(
                  id: "5",
                  imagePath: "assets/image/recette.jpg",
                  title: "Fromage",
                ),
              ];
              return GridView.builder(
                padding: EdgeInsets.all(5),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: books.length,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index){
                  if(_selected){
                    return books[index];
                  }
                  return Card(
                    child: ContentPlaceholder(
                      height: 100,
                      borderRadius: 0,
                      context: context,
                    ),
                  );
                },
              );
            }
          ),
        )
      ],
    );
  }
}

