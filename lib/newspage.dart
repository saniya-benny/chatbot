import 'package:flutter/material.dart';

class Newspage extends StatefulWidget {
  const Newspage({super.key});

  @override
  State<Newspage> createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[200],
        title: Center(
          child: Text(
            "NEWS APP",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        leading: Icon(Icons.home, size: 20),
        titleSpacing: -20,
      ),
      backgroundColor: Colors.indigo[100],
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.indigo[100],

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Global Heatwave Breaks   100                  Year Record',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Image.network(
                    'https://scitechdaily.com/images/Hot-Sun-Thermometer-Heatwave-Concept.jpg',
                    height: 300,
                  ),
                  Text(
                    ' Meteorologists confirm that this year’s temperatures have surpassed century-old records, sparking urgent climate action debates across nations',
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                  ),Row(
                    children: [
                      Text("ABC NEWS  ", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),),Icon(Icons.abc)
                    ],
                  ),
Text("5.35 AM"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
