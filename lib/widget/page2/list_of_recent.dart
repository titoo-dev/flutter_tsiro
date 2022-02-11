import 'package:content_placeholder/content_placeholder.dart';
import 'package:design_et_animation/widget/page2/recent_element.dart';
import 'package:flutter/material.dart';

class ListOfRecent extends StatefulWidget {
  @override
  _ListOfRecentState createState() => _ListOfRecentState();
}

class _ListOfRecentState extends State<ListOfRecent> {

  bool _isLoading = false;
  var _listItems = <Widget>[];
  final _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    _loading();
  }

  void _loading(){
    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(seconds: 2),(){
      setState(() {
        _isLoading = false;
      });
    }).then((_){
      _loadItems();
    });
  }

  void _loadItems(){
    final fetchedList = [
      RecentElement(
        id: "1",
        imagePath: "assets/image/recette.jpg",
        title: "Sauce Tomate ",
      ),
      RecentElement(
        id: "2",
        imagePath: "assets/image/recette.jpg",
        title: "Calzon",
      ),
      RecentElement(
        id: "3",
        imagePath: "assets/image/recette.jpg",
        title: "Sauce Vinegrette ",
      ),
      RecentElement(
        id: "4",
        imagePath: "assets/image/recette.jpg",
        title: "Sauce Bolognaise",
      ),
      RecentElement(
        id: "5",
        imagePath: "assets/image/recette.jpg",
        title: "Pomme fruite",
      ),
      RecentElement(
        id: "6",
        imagePath: "assets/image/recette.jpg",
        title: "Pizza 4 fromage",
      ),
      RecentElement(
        id: "7",
        imagePath: "assets/image/recette.jpg",
        title: "Composé spécial",
      ),
      RecentElement(
        id: "8",
        imagePath: "assets/image/recette.jpg",
        title: "Tarte au pomme",
      ),
      RecentElement(
        id: "9",
        imagePath: "assets/image/recette.jpg",
        title: "Pizza au fromage",
      ),
      RecentElement(
        id: "10",
        imagePath: "assets/image/recette.jpg",
        title: "Pizza margerita",
      ),
    ];
    
    var future = Future((){});
    for(var i = 0; i < fetchedList.length; i++){
      future = future.then((_){
        return Future.delayed(Duration(milliseconds: 500), (){
          _listItems.add(fetchedList[i]);
          _listKey.currentState.insertItem(_listItems.length - 1);
        });
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            height: 494,
            child: Builder(
              builder: (BuildContext context){
                if(!_isLoading){
                  return AnimatedList(  
                    key: _listKey,               
                    initialItemCount: _listItems.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index, animation){
                      var myTween = Tween<double>(begin: 0.0, end: 1.0).chain(CurveTween(
                        curve: Curves.easeOut
                      ));
                      return FadeTransition(
                        opacity: animation.drive(myTween),
                        child: _listItems[index],
                      );
                    },
                  );
                }
                return PlaceholderList();
              }
            ) 
        ),
      ],
    );
  }
}


class PlaceholderList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
                height: 487,
                child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index){
                  return Container(
                    child: Row(
                      children: <Widget>[
                        ContentPlaceholder(
                          width: 100,
                          height: 100,
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: Column(
                              children: <Widget>[
                                ContentPlaceholder(
                                  width: 180,
                                  height: 20,
                                ),

                                ContentPlaceholder(
                                    width: 180,
                                    height: 12,
                                  ),

                                ContentPlaceholder(
                                    width: 180,
                                    height: 20,
                                  ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ) 
            );
  }
}
