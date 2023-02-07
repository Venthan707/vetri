import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vetri/login/otppage.dart';
import '../datamodel/apimodels.dart';
import '../datamodel/colorandstyle.dart';
import 'package:http/http.dart' as http;

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  List<banner> bannerList = [];
  @override
  void initState() {
    super.initState();
  }

  Future<List<banner>> Fatchbanner() async {
    var Resp =
        await http.get(Uri.parse("http://vetriott.online/banner/GetAllBanner"));
    return (json.decode(Resp.body)['bannerimagePath'] as List)
        .map((B) => banner.formap(B))
        .toList();
  }

  final _formkey = GlobalKey<FormState>();
  TextEditingController _number = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: SafeArea(
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
          body: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 380,
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    child: FutureBuilder<List<banner>>(
                      future: Fatchbanner(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<banner> bannerList =
                              snapshot.data as List<banner>;
                          return Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: CarouselSlider.builder(
                                itemCount: bannerList.length,
                                itemBuilder: (context, index, realindex) {
                                  return Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  bannerList[index]
                                                      .bannerImagePath
                                                      .toString()),
                                              fit: BoxFit.fill),
                                          borderRadius:
                                              BorderRadius.circular(15)));
                                },
                                options: CarouselOptions(
                                  aspectRatio: .3,
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
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "WELCOME",
                          style: size30White,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0, left: 20),
                    child: Container(
                      height: 70,
                      child: TextFormField(
                          controller: _number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter valide mobile number';
                            } else {
                              return null;
                            }
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10)
                          ],
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            hintText: 'Enter your mobile number',
                            prefixIcon: Icon(
                              Icons.call,
                              color: Colors.black,
                            ),
                            filled: true,
                            fillColor: white70,
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: greyS500, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: greyS500, width: 1),
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 115,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(white)),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      otppage(number: _number.text)));
                        } else {
                          return null;
                        }
                      },
                      child: Text("Get OTP", style: size16Black),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'By clicking I accept the  ',
                              style: size16White70,
                            ),
                            Text(
                              'terms of service',
                              style: size16indigoS700,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'and  ',
                              style: size16White70,
                            ),
                            Text(
                              'privacy policy',
                              style: size16indigoS700,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
