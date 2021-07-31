import 'package:flutter/material.dart';
import 'package:flutter_spacex/UI/Tabs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var controllerUserName = TextEditingController();
  var controllerPassword = TextEditingController();
  var controllerEmail = TextEditingController();
  SharedPreferences pref;
  bool rememberMe = false;
  String warning = " ";

  void initialPref() async {
    pref = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    initialPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 120,
        titleSpacing: 150,
        //مسافة لليمين
        backgroundColor: Colors.black,
        title: Text(
          "Sign Up",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(100),
          ),
        ),
      ),


      body:
      Center(
        child: Padding(padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(children: [

              // error handling الغلابة
                Container(
                      height: 100,
                       width: 450,
                       child: Text("$warning" ,
                       style:TextStyle(color:Colors.red ,
                       fontSize: 20,
                       backgroundColor: Colors.grey,
                       ) ,
                       textDirection:TextDirection.ltr ,
                       )
                   ),

              //Email
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "E-mail",
                      icon: Icon(Icons.alternate_email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    controller: controllerEmail,
                  ),
                ),

              //userName
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "UserName",
                      icon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    controller: controllerUserName,
                  ),
                ),

                //password
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      icon: Icon(Icons.saved_search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    controller: controllerPassword,
                  ),
                ),

              //remember me
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Checkbox(
                          value: rememberMe,
                          onChanged: (bool value) {
                            setState(() {
                              rememberMe = value;
                            });
                          }),
                      Text("Remember me"),
                    ],
                  ),
                ),

                //continue and nav.pop
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      if (! (controllerEmail.text.contains("@") && controllerUserName.text.isNotEmpty) )
                      {
                        warning ="  Either your email or user Is not correct";
                        print (" warning>>>>> warning");

                      } 
                      else {
                        pref.setString("Email", controllerEmail.text);
                        pref.setString("UserName", controllerUserName.text);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>Tabs(),
                            )
                        );
                      }

                    },
                    child: Container(
                      height: 50,
                      width: 400, // ScreenWidth ??!!
                      color: Colors.black,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadiusDirectional.all(Radius.circular(50)),
                      // ) ,

                      child: Container(
                          child: Text(
                            "Continue",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          )),
                    ),
                  ),
                ),

                //login
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 400,
                    // ScreenWidth ??!!
                    color: Colors.white,
                    // decoration: BoxDecoration(
                    // border: Border.all(color: Colors.red),
                    // borderRadius: BorderRadiusDirectional.all(Radius.circular(50)),
                    // ) ,

                    child: Container(
                      height: 30,
                      child: Text(
                        "LogIn with FaceBook",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),

              ],),
          ),
        ),
      ),
    );
  }
}

// لسة كل الــcontroller إن شاءالله
// في سؤال في أول contaier
//   في سؤال في الـcontinue
//  الــــ initialPref و الـــ initState بيعملوا إيه ؟!
