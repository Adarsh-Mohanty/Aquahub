import 'package:aquahub/VendorItemDetail.dart';
import 'package:aquahub/services/api.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:transparent_image/transparent_image.dart';

class Vendor extends StatefulWidget {
  @override
  _VendorState createState() => _VendorState();
}

class _VendorState extends State<Vendor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController searchController = new TextEditingController();
  String searchedTerm;
  Future<List<Purchase>> PurchaseData;
  Future<List<Purchase>> newPurchaseData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchedTerm = "";

    print("initiate");
  }

  @override
  Widget build(BuildContext context) {
    // if (searchedTerm.length != 0) {
    //   print(PurchaseData);
    //   PurchaseData = search(PurchaseData);
    // }
    print("$searchedTerm - here");
    return FutureBuilder(
      future: getPurchaseData(),
      builder: (context, snapshot) {
        return CustomScrollView(
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
                            searchedTerm =
                                searchController.value.text.toString();
                          });
                        }
                      },
                    ),
                  )),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'My Products',
                      style: TextStyle(
                          color: Color.fromRGBO(40, 40, 40, 1), fontSize: 28),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20,
              ),
              sliver: snapshot.data != null
                  ? gridViewWidget(snapshot.data)
                  : SliverToBoxAdapter(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Theme.of(context).primaryColor),
                            )
                          ],
                        ),
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }

  Widget gridViewWidget(List<Purchase> Purchase) {
    return SliverGrid(
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 1 / 1.6),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          // String Offering = "";
          // for (Map<String, dynamic> item in Purchase[index].purchasehistory) {
          //   Offering = Offering + ", ${item["itemCategory"]}";
          // }
          // Offering = Offering.substring(1);
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VendorItemDetail(
                          Purchase[index].name, Purchase[index].image, index)));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 6,
                      offset: Offset(0, 3),
                      color: Color.fromRGBO(0, 0, 0, 0.16))
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              key: Key('cardKey'),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Hero(
                      tag: 'Purchase$index',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: Purchase[index].image,
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: Purchase[index].name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontFamily: 'raleway',
                          ),
                        ),
                        TextSpan(
                          text: "\nPrice- 350/KG",
                          style: TextStyle(
                            color: Color.fromRGBO(3, 3, 3, 0.5),
                            fontSize: 16,
                            fontFamily: 'raleway',
                          ),
                        ),
                        TextSpan(
                          text: "\nTotal Purchases: 191",
                          style: TextStyle(
                            color: Color.fromRGBO(3, 3, 3, 1),
                            fontSize: 16,
                            fontFamily: 'raleway',
                          ),
                        ),
                        TextSpan(
                          text: "\nTotal Revenue: 91.6K",
                          style: TextStyle(
                            color: Color.fromRGBO(3, 3, 3, 1),
                            fontSize: 16,
                            fontFamily: 'raleway',
                          ),
                        ),
                      ],
                    ),
                  ),
                  IgnorePointer(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Color.fromRGBO(41, 204, 226, 01),
                      child: Text(
                        "View More",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          );
        },
        childCount: Purchase.length,
      ),
    );
  }

// This method is stored as a backup.
  // Image fetch_image(List<Purchase> Purchase, int index) {
  //   return Image.network(
  //     Purchase[index].image,
  //     alignment: Alignment.center,
  //     fit: BoxFit.cover,
  //     gaplessPlayback: true,
  //     loadingBuilder: (BuildContext context, Widget child,
  //         ImageChunkEvent loadingProgress) {
  //       if (loadingProgress == null) return child;
  //       return Center(
  //         child: CircularProgressIndicator(
  //           value: loadingProgress.expectedTotalBytes != null
  //               ? loadingProgress.cumulativeBytesLoaded /
  //                   loadingProgress.expectedTotalBytes
  //               : null,
  //         ),
  //       );
  //     },
  //   );
  // }

  Future<List<Purchase>> getPurchaseData() async {
    var dio = Dio();
    List<Purchase> list;
    String link = "http://www.mocky.io/v2/5e19d70b3100003a0084b57c";
    var res = await dio.get(Uri.encodeFull(link));
    print(" Api code - ${res.statusCode} ");
    if (res.statusCode == 200) {
      var data = res.data;
      var rest = data["data"] as List;
      // print(rest);
      list = rest.map<Purchase>((json) => Purchase.fromJson(json)).toList();
    }
    // print("List Size: ${list.length}");
    return list;
  }
}
