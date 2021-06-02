part of 'pages.dart';

class Create extends StatefulWidget {
  static String routeName = "/create";
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
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
              child: Stack(children: [
            SizedBox(
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 12, 0, 0),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, size: 40),
                    color: Color(0xFFFFFFFF),
                    onPressed: () {
                      Navigator.pushNamed(context, Home.routeName);
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12, 20, 0),
                  child: IconButton(
                    icon: const Icon(Icons.person_rounded, size: 40),
                    color: Color(0xFF7041FF),
                    onPressed: () {
                      Navigator.pushNamed(context, Profile.routeName);
                    },
                  ),
                ),
              ),
            ),
          ])),
        ),
      ),
    );
  }
}
