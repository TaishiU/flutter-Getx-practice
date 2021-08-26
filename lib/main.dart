import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/CountCotroller.dart';
import 'package:getx_practice/StudentControllera.dart';

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
    final StudentController s = Get.put(StudentController());
    //final student = StudentController(name: 'Taishi', age: 22).obs;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('HomeScreen'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                  return Text(
                    '${s.name}',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  );
                }),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text('Upper'),
                  onPressed: () {
                    s.name.value = s.name.value.toUpperCase();
                    //  student.update((val) {
                    //    val!.name = val.name.toString().toUpperCase();
                    //  });
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  child: Text('Lower'),
                  onPressed: () {
                    s.name.value = s.name.value.toLowerCase();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Get.to(NextScreen(name: 'Adam')),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  final String name;

  const NextScreen({Key? key, required this.name}) : super(key: key);

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
            Text(name),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Click!'),
              onPressed: c.increment,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Back'),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
