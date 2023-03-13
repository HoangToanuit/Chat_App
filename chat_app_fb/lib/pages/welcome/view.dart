import 'package:chat_app_fb/pages/welcome/controller.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => SizedBox(
          width:360.w,
          height: 780.w,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView(
                scrollDirection: Axis.horizontal,
                reverse: false,
                onPageChanged: (index){
                  controller.chanePage(index);
                },
                controller: PageController(
                  initialPage: 0, keepPage: false, viewportFraction: 1
                ),
                pageSnapping: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit:BoxFit.fill,
                        image: AssetImage(
                          "assets/images/back1.png"
                        )
                      )
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit:BoxFit.fill,
                        image: AssetImage(
                          "assets/images/back2.png"
                        )
                      )
                    ),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Positioned(
                          width: 120,
                          height: 50,
                          bottom: 120,
                          child: ElevatedButton(
                            onPressed: (){
                              controller.handleSignIn();
                            }, 
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.white),
                              foregroundColor: MaterialStateProperty.all(Colors.black),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              )),
                              side: MaterialStateProperty.all(
                                BorderSide(
                                  color: Colors.white
                                )
                              )
                            ),
                            child: Text("Đăng nhập"),
                          )
                        )
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 70,
                child: DotsIndicator(
                  position: controller.state.index.value.toDouble(),
                  mainAxisAlignment: MainAxisAlignment.center,
                  dotsCount: 3,
                  reversed: false,
                  decorator: DotsDecorator(
                    size: Size.square(9),
                    activeSize: Size(18,9),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    )
                  )
                ) ,
              ),
            ],
          )
        )
      )
    );
  }
}