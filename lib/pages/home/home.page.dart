import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.header.dart';
import 'home.shoelist.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _homeAppBar(),
      body: Column(
        children: [
          HomeHeader(),
          HomeShoeList(),
        ],
      ),
    );
  }

  AppBar _homeAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(
          left: 20,
        ),
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.short_text,
            color: Colors.black,
            size: 35,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/svgs/search.svg"),
        ),
        SizedBox(
          width: 10,
        ),
        IconButton(
          onPressed: () {},
          icon: Transform.rotate(
              angle: (90 / (180 / pi)), //rotate by 90 deg
              child: SvgPicture.asset("assets/svgs/filter.svg")),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          margin: EdgeInsets.only(
            right: 30,
          ),
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              "3",
              style: GoogleFonts.spartan(
                textStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
