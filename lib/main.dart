import 'package:flutter/material.dart';
import 'readwrite.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ReadWrite(),
    );
  }
}

class ReadWrite extends StatefulWidget {
  @override
  _ReadWriteState createState() => _ReadWriteState();
}

class _ReadWriteState extends State<ReadWrite> {
  var _dataEntry = TextEditingController();
  var message = " ";

  void assign() async {
    setState(() {});

    message = await readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Read/Write'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(13.4),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            ListTile(
              title: TextField(
                controller: _dataEntry,
                decoration: InputDecoration(labelText: 'Enter data'),
              ),
            ),
            ListTile(
              title: RaisedButton(
                  color: Colors.green,
                  onPressed: () {
                    //SAVE TO FILE
                    assign();
                    writeData(_dataEntry.text);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Save Data',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 50.0),
                        ),
                        Padding(padding: EdgeInsets.all(14.5)),
                        FutureBuilder(
                            future: readData(),
                            builder: (BuildContext context,
                                AsyncSnapshot<String> data) {
                              if (data.hasData != null) {
                                return
                                  Text(
                                  data.data.toString(),
                                  style: TextStyle(color: Colors.blueAccent),
                                );
                              } else {
                                return Text('No data saved');
                              }
                            })
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
