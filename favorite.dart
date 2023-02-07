import 'package:flutter/material.dart';
import 'package:vetri/favorite/model/songs.dart';

import '../datamodel/colorandstyle.dart';
import '../profile/profile.dart';
import '../login/bottom.dart';
import 'model/song.dart';

class favoritepage extends StatefulWidget {
  const favoritepage({Key? key}) : super(key: key);

  @override
  State<favoritepage> createState() => _favoritepageState();
}

class _favoritepageState extends State<favoritepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.black,
          Colors.grey.shade900,
        ],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: black,
          title: Text(
            'Favorite',
            style: size20White70,
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => bottomNavigation()));
              },
              icon: Icon(
                Icons.arrow_back_ios_sharp,
                color: blueS800,
              )),
          actions: [
            IconButton(
              icon: Icon(
                Icons.person_outline,
                size: 30,
                color: white70,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => profilepage()));
              },
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recently watched",
                    style: size16White,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Container(
                    height: 120,
                    child: ListView.builder(
                      itemCount: watchList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                height: 130,
                                width: 200,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        watchList[index].image,),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [Text("Watch List", style: size16White)],
              ),
              SizedBox(
                height:15,
              ),
              Column(
                children: [
                  Container(
                    height: 255,
                    child: ListView.builder(
                      itemCount: recentlywatch.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          recentlywatch[index].image),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(15)),
                                height: 250,
                                width: 150,
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text("Creat new List", style: size16White),
                  IconButton(
                    icon: Icon(
                      Icons.add_rounded,
                      size: 30,
                      color: blueS800,
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Container(
                              child: AlertDialog(
                                backgroundColor: BC,
                                title: Text(
                                  "Enter list name",
                                  style: size20White70,
                                ),
                                content: TextFormField(
                                  style: size20White70,
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "cancel",
                                        style: size16BlueS800,
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Submit",
                                        style: size16BlueS800,
                                      ))
                                ],
                              ),
                            );
                          });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
