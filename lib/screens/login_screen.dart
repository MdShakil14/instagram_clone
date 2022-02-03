import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import '../widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              SvgPicture.asset(
                'assets/images/ic_instagram.svg',
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(
                height: 24.0,
              ),
              TextFieldInput(
                textEditingController: _emailController,
                hintText: 'Enter Your Email',
                textInputType: TextInputType.emailAddress,
                isPass: false,
              ),
              const SizedBox(
                height: 24.0,
              ),
              TextFieldInput(
                textEditingController: _passController,
                hintText: 'Enter Your Password',
                textInputType: TextInputType.visiblePassword,
                isPass: true,
              ),
              const SizedBox(
                height: 24.0,
              ),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Text('Log in'),
                  decoration:const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    color: blueColor,
                  ),
                ),
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 14.0,horizontal: 2.0),
                    child: const Text('Don\'t have an account?'),
                  ),
                  GestureDetector(
                    onTap: (){print('hit me');},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14.0,horizontal: 2.0),
                      child: const Text('Sign up.',style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
