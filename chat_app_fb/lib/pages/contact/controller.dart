import 'dart:convert';

import 'package:chat_app_fb/common/entities/entities.dart';
import 'package:chat_app_fb/pages/contact/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../common/store/store.dart';


class ContactController extends GetxController{
  ContactController();
  final ContactState state = ContactState();
  final db = FirebaseFirestore.instance;
  final token = UserStore.to.token;

  @override
  void onReady(){
    super.onReady();
    asyncLoadAllData();
  }

  goChat(UserData to_userdata) async {
    var from_message = await db.collection("message").withConverter(
      fromFirestore: Msg.fromFirestore,
       toFirestore: (Msg msg ,options) => msg.toFirestore()).where(
        "from_id",isEqualTo: token).where(
          "to_id", isEqualTo: to_userdata.id
        ).get();
    var to_message = await db.collection("message").withConverter(
      fromFirestore: Msg.fromFirestore,
       toFirestore: (Msg msg ,options) => msg.toFirestore()).where(
      "from_id",isEqualTo: token).where(
        "to_id", isEqualTo: token
       ).get();
    
    if(from_message.docs.isEmpty&&to_message.docs.isEmpty){
      String profile =  await UserStore.to.getProfile();
      UserLoginResponseEntity userdata = UserLoginResponseEntity.fromJson(jsonDecode(profile));
      var msgdata= Msg(
        from_uid: userdata.accessToken,
        to_uid: to_userdata.id,
        from_name: userdata.displayName,
        from_avatar: userdata.photoUrl,
        to_avatar: to_userdata.photourl,
        last_msg: "",
        last_time: Timestamp.now(),
        msg_num:0
      );
      db.collection("message").withConverter(
        fromFirestore: Msg.fromFirestore,
        toFirestore: (Msg msg, options) =>msg.toFirestore() 
        ).add(msgdata).then((value){
          Get.toNamed(
            "/chat", parameters: {
              "doc.id":value.id,
              "to_uid":to_userdata.id??"",
              "to_name":to_userdata.name??"",
              "to_avatar": to_userdata.photourl??""
            }
          );
        }
        );
    }else{
      if(from_message.docs.isNotEmpty){
          Get.toNamed(
            "/chat", parameters: {
              "doc.id":from_message.docs.first.id,
              "to_uid":to_userdata.id??"",
              "to_name":to_userdata.name??"",
              "to_avatar": to_userdata.photourl??""
            }
          );
      }
      if(to_message.docs.isNotEmpty){
          Get.toNamed(
            "/chat", parameters: {
              "doc.id":to_message.docs.first.id,
              "to_uid":to_userdata.id??"",
              "to_name":to_userdata.name??"",
              "to_avatar": to_userdata.photourl??""
            }
          );
      }
    }

  }

  asyncLoadAllData() async {
    var usersbase = await db.collection("users").where("id", isNotEqualTo: token).withConverter(
      fromFirestore: UserData.fromFirestore,
      toFirestore: (UserData userdata, options) =>userdata.toFirestore()
    ).get();

    for(var doc in usersbase.docs){
      state.contactList.add(doc.data());
      print(doc.toString());
    }
  }
}