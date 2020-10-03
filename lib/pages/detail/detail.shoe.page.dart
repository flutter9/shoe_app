import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailShoePage extends StatefulWidget {
  @override
  _DetailShoePageState createState() => _DetailShoePageState();
}

class _DetailShoePageState extends State<DetailShoePage> {
  Map passedShoe = {};
  List<String> sizeList = ["40", "41", "41,5", "42", "43"];
  int _selectedSizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    passedShoe = ModalRoute.of(context).settings.arguments;
    //print(passedShoe);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: _detailsAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _shoeContainer(),
            SizedBox(height: 40),
            _logo(),
            SizedBox(height: 40),
            _shoeName(),
            SizedBox(height: 20),
            _shoeCost(),
            SizedBox(height: 40),
            _sizeLabel(),
            _sizesList(),
            SizedBox(height: 40),
            _descriptionRow(),
            SizedBox(height: 40),
            _addToCart(),
          ],
        ),
      ),
    );
  }

  Widget _addToCart() {
    return Padding(
      padding: EdgeInsets.only(
        left: 30,
        right: 30,
        bottom: 30,
      ),
      child: Row(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
            ),
            child: IconButton(
              padding: EdgeInsets.all(
                20,
              ),
              onPressed: () {
                setState(() {
                  passedShoe['isFav'] = !passedShoe['isFav'];
                });
              },
              icon: passedShoe['isFav']
                  ? Icon(
                      Icons.favorite,
                    )
                  : Icon(
                      Icons.favorite_border,
                    ),
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    50,
                  ),
                ),
              ),
              child: FlatButton(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                ),
                onPressed: () {},
                child: Text(
                  "Add to Cart",
                  style: GoogleFonts.spartan(
                    textStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _descriptionRow() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Description",
            style: GoogleFonts.spartan(
              textStyle: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.w700,
                letterSpacing: -1,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.keyboard_arrow_down,
              size: 35,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sizesList() {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
        left: 30,
      ),
      height: 80,
      child: ListView.builder(
        itemCount: sizeList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedSizeIndex = i;
              });
            },
            child: Container(
              margin: EdgeInsets.only(
                right: 20,
              ),
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: _selectedSizeIndex == i
                    ? Colors.black
                    : Colors.grey.shade100,
              ),
              child: Center(
                child: Text(
                  "${sizeList[i]}",
                  style: GoogleFonts.spartan(
                    textStyle: TextStyle(
                      fontSize: 20,
                      color: _selectedSizeIndex == i
                          ? Colors.grey.shade100
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _sizeLabel() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Size",
            style: GoogleFonts.spartan(
              textStyle: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.w700,
                letterSpacing: -1,
              ),
            ),
          ),
          Text(
            "Size Guide",
            style: GoogleFonts.spartan(
              textStyle: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w700,
                letterSpacing: -1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _shoeCost() {
    return Text(
      "${passedShoe['cost']}",
      style: GoogleFonts.spartan(
        textStyle: TextStyle(
          fontSize: 30,
          color: Colors.black,
          fontWeight: FontWeight.w600,
          letterSpacing: -3,
        ),
      ),
    );
  }

  Widget _shoeName() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Text(
        "${passedShoe['name']}",
        textAlign: TextAlign.center,
        style: GoogleFonts.spartan(
          textStyle: TextStyle(
            fontSize: 36,
            color: Colors.black,
            fontWeight: FontWeight.w700,
            letterSpacing: -3,
          ),
        ),
      ),
    );
  }

  Widget _logo() {
    return SizedBox(
      height: 30,
      child: SvgPicture.asset("assets/svgs/nike.svg"),
    );
  }

  Container _shoeContainer() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 80,
        bottom: 50,
        left: 60,
        right: 65,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70),
        ),
      ),
      child: SizedBox(
        height: 180,
        child: Image.asset("assets/images/${passedShoe['image']}"),
      ),
    );
  }

  AppBar _detailsAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(
          left: 20,
        ),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 35,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(
            right: 30,
          ),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/svgs/2dots.svg"),
          ),
        ),
      ],
    );
  }
}
