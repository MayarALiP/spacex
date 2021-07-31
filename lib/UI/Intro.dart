import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_spacex/UI/LogIn.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  void _EndIntro(context) {
    Navigator.pop(context);
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => LogIn()));
  }

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Center(
            child: Container(
              width: 800,
              height: 800,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.red, width: 2),
                image: DecorationImage(
                    image: NetworkImage('https://i.redd.it/d79aqjbeqpn11.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        title: "Rocket engines",
        body: "The company has developed three families of rocket engines ",
        decoration: PageDecoration(pageColor: Colors.black ,
            titleTextStyle: TextStyle(color: Colors.white , fontSize: 25),
            bodyTextStyle: TextStyle(color: Colors.white , fontSize: 20)),
      ),



      PageViewModel(
        image: Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Center(
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.red, width: 2),
                image: DecorationImage(
                    image: NetworkImage(
                        'https://space.skyrocket.de/img_sat/crew-dragon__1.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        title: 'Dragon Spacecraft',
        body: "SpaceX announced plans to pursue a human-rated commercial space program through the end of the decade",
        decoration: PageDecoration(pageColor: Colors.black ,
            titleTextStyle: TextStyle(color: Colors.white , fontSize: 25),
            bodyTextStyle: TextStyle(color: Colors.white , fontSize: 20)),
      ),
      PageViewModel(
        image: Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Center(
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.red, width: 2),
                image: DecorationImage(
                    image: NetworkImage(
                        'https://spacenews.com/wp-content/uploads/2020/01/48380511427_eeafd03bd7_k.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        title: 'Launch Vehicles',
        body: "Falcon 1 was a small racket capable of placing several hundred Kms into low earth orbit",
        decoration: PageDecoration(pageColor: Colors.black ,
            titleTextStyle: TextStyle(color: Colors.white , fontSize: 25),
            bodyTextStyle: TextStyle(color: Colors.white , fontSize: 20)),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
            showSkipButton: true,
            nextColor: Colors.red,
            skipColor: Colors.red,
            globalBackgroundColor: Colors.black,
            color: Colors.red,
            next: Text("Next"),
            skip: Text("Skip"),
            done: Text("Done"),
            onDone: () {
              _EndIntro(context);
            },
            onSkip: () {
              _EndIntro(context);
            },
            pages: getPages()));
  }
}
