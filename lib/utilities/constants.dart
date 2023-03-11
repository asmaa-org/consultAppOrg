import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../apis/api.dart';
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
