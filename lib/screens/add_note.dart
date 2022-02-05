import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/controller/add_data.dart';

class AddNote extends StatefulWidget {

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  late String title="";
  late String description="";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
      return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.save,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
                if(!(title=="" && description==""))
                  addData(title, description, context, null);
            },
          )
        ],
      ),


      body: Container(
        margin: EdgeInsets.only(top: width/20),
        child: Column(
          children: [

            // Title field
            Container(
              padding: EdgeInsets.only(left: width/41),
              decoration: BoxDecoration(
                border: Border.all(
                  width: width/200,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(width/27),
              ),
              child: TextField(
                onChanged: (value){
                  setState(() {
                    title = value;
                    print(title);
                  });
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title',
                ),
              ),
            ),


            //2 description
            Container(
              margin: EdgeInsets.only(top: height/34),
              padding: EdgeInsets.only(left: width/41),
              decoration: BoxDecoration(
                border: Border.all(
                  width: width/200,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(width/27),
              ),
              height: height/4,
              child: TextField(
                onChanged: (value){
                  setState(() {
                    description = value;
                  });
                },
                maxLines: (width/10).toInt(),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Description',

                ),
              ),
            ),
          ],
        ),
      ),

    );
  }


}
