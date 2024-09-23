import 'dart:ui';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Color>colors = [
    Colors.red,
    Colors.yellow,
    Colors.black,
    Colors.deepPurple,
    Colors.orange,
    Colors.blue,
    Colors.green,
    Colors.brown,
    Colors.tealAccent,
    Colors.lightGreenAccent,
    Colors.blueGrey,
    Colors.deepOrange,
    Colors.lime,
    Colors.deepPurple,
    Colors.white,
    Colors.amber,
    Colors.pink,
    Colors.blueGrey,
    Colors.black45,
  ];

  Color selectColor = Colors.red;

  double font = 5.0;
  List paints = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanStart: (details) {
          paints.add(CustomItem(paint: Paint()..color=selectColor..strokeWidth=font, offset: details.localPosition));
          setState(() {

          });
        },
        onPanUpdate: (details) {
          paints.add(CustomItem(paint: Paint()..color=selectColor..strokeWidth=font, offset: details.localPosition));
          setState(() {

          });
        },
        onPanEnd: (details) {
          paints.add(null);
          setState(() {

          });
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Stack(
            children: [
              CustomPaint(
                child: Container(),
                painter: MyPainter(color: selectColor,paintss:paints ),
              ),
              Positioned(
                top: 35,
                child: Row(
                  children: [
                    SizedBox(width: 170,
                      child: Slider(
        
                        activeColor: selectColor,
                        inactiveColor: Colors.grey.shade400,
                        min: 1.0,
                        max: 60.0,
                        value: font,
                        onChanged: (value) {
                          font = value;
                          setState(() {
        
                          });
                        },),),
                    SizedBox(width: 60,),
        
                    if(paints.isNotEmpty)InkWell(
                      onTap: () {
                        paints.removeLast();
                        paints.removeLast();
                        paints.add(null);
                        setState(() {

                        });
                      },
                      child: Icon(Icons.settings_backup_restore_rounded, size: 28,
                        color: Colors.blue.shade800,)
                    ),
                    SizedBox(width: 10,),
                    ElevatedButton.icon(
                      style: ButtonStyle(
        
                          backgroundColor: WidgetStatePropertyAll(Colors.white)
                      ),
        
                      onPressed: () {
                        paints.clear();
                        setState(() {

                        });
                      }, label: Text('Clear All', style: TextStyle(
                        color: Colors.blue.shade800),), icon: Icon(Icons
                        .cancel_outlined, color: Colors.blue.shade900,),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.all(2),
        height: 50,
        width: MediaQuery
            .of(context)
            .size
            .width - 40,
        decoration: BoxDecoration(color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey.shade500, offset: Offset(1, 1))
          ],
          borderRadius: BorderRadius.circular(150),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:
              List.generate(
                colors.length, (index) =>
                  Padding(
                    padding: const EdgeInsets.all(1.2),
                    child: InkWell(
                      onTap: () {
                        selectColor = colors[index];
                        setState(() {

                        });
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            border: selectColor == colors[index] ? Border.all(
                                color: Colors.black, width: 2) : null,
                            shape: BoxShape.circle,
                            color: colors[index]

                        ),
                      ),
                    ),
                  ),),),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
class MyPainter extends CustomPainter {
  final Color color;

  MyPainter({required this.color , required this.paintss});
  List paintss = [] ;

  @override
  void paint(Canvas canvas, Size size) {
    for(int i =0 ; i< paintss.length ; i++)
      {
        if(paintss[i]!= null && paintss[i+1]!= null)
          {
            canvas.drawLine(paintss[i].offset, paintss[i+1].offset, paintss[i].paint);
          }else if (paintss[i]!=null && paintss[i+1]!=null)
            {
              canvas.drawPoints(PointMode.points, [paintss[i].offset], paintss[i].paint);
            }
      }
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => true ;
}
class CustomItem{
  Offset offset ;
  Paint paint ;
  CustomItem({required this.paint , required this.offset});
}