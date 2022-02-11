import 'package:flutter/material.dart';

class MultiSelectChip extends StatefulWidget {

  final  levelList;

  MultiSelectChip({this.levelList});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {

  String selectedChoice = "";


  _buildChoiceList(){
    List<Widget> choice = List();

    widget.levelList.forEach((item){
      choice.add(Container(
        padding: const EdgeInsets.all(2),
        child: ChoiceChip(
          elevation: 2,
          labelStyle: TextStyle(color: (selectedChoice == item) ? Colors.white : Colors.black87),
          selectedColor: Colors.teal,
          padding: EdgeInsets.symmetric(horizontal: 20),
          label: Text(item), 
          selected: selectedChoice == item,
          onSelected: (selected){
            setState(() {
              selectedChoice = item;
            });
          },
        ),
      ));
    });
    return choice;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        children: _buildChoiceList(),
      ),
    );
  }
}