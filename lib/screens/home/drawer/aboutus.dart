import 'package:dairy_products/values.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Widget aboutUsText1() {
      return Text(
        'WELCOME TO\nMAK DAIRY',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: colorconst.pcolor,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      );
    }


    Widget aboutUsText2() {
      return Text(
        'First of all, we thank you for taking a step towards using this application and supporting us. ',
        style: TextStyle(fontSize: 17),
      );
    }

    Widget aboutUsText2_1() {
      return Text(
        "MAK Dairy is an application developed to deliver you every day dairy products to your home . \nWell, you might ask, how do we do this ?",
        style: TextStyle(fontSize: 17),
      );
    }

    Widget aboutUsText3() {
      return Text(
        "In the  application, users can choose the products required and add them to cart",
        style: TextStyle(fontSize: 17),
      );
    }

    Widget aboutUsText4() {
      return Text(
        'checkout with required products from cart page and ',
        style: TextStyle(fontSize: 17),
      );
    }

    Widget aboutUsText5() {
      return Text(
        'we will deliver them to your home as promised.',
        style: TextStyle(fontSize: 17),
      );
    }

    Widget aboutUsText6() {
      return Text(
        'Our purposes while developing this application;',
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      );
    }

    Widget aboutUsText7() {
      return Text(
        '1) Make user friendly app to quickly find required products',
        style: TextStyle(fontSize: 17),
      );
    }

    Widget aboutUsText8() {
      return Text(
        "2) Deliver Home Premium Quality Dairy Products directly from Farm",
        style: TextStyle(fontSize: 17),
      );
    }

    Widget aboutUsText9() {
      return Text(
        "3) To support user in any query, Do contact us for any need.\n MAIL US AT - MAKDAIRY@SUPPORT.IN",
        style: TextStyle(fontSize: 17),
      );
    }

    Widget aboutUsText10() {
      return Text(
        "We are aware that we have shortcomings and we continue to work to provide you with a better experience. ",
        style: TextStyle(fontSize: 17),
      );
    }

    Widget aboutUsText11() {
      return Text(
        "Thank you for trusting MAK Dairy.\n\n ALL RIGHTS RESERVED \n©MAK DAIRY - 2021",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      );
    }

    return Scaffold(
      key: _drawerKey,
      body: Stack(children: [
        SingleChildScrollView(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 150,
                            ),
                            Image.asset(
                              "assets/logo.png",
                              width: 200,
                              height: 200,
                            ),
                            aboutUsText1(),
                            SizedBox(
                              height: 30,
                            ),
                            aboutUsText2(),
                            SizedBox(
                              height: 9,
                            ),
                            aboutUsText2_1(),
                            SizedBox(
                              height: 9,
                            ),
                            aboutUsText3(),
                            SizedBox(
                              height: 9,
                            ),
                            aboutUsText4(),
                            SizedBox(
                              height: 9,
                            ),
                            aboutUsText5(),
                            SizedBox(
                              height: 9,
                            ),
                            aboutUsText6(),
                            SizedBox(
                              height: 9,
                            ),
                            aboutUsText7(),
                            SizedBox(
                              height: 9,
                            ),
                            aboutUsText8(),
                            SizedBox(
                              height: 9,
                            ),
                            aboutUsText9(),
                            SizedBox(
                              height: 9,
                            ),
                            aboutUsText10(),
                            SizedBox(
                              height: 20,
                            ),
                            aboutUsText11(),
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            color: Color.fromRGBO(217, 217, 217, 1),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        ClipPath(
          
          child: Container(
            height: 175,
            color: (colorconst.pcolor),
            child: Column(children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                child: Row(
                  children: <Widget>[
                    TextButton(
                      child: Icon(Icons.arrow_back,color: Colors.white,),

                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(colorconst.pcolor),
                      ),
                      onPressed: () async {
                        return Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) => AboutUs()),
                        );
                      },
                    ),
                    SizedBox(width: 60),
                    Text("About Us",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              )
            ]),
          ),
        ),
      ]),
    );
  }
}