import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/controller/add_data.dart';
import 'package:notes_app/widgets/widgets.dart';

class EditNote extends StatefulWidget {

  final String title;
  final String description;
  final String id;
  late DateTime dt;
  EditNote({required this.title,required this.description,required this.id,required this.dt});

  @override
  EditNoteState createState() => EditNoteState();
}

class EditNoteState extends State<EditNote> {
  late String finalTitle;
  late String finalDescription;
  TextEditingController titleInit = TextEditingController();
  TextEditingController descInit = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleInit.text = widget.title;
    descInit.text = widget.description;

  }




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
              addData(finalTitle,finalDescription,context,widget.id);
            },
          )
        ],
      ),


      body: Container(
        margin: EdgeInsets.only(top: height/34),
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
                controller: titleInit,
                onChanged: (value){
                  setState(() {
                    finalTitle = value;
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
                controller: descInit,
                onChanged: (value){
                  setState(() {
                    finalDescription = value;
                  });
                },
                maxLines: (width/10).toInt(),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Description',

                ),
              ),
            ),


            //3
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: height/22),
                // Text(DateFormat('kk:mm:ss \n EEE d MMM').format(widget.dt))
                child: Row(
                  children: [
                    FlatButton(
                      onPressed: () {  },
                      color: Colors.blue,
                      child: FitText("Created", 20, Colors.white, FontWeight.normal, 0),
                    ),
                    SizedBox(width: width/20,),
                    FitText(DateFormat('kk:mm:ss \n EEE d MMM').format(widget.dt), 20, Colors.white, FontWeight.normal, 0)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }


}
