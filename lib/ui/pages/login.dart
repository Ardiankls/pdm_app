part of 'pages.dart';

class Login extends StatefulWidget {
  static const String routeName = "/login";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final ctrlEmail = TextEditingController();
  final ctrlPass = TextEditingController();
  bool isVisible = true;
  String email;
  String password;

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
            Text(
              'Welcome Back!',
              style: TextStyle(fontSize: 30, fontStyle: FontStyle.normal),
            ),
            SizedBox(
              height: 102,
            ),
            Container(
              height: 324,
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
                        'Login',
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
                                email = value;
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
                                    setState(
                                      () {
                                        isVisible = !isVisible;
                                      },
                                    );
                                  },
                                  child: Icon(isVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                password = value;
                                return value.length < 6
                                    ? "Password must have at least 6 characters!"
                                    : null;
                              },
                            ),
                          ),
                          SizedBox(height: 24),
                          ElevatedButton(
                            child: Text("Login"),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                //melanjutkan ke tahap berikutnya

                                await AuthServices.signIn(email, password)
                                    .then((value) {
                                  if (value == "Success") {
                                    ActivityServices.showToast(
                                        "Login success", Colors.greenAccent);
                                    Navigator.pushReplacementNamed(
                                        context, Home.routeName);
                                  } else {
                                    ActivityServices.showToast(
                                        value, Colors.redAccent);
                                  }
                                });
                                //melanjutkan ke tahap berikutnya
                                // Navigator.pushReplacementNamed(
                                // context, MainMenu.routeName);

                              } else {
                                Fluttertoast.showToast(
                                    msg: "Please check the field",
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF7041FF),
                              elevation: 0,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20.0),
                            child: RichText(
                              text: TextSpan(
                                text: 'Signup Here',
                                style: TextStyle(color: Colors.white),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacementNamed(
                                        context, Signup.routeName);
                                  },
                              ),
                            ),
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
