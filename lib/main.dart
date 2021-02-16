

import 'package:flutter/material.dart';
import 'package:notice_board_app/ListController.dart';
import 'package:provider/provider.dart';

void main() => runApp(
    ChangeNotifierProvider(
        create: (context)=>NoticeScreenContorller(),

            child:  NoticeBoardApp(),
    )
   );

class NoticeBoardApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Todo List',
      home: Home(),

    );
  }
}

class Home extends StatelessWidget {
  NoticeScreenContorller _noticeScreenControllerState;
  String head;
  String description;
  bool editFlag= false;
  final _headController =TextEditingController();
  final _descriptionController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    _noticeScreenControllerState=Provider.of<NoticeScreenContorller>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('NoticeBoard App'),
        backgroundColor: Colors.brown,

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown,
        child: Icon(Icons.add,),
        onPressed: (){
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
              title: Text('Add New Notice'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Heading"
                      ),
                      onChanged: (val) {
                         head=val;
                      },

                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter Description"
                      ),
                      onChanged: (val){
                         description=val;
                      },
                    )
                  ],

                ),

              ),
              actions: [
                TextButton(
                    onPressed: (){
                      _noticeScreenControllerState.setHead(head);
                      _noticeScreenControllerState.setDescription(description);
                      Navigator.of(context).pop();
                    },
                    child: Text('Add'))
              ],
            );
          });
        },
      ),
      body: ListMaker(),
    );
  }
  Widget ListMaker (){
    return ListView.builder(
      itemCount: _noticeScreenControllerState.NoticeHeading.length,
      itemBuilder: (BuildContext context, int index){
        return Card(
          child: ListTile(
            title: Text(
              _noticeScreenControllerState.NoticeHeading[index].toString()
            ),
            subtitle: Text(
              _noticeScreenControllerState.NoticeDescription[index].toString()
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(child: Icon(Icons.edit),
                onTap: (){
                  String head = _noticeScreenControllerState.getNoticeHead[index];
                  String description= _noticeScreenControllerState.getNoticeDescription[index];
                 showDialog(context: context, builder: (BuildContext context){
                   return AlertDialog(
                     title: Text('Add New Notice'),
                     content: SingleChildScrollView(
                       child: ListBody(
                         children: [
                           TextFormField(
                             decoration: InputDecoration(
                               labelText: head,
                             ),
                             controller: _headController,
                             onChanged: (val){
                               _noticeScreenControllerState.getNoticeHead[index]=val;
                             },
                           ),
                           TextFormField(
                             decoration: InputDecoration(
                               labelText: description,
                             ),
                             controller: _descriptionController,
                             onChanged: (val){
                               _noticeScreenControllerState.getNoticeDescription[index]=val;
                             },
                           ),
                         ],

                       ),

                     ),
                     actions: [
                       TextButton(
                           onPressed: (){

                             Navigator.of(context).pop();
                           },
                           child: Text('Edit'))
                     ],
                   );
                 });
                },

                ),
                SizedBox(width: 10,),
                GestureDetector(child: Icon(Icons.delete),
                onTap: (){
                  _noticeScreenControllerState.deleteItem(index);
                },),
              ],
            ),
          ),
        );
      },
    );
  }
}




