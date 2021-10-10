import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Timelines extends StatefulWidget {
  const Timelines({Key? key}) : super(key: key);

  @override
  _TimelinesState createState() => _TimelinesState();
}

class _TimelinesState extends State<Timelines> {
  int item = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Timeline'),
        ),
        body: ListView.builder(
            itemCount: item,
            itemBuilder: (context, index) {
              if (index == 0) {
                return const DayStartContainer();
              } else if (index == item - 1) {
                return const DayEndContainer();
              }
              return Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            left: BorderSide(color: Colors.blue, width: 4))),
                    margin: const EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Title(),
                        Center(
                          child: TaskActivity(
                              title: 'Sku Availability',
                              action: 'Details >',
                              onAction: () {}),
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    child: BulletIcon(),
                    top: 8,
                    left: 13,
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
          borderRadius: const BorderRadius.all(Radius.circular(9)),
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
      padding: const EdgeInsets.fromLTRB(12, 20, 0, 0),
      child: Row(
        children: [
          SizedBox(
            height: 70,
            child: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: BulletIcon(),
                ),
                Positioned(
                  top: 40,
                  left: 8,
                  child: Container(
                    width: 4,
                    height: 34,
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 70,
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Day Start"),
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
      padding: const EdgeInsets.fromLTRB(12, 0, 0, 20),
      child: Row(
        children: [
          SizedBox(
            height: 60,
            child: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: BulletIcon(),
                ),
                Positioned(
                  bottom: 36,
                  left: 8,
                  child: Container(
                    width: 4,
                    height: 24,
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 60,
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Day End"),
                Text(time),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title(
      {this.title = 'Opening Stock',
      this.time = '00:00 AM',
      this.duration = "25 Min",
      Key? key})
      : super(key: key);

  final String title;
  final String time;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.w800),
              ),
              Text(
                time,
              )
            ],
          ),
          const Spacer(),
          Text(duration)
        ],
      ),
    );
  }
}

class OutletActivity extends StatelessWidget {
  const OutletActivity({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Opening Stock',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '23.5',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Text('Value ()')
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('23', style: TextStyle(fontWeight: FontWeight.w700)),
                    Text('Std qty (Kg)')
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('23', style: TextStyle(fontWeight: FontWeight.w700)),
                    Text('Lines cut')
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TaskActivity extends StatelessWidget {
  const TaskActivity(
      {required this.title,
      required this.action,
      required this.onAction,
      Key? key})
      : super(key: key);

  final String title;
  final String action;
  final void Function() onAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.w800)),
          Text(action)
        ],
      ),
    );
  }
}
