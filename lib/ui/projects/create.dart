part of '../pages/pages.dart';

class Create extends StatefulWidget {
  static String routeName = "/create";
  @override
  _CreateState createState() => _CreateState();
}

GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final ctrlProTitle = TextEditingController();
final ctrlProDesc = TextEditingController();
final ctrlProMusic = TextEditingController();
final ctrlProDrive = TextEditingController();
String dateNow = ActivityServices.dateNow();
// DateTime datePicked;
String proDate;

// Widget convertDate(){
//   return
// }

@override
void dispose() {
  ctrlProTitle.dispose();
  ctrlProDesc.dispose();
  ctrlProMusic.dispose();
  ctrlProDrive.dispose();
  // super.dispose();
}

void clearForm() {
  ctrlProTitle.clear();
  ctrlProDesc.clear();
  ctrlProMusic.clear();
  ctrlProDrive.clear();
}

// void

class _CreateState extends State<Create> {
  DateTime _dateTime;

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
                      Navigator.pushReplacementNamed(context, Home.routeName);
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
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: ListView(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                children: [
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 80),
                          TextFormField(
                            controller: ctrlProTitle,
                            maxLength: 20,
                            decoration: InputDecoration(
                              labelText: "Video Title",
                              prefixIcon: Icon(Icons.title),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please fill the field!";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(height: 0),
                          Column(
                            children: [
                              // Text("Due Date"),
                              // CalendarDatePicker(
                              //   lastDate: DateTime(22222),
                              //   onDateChanged: (date) {},
                              //   firstDate: DateTime(2010),
                              //   initialDate: DateTime.now(),
                              // ),
                              Text(_dateTime == null
                                  ? 'Pick the due date'
                                  : _dateTime.toString()),
                              ElevatedButton(
                                onPressed: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2021),
                                    lastDate: DateTime(2060),
                                  ).then((date) {
                                    setState(() {
                                      _dateTime = date;
                                      var dateFormat =
                                          new DateFormat('yyyy-MM-dd');
                                      var datePicked = dateFormat.format(date);
                                      proDate = datePicked.toString();
                                    });
                                  });
                                },
                                child: Text('Pick date'),
                              ),
                            ],
                          ),
                          SizedBox(height: 40),
                          TextFormField(
                            controller: ctrlProDesc,
                            maxLines: 2,
                            decoration: InputDecoration(
                              labelText: "Video Description",
                              prefixIcon: Icon(Icons.description),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          SizedBox(height: 40),
                          TextFormField(
                            controller: ctrlProMusic,
                            decoration: InputDecoration(
                              labelText: "Music Link",
                              prefixIcon: Icon(Icons.music_note),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          SizedBox(height: 40),
                          TextFormField(
                            controller: ctrlProDrive,
                            decoration: InputDecoration(
                              labelText: "Drive Link",
                              prefixIcon: Icon(Icons.cloud),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          SizedBox(height: 40),
                          SizedBox(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    setState(() {});
                                    Projects projects = Projects(
                                        "",
                                        ctrlProTitle.text,
                                        proDate,
                                        ctrlProDesc.text,
                                        ctrlProMusic.text,
                                        ctrlProDrive.text,
                                        FirebaseAuth.instance.currentUser.uid,
                                        "OnGoing",
                                        dateNow,
                                        dateNow);
                                    await ProjectServices.addProject(projects)
                                        .then((value) {
                                      if (value == true) {
                                        ActivityServices.showToast(
                                            "Project Created Successfully",
                                            Colors.white);
                                        clearForm();
                                        Navigator.pushReplacementNamed(
                                            context, Home.routeName);
                                      } else {
                                        ActivityServices.showToast(
                                            "Error Create Project", Colors.red);
                                      }
                                    });
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "Please check the fied");
                                  }
                                },
                                child: Text("Create"),
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF7041FF),
                                  shape: StadiumBorder(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            )
          ])),
        ),
      ),
    );
  }
}
