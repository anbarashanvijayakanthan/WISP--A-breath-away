import 'package:flutter/material.dart';

void main() => runApp(WispApp());

class WispApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WispMonitor(),
      theme: ThemeData.dark(),
    );
  }
}

class WispMonitor extends StatefulWidget {
  @override
  _WispMonitorState createState() => _WispMonitorState();
}

class _WispMonitorState extends State<WispMonitor> {
  // Current status: 0 = Green, 1 = Amber, 2 = Red
  int status = 0; 

  void simulateAlert() {
    setState(() {
      status = (status + 1) % 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [Colors.green, Colors.orange, Colors.red];
    List<String> messages = ["BREATHING NORMAL", "CHECK BABY", "CRITICAL ALERT"];

    return Scaffold(
      backgroundColor: colors[status],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite, size: 100, color: Colors.white),
            SizedBox(height: 20),
            Text(
              messages[status],
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: simulateAlert,
              child: Text("Simulate Sensor Data"),
            ),
          ],
        ),
      ),
    );
  }
}
