import 'dart:io';

import 'package:chat/Ui/Auth/Data/auth_helper.dart';
import 'package:chat/Ui/Auth/Data/firestorage_helper.dart';
import 'package:chat/Ui/chat/data/data_firestore_helper.dart';
import 'package:chat/Ui/chat/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChatProvider extends ChangeNotifier {
  PageController pageController = PageController();
  String getMyId() {
    return AuthHelper.authHelper.getUserId();
  }

  int currentPageIndex = 0;
  changePageIndex(int newIndex) {
    pageController.jumpToPage(newIndex);
    this.currentPageIndex = newIndex;
    notifyListeners();
  }

  TextEditingController messageController = TextEditingController();

  sendMessage([MessageModel messageModel]) {
    if (messageModel == null) {
      messageModel = MessageModel(
          messageController.text, AuthHelper.authHelper.getUserId());
    }
    ChatFirestoreHelper.dataFirestoreHelper.sendMessage(messageModel);
    messageController.clear();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getStream() {
    return ChatFirestoreHelper.dataFirestoreHelper.getChatStream();
  }

  File file;
  selectFile() async {
    XFile file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);
    this.file = File(file.path);
    String imageUrl = await FireStorageHelper.fireStorageHelper
        .uploadImage(this.file, 'chat_images');
    MessageModel messageModel = MessageModel(
      '',
      getMyId(),
      imageUrl: imageUrl,
    );
    sendMessage(messageModel);
  }
}
