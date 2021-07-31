import 'package:flutter/material.dart';
import 'package:flutter_spacex/API/Ship/model/ModelShips.dart';
import 'package:flutter_spacex/API/Ship/repositories/APIRequestes.dart';

class ShipConn extends StatefulWidget {
  @override
  _ShipConnState createState() => _ShipConnState();
}

class _ShipConnState extends State<ShipConn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<ModelLanuches>>(
            future: APIRequests().dragonAPI(),
            builder: (context, snapshot) {

              if (snapshot.connectionState != ConnectionState.done) {
                return CircularProgressIndicator();
              }

              else if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      ModelLanuches ship = snapshot.data[index];

                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 150,
                          width: 50,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1.5, color: Colors.red)),
                          child: Column(
                            children: [
                              //title
                              Padding(
                                padding:const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      //child: Image.network(ship.flickrImages[1]),
                                      // fit:BoxFit.contain,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.red,width:1)
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(60,0,0,10),
                                      child: Text(ship.name,
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //subtitle
                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Row(
                                  children: [
                                    Text(ship.type,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          140, 0, 0, 0),
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text("$ship.active"),
                                        style: ButtonStyle(backgroundColor:
                                        MaterialStateProperty.resolveWith<
                                            Color>(
                                              (Set<MaterialState> states) {
                                            if (states.contains(
                                                MaterialState.pressed))
                                              return Colors.green;
                                            return null; // Use the component's default.)
                                          },
                                        )),
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