import 'dart:io';

import 'package:aquahub/showinvoice.dart';
import 'package:aquahub/transitions.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ItemInvoices extends StatefulWidget {
  final String name;
  final String image;
  final int index;
  ItemInvoices(this.name, this.image, this.index);
  @override
  _ItemInvoicesState createState() => _ItemInvoicesState();
}

class _ItemInvoicesState extends State<ItemInvoices> {
  String searchedTerm;
  String dropdownvalue;
  TextEditingController searchController = new TextEditingController();
  File file;
  void _choose() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    // var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      file = image;
    });
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
                  child: Text("SAVE",style:TextStyle(color:Colors.white)),
                  onPressed: () {
                    Navigator.pop(context);
                  },color: Theme.of(context).primaryColor,
                ),
              ),
              Container(
                child: RaisedButton(
                  child: Text("CANCEL",style:TextStyle(color:Colors.white)),
                  onPressed: () {
                    Navigator.pop(context);
                  },color: Theme.of(context).primaryColor,
                ),
              ),
            ],
            title: Text(
              "Add Invoice",
              textAlign: TextAlign.center,
            ),
            titleTextStyle: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w800,
              color: Color.fromRGBO(41, 93, 100, 1),
            ),
            titlePadding: EdgeInsets.symmetric(vertical: 15),
            content: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width - 10,
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Invoice title'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Item'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Quantity'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Product'),
                    ),
                    SizedBox(height: 15),
                    OutlineButton(
                      child: Text(
                        "Add",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      onPressed: () {},
                      color: Theme.of(context).primaryColor,
                    ),
                    Table(
                      columnWidths: {
                        0: FlexColumnWidth(3),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(2),
                      },
                      children: [
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
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Add Taxes",
                      style: defaultstyle.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Tax Name'),
                            )),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Amt'),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    OutlineButton(
                      child: Text(
                        "Add More",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      onPressed: () {},
                      color: Theme.of(context).primaryColor,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Buyer Name'),
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Buyer Contact Number'),
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Customer name'),
                    ),

                    // DropdownButton<String>(
                    //   hint: Text("Select customer from list"),
                    //   items: [
                    //     DropdownMenuItem<String>(
                    //       value: "Saswath",
                    //       child: Text("Saswath"),
                    //     ),
                    //     DropdownMenuItem<String>(
                    //       value: "Piyush",
                    //       child: Text("Piyush"),
                    //     ),
                    //     DropdownMenuItem<String>(
                    //       value: "Jyoti",
                    //       child: Text("Jyoti"),
                    //     ),
                    //     DropdownMenuItem<String>(
                    //       value: "AJ Loren",
                    //       child: Text("AJ Loren"),
                    //     ),
                    //   ],
                    //   onChanged: (value) {
                    //     setState(() {
                    //       dropdownvalue = value;
                    //     });
                    //   },
                    //   value: dropdownvalue,
                    //   elevation: 2,
                    //   style: TextStyle(color: Colors.black, fontSize: 18),
                    //   isDense: true,
                    //   iconSize: 40.0,
                    // ),
                    OutlineButton(
                      child: Text(
                        file==null?"Add File":"Change file",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      onPressed: () {
                        _choose();
                      },
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropdownvalue = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        splashColor: Colors.black12,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        onPressed: () {
          _showInvoicePopup(context);
        },
      ),
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
            bottom: PreferredSize(
                preferredSize: Size(0, 80),
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: searchController,
                    autocorrect: false,
                    textInputAction: TextInputAction.search,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black38,
                        fontFamily: 'raleway',
                      ),
                      alignLabelWithHint: true,
                      hasFloatingPlaceholder: true,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        enableFeedback: true,
                        onPressed: () {
                          // TODO:searchfeature
                          if (searchController.value != null) {
                            setState(() {
                              searchedTerm =
                                  searchController.value.text.toString();
                            });
                          }
                        },
                      ),
                    ),
                    //TODO:try with onchanged
                    onSubmitted: (value) {
                      if (searchController.value != null) {
                        setState(() {
                          searchedTerm = searchController.value.text.toString();
                        });
                      }
                    },
                  ),
                )),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 15,
                ),
                Text(
                  "${widget.name}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: 15,
                ),
                listofinvoices(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  listofinvoices() {
    return Column(
      children: <Widget>[
        Card(
            elevation: 3,
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    EnterExitRoute(exitPage: widget, enterPage: ShowInvoice()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Invoice #1",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 23)),
                        Text("Shrimp, Crab, Fish",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Colors.black.withOpacity(0.5))),
                        Text("Payment Mode: Cash",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text("12th Aug, 2019",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Colors.black.withOpacity(0.5))),
                        Text("Rs. 7.3K",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            )),
        Card(
            elevation: 3,
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Invoice #2",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 23)),
                        Text("Shrimp, Crab, Fish",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Colors.black.withOpacity(0.5))),
                        Text("Payment Mode: Cash",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text("12th Aug, 2019",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Colors.black.withOpacity(0.5))),
                        Text("Rs. 7.3K",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            )),
        Card(
            elevation: 3,
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Invoice #3",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 23)),
                        Text("Shrimp, Crab, Fish",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Colors.black.withOpacity(0.5))),
                        Text("Payment Mode: Cash",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text("12th Aug, 2019",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Colors.black.withOpacity(0.5))),
                        Text("Rs. 7.3K",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            )),
        Card(
            elevation: 3,
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Invoice #4",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 23)),
                        Text("Shrimp, Crab, Fish",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Colors.black.withOpacity(0.5))),
                        Text("Payment Mode: Cash",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text("12th Aug, 2019",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Colors.black.withOpacity(0.5))),
                        Text("Rs. 7.3K",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            )),
        Card(
            elevation: 3,
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Invoice #5",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 23)),
                        Text("Shrimp, Crab, Fish",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Colors.black.withOpacity(0.5))),
                        Text("Payment Mode: Cash",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text("12th Aug, 2019",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Colors.black.withOpacity(0.5))),
                        Text("Rs. 7.3K",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
