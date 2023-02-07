import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vetri/profile/profile.dart';
import 'package:vetri/home/tab/all.dart';
import 'package:vetri/home/tab/movies.dart';
import 'package:vetri/home/tab/songs.dart';
import '../datamodel/colorandstyle.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> with TickerProviderStateMixin {
  late TabController _tabController;
  final Tab = [
    alltab(),
    songstab(),
    moviestab(),
  ];

  @override
  Widget build(BuildContext context) {
    _tabController = TabController(length: Tab.length, vsync: this);
    return SafeArea(
        child: DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: black,
            leading: Image.asset('assets/logo/v.JPG'),
            leadingWidth: 60,
            title: Text(
              'Vetri',
              style: size20White70,
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search_sharp,
                  size: 30,
                  color: white70,
                ),
                onPressed: () {},
              ),
              SizedBox(
                width: 15,
              ),
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
            bottom: TabBar(
                indicatorWeight: 2,
                indicatorColor: greyS500,
                controller: _tabController,
                labelPadding: EdgeInsets.all(15),
                tabs: [
                  Text(
                    "All",
                  ),
                  Text("Songs"),
                  Text('Movies')
                ]),
          ),
          body: Padding(
            padding: const EdgeInsets.all(6.0),
            child: TabBarView(
              clipBehavior: Clip.antiAlias,
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(),
              dragStartBehavior: DragStartBehavior.down,
              children: [
                alltab(),
                songstab(),
                moviestab(),
              ],
            ),
          )),
    ));
  }
}
