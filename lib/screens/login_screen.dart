import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pal_moh_app/screens/home_screen.dart';
import 'package:http/http.dart' as http;
import '../apis/ApiResponse.dart';
import '../apis/api.dart';
import '../models/User.dart';
import '../utills/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const id = 'LoginScreen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  // Future<ApiResponse>register({required String email, required String password, required String confirmPassword,required String name}) async {
  //   // var body = jsonEncode({
  //   //   'email': email,
  //   //   'password': password,
  //   //   'password_confirmation': confirmPassword,
  //   //   'name':name
  //   // });
  //   ApiResponse apiResponse = ApiResponse();
  //   try {
  //     var body = {
  //       'email': email,
  //       'password': password,
  //       'password_confirmation': confirmPassword,
  //       'name': name
  //     };
  //     print(body);
  //     // var url = Uri.http('localhost:8000','/register');
  //     // var url = Uri.http(registerApi);
  //     var url = Uri.parse(registerApi);
  //
  //     http.Response response = await http.post(
  //         url, body: body, headers: {'Accept': 'application/json',});
  //     var result = jsonDecode(response.body)['user'];
  //   }
  //   catch(e){
  //
  //   }
  //
  // }
  Future<ApiResponse> register({required String email, required String password, required String confirmPassword,required String name}) async{
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await http.post(
          Uri.parse(registerApi),
          headers: {'Accept': 'application/json',},
          body: {'name': name,email: email,'password': password,'password_confirmation': password,}
          );
          print (response.statusCode);
          print (response.body);
          switch (response.statusCode) {
            case 200:
               apiResponse.data = User.fromJson(jsonDecode (response.body));
               break;
            case 422:
               var errors = jsonDecode(response.body) ['errors'];
               apiResponse.error = errors [errors.keys.elementAt(0)][0];
               break;
            case 403:
               apiResponse.error = jsonDecode (response.body) ['message'];
               break;
            default:
               apiResponse.error = somethingWentWrong;
          }
    }
    catch(e){
      print(e.toString());
      apiResponse.error = serverError;
    }
    return apiResponse;
  }
  Future<ApiResponse> login(String email,password) async{
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await http.post(
        Uri.parse(loginApi),
        headers: {'Accept': 'application/json',},
        body: {'email': email, 'password': password},);
      print(response.body);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = User.fromJson(jsonDecode(response.body));
          break;
        case 422:
          {
            final errors = jsonDecode(response.body) ['errors'];
            apiResponse.error = errors [errors.keys.elementAt(0)][0];
          }
          break;
        case 403:
          apiResponse.error = jsonDecode(response.body) ['message'];
          break;
        default:
          apiResponse.error = somethingWentWrong;
          break;
      }
    }
    catch(e){
      print('user services: ${e.toString()}');
      apiResponse.error = serverError;
    }
    return apiResponse;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, child) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Color(0xffE0EAF9),
              body: Stack(
                children: [
                  Container(
                    width: 473.w,
                    height: 359.h,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF6589FF),
                          Color(0xFF003AFC),
                        ],
                        begin: AlignmentDirectional.centerStart,
                        end: AlignmentDirectional.centerEnd,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100.r),
                        bottomRight: Radius.circular(130.r),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 37.h,
                      ),
                      Center(
                        child: Text(
                          'ديوان رئيس الوزراء',
                          style: TextStyle(
                            fontSize: 22.sp,
                            color: Colors.white,
                            fontFamily: 'Sana',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 19.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(59.r),
                          ),
                        ),
                        height: 700.h,
                        width: 367.w,
                        child: Padding(
                          padding: EdgeInsets.only(top: 66.h),
                          child: Column(
                            children: [
                              Container(
                                height: 35.h,
                                width: 265.w,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                  border: Border.all(
                                    color: const Color(0xFFEAEAF5),
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    22.r,
                                  ),
                                ),
                                child: TabBar(
                                  labelStyle: GoogleFonts.poppins(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  unselectedLabelStyle: GoogleFonts.poppins(
                                    fontSize: 14.sp,
                                  ),
                                  controller: _tabController,
                                  indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      22.r,
                                    ),
                                    color: const Color(0xFF003AFC),
                                  ),
                                  labelColor: Colors.white,
                                  unselectedLabelColor: const Color(0xFF003AFC),
                                  tabs: const [
                                    Tab(
                                      text: 'Login',
                                    ),
                                    Tab(
                                      text: 'Sign Up',
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 45.h,
                              ),
                              Expanded(
                                child: TabBarView(
                                  controller: _tabController,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 22.h,
                                        ),
                                        MyTextField(
                                          obscureText: false,
                                          keyboardType: TextInputType.emailAddress,
                                          controller: emailController,
                                          field: 'Enter email or Name',
                                        ),
                                        SizedBox(
                                          height: 22.h,
                                        ),
                                        MyTextField(
                                          obscureText: true,
                                          keyboardType: TextInputType.visiblePassword,
                                          controller: passwordController,
                                          field: 'Password',
                                        ),
                                        SizedBox(
                                          height: 62.h,
                                        ),
                                        MyButton(
                                          text: 'Login',
                                          fun: () {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyHomeScreen()),
                                            );
                                          },
                                        ),
                                        Links(),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        MyTextField(
                                          obscureText: false,
                                          keyboardType: TextInputType.name,
                                          controller: nameController,
                                          field: 'Enter Name',
                                        ),
                                        SizedBox(
                                          height: 22.h,
                                        ),
                                        MyTextField(
                                          obscureText: false,
                                          keyboardType: TextInputType.emailAddress,
                                          controller: emailController,
                                          field: 'Enter email or Name',
                                        ),
                                        SizedBox(
                                          height: 22.h,
                                        ),
                                        MyTextField(
                                          obscureText: true,
                                          keyboardType: TextInputType.visiblePassword,
                                          controller: passwordController,
                                          field: 'Password',
                                        ),
                                        SizedBox(
                                          height: 22.h,
                                        ),
                                        MyTextField(
                                          obscureText: true,
                                          keyboardType: TextInputType.visiblePassword,
                                          controller: confirmPasswordController,
                                          field: 'Confirm password',
                                        ),
                                        SizedBox(
                                          height: 62.h,
                                        ),
                                        MyButton(
                                          text: 'Sign up',
                                            fun:() async {
                                              // await reg();
                                              await register(email: emailController.text,
                                                  password: passwordController.text,
                                                  confirmPassword: confirmPasswordController.text,
                                                  name: nameController.text);
                                              Navigator.pushNamed(context, MyHomeScreen.id);
                                          }
                                        ),
                                        Links(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  // Future<void> reg()async {
  //
  //   bool statues = await register(email: emailController.text, password: passwordController.text, confirmPassword: confirmPasswordController.text,
  //       name: nameController.text);
  //   print(statues);
  //      if(statues==true){
  //
  //        Navigator.pushNamed(context, MyHomeScreen.id);
  //      }
  //      else{
  //        print('there is an error');
  //      }
  // }
}



class MyButton extends StatelessWidget {
  final String text;
  final Function() fun;
  const MyButton({
    super.key,
    required this.text,
    required this.fun,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 264.w,
      height: 48.h,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF6589FF),
            Color(0xFF003AFC),
          ],
          begin: Alignment.centerLeft,
          end: FractionalOffset.centerRight,
        ),
        borderRadius: BorderRadius.circular(22.r),
      ),
      child: TextButton(
        onPressed: fun,
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final String field;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  const MyTextField({
    super.key,
    required this.field, required this.controller, required this.keyboardType, required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType ,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: field,
        hintStyle: GoogleFonts.poppins(
          fontSize: 12.sp,
          color: const Color(0xFFB2B2B2),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFEAEAF5),
          ),
        ),
        constraints: BoxConstraints(
          maxWidth: 262.42.w,
        ),
      ),
    );
  }
}

class Links extends StatelessWidget {
  const Links({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Text(
          'OR',
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: const Color(0xFFA8A7A7),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.facebook,
                color: Colors.blue,
              ),
            ),
            GradientIcon(
              icon: FontAwesomeIcons.google,
              gradient: LinearGradient(
                colors: [Colors.red, Colors.orange, Colors.green, Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.twitter,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class GradientIcon extends StatelessWidget {
  final IconData icon;
  final Gradient gradient;

  GradientIcon({required this.icon, required this.gradient});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return gradient.createShader(bounds);
      },
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
