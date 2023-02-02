import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

List items = [];
// void main() {
//   runApp(const Jsonfetch());
// }

class Jsonfetch extends StatelessWidget {
  const Jsonfetch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Course Results',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List items = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/courses.json');
    final data = await json.decode(response);
    setState(() {
      items = data["Courses"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Search Results',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: readJson,
              child: const Text('Load Data'),
            ),

            // Display the data loaded from sample.json
            items.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Card(
                          key: ValueKey(items[index]["Course Name"]),
                          margin: const EdgeInsets.all(10),
                          color: Colors.amber.shade100,
                          child: ListTile(
                            leading: Text(items[index]["Course Name"]),
                            title: Text(items[index]["Age"]),
                            subtitle: Text(items[index]["Interests"]),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Jsonfetch();
                              }));
                            },
                          ),
                        );
                      },
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Course Details',
        ),
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              key: ValueKey(items[index]["Course Name"]),
              margin: const EdgeInsets.all(10),
              color: Colors.amber.shade100,
              child: ListTile(
                leading: Text(items[index]["Course Name"]),
                trailing: Text("Description: " + (items[index]["Description"])),
                title: Text("Institutes offering this course: " +
                    items[index]["Institutes offering this course"]),
                subtitle: Text("Institute contact: " +
                    items[index]["Institute contact\n"] +
                    "Location" +
                    (items[index][
                        "Institute location redirecting to maps applicationInstitute location redirecting to maps application"])),
              ),
            );
          },
        ),
      ),
    );
  }
}
