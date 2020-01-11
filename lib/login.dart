import 'dart:async';
import 'package:aquahub/customer.dart';
import 'package:aquahub/signupvendor.dart';
import 'package:aquahub/vendor.dart';
import 'package:connectivity/connectivity.dart';
import 'package:aquahub/presentation/aqua_hub_icons.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  final String role;
  Login(this.role);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;
  bool _loginError = false;
  bool _connected = true;
  final Connectivity _connectivity = Connectivity();
  final Dio dio = Dio();
  SharedPreferences pref;
  final TextEditingController username_controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();
  StreamSubscription<ConnectivityResult> _subscription;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    initConnectivity();

    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 3000;

    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // Got a new connectivity status!
      print(result);
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        setState(() {
          _connected = true;
        });
      } else {
        setState(() {
          _connected = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on Exception catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        setState(() {
          _connected = true;
        });
        break;
      default:
        setState(() {
          _connected = false;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark));
    var dest = widget.role == 'vendor' ? Vendor() : Customer();
    var token = widget.role == 'vendor' ? 'vendor_token' : 'cust_token';
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
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
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Image.asset(
                  //   'assets/images/logo.svg',
                  //   fit: BoxFit.fill,
                  // ),
                  _isLoading
                      ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).primaryColor),
                        )
                      : LoginCard(dest, token),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  LoginCard(dest, token) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(40),
                child: Image.asset(
                  'assets/images/logofull.png',
                  fit: BoxFit.contain,
                ),
              ),
              TextFormField(
                controller: username_controller,
                validator: _validateUsername,
                cursorColor: Theme.of(context).primaryColor,
                enableSuggestions: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hasFloatingPlaceholder: true,
                  labelText: "Username",
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(112, 112, 112, 0.5),
                    fontFamily: 'raleway'
                  ),
                  alignLabelWithHint: true,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: password_controller,
                validator: _validatePassword,
                obscureText: true,
                cursorColor: Theme.of(context).primaryColor,
                enableSuggestions: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hasFloatingPlaceholder: true,
                  labelText: "Password",
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(112, 112, 112, 0.5),
                    fontFamily: 'raleway'
                  ),
                  alignLabelWithHint: true,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              FlatButton(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "LOGIN",
                        style: TextStyle(
                            fontFamily: 'raleway',
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                color: Theme.of(context).primaryColor,
                onPressed: _connected
                    ? () async {
                        String username = username_controller.text;
                        String password = password_controller.text;
                        if (!_formKey.currentState.validate()) return;
                        var data = {'username': username, 'password': password};
                        //TODO:loginapi here
                        var loginRes = await dio.get(
                            'http://www.mocky.io/v2/5e0c9e1e2f000058002831c7',
                            queryParameters: data);

                        setState(() {
                          //TODO: make http request to login and set vars accordingly
                          _isLoading = true;
                          // _loginError = true;
                        });
                        if (loginRes.data['token'].isNotEmpty &&
                            loginRes.data['token'] != null) {
                          pref = await SharedPreferences.getInstance();
                          pref.clear();
                          pref.setString(token, loginRes.data['token']);
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return dest;
                          }));
                        } else {
                          setState(() {
                            _isLoading = false;
                            _loginError = true;
                          });
                        }
                      }
                    : null,
                disabledColor: Colors.grey.withOpacity(0.6),
              ),
              _loginError
                  ? Text(
                      "Login error. Check username and password",
                      style: TextStyle(fontSize: 14, color: Colors.redAccent),
                      textAlign: TextAlign.center,
                    )
                  : Container(),
              !_connected
                  ? Text(
                      "You are currently offline. Check your internet connection.",
                      style: TextStyle(fontSize: 14, color: Colors.redAccent),
                      textAlign: TextAlign.center,
                    )
                  : Container(),
              SizedBox(
                height: 10,
              ),
              RichText(
                text: new TextSpan(
                  style: TextStyle(fontFamily: 'raleway'),
                  children: [
                    new TextSpan(
                      text: 'New to Aquahub? ',
                      style: new TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    new TextSpan(
                      text: 'Register',
                      style: new TextStyle(color: Colors.blue, fontSize: 15),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (context) {
                                  return SignUpVendor();
                                },
                              ));
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _validateUsername(String value) {
    if (value.isEmpty) {
      return 'Please enter valid username.';
    }
    return null;
  }

  String _validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter valid password.';
    }
    return null;
  }
}
