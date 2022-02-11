import 'package:design_et_animation/view/notify_pageView.dart';
import 'package:design_et_animation/widget/custom_drawer.dart';
import 'package:design_et_animation/widget/custom_endDrawer.dart';
import 'package:design_et_animation/widget/page1/video.dart';
import 'package:design_et_animation/widget/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ValueNotifier<double> _notifier = ValueNotifier(0); 

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }


  @override
  void dispose(){
    _notifier ?.dispose();
    super.dispose();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      drawerScrimColor: Colors.black.withOpacity(0.2),
      endDrawer: CustomEndDrawer(),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          BackgroundVideo(),
          Container(color: Colors.black26,),

          AnimatedBuilder(animation: _notifier, 
            builder: (context, _){
              return Opacity(
                opacity: _notifier.value.abs(),
                child: Container(color: Colors.white)
              );
            }
          ),

          NotifyPageView(notifier: _notifier,),

          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 25),
                child: SearchBar()
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}