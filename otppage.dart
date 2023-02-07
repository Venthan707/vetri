import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vetri/login/registration.dart';
import '../datamodel/colorandstyle.dart';

class otppage extends StatefulWidget {
  String number;
  otppage({required this.number});

  @override
  State<otppage> createState() => _otppageState();
}

class _otppageState extends State<otppage> {
  int secondsRemaining = 30;
  bool enableResend = false;
  late Timer timer;

  @override
  initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
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
                    Colors.black,Colors.black,
                    Colors.grey.shade900,
                  ],
                )),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_sharp,
                              color: Colors.red.shade900,
                            ))
                      ],
                    ),
                    Container(
                        height: 200,
                        width: 230,
                        child: Image(
                          image: AssetImage(
                            "assets/logo/v.JPG",
                          ),
                          fit: BoxFit.fill,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Vetri",
                      style: size30White,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(children: [
                      Text('We have sent OTP on ${widget.number}',style: size16White70,),
                    ],),
                    SizedBox(
                      height: 20,
                    ),

                    Text(
                      "Enter your OTP code",
                      style: size16White,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: greyS500),
                              height: 58,
                              width: 62,
                              child: TextFormField(
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(border: InputBorder.none),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: greyS500),
                              height: 58,
                              width: 62,
                              child: TextFormField(
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(border: InputBorder.none),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: greyS500),
                              height: 58,
                              width: 62,
                              child: TextFormField(
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(border: InputBorder.none),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: greyS500),
                              height: 58,
                              width: 62,
                              child: TextFormField(
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(border: InputBorder.none),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 115,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(white)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => registration()));
                        },
                        child: Text("Submit", style: size16Black),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('The OTP expired in $secondsRemaining',style: size16White,),
                      ],),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap:() {
                        if(secondsRemaining == 0){
                          Navigator.pop(context);
                        }else{
                          return null;
                        }
                      },
                      child: Text(
                        "Resent OTP",
                        style: size16BlueS800,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
  @override
  dispose(){
    timer.cancel();
    super.dispose();
  }
}

