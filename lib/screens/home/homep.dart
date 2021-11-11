import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dairy_products/screens/home/cartlist.dart';
import 'package:dairy_products/screens/home/drawer/account.dart';
import 'package:dairy_products/screens/home/myorders.dart';
import 'package:dairy_products/screens/settings.dart';
import 'package:dairy_products/services/database.dart';
import 'package:dairy_products/values.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Homep extends StatefulWidget {
  Homep({Key? key}) : super(key: key);

  @override
  _HomepState createState() => _HomepState();
}

class _HomepState extends State<Homep> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    String id = _auth.currentUser!.email.toString();
    return Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * .07),
          child: AppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 2),
                StreamBuilder<DocumentSnapshot>(
                    stream: Databaseservice(id).details,
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text('Loading');
                      }
                      final data = snapshot.requireData;
                      return Text(
                        'Hi, ${data['Name']}',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                          color: colorconst.pcolor,
                        ),
                      );
                    }),
                Text(
                  'What would you buy today?',
                  style: TextStyle(
                      fontSize: 15.0,
                      letterSpacing: 1.0,
                      color: Colors.green,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Cartlist())),
                      },
                  icon: const Icon(
                    Icons.shopping_cart,
                  )),
            ],
            iconTheme: IconThemeData(color: colorconst.scolor),
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
        ),
        drawer: drawerfunc(context, id),
        body: ListView(
          children: [
            const SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                    items: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.pushNamed(context, "Milk");
                          });
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Hero(
                            tag: 'assets/categories/Milk/milkbottle.jpg',
                            child: Container(
                              // height: 40,
                              // width: 200,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    'assets/categories/Milk/milkbottle.jpg'),
                              )),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.pushNamed(context, "Cheese");
                          });
                        },
                        child: Hero(
                          tag: 'assets/categories/Cheese/cheese.jpg',
                          child: Container(
                            // height: 800,
                            // width: 800,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/categories/Cheese/cheese.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.pushNamed(context, "Butter");
                          });
                        },
                        child: Hero(
                          tag: 'assets/categories/Butter/butter.jpg',
                          child: Container(
                            // height: 800,
                            // width: 800,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/categories/Butter/butter.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.pushNamed(context, "Icecreams");
                          });
                        },
                        child: Hero(
                          tag: 'assets/categories/Icecreams/ice.jpg',
                          child: Container(
                            // height: 800,
                            // width: 800,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/categories/Icecreams/ice.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.pushNamed(context, "Paneer");
                          });
                        },
                        child: Hero(
                          tag: 'assets/categories/Paneer/paneer.jpg',
                          child: Container(
                            // height: 800,
                            // width: 800,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/categories/Paneer/paneer.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.pushNamed(context, "Yogurt");
                          });
                        },
                        child: Hero(
                          tag: 'assets/categories/Yogurt/Yogurt.jpg',
                          child: Container(
                            // height: 800,
                            // width: 800,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/categories/Yogurt/Yogurt.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      )
                    ],
                    options: CarouselOptions(
                      height: 200,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.easeInOutCubicEmphasized,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    )),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 9, left: 20),
                      child: Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.6,
                          color: colorconst.pcolor,
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'categories');
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 9, right: 25),
                        child: const Text(
                          "See all",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.3,
                              color: Colors.green),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => {Navigator.pushNamed(context, 'Milk')},
                        child: _categories(
                          'assets/categories/Milk/milkbottle.jpg',
                          'Milk',
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {Navigator.pushNamed(context, 'Cheese')},
                        child: _categories(
                          'assets/categories/Cheese/cheese.jpg',
                          'Cheese',
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {Navigator.pushNamed(context, 'Butter')},
                        child: _categories(
                          'assets/categories/Butter/butter.jpg',
                          'Butter',
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            {Navigator.pushNamed(context, 'Icecreams')},
                        child: _categories(
                          'assets/categories/Icecreams/ice.jpg',
                          'Icecreams',
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {Navigator.pushNamed(context, 'Paneer')},
                        child: _categories(
                          'assets/categories/Paneer/paneer.jpg',
                          'Paneer',
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {Navigator.pushNamed(context, 'Yogurt')},
                        child: _categories(
                          'assets/categories/Yogurt/Yogurt.jpg',
                          'Yogurt',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(left: 25),
                  child: Text(
                    "Best Selling",
                    style: TextStyle(
                      fontSize: 26.0,
                      fontFamily: 'Cookie',
                      letterSpacing: 0.7,
                      fontWeight: FontWeight.w600,
                      color: colorconst.pcolor,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'cowmilk');
                  },
                  child: _sellings(
                      'assets/categories/Milk/cowmilk.jpg',
                      'Cow Milk',
                      'Jersey Cow Milk and\nFresh 500 ML',
                      '\₹ 37',
                      context,
                      'cowmilk'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'slicedcheese');
                  },
                  child: _sellings(
                      'assets/categories/Cheese/slicedcheese.jpg',
                      'Sliced Cheese',
                      'Cheese Slices\n100 g.',
                      '\₹ 73',
                      context,
                      'slicedcheese'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'chocolate');
                  },
                  child: _sellings(
                      'assets/categories/Icecreams/chocice.jpg',
                      'Chocolate',
                      'rich chocolate\nicecream 1 L',
                      '\₹ 190',
                      context,
                      'chocolate'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'unsaltedbutter');
                  },
                  child: _sellings(
                      'assets/categories/Butter/unsaltedbutter.jpg',
                      'Unsalted Butter',
                      'fresh cream \n100% Natural! ',
                      '₹ 50',
                      context,
                      'unsaltedbutter'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'paneercubes');
                  },
                  child: _sellings(
                      'assets/categories/Paneer/pancube.jpg',
                      'Paneer Cubes',
                      'Pure Diet Paneer\nRich In Protein\n/Calcium',
                      '\₹ 74',
                      context,
                      'paneercubes'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'almondyogurt');
                  },
                  child: _sellings(
                      'assets/categories/Yogurt/almyogurt.jpg',
                      'Almond Yogurt',
                      'Creamy almond\nmilk yogurt',
                      '\₹ 500',
                      context,
                      'almondyogurt'),
                ),
              ],
            )
          ],
        ));
  }

  Drawer drawerfunc(BuildContext context, id) {
    return Drawer(
      child: ListView(
        children: [
          Column(
            children: [
              StreamBuilder<DocumentSnapshot>(
                  stream: Databaseservice(id).details,
                  builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Loading');
                    }
                    final data = snapshot.requireData;
                    return UserAccountsDrawerHeader(
                      accountName: Text(
                        data.get('Name'),
                        style: TextStyle(
                          letterSpacing: 1.3,
                          color: colorconst.pcolor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0,
                        ),
                      ),
                      accountEmail: Text(
                        data.get('Email'),
                        style: const TextStyle(
                          letterSpacing: 1.8,
                          fontSize: 17.0,
                          color: Colors.black54,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      currentAccountPicture: GestureDetector(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.white,
                              child: Text(
                                data['Name'].toString()[0].toUpperCase(),
                                style: TextStyle(
                                    fontSize: 35, color: colorconst.pcolor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      decoration:
                          BoxDecoration(color: Colors.green.withOpacity(0.6)),
                    );
                  }),
              InkWell(
                onTap: () => {Navigator.pop(context)},
                child: ListTile(
                  title: Text(
                    'Home',
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: colorconst.pcolor,
                    ),
                  ),
                  leading: Icon(
                    Icons.home,
                    color: colorconst.pcolor,
                  ),
                ),
              ),
              InkWell(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Account()))
                },
                child: ListTile(
                  title: Text(
                    'Account',
                    style: TextStyle(
                      fontSize: 18.0,
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.w500,
                      color: colorconst.pcolor,
                    ),
                  ),
                  leading: Icon(
                    Icons.person,
                    color: colorconst.pcolor,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Myorders()));
                },
                child: ListTile(
                  title: Text(
                    'My orders',
                    style: TextStyle(
                      fontSize: 18.0,
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.w500,
                      color: colorconst.pcolor,
                    ),
                  ),
                  leading: Icon(
                    Icons.shopping_basket,
                    color: colorconst.pcolor,
                  ),
                ),
              ),
              InkWell(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsPage()))
                },
                child: ListTile(
                  title: Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 18.0,
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.w500,
                      color: colorconst.pcolor,
                    ),
                  ),
                  leading: Icon(
                    Icons.settings,
                    color: colorconst.pcolor,
                  ),
                ),
              ),
              InkWell(
                onTap: () => {Navigator.pushNamed(context, 'about')},
                child: ListTile(
                  title: Text(
                    'About us',
                    style: TextStyle(
                      fontSize: 18.0,
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.w500,
                      color: colorconst.pcolor,
                    ),
                  ),
                  leading: Icon(
                    Icons.help,
                    color: colorconst.pcolor,
                  ),
                ),
              ),
              InkWell(
                onTap: () => {Navigator.pushNamed(context, 'terms')},
                child: ListTile(
                  title: Text(
                    'Terms & Conditions',
                    style: TextStyle(
                      fontSize: 18.0,
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.w500,
                      color: colorconst.pcolor,
                    ),
                  ),
                  leading: Icon(
                    Icons.file_copy,
                    color: colorconst.pcolor,
                  ),
                ),
              ),
              const Divider(
                height: 30,
              ),
              InkWell(
                child: ListTile(
                  title: Text(
                    "Version : 0.1.0",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      color: colorconst.pcolor.withOpacity(0.8),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _sellings(String image, String name, String description, String mvp,
      context, String path) {
    String mail = FirebaseAuth.instance.currentUser!.email.toString();

    return Container(
      height: MediaQuery.of(context).size.height * .15,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 30,
              top: 15,
              right: 15,
              bottom: 15,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Hero(
                tag: image,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            height: 85,
            width: 85,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.3,
                      color: Colors.green,
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                Padding(
                  padding: const EdgeInsets.only(right: 0.1),
                  child: Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.3,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                //const SizedBox(height: 8),
                Text(
                  mvp,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.1,
                    color: colorconst.pcolor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 10,
              margin: const EdgeInsets.only(right: 0),
              //color: Colors.amber,
            ),
          ),
          StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Users')
                  .doc(mail)
                  .collection('wishlist')
                  .doc(name)
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                try {
                  final data = snapshot.requireData;
                  bool isfav = data['fav'];
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    child: IconButton(
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('Users')
                              .doc(mail)
                              .collection('wishlist')
                              .doc(name)
                              .delete();
                        },
                        icon: Icon(Icons.favorite, color: Colors.red)),
                  );
                } catch (e) {
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    child: IconButton(
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('Users')
                              .doc(mail)
                              .collection('wishlist')
                              .doc(name)
                              .set(({
                                'Name': name,
                                'price': mvp,
                                'fav': true,
                                'image': image,
                                'path': path,
                              }));
                        },
                        icon: Icon(Icons.favorite_border, color: Colors.red)),
                  );
                }
              }),
        ],
      ),
    );
  }
}

Widget _categories(String image, String name) {
  return Container(
    margin: const EdgeInsets.only(left: 10),
    child: Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.black38,
          backgroundImage: AssetImage(image),
        ),
        const SizedBox(height: 10.0),
        Hero(
          transitionOnUserGestures: true,
          tag: name,
          child: Text(
            name,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.3,
                color: Colors.green),
          ),
        ),
      ],
    ),
  );
}
