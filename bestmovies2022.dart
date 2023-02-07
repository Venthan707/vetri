import 'dart:convert';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../datamodel/apimodels.dart';
import '../datamodel/colorandstyle.dart';

class bestmovies2022 extends StatefulWidget {
  const bestmovies2022({Key? key}) : super(key: key);

  @override
  State<bestmovies2022> createState() => _bestmovies2022State();
}

class _bestmovies2022State extends State<bestmovies2022> {
  List<videodetails> bestof2022List = [];
  @override
  void initState() {
    super.initState();
  }

  Future<List<videodetails>> Fatchvideodetails() async {
    var Resp = await http.get(Uri.parse(
        "http://vetriott.online/movie/GetAllVideoOfSpecificType?videotype=movie"));
    return (json.decode(Resp.body)['videoDetails'] as List)
        .map((S) => videodetails.formap(S))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_sharp,
            color: white70,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Best movies 2022',
          style: size16White70,
        ),
      ),
      body: FutureBuilder<List<videodetails>>(
        future: Fatchvideodetails(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<videodetails> bestof2022List =
                snapshot.data as List<videodetails>;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimationLimiter(
                child: GridView.builder(
                  itemCount: bestof2022List.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      childAspectRatio: .5),
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: Duration(milliseconds: 400),
                      child: SlideAnimation(
                        verticalOffset: 70.0,
                        child: FadeInAnimation(
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(bestof2022List[index]
                                        .imagePath
                                        .toString()),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
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
    ));
  }
}
