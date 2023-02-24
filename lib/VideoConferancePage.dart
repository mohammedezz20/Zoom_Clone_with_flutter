
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:videoapp/HomeScreen.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

class VideoConferance extends StatelessWidget {
  final String ConferanceId;
  final int appID = int.parse(dotenv.get('ZEGO_APP_ID'));
  final String appSign = dotenv.get('ZEGO_APP_SIGN');

  VideoConferance(this.ConferanceId);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        appBar: AppBar(title:  Text("meetingID:$roomID"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black54,),
        body: ZegoUIKitPrebuiltVideoConference (
        appID: appID,
        appSign: appSign,
        userID: userID,
        userName: userID,
        conferenceID: ConferanceId,
        // Modify your custom configurations here.
        config: ZegoUIKitPrebuiltVideoConferenceConfig(
          onLeaveConfirmation: (BuildContext context) async {
            return await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.blue[900]!.withOpacity(0.9),
                  title: const Text("This is your custom dialog",
                      style: TextStyle(color: Colors.white70)),
                  content: const Text(
                      "You can customize this dialog however you like",
                      style: TextStyle(color: Colors.white70)),
                  actions: [
                    ElevatedButton(
                      child: const Text("Cancel",
                          style: TextStyle(color: Colors.white70)),
                      onPressed: () => Navigator.of(context).pop(false),
                    ),
                    ElevatedButton(
                      child: const Text("Exit"),
                      onPressed: () => Navigator.of(context).pop(true),
                    ),
                  ],
                );
              },
            );
          },
        ),
      )
      ),
    );
  }
}
