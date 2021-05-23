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
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    child: IconButton(
                      alignment: Alignment.topRight,
                      icon: const Icon(Icons.person_rounded, size: 40),
                      color: Color(0xFF7041FF),
                      onPressed: () {
                        Navigator.pushNamed(context, Profile.routeName);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
