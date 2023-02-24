import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'VideoConferancePage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final String userID = Random().nextInt(900000 + 100000).toString();
final String roomID = (Random().nextInt(1000000000) * 10 + Random().nextInt(10))
    .toString()
    .padLeft(10, '0');

class _HomeScreenState extends State<HomeScreen> {
  final confranceIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:A"
              "Nd9GcRQ5JAos2BzMTrX0xEWQi62Y3xrWqobHpJvi2q7wJUVCERdygjj4ybP6CGv5SNvBImCTQ&usqp=CAU",
              width: MediaQuery.of(context).size.width * 0.6,
            ),
            SizedBox(
              height: 20,
            ),
            Text("Your UserId :$userID "),
            SizedBox(
              height: 10,
            ),
            const Text("Please test with two or more devices"),
            SizedBox(
              height: 20,
            ),
            TextField(
              maxLength: 10,
              keyboardType: TextInputType.number,
              controller: confranceIdController,
              onSubmitted: (value){print(value);},
              decoration: InputDecoration(
                  labelText: "Join a meeting by Id",

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            ElevatedButton(
              onPressed: () {
                return jumpToMeetingpage(context,
                    conferanceId: confranceIdController.text);
              },
              child: Text("Join a Meeting"),
              style: ButtonStyle(),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                return jumpToMeetingpage(context, conferanceId: roomID);
              },
              child: Text("New Meeting"),
              style: ButtonStyle(),
            ),
          ],
        ),
      ),
    );
  }

  jumpToMeetingpage(BuildContext context, {required String conferanceId}) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => VideoConferance(conferanceId)));
  }
}
