import 'package:dairy_products/screens/home/prods/components/prodpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CowMilk extends StatefulWidget {
  CowMilk({Key? key}) : super(key: key);

  @override
  _CowMilkState createState() => _CowMilkState();
}

class _CowMilkState extends State<CowMilk> {
  var desc = 'Shipped directly from Dairy';
  var img = 'assets/categories/Milk/cowmilk.jpg';
  @override
  Widget build(BuildContext context) {
    return prodpage(
      prod: 'Cow Milk',
      desc: desc,
      price: 37,
      img: img,
      qnty: '500 ML',
    );
  }
}

class buffalomilk extends StatefulWidget {
  buffalomilk({Key? key}) : super(key: key);

  @override
  _buffalomilkState createState() => _buffalomilkState();
}

class _buffalomilkState extends State<buffalomilk> {
  var desc = 'Shipped directly from Dairy';
  var img = 'assets/categories/Milk/buffalomilk.jpg';
  @override
  Widget build(BuildContext context) {
    return prodpage(
      prod: 'Buffalo Milk',
      desc: desc,
      price: 44,
      img: img,
      qnty: '500 ML',
    );
  }
}

class skimmeedmilk extends StatefulWidget {
  skimmeedmilk({Key? key}) : super(key: key);

  @override
  _skimmeedmilkState createState() => _skimmeedmilkState();
}

class _skimmeedmilkState extends State<skimmeedmilk> {
  var desc = 'Shipped directly from Dairy';
  var img = 'assets/categories/Milk/skimmedmilk.jpg';
  @override
  Widget build(BuildContext context) {
    return prodpage(
      prod: 'Skimmed Milk',
      desc: desc,
      price: 26,
      img: img,
      qnty: '500 ML',
    );
  }
}

class slicedcheese extends StatefulWidget {
  slicedcheese({Key? key}) : super(key: key);

  @override
  _slicedcheeseState createState() => _slicedcheeseState();
}

class _slicedcheeseState extends State<slicedcheese> {
  var desc = 'Shipped directly from Dairy';
  var img = 'assets/categories/Cheese/slicedcheese.jpg';
  @override
  Widget build(BuildContext context) {
    return prodpage(
      prod: 'Sliced Cheese',
      desc: desc,
      price: 73,
      img: img,
      qnty: '100 gm',
    );
  }
}

class wholecheese extends StatefulWidget {
  wholecheese({Key? key}) : super(key: key);

  @override
  _wholecheeseState createState() => _wholecheeseState();
}

class _wholecheeseState extends State<wholecheese> {
  var desc = 'Shipped directly from Dairy';
  var img = 'assets/categories/Cheese/wholecheese.jpg';
  @override
  Widget build(BuildContext context) {
    return prodpage(
      prod: 'Whole Cheese',
      desc: desc,
      price: 110,
      img: img,
      qnty: '200 gm',
    );
  }
}

class saltedbutter extends StatefulWidget {
  saltedbutter({Key? key}) : super(key: key);

  @override
  _saltedbutterState createState() => _saltedbutterState();
}

class _saltedbutterState extends State<saltedbutter> {
  var desc = 'Shipped directly from Dairy';
  var img = 'assets/categories/Butter/saltedbut.jpg';
  @override
  Widget build(BuildContext context) {
    return prodpage(
      prod: 'Salted Butter',
      desc: desc,
      price: 49,
      img: img,
      qnty: '100 gm',
    );
  }
}

class unsaltedbutter extends StatefulWidget {
  unsaltedbutter({Key? key}) : super(key: key);

  @override
  _unsaltedbutterState createState() => _unsaltedbutterState();
}

class _unsaltedbutterState extends State<unsaltedbutter> {
  var desc = 'Shipped directly from Dairy';
  var img = 'assets/categories/Butter/unsaltedbutter.jpg';
  @override
  Widget build(BuildContext context) {
    return prodpage(
      prod: 'Unsalted Butter',
      desc: desc,
      price: 50,
      img: img,
      qnty: '100 gm',
    );
  }
}

class chocolate extends StatefulWidget {
  chocolate({Key? key}) : super(key: key);

  @override
  _chocolateState createState() => _chocolateState();
}

class _chocolateState extends State<chocolate> {
  var desc = 'Shipped directly from Dairy';
  var img = 'assets/categories/Icecreams/chocice.jpg';
  @override
  Widget build(BuildContext context) {
    return prodpage(
      prod: 'Chocolate',
      desc: desc,
      price: 190,
      img: img,
      qnty: '1 L',
    );
  }
}

class butterscotch extends StatefulWidget {
  butterscotch({Key? key}) : super(key: key);

  @override
  _butterscotchState createState() => _butterscotchState();
}

class _butterscotchState extends State<butterscotch> {
  var desc = 'Shipped directly from Dairy';
  var img = 'assets/categories/Icecreams/butterscotchice.jpg';
  @override
  Widget build(BuildContext context) {
    return prodpage(
      prod: 'Butterscotch',
      desc: desc,
      price: 187,
      img: img,
      qnty: '1 L',
    );
  }
}

class pista extends StatefulWidget {
  pista({Key? key}) : super(key: key);

  @override
  _pistaState createState() => _pistaState();
}

class _pistaState extends State<pista> {
  var desc = 'Shipped directly from Dairy';
  var img = 'assets/categories/Icecreams/pistaice.jpg';
  @override
  Widget build(BuildContext context) {
    return prodpage(
      prod: 'Pista',
      desc: desc,
      price: 249,
      img: img,
      qnty: '1 L',
    );
  }
}

class vanilla extends StatefulWidget {
  vanilla({Key? key}) : super(key: key);

  @override
  _vanillaState createState() => _vanillaState();
}

class _vanillaState extends State<vanilla> {
  var desc = 'Shipped directly from Dairy';
  var img = 'assets/categories/Icecreams/vanice.jpg';
  @override
  Widget build(BuildContext context) {
    return prodpage(
      prod: 'vanilla',
      desc: desc,
      price: 157,
      img: img,
      qnty: '1 L',
    );
  }
}

class paneerbricks extends StatefulWidget {
  paneerbricks({Key? key}) : super(key: key);

  @override
  _paneerbricksState createState() => _paneerbricksState();
}

class _paneerbricksState extends State<paneerbricks> {
  var desc = 'Shipped directly from Dairy';
  var img = 'assets/categories/Paneer/panbrick.jpg';
  @override
  Widget build(BuildContext context) {
    return prodpage(
      prod: 'Paneer',
      desc: desc,
      price: 75,
      img: img,
      qnty: '200 gm',
    );
  }
}

class paneercubes extends StatefulWidget {
  paneercubes({Key? key}) : super(key: key);

  @override
  _paneercubesState createState() => _paneercubesState();
}

class _paneercubesState extends State<paneercubes> {
  var desc = 'Shipped directly from Dairy';
  var img = 'assets/categories/Paneer/pancube.jpg';
  @override
  Widget build(BuildContext context) {
    return prodpage(
      prod: 'Paneercubes',
      desc: desc,
      price: 74,
      img: img,
      qnty: '200 gm',
    );
  }
}

class almondyogurt extends StatefulWidget {
  almondyogurt({Key? key}) : super(key: key);

  @override
  _almondyogurtState createState() => _almondyogurtState();
}

class _almondyogurtState extends State<almondyogurt> {
  var desc = 'Shipped directly from Dairy';
  var img = 'assets/categories/Yogurt/almyogurt.jpg';
  @override
  Widget build(BuildContext context) {
    return prodpage(
      prod: 'Almond Yoguet',
      desc: desc,
      price: 500,
      img: img,
      qnty: '500 gm',
    );
  }
}

class coconutyogurt extends StatefulWidget {
  coconutyogurt({Key? key}) : super(key: key);

  @override
  _coconutyogurtState createState() => _coconutyogurtState();
}

class _coconutyogurtState extends State<coconutyogurt> {
  var desc = 'Shipped directly from Dairy';
  var img = 'assets/categories/Yogurt/cocoyogurt.jpg';
  @override
  Widget build(BuildContext context) {
    return prodpage(
      prod: 'Coconut Yogurt',
      desc: desc,
      price: 400,
      img: img,
      qnty: '500 gm',
    );
  }
}

class soyyogurt extends StatefulWidget {
  soyyogurt({Key? key}) : super(key: key);

  @override
  _soyyogurtState createState() => _soyyogurtState();
}

class _soyyogurtState extends State<soyyogurt> {
  var desc = 'Shipped directly from Dairy';
  var img = 'assets/categories/Yogurt/soyyogurt.jpg';
  @override
  Widget build(BuildContext context) {
    return prodpage(
      prod: 'Soy Yogurt',
      desc: desc,
      price: 200,
      img: img,
      qnty: '360 gm',
    );
  }
}
