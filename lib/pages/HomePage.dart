import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _services = [];
  


  //Fetch data from JSON
  Future<String> loadJsonData() async {
    var response = await rootBundle.loadString('assets/list.json');
    
    setState(() {
      Map<String, dynamic> map = json.decode(response);
      _services  = map["list"];
    });
    return 'success';
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetching Data from Json"),
      ),
      body: ListView.builder(
        itemCount: _services.length,
        itemBuilder: (BuildContext context, int index){
          var service = _services[index]["title"];
          var icons = _services[index]["leading"];
          //String service_icon = _services[index]["leading"];
          var check = _services[index]["trailing"];

        return Column(
          children: [
            ListTile(
              leading: Text(
                icons,
                style: TextStyle(fontFamily: 'MaterialIcons'),
              ),
              title: Text(service),
              trailing: check? Icon(Icons.check_box) : Icon(Icons.check_box_outline_blank),
              //trailing: ServiceCheckbox(),

            ),
          ],
        );
      }
    ),
  );
  }
}

/*
class ServiceCheckbox extends StatefulWidget {
  @override
  _ServiceCheckboxState createState() => _ServiceCheckboxState();
}

class _ServiceCheckboxState extends State<ServiceCheckbox> {
    bool isChecked = false ;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.black54,
      value: isChecked,
      onChanged: (newValue){
        setState(() {
          isChecked=newValue!;
        });
      },
    );
  }
}
*/