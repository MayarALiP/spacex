import 'package:flutter/material.dart';
import 'package:flutter_spacex/API/Lanuches/model/ModelLanuches.dart';
import 'package:flutter_spacex/API/Lanuches/repositories/APIRequestes.dart';

class LanuchesConn extends StatefulWidget {
  @override
  _LanuchesConnState createState() => _LanuchesConnState();
}

class _LanuchesConnState extends State<LanuchesConn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<ModelLanuches>>(
            future: APIRequests().lanuchesAPI(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return CircularProgressIndicator();
              } else if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      ModelLanuches lanuches = snapshot.data[index];

                      return Padding(padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 150,
                          width: 50,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1.5, color: Colors.red)),

                          child: Column(
                            children: [
                              //title
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.redAccent,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          60, 0, 0, 10),
                                      child: Text(lanuches.name,
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],),
                              ),
                              //subtitle
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Row(
                                  children: [
                                    // Text(
                                    //   lanuches.type,
                                    //   style: TextStyle(fontSize: 20),
                                    // ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          140, 0, 0, 0),
                                      //child:
                                    ),
                                  ],
                                ),
                              )
                            ],),),
                      );
                    });
              } else
                return Text("No data to show ");
            }),
      ),
    );
  }
}
