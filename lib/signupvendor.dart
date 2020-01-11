import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SignUpVendor extends StatefulWidget {
  @override
  _SignUpVendorState createState() => _SignUpVendorState();
}

class _SignUpVendorState extends State<SignUpVendor> {
  List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  int _counter = 1;
  int currentStep = 0;
  bool complete = false;
  List<Step> steps;
  String _email;
  String _name;
  String _password;
  String _confirm_password;
  bool _autoValidate = false;
  next() {
    if (_validateInputs(currentStep)) {
      currentStep + 1 != steps.length
          ? goTo(currentStep + 1)
          : setState(() => complete = true);
    }
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  String validateEmail(val) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(val))
      return 'Enter Valid Email';
    else
      return null;
  }

  String validateName(val) {
    if (val.length < 3)
      return "Name must be more than 2 charater";
    else
      return null;
  }

  String validatePassword(val) {
    if (val.length < 5)
      return "Password must be more than 4 charater";
    else {
      _password = val;
      return null;
    }
  }

  String validateConfirmPassword(val) {
    if (val != _password)
      return "Passwords do not match";
    else
      return null;
  }

  bool _validateInputs(int i) {
    if (_formKeys[i].currentState.validate()) {
//    If all data are correct then save data to out variables
      _formKeys[i].currentState.save();
      return true;
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    steps = [
      Step(
        title: const Text('New Account'),
        isActive: currentStep == 0,
        state: StepState.indexed,
        content: Form(
          key: _formKeys[0],
          child: Column(
            children: <Widget>[
              TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'Store Name'),
                  validator: validateName,
                  onSaved: (val) {
                    _name = val;
                  },
                  autovalidate: _autoValidate),
              TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'Email Address'),
                  validator: validateEmail,
                  onSaved: (val) {
                    _email = val;
                  },
                  autovalidate: _autoValidate),
              TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  validator: validatePassword,
                  onSaved: (val) {
                    _password = val;
                  },
                  autovalidate: _autoValidate),
              TextFormField(
                  decoration: InputDecoration(labelText: 'Confirm Password'),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  validator: validateConfirmPassword,
                  onSaved: (val) {
                    _confirm_password = val;
                  },
                  autovalidate: _autoValidate),
            ],
          ),
        ),
      ),
      Step(
        isActive: currentStep == 1,
        state: StepState.indexed,
        title: const Text('Ponds detail'),
        content: Form(
          key: _formKeys[1],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "How many ponds do you have?",
                style: TextStyle(fontSize: 16),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    OutlineButton(
                      shape: CircleBorder(),
                      child: Icon(Icons.remove),
                      highlightedBorderColor: Colors.grey,
                      onPressed: _counter > 1
                          ? () {
                              setState(() {
                                if (_counter > 1) _counter--;
                              });
                            }
                          : null,
                    ),
                    Text(
                      "$_counter",
                      style: TextStyle(fontSize: 17),
                    ),
                    OutlineButton(
                      shape: CircleBorder(),
                      child: Icon(Icons.add),
                      highlightedBorderColor: Colors.grey,
                      onPressed: () {
                        setState(() {
                          _counter++;
                        });
                      },
                    ),
                  ],
                ),
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: _counter,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            initialValue: "Pond ${index+1}",
                            decoration:
                                InputDecoration(labelText: "Pond Name"),
                          ),
                          TextFormField(  
                            decoration:
                                InputDecoration(labelText: "Pond Size (in m²)"),
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text('Create an account'),
        ),
        body: Column(children: <Widget>[
          Expanded(
            child: Stepper(
              steps: steps,
              currentStep: currentStep,
              onStepContinue: next,
              onStepTapped: null,
              onStepCancel: cancel,
            ),
          ),
        ]));
  }
}
