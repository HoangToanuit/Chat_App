import 'package:chat_app_fb/common/entities/entities.dart';
import 'package:chat_app_fb/common/routes/names.dart';
import 'package:chat_app_fb/common/widgets/toast.dart';
import 'package:chat_app_fb/pages/application/state.dart';
import 'package:chat_app_fb/pages/chat/state.dart';
import 'package:chat_app_fb/pages/sign_in/state.dart';
import 'package:chat_app_fb/pages/welcome/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../common/store/user.dart';
import '../../common/values/colors.dart';


class ChatController extends GetxController{
  ChatState state =ChatState();
  ChatController();
  var doc_id = null;
  final textMessageController = TextEditingController();
  ScrollController msgScrolling = ScrollController();
  FocusNode contentNode = FocusNode();
  final user_id =UserStore.to.token;
  final db = FirebaseFirestore.instance; 

  @override
  void onInit() {
    super.onInit();
    var data = Get.parameters;
    doc_id =data['doc_id'];
    state.to_uid.value = data['to_uid']??"";
    state.to_name.value = data['to_name']??"";
    state.to_avatar.value = data['to_avatar']??"";
  }
  
  sendMessage() async {
    String sendContent = textMessageController.text;
    final content = Msgcontent(
      uid: user_id,
      content: sendContent,
      type: "Text",
      addtime: Timestamp.now()
    );
    await db.collection("message").doc(doc_id).collection("msglist").withConverter(
      fromFirestore:Msgcontent.fromFirestore,
      toFirestore: (Msgcontent msgcontent, options)=>msgcontent.toFirestore()
      ).add(content).then((DocumentReference doc){
        print("doccument,${doc.id}");
        textMessageController.clear();
        Get.focusScope?.unfocus();
      }
      );
      await db.collection("message").doc(doc_id).update({
        "last_msg":sendContent,
        "last_time": Timestamp.now(),
      });
      if(doc_id ==null){
        print("concac");
      }
  }
}