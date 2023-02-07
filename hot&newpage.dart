import 'package:flutter/material.dart';
import 'package:vetri/favorite/model/song.dart';
import 'package:vetri/favorite/model/songs.dart';
import 'package:vetri/hot&new/model/movie.dart';

import '../datamodel/colorandstyle.dart';
import '../profile/profile.dart';
import '../login/bottom.dart';

class hotandnewpage extends StatefulWidget {
  const hotandnewpage({Key? key}) : super(key: key);

  @override
  State<hotandnewpage> createState() => _hotandnewpageState();
}

class _hotandnewpageState extends State<hotandnewpage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: black,
        title: Text('Hot & New',style: size20White70,),
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>bottomNavigation()));
            },
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: blueS800,
            )),
        actions: [
          IconButton(icon:Icon(Icons.person_outline,size: 30,color: white70,), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>profilepage()));
          },),
          SizedBox(width: 10,),
        ],
      ),
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            Row(children: [
              Text("Treanding song",style: size16White)
            ],),
            SizedBox(height: 15,),
            Column(children: [
              Container(height:152,
                child:
                ListView.builder(
                  itemCount: watchList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(height: 150,width: 300,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  watchList[index].image,),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      )
                    ],);
                  },),)
            ],),
            SizedBox(height: 15,),
            Row(children: [
              Text("Best of 2022",style: size16White)
            ],),
            SizedBox(height: 15,),
            Column(children: [
              Container(height:150,
                child:
                ListView.builder(
                  itemCount: recentlywatch.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(height: 150,width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                AssetImage(recentlywatch[index].image),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(10)),),
                      )
                    ],);
                  },),)
            ],),
            SizedBox(height: 15,),
            Row(children: [
              Text("Treanding movies",style: size16White)
            ],),
            SizedBox(height: 15,),
            Column(children: [
              Container(height:185,
                child:
                ListView.builder(
                  itemCount: moviepost.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(height: 180,width: 300,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                AssetImage(moviepost[index].image),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(20)),),
                      )
                    ],);
                  },),)
            ],),
          ],),
      ),

    ));
  }
}