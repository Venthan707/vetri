import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../datamodel/colorandstyle.dart';
import 'actorgrid.dart';

class selectedactorpage extends StatefulWidget {
  const selectedactorpage({Key? key}) : super(key: key);

  @override
  State<selectedactorpage> createState() => _selectedactorpageState();
}

class _selectedactorpageState extends State<selectedactorpage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: black,
            body:
            AnimationLimiter(
              child: GridView.builder(
                itemCount: actors.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: Container(
                          height: 400,
                          child: Image.asset(actors[index].image,fit: BoxFit.fill,),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )));
  }
}
