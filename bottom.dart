import 'package:flutter/material.dart';
import 'package:vetri/download/download.dart';
import 'package:vetri/favorite/favorite.dart';
import 'package:vetri/home/home.dart';
import 'package:vetri/hot&new/hot&newpage.dart';

import '../datamodel/colorandstyle.dart';

class bottomNavigation extends StatefulWidget {
  const bottomNavigation({Key? key}) : super(key: key);

  @override
  State<bottomNavigation> createState() => _bottomNavigationState();
}

class _bottomNavigationState extends State<bottomNavigation> {
  int _selectedindex=0;
  final pages =[
    homepage(),
    hotandnewpage(),
    favoritepage(),
    downloadpage(),
  ];

  void _itemtap(int index ){
    setState(() {
      _selectedindex = index ;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.black,
            Colors.grey.shade900,
          ],
        )
    ),
      child: Scaffold(backgroundColor: Colors.transparent,
        body: pages[_selectedindex],
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: black,
          backgroundColor: Colors.transparent,
          items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined,color: black,),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.whatshot_outlined,color: black,),label: 'Hot/New'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined,color: black,),label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.download_outlined,color: black,),label: 'Download'),
        ],
        currentIndex: _selectedindex,
          onTap: _itemtap,
          showUnselectedLabels: true,
        ),
      ),
    ));
  }
}
