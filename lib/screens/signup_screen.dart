import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/image_picker.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';
import '../resources/auth_methods.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  Uint8List? _image;

  void selectImage() async {
    Uint8List image = await pickImage(ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                height: 32.0,
              ),
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64.0,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : CircleAvatar(
                          radius: 64.0,
                          backgroundImage: NetworkImage(
                              'https://st2.depositphotos.com/1009634/7235/v/600/depositphotos_72350117-stock-illustration-no-user-profile-picture-hand.jpg'),
                        ),
                  Positioned(
                      bottom: -10,
                      right: 80,
                      child: IconButton(
                        icon: const Icon(Icons.add_a_photo),
                        onPressed: selectImage,
                        iconSize: 30.0,
                      ))
                ],
              ),
              const SizedBox(
                height: 32.0,
              ),
              TextFieldInput(
                  textEditingController: _userNameController,
                  hintText: 'Enter your name',
                  textInputType: TextInputType.text),
              SizedBox(
                height: 24.0,
              ),
              TextFieldInput(
                  textEditingController: _emailController,
                  hintText: 'Enter your mail',
                  textInputType: TextInputType.emailAddress),
              SizedBox(
                height: 24.0,
              ),
              TextFieldInput(
                textEditingController: _passwordController,
                hintText: 'Enter your password',
                textInputType: TextInputType.visiblePassword,
                isPass: true,
              ),
              SizedBox(
                height: 24.0,
              ),
              TextFieldInput(
                textEditingController: _bioController,
                hintText: 'Enter your Bio',
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 24.0,
              ),
              InkWell(
                onTap: () async {
                  String res = await AuthMethods().signUpUser(
                      userName: _userNameController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                      bio: _bioController.text,
                      file: _image!
                  );
                  print(res);
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  alignment: Alignment.center,
                  child: Text('Sign up'),
                  decoration: ShapeDecoration(
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
                      padding:
                          EdgeInsets.symmetric(vertical: 14.0, horizontal: 2.0),
                      child: Text('Already have an account?')),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 14.0, horizontal: 2.0),
                      child: Text(
                        'Log In',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
