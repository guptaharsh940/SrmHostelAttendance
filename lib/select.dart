import 'package:flutter/material.dart';
import 'package:login_page/splashscreen.dart';
import 'information.dart';

const List<String> list = <String>['All','D', 'E', 'F', 'G', 'H'];

class SelectBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Container(
          decoration: new BoxDecoration(
            color: Colors.amber,
            borderRadius: new BorderRadius.all(Radius.circular(25))),
          margin: EdgeInsets.all(25),
          height: 200,
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Select Hostel Block",style: TextStyle(color: Color.fromARGB(255, 13, 1, 1),fontSize: 20),),
              SizedBox(
                height: 20,
              ),
              DropdownButtonExample(),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: Text('Continue',style: TextStyle(color: Colors.white,fontSize: 20),),
                onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SplashScreen()));})
            ],
          ),
        ),
      ),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward,),
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
    );
  }
}
