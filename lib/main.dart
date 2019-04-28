import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Wavy Header Login page.",
      home: WavyHeader(),
    );
  }
}

class WavyHeader extends StatelessWidget {
  List<Color> orangeGradients = [
    Color(0xFFFF9844),
    Color(0xFFFE8853),
    Color(0xFFFD7267),
  ];
  BuildContext myContext;
  Widget get wavyHeader {
    return ClipPath(
      clipper: TopWaveClipper(),
      child: Container(
        height: MediaQuery.of(myContext).size.height / 2.5,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: orangeGradients,
            begin: Alignment.topRight,
            end: Alignment.center,
          ),
        ),
      ),
    );
  }

  Widget get midSection {
    return Material(
      elevation: 10.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 40.0,
          right: 20.0,
          top: 10.0,
          bottom: 10.0,
        ),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "johndoe@example.com",
            hintStyle: TextStyle(
              color: Color(0xFFE1E1E1),
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
  Widget get circularButton{
    List<Color> signInGradients = [
      Color(0xFFFF9844),
      Color(0xFFFE8853),
      Color(0xFFFD7267),
    ];
    return Container(
      padding: EdgeInsets.all(10),
      decoration: ShapeDecoration(
          shape: CircleBorder(),
          gradient: LinearGradient(
            colors: signInGradients,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
      ),
      child: Icon(
        IconData(58824, fontFamily: 'MaterialIcons', matchTextDirection: true),
        size: 40,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    myContext = context;
    return CircleYellow();
  }
}


class CircleYellow extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
        offset: Offset(0.0,210.0),
      child: Material(
        color: Colors.yellow,
        child: Padding(
          padding: EdgeInsets.all(140),
        ),
        shape: CircleBorder(
          side: BorderSide(
            color: Colors.white,
            width: 15.0,
          )
        ),
      ),
    );
  }

}

class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    var firstControlPoint = new Offset(size.width / 7, size.height - 30);
    var firstEndPoint = new Offset(size.width / 6, size.height / 1.5);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    var secondControlPoint = Offset(size.width / 5, size.height / 4);
    var secondEndPoint = Offset(size.width / 1.5, size.height / 5);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    var thirdControlPoint =
        Offset(size.width - (size.width / 9), size.height / 6);
    var thirdEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
