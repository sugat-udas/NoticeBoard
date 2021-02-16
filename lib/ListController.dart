import 'package:flutter/material.dart';

class NoticeScreenContorller extends ChangeNotifier{
  List NoticeHeading=[
    "Holiday Tomorrow",
    "Be on Time",
    "Complete the assigned task properly"
  ];

  List NoticeDescription=[
    "Take a rest tomorrow and be on time on the next day",
    "Maintain your quality and punctuality",
    "Give more focus on your work"
  ];
  List get getNoticeHead => NoticeHeading;
  set setNoticeHead(List noticeHead) => this.NoticeHeading=NoticeHeading;

  List get getNoticeDescription => NoticeDescription;
  set setNoticeDescription(List noticeDescription) => this.NoticeDescription=NoticeDescription;

  deleteItem(int index){
    NoticeHeading.removeAt(index);
    NoticeDescription.removeAt(index);
    notifyListeners();
  }

  editItem(int index){
    String editHead= getNoticeHead.indexOf(index).toString();
    String editSubtitle= getNoticeDescription.indexOf(index).toString();
    notifyListeners();
  }

  String _itemHead;
  String get itemHead => _itemHead;
  set itemHead(String value) => _itemHead = value;
  setHead(String val){
    itemHead=val;
    notifyListeners();
    print(itemHead);
    NoticeHeading.add(itemHead);
  }
  String _itemDescription;
  String get itemDescription => _itemDescription;
  set itemDescription(String value) => _itemDescription = value;
  setDescription(String val){
    itemDescription=val;
    notifyListeners();
    print(itemDescription);
    NoticeDescription.add(itemDescription);

  }

}

