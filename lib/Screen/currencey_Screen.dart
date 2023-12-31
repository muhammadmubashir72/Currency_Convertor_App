import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../model/cuurencyClass.dart';

class AllCurrencyScreen extends StatefulWidget {
  const AllCurrencyScreen({super.key});

  @override
  State<AllCurrencyScreen> createState() => _AllCurrencyScreenState();
}

class _AllCurrencyScreenState extends State<AllCurrencyScreen> {
  Currency curr = Currency();
  var country = "usd";
  var currencyController = TextEditingController();
  var increaseNumberController = TextEditingController();
  var currencyName = [];
  var currencyValue = [];
  var result;
  @override
  void initState() {
    super.initState();
    getCurrency();
  }

  Future<void> getCurrency() async {
    http.Response response = await http
        .get(Uri.parse("https://open.er-api.com/v6/latest/${country}"));

    print(response.statusCode);
    print(response.body);
    result = jsonDecode(response.body);

    setState(() {
      curr = Currency.fromJson(jsonDecode(response.body));
      // currencyName = response.body['rates'].keys.toList();
      currencyName = result['rates'].keys.toList();
      currencyValue = result['rates'].values.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212121),
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          "Currency Converter",
          style: GoogleFonts.urbanist(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: const Color(0xffFFFFFF)),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.7), BlendMode.darken),
                image: AssetImage("assets/images/bg_image.png"))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 42,
              margin: const EdgeInsets.only(top: 27),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: TextField(
                    style: GoogleFonts.urbanist(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                    cursorColor: const Color.fromRGBO(61, 61, 54, 0.932),
                    controller: currencyController,
                    decoration: InputDecoration(
                      suffix: IconButton(
                        icon: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            country = currencyController.text;
                            getCurrency();
                            currencyController.clear();
                          });
                        },
                      ),
                      filled: true,
                      fillColor: const Color(0xff212436),
                      contentPadding: const EdgeInsets.all(25),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          borderSide:
                              BorderSide(width: 1, color: Color(0xff212436))),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          borderSide: BorderSide(
                              width: 1, color: Colors.lightBlueAccent)),
                      labelText: "Type your currency",
                      labelStyle: GoogleFonts.urbanist(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    )),
              ),
            ),
            Text(
              "Current Currency",
              style: GoogleFonts.urbanist(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 24),
            ),
            Text("${curr.baseCode ?? ("___")}",
                style: GoogleFonts.urbanist(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 44,
                )),
            const SizedBox(
              height: 10,
            ),
            Text("${curr.timeLastUpdateUtc?.substring(0, 17) ?? ("___")}",
                style: GoogleFonts.urbanist(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                )),
            Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemCount: currencyValue.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Column(
                          children: [
                            ListTile(
                                onTap: () {
                                  showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25))),
                                    elevation: 5,
                                    backgroundColor: Colors.grey[800],
                                    context: context,
                                    builder: (context) => bottom(),
                                  );
                                },
                                horizontalTitleGap: 5,
                                leading: CircleAvatar(
                                  backgroundColor: Colors.grey[700],
                                  child: Image.asset(
                                    "assets/images/dollar.png",
                                    width: 25,
                                    height: 25,
                                  ),
                                ),
                                title: Text(
                                  currencyName[index],
                                  style: GoogleFonts.urbanist(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                ),
                                trailing: Text(
                                  currencyValue[index].toString(),
                                  style: GoogleFonts.urbanist(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                )),
                            const Divider(
                              thickness: 1,
                              color: Colors.grey,
                            )
                          ],
                        ),
                        //   ],
                        // )
                      );
                    }))
          ],
        ),
      ),
    );
  }

  Widget bottom() {
    return Container(
      height: 316,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(height: 20),
        Center(
          child: CircleAvatar(
              backgroundColor: Colors.grey[700],
              child: Image.asset(
                "assets/images/dollar.png",
                width: 50,
                height: 50,
              )),
        ),
        SizedBox(height: 20),
        Column(
          children: [
            Container(
              width: 320,
              height: 65,
              child: TextField(
                  controller: increaseNumberController,
                  maxLength: 4,
                  style: GoogleFonts.urbanist(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                  autofocus: true,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.number,
                  toolbarOptions: const ToolbarOptions(
                      copy: true, paste: true, cut: true, selectAll: true),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 100, 97, 86),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 100, 97, 86),
                        ),
                        borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 100, 97, 86),
                        ),
                        borderRadius: BorderRadius.circular(25)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(25)),
                    suffixText: "${curr.baseCode ?? "---"}",
                    suffixStyle: GoogleFonts.urbanist(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                    prefixText: "${curr.rates?.uSD ?? "---"}",
                    prefixStyle: GoogleFonts.urbanist(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  )),
            ),
            Container(
                width: 320,
                height: 48,
                child: TextField(
                    readOnly: true,
                    style: GoogleFonts.urbanist(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 100, 97, 86),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 100, 97, 86),
                          ),
                          borderRadius: BorderRadius.circular(25)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 100, 97, 86),
                          ),
                          borderRadius: BorderRadius.circular(25)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(25)),
                      prefixText: "${curr.rates?.pKR ?? "---"}",
                      prefixStyle: GoogleFonts.urbanist(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                      suffixText: "PKR",
                      suffixStyle: GoogleFonts.urbanist(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ))),
          ],
        ),
      ]),
    );
  }
}
