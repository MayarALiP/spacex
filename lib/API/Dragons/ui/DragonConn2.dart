import 'package:flutter/material.dart';
import 'package:flutter_spacex/API/Dragons/models/ModelDragon.dart';
import 'package:flutter_spacex/API/Dragons/repositories/APIRequestes.dart';

class DragonConn extends StatefulWidget {
  @override
  _DragonConnState createState() => _DragonConnState();
}

class _DragonConnState extends State<DragonConn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: FutureBuilder<List<ModelShips>>(
            future: APIRequests().dragonAPI(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return CircularProgressIndicator();
              }
              else if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      ModelShips dragon = snapshot.data[index];
                      print(dragon.flickrImages);

                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 200,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border:
                                  Border.all(width: 1.5, color: Colors.purple)),
                          child: Column(
                            children: [
                              //title
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 0, 0),
                                child: Row(
                                  children: [
                                    // for item pic
                                    Container(
                                      width: 80,
                                      height: 170,
                                      child: dragon.flickrImages.length != 0
                                          ? Image.network(
                                              dragon.flickrImages[0])
                                          : SizedBox(),
                                      //fit:BoxFit.contain,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.purple, width: 2)),
                                    ),

                                    //for Name
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Text(
                                        dragon.name,
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              //subtitle
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Row(
                                  children: [
                                    Text(
                                      dragon.type,
                                      style: TextStyle(fontSize: 20),
                                    ),

                                    //active or not
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: SizedBox(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: dragon.active
                                                  ? Colors.tealAccent
                                                  : Colors.purple),
                                          onPressed: () {},
                                          child: Text("${dragon.active}"),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              } else
                return Text("No data to show ");
            }),
      ),
    );
  }
}
// عايزة أعرف كل IF  ايه الelse بتاعتها
