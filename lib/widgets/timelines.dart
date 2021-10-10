import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Timelines extends StatefulWidget {
  const Timelines({Key? key}) : super(key: key);

  @override
  _TimelinesState createState() => _TimelinesState();
}

class _TimelinesState extends State<Timelines> {
  int item = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Timeline'),
        ),
        body: ListView.builder(
            itemCount: item,
            itemBuilder: (context, index) {
              return (index == 0)
                  ? DayStartContainer()
                  : Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        border: Border(
                            left: BorderSide(
                                color: Colors.blue, width: 4))),
                    margin: EdgeInsets.only(left: 40),
                    width: MediaQuery.of(context).size.width - 40,
                    child: SizedBox(
                        height: 80, child: Center(child: Text('sameer'))),
                  ),
                  Positioned(
                    child: BulletIcon(),
                    top: (index == 0) ? 0 : 10,
                    left: 33,
                  ),
                ],
              );
            }));
  }
}

class BulletIcon extends StatelessWidget {
  const BulletIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(9)),
          border: Border.all(color: Colors.blue, width: 4),
        ));
  }
}

class DayStartContainer extends StatelessWidget {
  const DayStartContainer({this.time = "00:00 AM", Key? key}) : super(key: key);

  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 20, 0, 0),
      child: Row(
        children: [
          BulletIcon(),
          Container(
            height: 60,
            padding: EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Day Start"),
                Text(time),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DayEndContainer extends StatelessWidget {
  const DayEndContainer({this.time = "00:00 PM", Key? key}) : super(key: key);
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 20, 0, 0),
      child: Row(
        children: [
          BulletIcon(),
          Container(
            height: 60,
            padding: EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Day End"),
                Text(time),
              ],
            ),
          )
        ],
      ),
    );
  }
}
