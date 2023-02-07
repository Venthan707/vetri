import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vetri/login/login.dart';
import 'package:vetri/profile/editprofile.dart';
import '../datamodel/colorandstyle.dart';
import '../login/bottom.dart';

class profilepage extends StatefulWidget {
  const profilepage({Key? key}) : super(key: key);

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
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
            Colors.black,
            Colors.grey.shade900,
          ],
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: black,
            title: Text(
              'Profile',
              style: size20White70,
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_sharp,
                  color: blueS800,
                )),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.logout,
                  size: 30,
                  color: white70,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: AlertDialog(
                            backgroundColor: BC,
                            title: Text(
                              "Login Out",
                              style: size20White70,
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "No",
                                    style: size16BlueS800,
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => login()));
                                  },
                                  child: Text(
                                    "Yes",
                                    style: size16BlueS800,
                                  ))
                            ],
                          ),
                        );
                      });
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
                SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 65.5,
                      child: CircleAvatar(
                        radius: 65,
                        backgroundImage: AssetImage('assets/logo/img.png'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              height: 50,
                              width: 300,
                              child: TextField(
                                keyboardType: TextInputType.name,
                                style: size20White,
                                cursorColor: blueS800,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.person_outline,
                                      color: Colors.lightBlueAccent,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: greyS500, width: .4),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: greyS500, width: .4),
                                    )),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                              height: 50,
                              width: 300,
                              child: TextField(
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10)
                                ],
                                style: size20White,
                                cursorColor: blueS800,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.phone,
                                      color: Colors.lightBlueAccent,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: greyS500, width: .4),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: greyS500, width: .4),
                                    )),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                              height: 50,
                              width: 300,
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                style: size20White,
                                cursorColor: blueS800,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.mail_outline,
                                      color: Colors.lightBlueAccent,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: greyS500, width: .4),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: greyS500, width: .4),
                                    )),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                              height: 50,
                              width: 300,
                              child: TextField(
                                keyboardType: TextInputType.datetime,
                                style: size20White,
                                cursorColor: blueS800,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.date_range_outlined,
                                      color: Colors.lightBlueAccent,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: greyS500, width: .4),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: greyS500, width: .4),
                                    )),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                              height: 50,
                              width: 300,
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                style: size20White,
                                cursorColor: blueS800,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.boy_outlined,
                                      color: Colors.lightBlueAccent,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: greyS500, width: .4),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: greyS500, width: .4),
                                    )),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: 120,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(white)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Editprofile()));
                    },
                    child: Text("Edit profile", style: size16Black),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
