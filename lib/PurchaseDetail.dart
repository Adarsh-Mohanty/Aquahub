import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PurchaseDetail extends StatefulWidget {
  final String name;
  final String image;
  final int index;
  PurchaseDetail(this.name, this.image, this.index);
  @override
  _PurchaseDetailState createState() => _PurchaseDetailState();
}

class _PurchaseDetailState extends State<PurchaseDetail> {
  int currentPage;
  List title;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentPage = 0;
  }

  void _showInvoicePopup(context) {
    var defaultstyle = TextStyle(color: Color.fromRGBO(41, 93, 100, 1));
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: <Widget>[
              Container(
                child: RaisedButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
            title: Text(
              "Invoice Heading",
              textAlign: TextAlign.center,
            ),
            titleTextStyle: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w800,
              color: Color.fromRGBO(41, 93, 100, 1),
            ),
            titlePadding: EdgeInsets.symmetric(vertical: 15),
            content: Container(
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
                              textAlign: TextAlign.center, style: defaultstyle),
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
                              textAlign: TextAlign.start, style: defaultstyle),
                          Text("2 KG",
                              textAlign: TextAlign.center, style: defaultstyle),
                          Text("1900",
                              textAlign: TextAlign.center, style: defaultstyle),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text("Tiger Prawns",
                              textAlign: TextAlign.start, style: defaultstyle),
                          Text("2 KG",
                              textAlign: TextAlign.center, style: defaultstyle),
                          Text("1900",
                              textAlign: TextAlign.center, style: defaultstyle),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text("Tiger Prawns",
                              textAlign: TextAlign.start, style: defaultstyle),
                          Text("2 KG",
                              textAlign: TextAlign.center, style: defaultstyle),
                          Text("1900",
                              textAlign: TextAlign.center, style: defaultstyle),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text("GST",
                              textAlign: TextAlign.start, style: defaultstyle),
                          Text("",
                              textAlign: TextAlign.center, style: defaultstyle),
                          Text("1600",
                              textAlign: TextAlign.center, style: defaultstyle),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text("Total",
                              textAlign: TextAlign.start, style: defaultstyle),
                          Text("",
                              textAlign: TextAlign.center, style: defaultstyle),
                          Text("7300",
                              textAlign: TextAlign.center, style: defaultstyle),
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
                                fontWeight: FontWeight.w700, fontSize: 13),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var mainSection = MainSection();
    final Widget listview = ListView(
      children: <Widget>[
        Card(
          elevation: 3,
          child: ListTile(
            leading: SizedBox(
                height: double.infinity, child: Icon(Icons.format_align_left)),
            title: Text("Date: 3rd Jan, 2020"),
            subtitle: Text("Bill: Rs. 850"),
            enabled: true,
            trailing: SizedBox(
              height: double.infinity,
              child: FlatButton(
                color: Color.fromRGBO(41, 93, 100, 1),
                child: Text(
                  "View",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  _showInvoicePopup(context);
                },
              ),
            ),
          ),
        ),
        Card(
          elevation: 3,
          child: ListTile(
            leading: SizedBox(
                height: double.infinity, child: Icon(Icons.format_align_left)),
            title: Text("Date: 3rd Jan, 2020"),
            subtitle: Text("Bill: Rs. 850"),
            enabled: true,
            trailing: SizedBox(
              height: double.infinity,
              child: FlatButton(
                color: Color.fromRGBO(41, 93, 100, 1),
                child: Text(
                  "View",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  _showInvoicePopup(context);
                },
              ),
            ),
          ),
        ),
        Card(
          elevation: 3,
          child: ListTile(
            leading: SizedBox(
                height: double.infinity, child: Icon(Icons.format_align_left)),
            title: Text("Date: 3rd Jan, 2020"),
            subtitle: Text("Bill: Rs. 850"),
            enabled: true,
            trailing: SizedBox(
              height: double.infinity,
              child: FlatButton(
                color: Color.fromRGBO(41, 93, 100, 1),
                child: Text(
                  "View",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  _showInvoicePopup(context);
                },
              ),
            ),
          ),
        ),
        Card(
          elevation: 3,
          child: ListTile(
            leading: SizedBox(
                height: double.infinity, child: Icon(Icons.format_align_left)),
            title: Text("Date: 3rd Jan, 2020"),
            subtitle: Text("Bill: Rs. 850"),
            enabled: true,
            trailing: SizedBox(
              height: double.infinity,
              child: FlatButton(
                color: Color.fromRGBO(41, 93, 100, 1),
                child: Text(
                  "View",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  _showInvoicePopup(context);
                },
              ),
            ),
          ),
        ),
        Card(
          elevation: 3,
          child: ListTile(
            leading: SizedBox(
                height: double.infinity, child: Icon(Icons.format_align_left)),
            title: Text("Date: 3rd Jan, 2020"),
            subtitle: Text("Bill: Rs. 850"),
            enabled: true,
            trailing: SizedBox(
              height: double.infinity,
              child: FlatButton(
                color: Color.fromRGBO(41, 93, 100, 1),
                child: Text(
                  "View",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  _showInvoicePopup(context);
                },
              ),
            ),
          ),
        ),
        Card(
          elevation: 3,
          child: ListTile(
            leading: SizedBox(
                height: double.infinity, child: Icon(Icons.format_align_left)),
            title: Text("Date: 3rd Jan, 2020"),
            subtitle: Text("Bill: Rs. 850"),
            enabled: true,
            trailing: SizedBox(
              height: double.infinity,
              child: FlatButton(
                color: Color.fromRGBO(41, 93, 100, 1),
                child: Text(
                  "View",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  _showInvoicePopup(context);
                },
              ),
            ),
          ),
        ),
        Card(
          elevation: 3,
          child: ListTile(
            leading: SizedBox(
                height: double.infinity, child: Icon(Icons.format_align_left)),
            title: Text("Date: 3rd Jan, 2020"),
            subtitle: Text("Bill: Rs. 850"),
            enabled: true,
            trailing: SizedBox(
              height: double.infinity,
              child: FlatButton(
                color: Color.fromRGBO(41, 93, 100, 1),
                child: Text(
                  "View",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  _showInvoicePopup(context);
                },
              ),
            ),
          ),
        ),
        Card(
          elevation: 3,
          child: ListTile(
            leading: SizedBox(
                height: double.infinity, child: Icon(Icons.format_align_left)),
            title: Text("Date: 3rd Jan, 2020"),
            subtitle: Text("Bill: Rs. 850"),
            enabled: true,
            trailing: SizedBox(
              height: double.infinity,
              child: FlatButton(
                color: Color.fromRGBO(41, 93, 100, 1),
                child: Text(
                  "View",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  _showInvoicePopup(context);
                },
              ),
            ),
          ),
        ),
        Card(
          elevation: 3,
          child: ListTile(
            leading: SizedBox(
                height: double.infinity, child: Icon(Icons.format_align_left)),
            title: Text("Date: 3rd Jan, 2020"),
            subtitle: Text("Bill: Rs. 850"),
            enabled: true,
            trailing: SizedBox(
              height: double.infinity,
              child: FlatButton(
                color: Color.fromRGBO(41, 93, 100, 1),
                child: Text(
                  "View",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  _showInvoicePopup(context);
                },
              ),
            ),
          ),
        ),
        Card(
          elevation: 3,
          child: ListTile(
            leading: SizedBox(
                height: double.infinity, child: Icon(Icons.format_align_left)),
            title: Text("Date: 3rd Jan, 2020"),
            subtitle: Text("Bill: Rs. 850"),
            enabled: true,
            trailing: SizedBox(
              height: double.infinity,
              child: FlatButton(
                color: Color.fromRGBO(41, 93, 100, 1),
                child: Text(
                  "View",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  _showInvoicePopup(context);
                },
              ),
            ),
          ),
        ),
      ],
    );
    title = ["Purchase History", "Quantity of Sales", "Customer Satisfaction"];
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
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Hero(
                  tag: "Purchase${widget.index}",
                  transitionOnUserGestures: true,
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        widget.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              centerTitle: true,
            ),
            bottom: PreferredSize(
              preferredSize: Size(0, 90),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  widget.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    textBaseline: TextBaseline.ideographic,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return listview;
                                });
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                Icons.folder_special,
                                size: 72,
                                color: Colors.amber,
                              ),
                              Text(
                                "Invoices",
                                style: TextStyle(
                                    color: Color.fromRGBO(3, 3, 3, 0.5),
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              mainSection.previousPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            },
                          ),
                          Text(
                            "${title[currentPage]}",
                            style: TextStyle(fontSize: 23),
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_forward_ios),
                            onPressed: () {
                              mainSection.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            },
                          ),
                        ],
                      ),
                      mainSection,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  MainSection() {
    Widget purchaseHistory = Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      border: TableBorder.all(),
      columnWidths: {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(5),
        2: FlexColumnWidth(5),
        3: FlexColumnWidth(5),
        4: FlexColumnWidth(5),
      },
      children: [
        TableRow(children: [
          TableCell(
              child: Text("Sl",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16))),
          TableCell(
              child: Text("Quantity",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16))),
          TableCell(
              child: Text("Unit Price",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16))),
          TableCell(
              child: Text("Total",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16))),
          TableCell(
              child: Text("Date",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16))),
        ]),
        TableRow(children: [
          TableCell(child: Text("1", textAlign: TextAlign.center)),
          TableCell(child: Text("2.5 KG", textAlign: TextAlign.center)),
          TableCell(child: Text("350", textAlign: TextAlign.center)),
          TableCell(child: Text("875", textAlign: TextAlign.center)),
          TableCell(child: Text("25th Dec, 2020", textAlign: TextAlign.center)),
        ]),
        TableRow(children: [
          TableCell(child: Text("2", textAlign: TextAlign.center)),
          TableCell(child: Text("2.5 KG", textAlign: TextAlign.center)),
          TableCell(child: Text("350", textAlign: TextAlign.center)),
          TableCell(child: Text("875", textAlign: TextAlign.center)),
          TableCell(child: Text("25th Dec, 2020", textAlign: TextAlign.center)),
        ]),
        TableRow(children: [
          TableCell(child: Text("3", textAlign: TextAlign.center)),
          TableCell(child: Text("2.5 KG", textAlign: TextAlign.center)),
          TableCell(child: Text("350", textAlign: TextAlign.center)),
          TableCell(child: Text("875", textAlign: TextAlign.center)),
          TableCell(child: Text("25th Dec, 2020", textAlign: TextAlign.center)),
        ]),
        TableRow(children: [
          TableCell(child: Text("4", textAlign: TextAlign.center)),
          TableCell(child: Text("2.5 KG", textAlign: TextAlign.center)),
          TableCell(child: Text("350", textAlign: TextAlign.center)),
          TableCell(child: Text("875", textAlign: TextAlign.center)),
          TableCell(child: Text("25th Dec, 2020", textAlign: TextAlign.center)),
        ]),
        TableRow(children: [
          TableCell(child: Text("5", textAlign: TextAlign.center)),
          TableCell(child: Text("2.5 KG", textAlign: TextAlign.center)),
          TableCell(child: Text("350", textAlign: TextAlign.center)),
          TableCell(child: Text("875", textAlign: TextAlign.center)),
          TableCell(child: Text("25th Dec, 2020", textAlign: TextAlign.center)),
        ])
      ],
    );
    Widget qos = Card(
      child: BarChart(
        BarChartData(
            gridData: FlGridData(show: true, drawVerticalLine: true),
            alignment: BarChartAlignment.spaceAround,
            maxY: 20,
            barTouchData: BarTouchData(
              enabled: false,
              touchTooltipData: BarTouchTooltipData(
                tooltipBgColor: Color.fromRGBO(163, 161, 251, 1),
                tooltipPadding: const EdgeInsets.all(2),
                tooltipBottomMargin: 8,
                getTooltipItem: (
                  BarChartGroupData group,
                  int groupIndex,
                  BarChartRodData rod,
                  int rodIndex,
                ) {
                  return BarTooltipItem(
                    rod.y.round().toString(),
                    TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: SideTitles(
                showTitles: true,
                textStyle: TextStyle(
                    color: const Color(0xff7589a2),
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
                margin: 20,
                getTitles: (double value) {
                  switch (value.toInt()) {
                    case 0:
                      return 'Mn';
                    case 1:
                      return 'Te';
                    case 2:
                      return 'Wd';
                    case 3:
                      return 'Tu';
                    case 4:
                      return 'Fr';
                    case 5:
                      return 'St';
                    case 6:
                      return 'Sn';
                    case 7:
                      return 'Sn';
                    default:
                      return '';
                  }
                },
              ),
              leftTitles: const SideTitles(
                showTitles: true,
                interval: 5,
              ),
            ),
            borderData: FlBorderData(
              show: false,
            ),
            barGroups: [
              BarChartGroupData(x: 0, barRods: [
                BarChartRodData(y: 8, color: Color.fromRGBO(163, 161, 251, 1))
              ], showingTooltipIndicators: [
                0
              ]),
              BarChartGroupData(x: 1, barRods: [
                BarChartRodData(y: 10, color: Color.fromRGBO(163, 161, 251, 1))
              ], showingTooltipIndicators: [
                0
              ]),
              BarChartGroupData(x: 2, barRods: [
                BarChartRodData(y: 14, color: Color.fromRGBO(163, 161, 251, 1))
              ], showingTooltipIndicators: [
                0
              ]),
              BarChartGroupData(x: 3, barRods: [
                BarChartRodData(y: 15, color: Color.fromRGBO(163, 161, 251, 1))
              ], showingTooltipIndicators: [
                0
              ]),
              BarChartGroupData(x: 3, barRods: [
                BarChartRodData(y: 13, color: Color.fromRGBO(163, 161, 251, 1))
              ], showingTooltipIndicators: [
                0
              ]),
              BarChartGroupData(x: 3, barRods: [
                BarChartRodData(y: 10, color: Color.fromRGBO(163, 161, 251, 1))
              ], showingTooltipIndicators: [
                0
              ]),
            ]),
      ),
    );
    List<Widget> list = [
      Container(alignment: Alignment.center, child: purchaseHistory),
      Container(child: qos),
      Container(child: qos),
    ];
    return CarouselSlider(
      initialPage: 0,
      height: 400,
      aspectRatio: 16 / 9,
      enableInfiniteScroll: false,
      enlargeCenterPage: true,
      onPageChanged: (i) {
        setState(() {
          currentPage = i;
        });
      },
      items: list.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: i,
            );
          },
        );
      }).toList(),
    );
  }
}
