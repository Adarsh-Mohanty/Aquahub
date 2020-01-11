import 'package:aquahub/customer.dart';
import 'package:aquahub/login.dart';
import 'package:aquahub/presentation/aqua_hub_icons.dart';
import 'package:aquahub/vendor.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Color.fromRGBO(41, 204, 226, 1),
          backgroundColor: Colors.white,
          fontFamily: 'raleway',
          textSelectionHandleColor: Color.fromRGBO(84, 216, 234, 1)),
      home: SplashScreen.navigate(
        name: 'assets/intro.flr',
        backgroundColor: Colors.white,
        fit: BoxFit.fitWidth,
        alignment: Alignment.center,
        next: (BuildContext context) {
          return HomePage();
        },
        until: () {
          return Future.delayed(Duration(milliseconds: 1300));
        },
        // isLoading: !loadingdone,
        startAnimation: '1',
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(40),
                  child: Image.asset(
                    'assets/images/logofull.png',
                    fit: BoxFit.contain,
                  ),
                ),
                // Image.asset(
                //   'assets/images/logo.svg',
                //   fit: BoxFit.fill,
                // ),

                RoleSelectionCard(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RoleSelectionCard extends StatelessWidget {
  const RoleSelectionCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.width * 0.4,
                    width: MediaQuery.of(context).size.width * 0.4,
                    padding: EdgeInsets.symmetric(vertical: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            blurRadius: 6,
                            offset: Offset(0, 0))
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.black12,
                        onTap: () {
                          checkSignIn(context, "vendor");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Login('vendor')));
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            // Image.asset('name'),

                            Expanded(
                              child: Icon(
                                AquaHub.shop,
                                color: Colors.white,
                                size: MediaQuery.of(context).size.width * 0.4 -
                                    90,
                              ),
                              // SvgPicture.asset(
                              //   'assets/images/vendor.svg',
                              //   fit: BoxFit.contain,
                              //   color: Colors.white,
                              //   width:
                              //       MediaQuery.of(context).size.width * 0.4 - 90,
                              // ),

                              // child: Image.asset(

                              //   'assets/images/vendor.png',

                              //   fit: BoxFit.fill

                              // ),
                            ),

                            Text(
                              'Vendor',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width * 0.4,
                    width: MediaQuery.of(context).size.width * 0.4,
                    padding: EdgeInsets.symmetric(vertical: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            blurRadius: 6,
                            offset: Offset(0, 0))
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.black12,
                        onTap: () {
                          checkSignIn(context, "customer");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Login('customer')));
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            // Image.asset('name'),

                            Expanded(
                              child: Icon(
                                AquaHub.buyer,
                                color: Theme.of(context).primaryColor,
                                size: MediaQuery.of(context).size.width * 0.4 -
                                    90,
                              ),
                              // SvgPicture.asset(
                              //   'assets/images/buyer.svg',
                              //   fit: BoxFit.contain,
                              //   width:
                              //       MediaQuery.of(context).size.width * 0.4 - 90,
                              // ),
                            ),

                            Text(
                              'Customer',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                width: 69,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.16),
                        blurRadius: 6,
                        offset: Offset(0, 3))
                  ],
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  "OR",
                  style: TextStyle(
                    fontSize: 22,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void checkSignIn(context, String role) async {
    var pref = await SharedPreferences.getInstance();
    var token = role == 'vendor'
        ? pref.getString('vendor_token')
        : pref.getString('cust_token');
    if (token != null) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return role == 'vendor' ? Vendor() : Customer();
      }));
    }
  }
}
