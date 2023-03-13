import 'package:chat_app_fb/common/style/color.dart';
import 'package:chat_app_fb/common/values/colors.dart';
import 'package:chat_app_fb/common/widgets/button.dart';
import 'package:chat_app_fb/pages/application/controller.dart';
import 'package:chat_app_fb/pages/contact/index.dart';
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
  

class ApplicationPage extends GetView<ApplicationController> {
  const ApplicationPage({super.key});
  @override
  Widget build(BuildContext context) {
  Widget _buildPageView(){
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: controller.pageController,
      onPageChanged: controller.handlePageChanged,
      children: [
        Container(child: Center(child: Text("Nhắn tin"))),
        ContactPage(),
        Container(child: Text("Hồ sơ"))
      ],
    );
  }
  Widget _buildBottomNavigation(){
    return Obx(() 
    => BottomNavigationBar(
      items: controller.bottomTab,
      currentIndex: controller.state.page ,
      type: BottomNavigationBarType.fixed,
      onTap: controller.handleNavbaronTap,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: AppColors.tabBarElement,
      selectedItemColor: AppColors.thirdElement,
      )
    );
  }
  
    return Scaffold(
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }
}

