import 'package:flutter/material.dart';
import 'Jsonfetch.dart';

const List<String> list = <String>[
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12',
  '13',
  '14',
  '15',
  '16',
  '17',
  '18',
  '19',
  '20',
  '21',
  '22',
  '23',
  '24',
  '25',
  '26',
  '27',
  '28',
  '29',
  '30',
  '31',
  '32',
  '33',
  '34',
  '35',
  '36',
  '37',
  '38',
  '39',
  '40',
  '41',
  '42',
  '43',
  '44',
  '45',
  '46',
  '47',
  '48',
  '49',
  '50',
  '51',
  '52',
  '53',
  '54',
  '55',
  '56',
  '57',
  '58',
  '59',
  '60',
];

void main() {
  runApp(MaterialApp(title: 'Course', home: CoursePage()));
}

// void main() {
//   runApp(const CoursePage());
// }

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  String dropdownValue = list.first;
  bool isChecked = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  String name = "sheral";
  var qual;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Course Finder'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                initialValue: name,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                initialValue: qual,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Qualification',
                ),
              ),
            ),
            Row(
              children: [
                Text('Age'),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? value) {
// This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            Text('Interests:'),
            Row(
              children: [
                Checkbox(
                    checkColor: Colors.white,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    }),
                Text('Computers'),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    checkColor: Colors.white,
                    value: isChecked2,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked2 = value!;
                      });
                    }),
                Text('Cricket'),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    checkColor: Colors.white,
                    value: isChecked3,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked3 = value!;
                      });
                    }),
                Text('Camera'),
              ],
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blue.shade300),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                if (int.parse(dropdownValue.replaceAll("", "")) > 18) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Jsonfetch()
                        // {
                        //   return Jsonfetch();
                        // },
                        ),
                  );
                  print("display next page");
                }
                if (qual == 'BTech' || qual == 'Btech' || qual == 'btech') {
                  print("display next page");
                }
                if (isChecked == 1) {
                  print("display computer courses");
                }
                if (isChecked2 == 1) {
                  print("display cricket courses");
                }
                if (isChecked3 == 1) {
                  print("display camera courses");
                }
              },
              child: Text('Search'),
            )
          ],
        ),
      ),
    );
  }
}
