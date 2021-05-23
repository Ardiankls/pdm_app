part of 'pages.dart';

class Profile extends StatefulWidget {
  static const String routeName = "/profile";
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  String msg = "Fail";
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF161E29),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(children: [
            Row(
              children: [
                Icon(Icons.person_rounded),
                Container(
                  child: ElevatedButton.icon(
                      onPressed: () async {
                        //melanjutkan ke next stepe

                        // String msg = await AuthServices.signUp(users);
                        await AuthServices.signout().then((value) {
                          if (value) {
                            ActivityServices.showToast(
                                "Login success", Colors.greenAccent);
                            Navigator.pushReplacementNamed(
                                context, Login.routeName);
                          } else {
                            ActivityServices.showToast(msg, Colors.redAccent);
                          }
                        });
                      },
                      icon: Icon(Icons.logout),
                      label: Text("Logout"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red[300],
                        elevation: 0,
                      )),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
