import 'package:flutter/material.dart';

class ShowInvoice extends StatefulWidget {
  @override
  _ShowInvoiceState createState() => _ShowInvoiceState();
}

class _ShowInvoiceState extends State<ShowInvoice> {
  @override
  Widget build(BuildContext context) {
    var defaultstyle = TextStyle(color: Color.fromRGBO(41, 93, 100, 1),fontSize: 18);
    return Scaffold(
     
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            forceElevated: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.25,
            floating: false,
            pinned: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(bottom: 10),
              background: Image.asset(
                'assets/images/bg_small.png',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
              collapseMode: CollapseMode.parallax,
              title: Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Text(
                  "Aquahub",
                  style: TextStyle(
                    fontSize: 37,
                    fontFamily: 'vonique',
                    color: Colors.white,
                  ),
                ),
              ),
              centerTitle: true,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.only(top:8.0,left:8),
                  child: Text("Last edited:24th Jan, 2020",style: defaultstyle.copyWith(fontSize: 15),),
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Demo Invoice",style: defaultstyle.copyWith(fontSize: 28,fontWeight: FontWeight.bold),),
                    Container(
                      margin: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width - 10,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Table(
                            columnWidths: {
                              0: FlexColumnWidth(3),
                              1: FlexColumnWidth(2),
                              2: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Text(
                                    "12th Jan, 2019",
                                    textAlign: TextAlign.start,
                                    style: defaultstyle,
                                  ),
                                  Text(""),
                                  Text("Friday",
                                      textAlign: TextAlign.center,
                                      style: defaultstyle),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Text(
                                    " ",
                                    textAlign: TextAlign.start,
                                    style: defaultstyle,
                                  ),
                                  Text(""),
                                  Text(" ",
                                      textAlign: TextAlign.center,
                                      style: defaultstyle),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Text("Item",
                                      textAlign: TextAlign.start,
                                      style: defaultstyle.copyWith(
                                          fontWeight: FontWeight.w700)),
                                  Text("Qty",
                                      textAlign: TextAlign.center,
                                      style: defaultstyle.copyWith(
                                          fontWeight: FontWeight.w700)),
                                  Text("Amt.",
                                      textAlign: TextAlign.center,
                                      style: defaultstyle.copyWith(
                                          fontWeight: FontWeight.w700)),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Text("Tiger Prawns",
                                      textAlign: TextAlign.start,
                                      style: defaultstyle),
                                  Text("2 KG",
                                      textAlign: TextAlign.center,
                                      style: defaultstyle),
                                  Text("1900",
                                      textAlign: TextAlign.center,
                                      style: defaultstyle),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Text("Tiger Prawns",
                                      textAlign: TextAlign.start,
                                      style: defaultstyle),
                                  Text("2 KG",
                                      textAlign: TextAlign.center,
                                      style: defaultstyle),
                                  Text("1900",
                                      textAlign: TextAlign.center,
                                      style: defaultstyle),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Text("Tiger Prawns",
                                      textAlign: TextAlign.start,
                                      style: defaultstyle),
                                  Text("2 KG",
                                      textAlign: TextAlign.center,
                                      style: defaultstyle),
                                  Text("1900",
                                      textAlign: TextAlign.center,
                                      style: defaultstyle),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Text("GST",
                                      textAlign: TextAlign.start,
                                      style: defaultstyle),
                                  Text("",
                                      textAlign: TextAlign.center,
                                      style: defaultstyle),
                                  Text("1600",
                                      textAlign: TextAlign.center,
                                      style: defaultstyle),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Text("Total",
                                      textAlign: TextAlign.start,
                                      style: defaultstyle),
                                  Text("",
                                      textAlign: TextAlign.center,
                                      style: defaultstyle),
                                  Text("7300",
                                      textAlign: TextAlign.center,
                                      style: defaultstyle),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Text(" ",
                                      textAlign: TextAlign.start,
                                      style: defaultstyle),
                                  Text("",
                                      textAlign: TextAlign.center,
                                      style: defaultstyle),
                                  Text(" ",
                                      textAlign: TextAlign.center,
                                      style: defaultstyle),
                                ],
                              ),
                            ],
                          ),
                          Table(
                            children: [
                              TableRow(
                                children: [
                                  Text(
                                    "Payer: Mr. Rajeshwar (+91 8989898989)",
                                    style: defaultstyle.copyWith(fontSize: 15),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Text(
                                    "Payment Method: Cash",
                                    style: defaultstyle.copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
