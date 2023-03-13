import 'package:chat_app_fb/common/values/colors.dart';
import 'package:chat_app_fb/common/widgets/app.dart';
import 'package:chat_app_fb/common/widgets/button.dart';
import 'package:chat_app_fb/pages/contact/widgets/contact_list.dart';
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
import 'controller.dart';
  

class ContactPage extends GetView<ContactController> {
  const ContactPage({super.key});
  @override
  Widget build(BuildContext context) {
  AppBar _buildAppBar(){
    return transparentAppBar(
      title: Text(
        "Contact",
        style: TextStyle(
          color: AppColors.primaryBackground,
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
        ),
      ),

    );
  }
  
    return Scaffold(
      appBar: _buildAppBar(),
      body: ContactList(),
    );
  }
}