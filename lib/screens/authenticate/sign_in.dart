import 'package:dairy_products/screens/home/homepage.dart';
import 'package:dairy_products/services/auth.dart';
import 'package:dairy_products/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:dairy_products/values.dart';
import 'package:flutter/services.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {
  bool isLogin = true;
  late Animation<double> containerSize;
  late AnimationController animationController;
  Duration animationduration = Duration(milliseconds: 270);

  final Authservice _auth = Authservice();
  final FirebaseFirestore _base = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    animationController =
        AnimationController(vsync: this, duration: animationduration);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  //text fields
  String email = '';
  String password = '';
  dynamic res = 't';
  String name = '';

  @override
  Widget build(BuildContext context) {
    //final _auth = Provider.of<Authservice>(context);
    Size size = MediaQuery.of(context).size;
    double viewInset = MediaQuery.of(context).viewInsets.bottom;
    double defaultLoginsize = size.height - (size.height * 0.2);
    double defaultRegsize = size.height - (size.height * 0.1);
    containerSize = Tween<double>(begin: size.height * 0.1, end: defaultRegsize)
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.linear));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              top: 100,
              right: -55,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.indigo.shade900,
                ),
              )),
          Positioned(
              top: -70,
              left: -60,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.indigo.shade900,
                ),
              )),
          AnimatedOpacity(
            opacity: isLogin ? 0.0 : 1.0,
            duration: animationduration,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: size.width,
                height: size.height * 0.1,
                child: IconButton(
                  onPressed: isLogin
                      ? null
                      : () {
                          animationController.reverse();
                          setState(() {
                            isLogin = !isLogin;
                          });
                        },
                  icon: Icon(Icons.close),
                  color: Colors.black,
                ),
              ),
            ),
          ),

          //login

          AnimatedOpacity(
            opacity: isLogin ? 1.0 : 0.0,
            duration: animationduration * 4,
            child: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  width: size.width,
                  height: defaultLoginsize,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                          color: Colors.indigo.shade900,
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 10),

                      Image(image: AssetImage('assets/logo.gif')),

                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: colorconst.scolor.withOpacity(0.4),
                        ),
                        child: TextFormField(
                          // validator: (val) => val!.isEmpty ? null : 'empty mail',
                          onChanged: (val) async {
                            setState(() {
                              email = val;
                            });
                          },
                          //cursorColor: colorconst.pcolor,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.email_outlined,
                              color: Colors.blue,
                            ),
                            hintText: 'Email',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      // email.isEmpty
                      //     ? Padding(
                      //         padding: const EdgeInsets.all(8.0),
                      //         child: Text(
                      //           'please enter a valid Email',
                      //           style: TextStyle(color: Colors.red),
                      //         ),
                      //       )
                      //     : Text(''),

                      const SizedBox(height: 10),

                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: colorconst.scolor.withOpacity(0.4),
                        ),
                        child: TextFormField(
                          obscureText: true,
                          onChanged: (val) {
                            // validator:
                            // (val) => val.toString().length < 8
                            //     ? 'password less than 8 characters'
                            //     : null;
                            setState(() {
                              password = val;
                            });
                          },
                          //cursorColor: colorconst.pcolor,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.lock_outline),
                            hintText: 'Password',
                            border: InputBorder.none,
                          ),
                        ),
                      ),

                      // password.isEmpty
                      //     ? Padding(
                      //         padding: const EdgeInsets.only(bottom: 8.0),
                      //         child: Text(
                      //           'please enter password',
                      //           style: TextStyle(color: Colors.red),
                      //         ),
                      //       )
                      //     : Text(''),

                      //const SizedBox(height: 40),

                      //const SizedBox(height: 5),

                      InkWell(
                        onTap: () async {
                          var result =
                              await _auth.signinwithemail(email, password);
                          if (result == null) {
                            res = null;
                            print('print error');
                          } else {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Homepage()));

                            res = 'k';

                            print(result.uid);
                          }
                        },
                        child: Column(
                          children: [
                            res == null
                                ? const Padding(
                                    padding: EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      'Email or Password Entered is Wrong',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                : Text(''),
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: colorconst.scolor.withOpacity(1),
                              ),
                              child: const Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'LOGIN',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              if ((viewInset == 0 && isLogin) || !isLogin) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: containerSize.value,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(217, 217, 217, 1),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100)),
                    ),
                    alignment: Alignment.center,
                    child: GestureDetector(
                        onTap: !isLogin
                            ? null
                            : () {
                                animationController.forward();
                                setState(() {
                                  isLogin = !isLogin;
                                });
                              },
                        child: isLogin
                            ? const Text(
                                'Don\'t have an account? Sign up',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.cyan,
                                ),
                              )
                            : null),
                  ),
                );
              }
              return Container();
            },
          ),

          // register

          AnimatedOpacity(
            duration: animationduration * 5,
            opacity: isLogin ? 0.0 : 1.0,
            child: Visibility(
              visible: !isLogin,
              child: Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    width: size.width,
                    height: defaultLoginsize,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          'Welcome',
                          style: TextStyle(
                            color: Colors.cyan,
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                        const Image(image: AssetImage('assets/logo_r.gif')),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: colorconst.scolor.withOpacity(0.4),
                          ),
                          child: TextFormField(
                            // validator: (val) => val!.isEmpty ? null : 'empty mail',
                            onChanged: (val) async {
                              setState(() {
                                name = val;
                              });
                            },
                            //cursorColor: colorconst.pcolor,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.person_outline,
                                color: Colors.indigo.shade900,
                              ),
                              hintText: 'NickName',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: colorconst.scolor.withOpacity(0.4),
                          ),
                          child: TextFormField(
                            // validator: (val) => val!.isEmpty ? null : 'empty mail',
                            onChanged: (val) async {
                              setState(() {
                                email = val;
                              });
                            },
                            //cursorColor: colorconst.pcolor,
                            decoration: const InputDecoration(
                              icon: Icon(
                                Icons.email_outlined,
                                color: Colors.blue,
                              ),
                              hintText: 'Email',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: colorconst.scolor.withOpacity(0.4),
                          ),
                          child: TextFormField(
                            obscureText: true,
                            onChanged: (val) {
                              validator:
                              (val) => val.toString().length < 8
                                  ? 'password less than 8 characters'
                                  : null;
                              setState(() {
                                password = val;
                              });
                            },
                            //cursorColor: colorconst.pcolor,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.lock_outline),
                              hintText: 'Password',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                dynamic result = await _auth.registerwithemail(
                                    email, password);
                                if (result == null) {
                                  // res = null;
                                  print('print error');
                                } else {
                                  print('Registered');
                                  print(result);
                                  Databaseservice(email)
                                      .updateUsername(name, email);
                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Homepage()));
                                }
                              },
                              child: Container(
                                  margin: const EdgeInsets.only(bottom: 5),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  width: size.width * 0.8,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: colorconst.scolor.withOpacity(1),
                                  ),
                                  child: const Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        'REGISTER',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('sign in'),
    //   ),
    //   body: Container(
    //     padding: EdgeInsets.all(20),
    //     // child: ElevatedButton(
    //     //   onPressed: () async {
    //     //     dynamic result = await _auth.signInAnon();
    //     //     if (result == null) {
    //     //       print('print error');
    //     //     } else {
    //     //       print('signed in anon');
    //     //       print(result.uid);
    //     //     }
    //     //   },
    //     //   child: Text('sign in anon'),
    //     // ),
    //     child: Form(
    //         child: Column(
    //       children: [
    //         SizedBox(height: 20),
    //         TextFormField(
    //           onChanged: (val) {
    //             setState(() {
    //               email = val;
    //             });
    //           },
    //         ),
    //         SizedBox(height: 20),
    //         TextFormField(
    //           obscureText: true,
    //           onChanged: (val) {
    //             password = val;
    //           },
    //         ),
    //         SizedBox(height: 20),
    //         ElevatedButton(
    //           onPressed: () async {
    //             dynamic result = await _auth.signinwithemail(email, password);
    //             if (result == null) {
    //               print('error logging');
    //               print(email);
    //               print(password);
    //             } else {
    //               print(email);
    //               print(password);
    //               Navigator.pushNamed(context, 'home');
    //             }
    //           },
    //           child: Text('sign in'),
    //         ),
    //       ],
    //     )),
    //   ),
    // );
  }
}

// Widget buildRegisterContainer(AnimationController animationController) {
//   return Align(
//     alignment: Alignment.bottomCenter,
//     child: Container(
//       width: double.infinity,
//       height: 50,
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(300), topRight: Radius.circular(300)),
//       ),
//       alignment: Alignment.center,
//       child: GestureDetector(
//         onTap: () {
//           animationController.forward();
//         },
//         child: Text(
//           'Don\'t have an account? Sign up',
//           style: TextStyle(
//             fontSize: 18,
//             color: Colors.cyan,
//           ),
//         ),
//       ),
//     ),
//   );
// }



// class field extends StatelessWidget {
//   field(
//       {Key? key,
//       required this.size,
//       required this.ico,
//       required this.hint,
//       required this.varia})
//       : super(key: key);

//   final Size size;
//   final Widget ico;
//   final String hint;
//   String varia;

//   void _setState(variable,val) {
//     varia = val;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//       width: size.width * 0.8,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30),
//         color: colorconst.scolor.withOpacity(0.4),
//       ),
//       child: TextField(
//         onChanged: (val) {
//           _setState(varia, val);
//         },
//         //cursorColor: colorconst.pcolor,
//         decoration: InputDecoration(
//           icon: ico,
//           hintText: hint,
//           border: InputBorder.none,
//         ),
//       ),
//     );
//   }
// }

// Widget field(Size size, variable, String hint, Icon ico) {
//   return Container(
//     margin: const EdgeInsets.symmetric(vertical: 10),
//     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//     width: size.width * 0.8,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(30),
//       color: colorconst.scolor.withOpacity(0.4),
//     ),
//     child: TextField(
//       onChanged: (val) {
//       },
//       //cursorColor: colorconst.pcolor,
//       decoration: InputDecoration(
//         icon: ico,
//         hintText: hint,
//         border: InputBorder.none,
//       ),
//     ),
//   );
// }

