import 'dart:io';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:doortodata/constants.dart';
import '../../constants.dart';
import '../../constants.dart';
import '../../constants.dart';
import '../../utils/api-response.dart';
import '../../utils/api_endpoints.dart';
import '../../utils/api_helper.dart';
import '../../utils/http_exception.dart';

class MyProfile extends StatefulWidget {
  // static const routeName = '/ContactUs';

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstnameCtl = TextEditingController();
  final TextEditingController lastnameCtl = TextEditingController();
  final TextEditingController emailCtl = TextEditingController();
  final TextEditingController mobileCtl = TextEditingController();


  Future<ApiResponse> _response;

  @override
  void initState() {
    // profile = EmployeeProfile();

    _fetchData();
    super.initState();
  }

  _fetchData() async {
    setState(() {
      _isLoading = true;
    });
    try {
      ApiResponse response;
      response =await ApiHelper().getRequest(
        endpoint: eUser,
      );
      print(response.errorMessage);
      final Map<String, dynamic> profile = response.data;
      print(profile);
      setState(() {
        firstnameCtl.text = profile['first_name'];
        lastnameCtl.text = profile['last_name'];
        emailCtl.text = profile['email'];
        mobileCtl.text = profile['mobile'];

      });
    } on HttpException catch (error) {
      Flushbar(
        message: '${error.toString()}',
        duration: Duration(seconds: 3),
      )..show(context);
    } catch (error) {
      print(error);
      Flushbar(
        message: 'Failed to load profile.',
        duration: Duration(seconds: 3),
      )..show(context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _saveForm() async {
    final isValid = _formKey.currentState.validate();
    if (!isValid) return;
    _formKey.currentState.save();

    setState(() {
      _isLoading = true;
    });

    Map<String, dynamic> data = {
      'first_name': firstnameCtl.text,
      'last_name': lastnameCtl.text,
      'email': emailCtl.text,
      'mobile': mobileCtl.text,
    };

    try {
      final ApiResponse response = await ApiHelper().patchRequest(
        '$eUser',
        data,
      );
      if (!response.error) {
        Flushbar(
          message: 'Updated successfully!',
          duration: Duration(seconds: 3),
        )..show(context);

      } else {
        Flushbar(
          message: response.errorMessage ?? 'Unable to Update',
          duration: Duration(seconds: 3),
        )..show(context);
      }
    } on HttpException catch (error) {
      throw HttpException(message: error.toString());
    } catch (error) {
      Flushbar(
        message: 'Unable to Update',
        duration: Duration(seconds: 3),
      )..show(context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = DeviceSize(context: context);

    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: DoorToDataAppTheme.nearlyDarkBlue,
        title: Text('Account'),
      ),
      // bottomNavigationBar: bottom_bar(3),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    child: Center(
                  child: Text(
                    "Door To Data",
                    style: TextStyle(
                      color: DoorToDataAppTheme.nearlyDarkBlue,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
                Container(
                    child: Center(
                  child: Text(
                    "Your data is safe with us!",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: firstnameCtl,
                  keyboardType: TextInputType.text,
                  style: TextStyle(height: 1.0),
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  ),
                  validator: (value) {
                    if (value.isEmpty) return 'First Name can\'t be empty';
                    return null;
                  },
                ),
                SizedBox(
                  height: 18.0,
                ),
                TextFormField(
                  controller: lastnameCtl,
                  keyboardType: TextInputType.text,
                  style: TextStyle(height: 1.0),
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  ),
                  validator: (value) {
                    if (value.isEmpty) return 'Last Name can\'t be empty';
                    return null;
                  },
                ),
                SizedBox(
                  height: 18.0,
                ),
                TextFormField(
                  controller: mobileCtl,
                  keyboardType: TextInputType.number,
                  style: TextStyle(height: 1.0),
                  decoration: InputDecoration(
                    labelText: 'Mobile',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  ),
                  validator: (value) {
                    if (value.length != 10) return 'Mobile Number should be exactly 10 digits.';
                    return null;
                  },
                ),
                SizedBox(
                  height: 18.0,
                ),
                TextFormField(
                  controller: emailCtl,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(height: 1.0),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  ),
                  validator: (value) {
                    if (value.isEmpty) return 'Email can\'t be empty';
                    return null;
                  },
                ),
                SizedBox(
                  height: 18.0,
                ),

                SizedBox(
                  height: 10.0,
                ),
                (_isLoading)
                    ? SpinKitThreeBounce(
                        color: Theme.of(context).primaryColor,
                      )
                    : MaterialButton(
                        height: 30,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)),
                        color: DoorToDataAppTheme.nearlyDarkBlue,
                        textColor: Colors.white,
                        onPressed: () async {
                          _saveForm();
                        },
                        child: Text('Update'),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
