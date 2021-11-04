import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:raw_gnss/gnss_measurement_model.dart';
import 'package:raw_gnss/raw_gnss.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Permission.location.request().then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: Center(
        child: StreamBuilder<GnssMeasurementModel>(
          builder: (context, snapshot) {
            return Text(snapshot.data.string ?? "");
          },
          stream: RawGnss().gnssMeasurementEvents,
        ),
      ),
    );
  }
}
