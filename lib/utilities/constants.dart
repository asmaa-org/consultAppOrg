import 'package:flutter/material.dart';

import '../services/user_services.dart';

BoxDecoration colorBoxDecoration =
    BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10));

//errors
const serverError = 'Server Error';
const unauthorized = 'unauthorized';
const somethingWentWrong = 'Something Error';

//token
UserServices userServices = UserServices();
Future<String?> token = userServices.getToken();
