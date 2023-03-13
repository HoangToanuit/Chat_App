import 'package:chat_app_fb/common/values/colors.dart';
import 'package:chat_app_fb/common/widgets/button.dart';
import 'package:chat_app_fb/pages/sign_in/controller.dart';
import 'package:chat_app_fb/pages/welcome/controller.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../common/values/colors.dart';
import '../../common/values/colors.dart';
import '../../common/values/shadows.dart';
  

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});
  @override
  Widget build(BuildContext context) {
  
  
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            Spacer(),
            buildThirdPartyLogin()
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
  return SingleChildScrollView(
    child: Container(
        
        width:110.w,
        margin:EdgeInsets.only(top: 84.h),
        child: Column(
          children: [
            Container(
              width: 76.w,
              height:76.w,
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height:76.w,
                      decoration: BoxDecoration(
                        color: AppColors.primaryBackground,
                        boxShadow:[
                          Shadows.primaryShadow,
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                    ),
                  ),
                  Positioned(
                    child: Image.asset(
                      fit: BoxFit.cover,
                      "assets/images/ic_launcher.png",
                      width: 76.w,
                      height:76.w,
                    )
                  )
                ],
              ),
            ),
            Container( 
              margin: EdgeInsets.only(
                top: 15.h,
                bottom: 15.h
              ),
              child: Text("Nhắn tin trực tuyến", 
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.thirdElement,
                fontWeight: FontWeight.w600,
                fontSize:18.sp,
                height: 1,
                ),
              ),
            )
          ],
        )
      ),
    );
  }
Widget buildThirdPartyLogin(){
  return Container(
    width: 295.w,
    margin: EdgeInsets.only(bottom: 280.h),
    child: Column(
      children: [
        Text("Đăng nhập với tài khoản mạng xã hội",
        textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.thirdElement,
              fontWeight: FontWeight.w400,
              fontSize:16.sp,
              height: 1,
              ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top:30.h, left: 50.w, right: 50.h
          ),
          child: btnFlatButtonWidget(
            onPressed:(){controller.handleSignIn();},
            width:180.w,
            height:40.h,
            title: "Đăng nhập bằng Tài khoản Google"
          ),
        )
      ],
    ),
  );
}
}
