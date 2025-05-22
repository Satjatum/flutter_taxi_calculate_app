// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_taxi_calculate_app/views/taxi_result_ui.dart';

class TaxiHomeUi extends StatefulWidget {
  const TaxiHomeUi({super.key});

  @override
  State<TaxiHomeUi> createState() => _TaxiHomeUiState();
}

class _TaxiHomeUiState extends State<TaxiHomeUi> {
  TextEditingController _Distance = TextEditingController();
  TextEditingController _TimeTafficJam = TextEditingController();
  _warningDialog(msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("คำเตือน"),
        content: Text(
          msg,
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "OK",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "คำนวนค่าแท็กซี่",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 60,
          right: 60,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/images/taxi.png',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: _Distance,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "ป้อนระยะทาง",
                  label: Text(
                    "ระยะทาง (กิโลเมตร)",
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _TimeTafficJam,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "ป้อนเวลารถติด (ไม่มีป้อน 0)",
                  label: Text(
                    "เวลารถติด (วินาที)",
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_Distance.text.isEmpty) {
                    _warningDialog("ป้อนระยะทางด้วย...");
                  } else if (_TimeTafficJam.text.isEmpty) {
                    _warningDialog("ป้อนเวลารถติดด้วย...");
                    // _TimeTafficJam.text = "0";
                  }

                  double distance = double.parse(_Distance.text);
                  double timetafficjam = double.parse(_TimeTafficJam.text);
                  double totalPrice = 35;
                  if (distance > 1) {
                    totalPrice += (distance - 1) * 5.50;
                  }
                  totalPrice += timetafficjam * 0.50;
                  // _warningDialog("$totalPrice");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaxiResultUi(
                        distance: distance,
                        timetafficjam: timetafficjam,
                        totalPrice: totalPrice,
                      ),
                    ),
                  );
                },
                child: Text(
                  "คำนวน",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  fixedSize: Size(
                    MediaQuery.of(context).size.width,
                    55,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _Distance.text = "";
                    _TimeTafficJam.text = "";
                  });
                },
                child: Text(
                  "ยกเลิก",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  fixedSize: Size(
                    MediaQuery.of(context).size.width,
                    55,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
