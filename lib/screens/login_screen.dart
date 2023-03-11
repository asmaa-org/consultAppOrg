import 'package:consultApp/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/User.dart';
import '../services/user_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const id = 'LoginScreen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  UserServices userServices = UserServices();
  User u = User();
  String? t;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          controller: emailController,
                                          field: 'Enter email',
                                        ),
                                        SizedBox(
                                          height: 22.h,
                                        ),
                                        MyTextField(
                                          obscureText: true,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          controller: passwordController,
                                          field: 'Password',
                                        ),
                                        SizedBox(
                                          height: 62.h,
                                        ),
                                        MyButton(
                                          text: 'Login',
                                          fun: () async {
                                            var apiResponse =
                                                await userServices.login(
                                                    email: emailController.text,
                                                    password: passwordController
                                                        .text);
                                            if (apiResponse.error == null) {
                                              u = apiResponse.data as User;
                                              userServices.setToken(u.token!);
                                              //Get token from constants
                                              // t = await token;
                                              // print(t);
                                              Navigator.pushNamed(
                                                  context, MyHomeScreen.id);
                                            }
                                          },
                                        ),
                                        const Links(),
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
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          controller: emailController,
                                          field: 'Enter email',
                                        ),
                                        SizedBox(
                                          height: 22.h,
                                        ),
                                        MyTextField(
                                          obscureText: true,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          controller: passwordController,
                                          field: 'Password',
                                        ),
                                        SizedBox(
                                          height: 22.h,
                                        ),
                                        MyTextField(
                                          obscureText: true,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          controller: confirmPasswordController,
                                          field: 'Confirm password',
                                        ),
                                        SizedBox(
                                          height: 62.h,
                                        ),
                                        MyButton(
                                            text: 'Sign up',
                                            fun: () async {
                                              if (passwordController.text ==
                                                  confirmPasswordController
                                                      .text) {
                                                var apiResponse =
                                                    await userServices.register(
                                                        email: emailController
                                                            .text,
                                                        password:
                                                            passwordController
                                                                .text,
                                                        name: nameController
                                                            .text);
                                                if (apiResponse.error == null) {
                                                  u = apiResponse.data as User;
                                                  userServices
                                                      .setToken(u.token!);
                                                  Navigator.pushNamed(
                                                      context, MyHomeScreen.id);
                                                }
                                              }
                                            }),
                                        const Links(),
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
    required this.field,
    required this.controller,
    required this.keyboardType,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
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
