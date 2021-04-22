part of 'pages.dart';

class Signup extends StatefulWidget {
  static const String routeName = "/signup";
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final ctrlEmail = TextEditingController();
  final ctrlName = TextEditingController();
  final ctrlPass = TextEditingController();
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF161E29),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: const EdgeInsets.only(top: 130.0),
          child: Column(children: [
            Image.asset(
              "assets/images/PDMLogo.png",
              height: 36,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 376,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFF0E1621),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25))),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                      child: Text(
                        'Signup',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 20),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 30, left: 30),
                            child: TextFormField(
                              controller: ctrlEmail,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                contentPadding:
                                    new EdgeInsets.symmetric(vertical: 1.0),
                                labelText: "Email",
                                prefixIcon: Icon(Icons.mail_outline_rounded),
                                border: OutlineInputBorder(),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please fill the field!";
                                } else {
                                  if (!EmailValidator.validate(value)) {
                                    return "Email isn't valid!";
                                  } else {
                                    return null;
                                  }
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30, left: 30),
                            child: TextFormField(
                              controller: ctrlName,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                contentPadding:
                                    new EdgeInsets.symmetric(vertical: 1.0),
                                labelText: "Username",
                                prefixIcon: Icon(Icons.person_outline),
                                border: OutlineInputBorder(),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please fill the field!";
                                } else {
                                  if (!EmailValidator.validate(value)) {
                                    return "Email isn't valid!";
                                  } else {
                                    return null;
                                  }
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30, left: 30),
                            child: TextFormField(
                              controller: ctrlPass,
                              obscureText: isVisible,
                              decoration: InputDecoration(
                                  contentPadding:
                                      new EdgeInsets.symmetric(vertical: 1.0),
                                  labelText: "Password",
                                  prefixIcon: Icon(Icons.vpn_key),
                                  border: OutlineInputBorder(),
                                  suffixIcon: new GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isVisible = !isVisible;
                                      });
                                    },
                                    child: Icon(isVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                  )),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                return value.length < 6
                                    ? "Password must have at least 6 characters!"
                                    : null;
                              },
                            ),
                          ),
                          SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                //melanjutkan ke tahap berikutnya
                                Users users = new Users("", ctrlName.text,
                                    ctrlEmail.text, ctrlPass.text, "", "");

                                await AuthServices.signUp(users).then((value) {
                                  if (value == "Success") {
                                    ActivityServices.showToast(
                                        "Register success", Colors.greenAccent);
                                    Navigator.pushReplacementNamed(
                                        context, Login.routeName);
                                  } else {
                                    ActivityServices.showToast(
                                        value, Colors.redAccent);
                                  }
                                });
                                // Navigator.pushReplacementNamed(context, null);
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Please check the field",
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white);
                              }
                            },
                            child: Text("Signup"),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF7041FF),
                              elevation: 0,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20.0),
                            child: RichText(
                                text: TextSpan(
                                    text: 'Login',
                                    style: TextStyle(color: Colors.white),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushReplacementNamed(
                                            context, Login.routeName);
                                      })),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
