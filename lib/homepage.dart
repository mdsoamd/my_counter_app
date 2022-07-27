import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController inputvalue = TextEditingController();
  TextEditingController inputvalue1 = TextEditingController();
  int count = 0;
  int isValue = 0;
  final forKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
      ),
      body: Container(
          child: SingleChildScrollView(
        child: Form(
          key: forKey,
          child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Container(
                  color: Colors.black,
                  height: 60,
                  width: 300,
                  child: Center(
                    child: Text(
                      '$isValue',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: inputvalue,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter Your Days",
                      hintText: "Days"),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please Enter days";
                    }
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: inputvalue1,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter Your Count Value",
                      hintText: "Count Value"),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please Enter Count Value";
                    }
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Material(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(5),
                  child: InkWell(
                    onTap: (() {
                      if (forKey.currentState!.validate()) {
                        count = int.parse(inputvalue.text);
                        isValue = int.parse(inputvalue1.text);
                        setState(() {
                          for (var i = 0; i < count; i++) {
                            isValue = isValue + isValue;
                            print(isValue);
                          }
                        });
                      }
                    }),
                    child: Container(
                      height: 50,
                      width: 130,
                      child: Center(
                          child: Text(
                        "Click Button",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
