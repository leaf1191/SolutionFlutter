import 'package:emergency_mate/colors/colors.dart';
import 'package:flutter/material.dart';

class BasicAppBar extends StatelessWidget {
  const BasicAppBar({Key? key,String this.title = ''}) : super(key: key);
  final title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
        BoxShadow(
            offset: const Offset(0, 7),
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5),
      ]),
      child: Center(child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: MAIN_COLOR),)),
    );
  }
}

class BackAppBar extends StatelessWidget {
  const BackAppBar({Key? key,String this.title = '',required String this.back,Color this.color = const Color(0xff000000)}) : super(key: key);
  final title;
  final back;
  final color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 7),
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5),
          ]),
      child: Stack(
        children: [
          Center(child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: color),)),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: 100,
              height: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back_ios_new,color: color,),
                  Text(back, style: TextStyle(color: color),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RightWidgetAppBar extends StatelessWidget {
  const RightWidgetAppBar(
      {Key? key,
      required Widget this.widget,
      required void Function()? this.onTap,
      String this.title = '',
      Color this.color = const Color(0xff000000)})
      : super(key: key);
  final title;
  final color;
  final widget;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 7),
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5),
          ]),
      child: Stack(
        children: [
          Center(child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: color),)),
          GestureDetector(
            onTap: onTap,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.all(10),
                width: 50,
                height: double.infinity,
                child: widget,
              ),
            ),
          )
        ],
      ),
    );
  }
}


