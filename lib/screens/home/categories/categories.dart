import 'package:dairy_products/values.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          padding: EdgeInsets.only(top: 5),
                          iconSize: 20.0,
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(context);
                          },
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 17, left: 0, bottom: 13),
                          child: Text(
                            'Categories',
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w600,
                                color: colorconst.pcolor),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 10,
                      thickness: 2,
                      color: Colors.black12,
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () => {Navigator.pushNamed(context, 'Milk')},
                            child: _cat('Milk',
                                'assets/categories/Milk/milkbottle.jpg')),
                        InkWell(
                          onTap: () => {Navigator.pushNamed(context, 'Cheese')},
                          child: _cat(
                              'Cheese', 'assets/categories/Cheese/cheese.jpg'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => {Navigator.pushNamed(context, 'Butter')},
                          child: _cat(
                              'Butter', 'assets/categories/Butter/butter.jpg'),
                        ),
                        InkWell(
                          onTap: () =>
                              {Navigator.pushNamed(context, 'Icecreams')},
                          child: _cat('Icecream',
                              'assets/categories/Icecreams/ice.jpg'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => {Navigator.pushNamed(context, 'Paneer')},
                          child: _cat(
                              'Paneer', 'assets/categories/Paneer/paneer.jpg'),
                        ),
                        InkWell(
                          onTap: () => {Navigator.pushNamed(context, 'Yogurt')},
                          child: _cat(
                              'Yogurt', 'assets/categories/Yogurt/Yogurt.jpg'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _cat(String name, String image) {
  return Container(
    margin: EdgeInsets.only(bottom: 0, top: 10, left: 10, right: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Hero(
              tag: image,
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: const TextStyle(
                  fontSize: 23,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.w600,
                  color: Colors.green),
            ),
          ],
        ),
      ],
    ),
  );
}
