import 'dart:convert';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:video_player/video_player.dart';
import '../datamodel/apimodels.dart';
import '../datamodel/colorandstyle.dart';
import '../profile/profile.dart';
import 'package:http/http.dart' as http;

class videodescriptionpage extends StatefulWidget {
  @override
  State<videodescriptionpage> createState() => _videodescriptionpageState();
}

class _videodescriptionpageState extends State<videodescriptionpage> {
  List<videodetails> videodescriptionList = [];
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    Future<List<videodetails>> Fatchvideodetails() async {
      var Resp = await http.get(Uri.parse(
          "http://vetriott.gtgym.in/VideoDiscription/GetVideoDetailsByVideoId?videoId=1"));
      return (json.decode(Resp.body)['videoDetails'] as List)
          .map((S) => videodetails.formap(S))
          .toList();
    }

    flickManager = FlickManager(
      videoPlayerController:
          VideoPlayerController.asset('assets/videos/thunivu.mp4'),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: black,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: white70,
            )),
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 180,
              child: FlickVideoPlayer(flickManager: flickManager),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Thunivu',
                  style: size20White,
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 45,
                          child: FloatingActionButton(
                            backgroundColor: Colors.grey.shade500,
                            onPressed: () {},
                            child: Icon(
                              Icons.play_arrow_outlined,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Play',
                          style: size16White70,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            height: 45,
                            child: FloatingActionButton(
                                backgroundColor: Colors.grey.shade500,
                                onPressed: () {},
                                child: Icon(
                                  Icons.download_outlined,
                                  color: Colors.black,
                                  size: 25,
                                ))),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'download',
                          style: size16White70,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            height: 45,
                            child: FloatingActionButton(
                                backgroundColor: Colors.grey.shade500,
                                onPressed: () {},
                                child: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                  size: 30,
                                ))),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'add',
                          style: size16White70,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            height: 45,
                            child: FloatingActionButton(
                                backgroundColor: Colors.grey.shade500,
                                onPressed: () {},
                                child: Icon(
                                  Icons.share_outlined,
                                  color: Colors.black,
                                  size: 25,
                                ))),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'share',
                          style: size16White70,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  'About',
                  style: size20White,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0, top: 6),
              child: Container(
                  child: ReadMoreText(
                'Thunivu ( transl. Fortitude) is an upcoming Indian Tamil-language action thriller film written and directed by H. Vinoth, and produced by Boney Kapoor.A criminal mastermind and his team form a plan and commit bank heists across Chennai, but the motive of their heists remains mysterious.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w200),
                trimLines: 2,
                textAlign: TextAlign.justify,
                trimMode: TrimMode.Line,
                trimCollapsedText: "showmore>>",
                trimExpandedText: "<<showless",
                lessStyle: TextStyle(color: Colors.blue),
                moreStyle: TextStyle(color: Colors.blue),
              )),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Cast & crew",
                  style: size16White,
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              children: [
                Container(
                    height: 125,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: crew.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: CircleAvatar(
                                  radius: 45,
                                  backgroundColor: Colors.red,
                                  child: CircleAvatar(
                                    radius: 44,
                                    backgroundImage:
                                        AssetImage(crew[index].photo),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                crew[index].name,
                                style: size16White70,
                              )
                            ],
                          );
                        })),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  "More Like This",
                  style: size16White,
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              children: [
                Container(
                    height: 300,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movies.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Container(
                                  height: 260,
                                  width: 120,
                                  child: Image.asset(
                                    movies[index].poster,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Text(
                                movies[index].name,
                                style: size16White70,
                              )
                            ],
                          );
                        })),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

class cast {
  String? photo;
  String? name;

  cast(this.photo, this.name);
}

List crew = castandcrew
    .map((e) => cast(
          e['photo'],
          e['name'],
        ))
    .toList();

var castandcrew = [
  {'photo': 'assets/actors/ajith.png', 'name': 'Ajith'},
  {'photo': 'assets/actors/manju.jpg', 'name': 'Manju'},
  {'photo': 'assets/actors/skani.jpg', 'name': 'S.kani'},
  {'photo': 'assets/actors/yogi.jpg', 'name': 'Yogi'},
  {'photo': 'assets/actors/veera.jpg', 'name': 'Veera'},
  {'photo': 'assets/actors/gm.jpg', 'name': 'GM'},
  {'photo': 'assets/actors/bagavathi.jpg', 'name': 'Bagavathi'},
];

class movie {
  String? poster;
  String? name;

  movie(this.poster, this.name);
}

List movies = movielist.map((m) => movie(m['poster'], m['name'])).toList();

var movielist = [
  {'poster': 'assets/actors/veeram.jpg', 'name': 'Veeram'},
  {'poster': 'assets/actors/dsp.jpg', 'name': 'Dsp'},
  {'poster': 'assets/actors/beast.jpg', 'name': 'beast'},
  {'poster': 'assets/actors/valimai.jpg', 'name': 'Valimai'},
  {'poster': 'assets/actors/varisu.jpg', 'name': 'Varisu'},
  {'poster': 'assets/actors/vivegam.jpg', 'name': 'Vivegam'},
];
