import 'package:flutter/material.dart';

void main() => runApp(App());
class App extends StatelessWidget{
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
    Color(0xFFFD7267),];
  BuildContext myContext;
  Widget get wavyHeader{
    return ClipPath(
      clipper: TopWaveClipper(),
      child: Container(
        height: MediaQuery.of(myContext).size.height/2.5,
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
  @override
  Widget build(BuildContext context) {
    myContext = context;
    return wavyHeader;

  }
}
class TopWaveClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    var firstControlPoint = new Offset(size.width/7, size.height - 30);
    var firstEndPoint = new Offset(size.width/6, size.height/1.5);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
    var secondControlPoint = Offset(size.width / 5, size.height / 4);
    var secondEndPoint = Offset(size.width / 1.5, size.height / 5);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    var thirdControlPoint = Offset(size.width - (size.width / 9), size.height / 6);
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
