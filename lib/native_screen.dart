import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeScreen extends StatefulWidget {
  @override
  _NativeScreenState createState() => _NativeScreenState();
}

class _NativeScreenState extends State<NativeScreen> {
  static const firebaseChannel = MethodChannel('firebaseStorage');
  List<dynamic> images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Text('a');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImages,
        child: Icon(Icons.refresh),
      ),
    );
  }

  _getImages() async {
    try {
      final List<dynamic> result = await firebaseChannel.invokeMethod('getImages');
      setState(() {
        images = result;
      });
    } on PlatformException catch (e) {
      throw e.message;
    }
  }
}
