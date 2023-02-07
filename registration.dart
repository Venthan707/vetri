import 'dart:io';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'bottom.dart';
import '../datamodel/colorandstyle.dart';

class registration extends StatefulWidget {
  const registration({Key? key}) : super(key: key);

  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration> {
  int _value = 0;
  late SingleValueDropDownController _cnt;
  final _fromkey = GlobalKey<FormState>();

  @override
  void initState() {
    _cnt = SingleValueDropDownController();
    super.initState();
  }

  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
  Future captureImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
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
          begin: Alignment.topLeft,
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
              key: _fromkey,
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios_sharp),
                        color: Colors.red.shade700,
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      Text(
                        "Registration",
                        style: size25White,
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Column(
                    children: [
                      Stack(children: [
                        Container(
                            height: 125,
                            width: 125,
                            child: ClipOval(
                                child: image != null
                                    ? Image.file(
                                        image!,
                                        fit: BoxFit.fill,
                                      )
                                    : Image(image: AssetImage('assets/logo/v.JPG')))),
                        Positioned(
                            right: -11,
                            bottom: 1,
                            child: Container(
                                height: 40,
                                child: FloatingActionButton(
                                  backgroundColor: black,
                                  onPressed: (){
                                    showModalBottomSheet<void>(
                                        context: context,
                                        builder: (BuildContext context){
                                      return Container(
                                        color: Colors.white,
                                        height: 100,
                                        child: Column(children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: GestureDetector(
                                              onTap: ()=>captureImage(),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.camera_alt_outlined,size: 30,),
                                                  Text("Camera",style: size16Black,)
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: GestureDetector(
                                              onTap: ()=>pickImage(),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.photo_album,size: 30,),
                                                  Text("Album",style: size16Black)
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],),
                                      );
                                    });
                                  },
                                  child: Icon(Icons.camera_alt_outlined),
                                )))
                      ])
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0,left: 10),
                    child: Container(
                      child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'[a-z A-Z]+$').hasMatch(value)) {
                              return 'please enter the name';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.name,
                          decoration:InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            hintText: 'Enter your name',
                            prefixIcon: Icon(Icons.person_outline,color: Colors.black,),
                            filled: true,
                            fillColor: white70,
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: greyS500, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: greyS500, width: 1),
                            ),
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0,left: 10),
                    child: Container(

                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter the mobile number';
                            } else {
                              return null;
                            }
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10)
                          ],
                          keyboardType: TextInputType.phone,
                            decoration:InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              hintText: 'Enter the mobile number',
                              prefixIcon: Icon(Icons.phone_android,color: Colors.black,),
                              filled: true,
                              fillColor: white70,
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: greyS500, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: greyS500, width: 1),
                              ),
                            )
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0,left: 10),
                    child: Container(

                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'[\w]+@([\w-]+[\w]{2,4})')
                                    .hasMatch(value)) {
                              return 'please enter the e-mail id';
                            } else {
                              return null;
                            }
                          },
                            decoration:InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              hintText: 'Enter the e-mail id',
                              prefixIcon: Icon(Icons.email_outlined,color: Colors.black,),
                              filled: true,
                              fillColor: white70,
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: greyS500, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: greyS500, width: 1),
                              ),
                            )
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: [
                        Text(
                          'Age      :  ',
                          style: size20White,
                        ),
                        SizedBox(height: 5,),
                        Container(
                            width: 100,
                            child: Center(
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      int.tryParse(value)! < 18) {
                                    return 'Enter age';
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.number,
                                  decoration:InputDecoration(

                                    contentPadding: EdgeInsets.only(left: 30),
                                    filled: true,
                                    fillColor: white70,
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: greyS500, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: greyS500, width: 1),
                                    ),
                                  ),
                                  inputFormatters: [
                                  LengthLimitingTextInputFormatter(2)
                          ],
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0,top: 2),
                    child: Row(
                      children: [
                        Text(
                          'DOB     :  ',
                          style: size20White,
                        ),
                        Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: white70),
                          child: Row(children: [
                            IconButton(onPressed: () async{
                              DateTime? newDate =await showDatePicker(context: context,
                                  initialDate: date,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100)
                              );
                              if(newDate == null) return;
                              setState(() =>date= newDate);

                            }, icon: Icon(Icons.date_range_outlined,size: 25,)),
                            Text('${date.year}/${date.month}/${date.day}',style: size16Black,)
                          ],),
                        )

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Gender : ',
                              style: size20White,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Theme(
                                  data: Theme.of(context)
                                      .copyWith(unselectedWidgetColor: white70),
                                  child: Radio(
                                      activeColor: indigoS700,
                                      value: 1,
                                      groupValue: _value,
                                      onChanged: (value) {
                                        setState(() {
                                          _value = value!;
                                        });
                                      }),
                                ),
                                Text(
                                  'Male',
                                  style: size16White,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Theme(
                                  data: Theme.of(context)
                                      .copyWith(unselectedWidgetColor: white70),
                                  child: Radio(
                                      activeColor: indigoS700,
                                      value: 2,
                                      groupValue: _value,
                                      onChanged: (value) {
                                        setState(() {
                                          _value = value!;
                                        });
                                      }),
                                ),
                                Text(
                                  'Female',
                                  style: size16White,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Theme(
                                  data: Theme.of(context)
                                      .copyWith(unselectedWidgetColor: white70),
                                  child: Radio(
                                      activeColor: indigoS700,
                                      value: 3,
                                      groupValue: _value,
                                      onChanged: (value) {
                                        setState(() {
                                          _value = value!;
                                        });
                                      }),
                                ),
                                Text(
                                  'Others',
                                  style: size16White,
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 120,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(white)),
                      onPressed: () {
                        if (_fromkey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => bottomNavigation()));
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Continue", style: size16Black),
                        ],
                      ),
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


