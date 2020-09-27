import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeHeader extends StatefulWidget {
  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  String _selectedValue;
  List<String> _sortByList = ["First", "Second", "Third"];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 35,
        top: 35,
        right: 30,
        bottom: 35,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Shoes",
            style: GoogleFonts.spartan(
              textStyle: TextStyle(
                fontSize: 36,
                color: Colors.black,
                fontWeight: FontWeight.w700,
                letterSpacing: -3,
              ),
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton(
              value: _selectedValue,
              style: GoogleFonts.spartan(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -1,
                ),
              ),
              items: _sortByList
                  .map((String item) =>
                      DropdownMenuItem(child: Text(item), value: item))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedValue = value;
                });
              },
              hint: Text(
                "Sort by",
                style: GoogleFonts.spartan(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -1,
                  ),
                ),
              ),
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
