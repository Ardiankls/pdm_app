part of 'pages.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF343B4B),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 180, 0, 0),
          child: Column(
            children: [
              Image.asset(
                "assets/images/PDMLogo.png",
                height: 150,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 180, 0, 0),
                child: Text('Publication Documentation Manager'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text('ver 1.0'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
