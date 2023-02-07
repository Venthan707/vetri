import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../datamodel/apimodels.dart';
import '../../datamodel/colorandstyle.dart';
import '../../grid/bestmovies2022.dart';
import 'package:http/http.dart' as http;
import '../videodescriptionpage.dart';

class moviestab extends StatefulWidget {
  const moviestab({Key? key}) : super(key: key);

  @override
  State<moviestab> createState() => _moviestabState();
}

class _moviestabState extends State<moviestab> {
  List<banner> bannerList = [];
  List<videodetails> moviedetailsList = [];
  List<star> StarList = [];
  @override
  void initState() {
    super.initState();
  }

  Future<List<banner>> Fatchbanner() async {
    var Resp =
        await http.get(Uri.parse("http://vetriott.online/movie/GetAllBanner"));
    print(json.decode(Resp.body)['bannerimagePath']);
    return (json.decode(Resp.body)['bannerimagePath'] as List)
        .map((B) => banner.formap(B))
        .toList();
  }

  Future<List<videodetails>> Fatchmoviedetails() async {
    var Resp = await http.get(Uri.parse(
        "http://vetriott.online/movie/GetTop10VideoByType?videotype=movie"));
    print(Resp.statusCode);
    return (json.decode(Resp.body)['videoDetails'] as List)
        .map((V) => videodetails.formap(V))
        .toList();
  }

  Future<List<star>> FatchStars() async {
    var Resp = await http.get(
        Uri.parse("http://vetriott.online/movie/GetTop9Stars?videotype=movie"));
    return (json.decode(Resp.body)['starDetails'] as List)
        .map((S) => star.formap(S))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  // padding: const EdgeInsets.all(8),
                  child: FutureBuilder<List<banner>>(
                    future: Fatchbanner(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<banner> banneList = snapshot.data as List<banner>;
                        print(banneList.length);
                        return Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CarouselSlider.builder(
                              itemCount: banneList.length,
                              itemBuilder: (int, context, index) {
                                print(banneList[index]
                                    .bannerImagePath
                                    .toString());
                                return Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(banneList[index]
                                                .bannerImagePath
                                                .toString()),
                                            fit: BoxFit.fill),
                                        borderRadius:
                                            BorderRadius.circular(20)));
                              },
                              options: CarouselOptions(
                                aspectRatio: 2,
                                enlargeCenterPage: true,
                                enableInfiniteScroll: false,
                                autoPlay: true,
                                viewportFraction: 1,
                                autoPlayInterval: Duration(seconds: 5),
                              )),
                        );
                      }
                      if (snapshot.hasError) {
                        print(snapshot.error.toString());
                        return Text('error');
                      }
                      return Center(
                          child: Container(
                              height: 50,
                              child: CircularProgressIndicator(
                                color: blueS800,
                              )));
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Best of 2022 movies ',
                          style: size16White,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => bestmovies2022()));
                          },
                          child: Text(
                            'More>> ',
                            style: size16BlueS800,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Container(
                      height: 185,
                      child: FutureBuilder<List<videodetails>>(
                        future: Fatchmoviedetails(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<videodetails> moviedetailsList =
                                snapshot.data as List<videodetails>;
                            return ListView.builder(
                              itemCount: moviedetailsList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(25))),
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Container(
                                            height: 330,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top: Radius.circular(25)),
                                              color: Colors.black87,
                                            ),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Column(
                                                      children: [
                                                        Container(
                                                            height: 150,
                                                            width: 100,
                                                            child: Image(
                                                              image: AssetImage(
                                                                  'assets/Songs/chilla.jpg'),
                                                              fit: BoxFit.fill,
                                                            )),
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 15,
                                                            ),
                                                            Text(
                                                              'THUNIVU',
                                                              style:
                                                                  size20White,
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 15,
                                                            ),
                                                            Column(
                                                              children: [
                                                                Text(
                                                                  '2023',
                                                                  style:
                                                                      size16White70,
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            Column(
                                                              children: [
                                                                Text(
                                                                  '16+',
                                                                  style:
                                                                      size16White70,
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            Column(
                                                              children: [
                                                                Text(
                                                                  '2h20m',
                                                                  style:
                                                                      size16White70,
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
                                                            Container(
                                                              width: 200,
                                                              child: Text(
                                                                'A criminal mastermind and his team form a plan and commit bank heists across Chennai,    but the motive of their heists remains mysterious',
                                                                style:
                                                                    size16White70,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        Column(
                                                          children: [
                                                            Container(
                                                              height: 45,
                                                              child:
                                                                  FloatingActionButton(
                                                                backgroundColor:
                                                                    Colors.grey
                                                                        .shade500,
                                                                onPressed:
                                                                    () {},
                                                                child: Icon(
                                                                  Icons
                                                                      .play_arrow_outlined,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 30,
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              'Play',
                                                              style:
                                                                  size16White70,
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        Column(
                                                          children: [
                                                            Container(
                                                                height: 45,
                                                                child:
                                                                    FloatingActionButton(
                                                                        backgroundColor: Colors
                                                                            .grey
                                                                            .shade500,
                                                                        onPressed:
                                                                            () {},
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .download_outlined,
                                                                          color:
                                                                              Colors.black,
                                                                          size:
                                                                              25,
                                                                        ))),
                                                            Text(
                                                              'download',
                                                              style:
                                                                  size16White70,
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        Column(
                                                          children: [
                                                            Container(
                                                                height: 45,
                                                                child:
                                                                    FloatingActionButton(
                                                                        backgroundColor: Colors
                                                                            .grey
                                                                            .shade500,
                                                                        onPressed:
                                                                            () {},
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .add,
                                                                          color:
                                                                              Colors.black,
                                                                          size:
                                                                              30,
                                                                        ))),
                                                            Text(
                                                              'add',
                                                              style:
                                                                  size16White70,
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        Column(
                                                          children: [
                                                            Container(
                                                                height: 45,
                                                                child:
                                                                    FloatingActionButton(
                                                                        backgroundColor: Colors
                                                                            .grey
                                                                            .shade500,
                                                                        onPressed:
                                                                            () {},
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .share_outlined,
                                                                          color:
                                                                              Colors.black,
                                                                          size:
                                                                              25,
                                                                        ))),
                                                            Text(
                                                              'share',
                                                              style:
                                                                  size16White70,
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
                                                Column(
                                                  children: [
                                                    Container(
                                                      height: .2,
                                                      color:
                                                          Colors.grey.shade600,
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                videodescriptionpage()));
                                                  },
                                                  child: Container(
                                                    color: Colors.transparent,
                                                    height: 44,
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .info_outline_rounded,
                                                              color: white70,
                                                            ),
                                                            SizedBox(
                                                              width: 3,
                                                            ),
                                                            Text(
                                                              'About more',
                                                              style:
                                                                  size16White70,
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 200,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .arrow_forward_outlined,
                                                          color: white70,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    moviedetailsList[index]
                                                        .imagePath
                                                        .toString()),
                                                fit: BoxFit.fill,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          height: 180,
                                          width: 240,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          }
                          if (snapshot.hasError) {
                            print(snapshot.error.toString());
                            return Text('error');
                          }
                          return Center(
                              child: Container(
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    color: blueS800,
                                  )));
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      'your Favorite Star ',
                      style: size16White,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 355,
              child: FutureBuilder<List<star>>(
                future: FatchStars(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<star> StarList = snapshot.data as List<star>;
                    return GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: StarList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: blueS800,
                              child: CircleAvatar(
                                radius: 34,
                                backgroundImage: NetworkImage(
                                    StarList[index].imagepath.toString()),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              StarList[index].name.toString(),
                              style: size16White,
                            )
                          ],
                        );
                      },
                    );
                  }
                  if (snapshot.hasError) {
                    print(snapshot.error.toString());
                    return Text('error');
                  }
                  return Center(
                      child: Container(
                          height: 50,
                          child: CircularProgressIndicator(
                            color: blueS800,
                          )));
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
