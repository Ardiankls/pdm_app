part of 'pages.dart';

class Login extends StatefulWidget {
  static const String routeName = "/login";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF161E29),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(40, 120, 0, 0),
                child: Text(
                  'Welcome Back!',
                  style: TextStyle(fontSize: 30, fontStyle: FontStyle.normal),
                ),
              ),
            ),
            Container()
          ],
        ),
      ),
    );
  }
}
