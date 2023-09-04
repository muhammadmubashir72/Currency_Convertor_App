import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({super.key});

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/dollarCoin.png",
          width: 300,
          height: 150,
        ),
        Container(
          height: 42,
          margin: const EdgeInsets.only(top: 27),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: TextField(
                cursorColor: Color.fromRGBO(61, 61, 54, 0.932),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xff212436),
                  contentPadding: EdgeInsets.all(25),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xff212436))),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide:
                          BorderSide(width: 1, color: Colors.lightBlueAccent)),
                  labelText: "Type your currency",
                  labelStyle: GoogleFonts.urbanist(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                )),
          ),
        ),
        Container(
          height: 42,
          margin: const EdgeInsets.only(top: 27),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: TextField(
                cursorColor: Color.fromRGBO(61, 61, 54, 0.932),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xff212436),
                  contentPadding: EdgeInsets.all(25),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xff212436))),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide:
                          BorderSide(width: 1, color: Colors.lightBlueAccent)),
                  labelText: "Type your currency",
                  labelStyle: GoogleFonts.urbanist(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                )),
          ),
        ),
      ],
    ),
    );
  }

  Widget ShowBottomSeet() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/dollarCoin.png",
          width: 300,
          height: 150,
        ),
        Container(
          height: 42,
          margin: const EdgeInsets.only(top: 27),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: TextField(
                cursorColor: Color.fromRGBO(61, 61, 54, 0.932),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xff212436),
                  contentPadding: EdgeInsets.all(25),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xff212436))),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide:
                          BorderSide(width: 1, color: Colors.lightBlueAccent)),
                  labelText: "Type your currency",
                  labelStyle: GoogleFonts.urbanist(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                )),
          ),
        ),
        Container(
          height: 42,
          margin: const EdgeInsets.only(top: 27),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: TextField(
                cursorColor: Color.fromRGBO(61, 61, 54, 0.932),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xff212436),
                  contentPadding: EdgeInsets.all(25),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xff212436))),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide:
                          BorderSide(width: 1, color: Colors.lightBlueAccent)),
                  labelText: "Type your currency",
                  labelStyle: GoogleFonts.urbanist(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                )),
          ),
        ),
      ],
    );
  }
}
