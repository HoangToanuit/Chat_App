import 'package:chat_app_fb/common/entities/entities.dart';
import 'package:chat_app_fb/common/routes/names.dart';
import 'package:chat_app_fb/common/widgets/toast.dart';
import 'package:chat_app_fb/pages/application/state.dart';
import 'package:chat_app_fb/pages/sign_in/state.dart';
import 'package:chat_app_fb/pages/welcome/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../common/store/user.dart';
import '../../common/values/colors.dart';


class ApplicationController extends GetxController{
  final state =ApplicationState();
  ApplicationController();

  late final List<String> tabTitle;
  late final PageController pageController;
  late final List<BottomNavigationBarItem> bottomTab;

  void handlePageChanged(int index){
    state.page = index;
  }

  void handleNavbaronTap(int index){
    pageController.jumpToPage(index);
  }

  void onInit(){
    super.onInit();
    tabTitle =['Nhắn tin','Liên hệ','Hồ sơ'];
    bottomTab =<BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(Icons.message,
        color: AppColors.thirdElementText,
        ),
        activeIcon: Icon(Icons.message,
        color: AppColors.secondaryElementText,
        ),
        label: 'Nhắn tin',
        backgroundColor: AppColors.primaryBackground
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.message,
        color: AppColors.thirdElementText,
        ),
        activeIcon: Icon(Icons.contact_page,
        color: AppColors.secondaryElementText,
        ),
        label: 'Liên lạc',
        backgroundColor: AppColors.primaryBackground
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person,
        color: AppColors.thirdElementText,
        ),
        activeIcon: Icon(Icons.person,
        color: AppColors.secondaryElementText,
        ),
        label: 'Tài khoản',
        backgroundColor: AppColors.primaryBackground
      )
    ];
    pageController = PageController(initialPage: state.page);
  }
  @override
  void dispose(){
    pageController.dispose();
    super.dispose();
  }
}