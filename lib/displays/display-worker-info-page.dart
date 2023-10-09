import 'package:flutter/material.dart';
import '../model/user.dart';

class DisplayWorkerInfoPage extends StatefulWidget {
  final AppUser worker;
  const DisplayWorkerInfoPage({super.key, required this.worker});

  @override
  DisplayWorkerInfoPageState createState() => DisplayWorkerInfoPageState();
}

class DisplayWorkerInfoPageState extends State<DisplayWorkerInfoPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black87, Colors.black],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 450,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          padding: EdgeInsets.all(8),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Colors.teal.shade200)
                            ),
                          ),
                          child: Text(
                            'A G E \n${widget.worker.age}',
                            style: TextStyle(
                                fontFamily: 'Poppins-Medium',
                                color: Colors.white
                            ),
                          ),
                        ),

                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        padding: EdgeInsets.all(8),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.teal.shade200)
                          ),
                        ),
                        child: Text(
                          'B I O G R A P H Y \n${widget.worker.biography}',
                          style: TextStyle(
                              fontFamily: 'Poppins-Medium',
                              color: Colors.white
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        padding: EdgeInsets.all(8),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.teal.shade200)
                          ),
                        ),
                        child: Text(
                          'L O C A T I O N \n${widget.worker.location}',
                          style: TextStyle(
                              fontFamily: 'Poppins-Medium',
                              color: Colors.white
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        padding: EdgeInsets.all(8),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(color: Colors.teal.shade200),
                          ),
                        ),
                        child: Text(
                          'P A Y M E N T / H O U R \n\$ ${widget.worker.paymentHour}/h',
                          style: TextStyle(
                              fontFamily: 'Poppins-Medium',
                              color: Colors.white
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            CustomPaint(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              painter: HeaderCurvedContainer(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "${widget.worker.name}",
                      style: TextStyle(
                        fontSize: 35,
                        letterSpacing: 1.5,
                        color: Colors.white,
                        fontFamily: "Poppins-Medium"
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  width: MediaQuery.of(context).size.width/2,
                  height: MediaQuery.of(context).size.width/2,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.white,
                        width: 5),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('lib/images/avatar.jpg'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.teal.shade700;
    Path path = Path()
    ..relativeLineTo(0, 150)
    ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
    ..relativeLineTo(0, -150)
    ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}

