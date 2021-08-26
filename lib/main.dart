import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/CountCotroller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CountController c = Get.put(CountController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('HomeScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Text(
                '${c.count}',
                style: TextStyle(
                  fontSize: 40,
                ),
              );
            }),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Click!'),
              onPressed: c.increment,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Get.to(NextScreen()),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CountController c = Get.find();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('NextScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Text(
                '${c.count}',
                style: TextStyle(
                  fontSize: 40,
                ),
              );
            }),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Click!'),
              onPressed: c.increment,
            ),
          ],
        ),
      ),
    );
  }
}
