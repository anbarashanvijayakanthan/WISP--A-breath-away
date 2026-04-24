import 'package:flutter/material.dart';

void main() => runApp(WispApp());

class WispApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: WispMonitor(),
    );
  }
}

class WispMonitor extends StatefulWidget {
  @override
  _WispMonitorState createState() => _WispMonitorState();
}

class _WispMonitorState extends State<WispMonitor> {
  Color statusColor = Colors.green;
  String statusText = "BREATHING NORMAL";
  String subText = "Monitoring chest retractions...";

  void updateStatus(Color color, String main, String sub) {
    setState(() {
      statusColor = color;
      statusText = main;
      subText = sub;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: statusColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite, size: 120, color: Colors.white),
                  SizedBox(height: 20),
                  Text(statusText, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  Text(subText, style: TextStyle(fontSize: 18, color: Colors.white70)),
                ],
              ),
            ),
            // SIMULATOR PANEL (For your video demo)
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.black26,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => updateStatus(Colors.green, "BREATHING NORMAL", "Monitoring..."),
                    child: Text("Safe"),
                  ),
                  ElevatedButton(
                    onPressed: () => updateStatus(Colors.orange, "CHECK PATIENT", "Irregular rhythm detected"),
                    child: Text("Warning"),
                  ),
                  ElevatedButton(
                    onPressed: () => updateStatus(Colors.red, "CRITICAL ALERT", "Apnea / Grunting detected"),
                    child: Text("Danger"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
