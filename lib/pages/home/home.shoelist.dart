import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeShoeList extends StatefulWidget {
  @override
  _HomeShoeListState createState() => _HomeShoeListState();
}

class _HomeShoeListState extends State<HomeShoeList> {
  List<Map> shoes = [
    {
      "name": "Nike Air Max 97",
      "image": "shoe1.png",
      "cost": "\$ 270.00",
      "isFav": true,
    },
    {
      "name": "Nike Air Max 270 React",
      "image": "shoe2.png",
      "cost": "\$ 299.00",
      "isFav": false,
    },
    {
      "name": "Nike Max 10",
      "image": "shoe3.png",
      "cost": "\$ 450.00",
      "isFav": true,
    },
    {
      "name": "Nike Classic 111",
      "image": "shoe4.png",
      "cost": "\$ 199.00",
      "isFav": false,
    },
    {
      "name": "Nike Teal",
      "image": "shoe5.png",
      "cost": "\$ 149.00",
      "isFav": true,
    },
    {
      "name": "Nike Vibrant Red",
      "image": "shoe6.png",
      "cost": "\$ 199.00",
      "isFav": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: Colors.black,
        child: ListView.builder(
          itemBuilder: (context, i) {
            Map currentShoe = shoes[i];
            return GestureDetector(
              child: Container(
                padding: EdgeInsets.only(
                  top: 20,
                  left: 30,
                  right: 30,
                  bottom: 30,
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            currentShoe['isFav'] =
                                currentShoe['isFav'] ? false : true;
                          });
                        },
                        icon: Icon(
                            currentShoe['isFav']
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.black,
                            size: 20),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 130,
                            child: Image.asset(
                              'assets/images/${currentShoe['image']}',
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "${currentShoe['name']}",
                            style: GoogleFonts.spartan(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                                fontSize: 16,
                                letterSpacing: -1,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "${currentShoe['cost']}",
                            style: GoogleFonts.spartan(
                              textStyle: TextStyle(
                                fontSize: 14,
                                letterSpacing: -1,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/detail', arguments: currentShoe);
              },
            );
          },
          itemCount: shoes.length,
        ),
      ),
    );
  }
}
