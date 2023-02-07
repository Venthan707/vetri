import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vetri/datamodel/colorandstyle.dart';
import 'package:vetri/grid/bestmovies2022.dart';
import 'package:vetri/home/videodescriptionpage.dart';
import 'package:http/http.dart' as http;
import '../../datamodel/apimodels.dart';
import '../../grid/bestof2022.dart';

class alltab extends StatefulWidget {
  const alltab({Key? key}) : super(key: key);

  @override
  State<alltab> createState() => _alltabState();
}

class _alltabState extends State<alltab> {
  List<banner> bannerList = [];
  List<videodetails> moviedetailsList = [];
  List<videodetails> SongdetailsList = [];
  @override
  void initState() {
    super.initState();
  }

  Future<List<banner>> Fatchbanner() async {
    var Resp =
        await http.get(Uri.parse("http://vetriott.online/home/GetAllBanner"));
    return (json.decode(Resp.body)['bannerimagePath'] as List)
        .map((B) => banner.formap(B))
        .toList();
  }

  Future<List<videodetails>> Fatchmoviedetails() async {
    var Resp = await http.get(Uri.parse(
        "http://vetriott.online/home/GetTop10VideoByType?videotype=movie"));
    return (json.decode(Resp.body)['videoDetails'] as List)
        .map((V) => videodetails.formap(V))
        .toList();
  }

  Future<List<videodetails>> Fatchsongdetails() async {
    var Resp = await http.get(Uri.parse(
        "http://vetriott.online/home/GetTop10VideoByType?videotype=Song"));
    return (json.decode(Resp.body)['videoDetails'] as List)
        .map((V) => videodetails.formap(V))
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
            Container(
              height: 200,
              width: double.infinity,
              //padding: const EdgeInsets.all(8),
              child: FutureBuilder<List<banner>>(
                future: Fatchbanner(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<banner> banneList = snapshot.data as List<banner>;
                    return Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: CarouselSlider.builder(
                          itemCount: banneList.length,
                          itemBuilder: (context, index, realindex) {
                            return Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(banneList[index]
                                            .bannerImagePath
                                            .toString()),
                                        fit: BoxFit.fill),
                                    borderRadius: BorderRadius.circular(20)));
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
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Best of 2022 Songs ',
                      style: size16White,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => bestof2022()));
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
                  height: 180,
                  child: FutureBuilder<List<videodetails>>(
                    future: Fatchsongdetails(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<videodetails> SongdetailsList =
                            snapshot.data as List<videodetails>;
                        return ListView.builder(
                          itemCount: SongdetailsList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                GestureDetector(
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
                                                              image: NetworkImage(
                                                                  SongdetailsList[
                                                                          index]
                                                                      .imagePath
                                                                      .toString()),
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
                                                              SongdetailsList[
                                                                      index]
                                                                  .title
                                                                  .toString(),
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
                                                                  SongdetailsList[
                                                                          index]
                                                                      .releasedYear
                                                                      .toString(),
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
                                                                  SongdetailsList[
                                                                          index]
                                                                      .agerestriction
                                                                      .toString(),
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
                                                                  SongdetailsList[
                                                                          index]
                                                                      .duration
                                                                      .toString(),
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
                                                                SongdetailsList[
                                                                        index]
                                                                    .description
                                                                    .toString(),
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
                                  child: Card(
                                    elevation: 2,
                                    shadowColor: white70,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Container(
                                      height: 155,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                SongdetailsList[index]
                                                    .imagePath
                                                    .toString()),
                                            fit: BoxFit.fill,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ),
                                ),
                                Text(
                                  SongdetailsList[index].title.toString(),
                                  style: size16White70,
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
                ),
                SizedBox(
                  height: 10,
                ),
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
                      height: 205,
                      child: FutureBuilder<List<videodetails>>(
                        future: Fatchmoviedetails(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<videodetails> moviedetailsList =
                                snapshot.data as List<videodetails>;
                            return ListView.builder(
                              itemCount: moviedetailsList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(25))),
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Container(
                                            height: 350,
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
                                                              image: NetworkImage(
                                                                  moviedetailsList[
                                                                          index]
                                                                      .imagePath
                                                                      .toString()),
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
                                                              moviedetailsList[
                                                                      index]
                                                                  .title
                                                                  .toString(),
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
                                                                  moviedetailsList[
                                                                          index]
                                                                      .releasedYear
                                                                      .toString(),
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
                                                                  moviedetailsList[
                                                                          index]
                                                                      .agerestriction
                                                                      .toString(),
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
                                                                  moviedetailsList[
                                                                          index]
                                                                      .duration
                                                                      .toString(),
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
                                                                moviedetailsList[
                                                                        index]
                                                                    .description
                                                                    .toString(),
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
                                                            SizedBox(
                                                              height: 5,
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
                                                            SizedBox(
                                                              height: 5,
                                                            ),
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
                                                            SizedBox(
                                                              height: 5,
                                                            ),
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
                                                            SizedBox(
                                                              height: 5,
                                                            ),
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
                                  child: Column(
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
                                      ),
                                      Text(
                                        moviedetailsList[index]
                                            .title
                                            .toString(),
                                        style: size16White70,
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
          ],
        ),
      ),
    ));
  }
}
