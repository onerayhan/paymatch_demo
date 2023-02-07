import 'package:paymatch_demo/utils/color.dart';
import 'package:paymatch_demo/utils/dimension.dart';
import 'package:paymatch_demo/utils/styles.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>{
  late String mail;
  late String pass;
  late int attemptCount;
  final _formkey = GlobalKey<FormState>();

  Future<void> showAlertDialog(String title, String message) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(message),
                ],
              ),
            ),
            actions: [
              TextButton(onPressed: () {
                Navigator.of(context).pop();
              }, child: Text("OK"))
            ],
          );
        }
    );
  }
  void getData() async {
    String name = await Future.delayed(Duration(seconds: 3), () {
      return "Ayhan";
    });
    String uni = await Future.delayed(Duration(seconds: 1), () {
      return "Sabanci";
    });
    print("$name : $uni");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState called");
    attemptCount = 0;
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text(
        'LOGIN',
        style: kAppBarTitleTextStyle,
      ),
      backgroundColor: lightColorScheme.primary,
      centerTitle: true,
      elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(Dimen.parentMargin),
        child: Column(
          children: [
            Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          decoration: InputDecoration(
                            //fillColor: lightColorScheme.primary,
                            //filled: true,
                            hintText: "Email",
                            labelStyle: kLabelLightTextStyle,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(7.0)),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty){
                              return "Please enter your E-mail";
                            }
                            if(!EmailValidator.validate(value)){
                              return "The E-mail address is not valid";
                            }
                            return null;
                          },
                          onSaved: (String? value) {
                            mail = value as String;
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16.0,),

                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          decoration: InputDecoration(
                            //fillColor: lightColorScheme.primary,
                            //filled: true,
                            hintText: "Password",
                            labelStyle: kLabelLightTextStyle,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(7.0)),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          enableSuggestions: false,
                          autocorrect: false,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty){
                              return "Please enter your password";
                            }
                            if(value.length < 8){
                              return "The password is not valid";
                            }
                            return null;
                          },
                          onSaved: (String? value) {
                            pass = value as String;
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16.0,),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: OutlinedButton(
                          onPressed: () {
                            if(_formkey.currentState!.validate()){
                              _formkey.currentState!.save();

                              setState(() {
                                attemptCount += 1;
                              });
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content: Text('Logging in')));
                              Navigator.pushNamed(context, "/");
                            }
                            else{
                              showAlertDialog("error", "invalid pass or email");
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Text(
                              'Login Attempt: $attemptCount',
                              style: kButtonLightTextStyle,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: lightColorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
