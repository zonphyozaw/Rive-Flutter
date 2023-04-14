import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

import 'components/animated_btn.dart';


class OnbodingScreen extends StatefulWidget {
  const OnbodingScreen({super.key});

  @override
  State<OnbodingScreen> createState() => _OnbodingScreenState();
}

class _OnbodingScreenState extends State<OnbodingScreen> {
  late RiveAnimationController _btnAnimationController;

  @override
  void initState(){
    _btnAnimationController = OneShotAnimation("active",autoplay: false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:  [
          Positioned(
              bottom:200,
              left: 100,
              width: MediaQuery.of(context).size.width * 1.7,
              child: Image.asset("assets/Backgrounds/Spline.png")),
          const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
          Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30,sigmaY: 30),
              )),
          Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 70,sigmaY: 70),
                child: const SizedBox(),
              )),
          SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    SizedBox(
                      width: 260,
                      child: Column(
                        children:  const [
                          SizedBox(height: 20),
                         Text("Learn Design & Code",style: TextStyle(fontSize: 60,fontFamily: "Poppins",height: 1.2,color:Colors.black45),),
                          Text("Don't skip deskgn.Learn design and code, by building real apps with Flutter and Swift. Complete course about the best tools.")
                        ],
                      ),
                    ),
                    const Spacer(flex: 2,),
                    AnimatedBtn(btnAnimationController: _btnAnimationController, press: () {
                      _btnAnimationController.isActive = true;
                      showGeneralDialog(
                          barrierLabel: "Sig In",
                          barrierDismissible: true,
                          context: context,
                          pageBuilder: (center,_,__)=>Center(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 32,horizontal: 24),
                              height: 620,
                              margin: const EdgeInsets.symmetric(horizontal: 16),
                              decoration:  BoxDecoration(
                                color: Colors.white.withOpacity(0.94),
                                borderRadius: const BorderRadius.all(Radius.circular(40)),
                              ),
                              child: Scaffold(
                                backgroundColor: Colors.transparent,
                                body: Column(
                                  children:  const [
                                    Text("Sign In",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: "Poppins",fontSize: 40),)
                                    ,Text("Access to 240+ hours of content. Learn design and code, by building real apps with Flutter and Swift.",textAlign: TextAlign.center,),
                                    SignInForm(),
                                  ],
                                ),
                              ),
                            ),
                          ));
                    }),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text("Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, sourse files and certificates."),
                    ),
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      const Text("Email"),
      Padding(
        padding: const EdgeInsets.only(top:8,bottom: 16),
        child: TextFormField(
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SvgPicture.asset("assets/icons/email.svg"),
            ),
          ),
        ),
      ),
      const Text("password"),
      Padding(
        padding: const EdgeInsets.only(top:8,bottom: 16),
        child: TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SvgPicture.asset("assets/icons/password.svg"),
            ),
          ),
        ),
      ),
    ],));
  }
}


