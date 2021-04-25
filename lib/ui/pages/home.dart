part of 'pages.dart';

class Home extends StatefulWidget {
  static String routeName = "/home";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF161E29),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
            child: ElevatedButton(
          onPressed: () {},
        )),
      ),
    );
  }
}
