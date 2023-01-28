import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const XylophoneHome(),
    );
  }
}

class XylophoneHome extends StatefulWidget {
  const XylophoneHome({Key? key}) : super(key: key);

  @override
  State<XylophoneHome> createState() => _XylophoneHomeState();
}

class _XylophoneHomeState extends State<XylophoneHome> {
  void playSound(int number) {
    final player = AudioPlayer();
    player.play(AssetSource('note$number.wav'));
  }

  List color = [
    Colors.deepOrange,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.deepPurpleAccent,
    Colors.indigo
  ];

  // List<Widget> allXylo() {
  //   final newList = <Widget>[];
  //   for (int i = 1; i <= 7; i++) {
  //     newList.add(xylobars(color: color[i - 1], number: i));
  //   }
  //   return newList;
  // }

  Widget xylobars({required Color color, required int number}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        onPressed: () {
          playSound(number);
        },
        child: Container(
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Always put media query inside the build function
    // final size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            'XyloKode',
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          //Put shrinkwrap always in list view when you want it to take up the min space
          // shrinkWrap: true,
          // padding: EdgeInsets.zero,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (int i = 1; i <= 7; i++)
              xylobars(color: color[i - 1], number: i)
          ],
        ),
      ),
    );
  }
}
