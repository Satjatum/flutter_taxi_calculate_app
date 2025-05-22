import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaxiResultUi extends StatefulWidget {
  double? distance;
  double? timetafficjam;
  double? totalPrice;

  //เอาตัวแปรมารอรับค่าที่ส่งมา
  TaxiResultUi({super.key, this.distance, this.timetafficjam, this.totalPrice});

  @override
  State<TaxiResultUi> createState() => _TaxiResultUiState();
}

class _TaxiResultUiState extends State<TaxiResultUi> {
  @override
  Widget build(BuildContext context) {
    NumberFormat fm = NumberFormat('#,###,##0.0');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "คำนวนค่าแท็กซี่ (ผลลัพธ์)",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
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
              height: 20,
            ),
            Text(
              "---ค่าแท็กซี่---",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "ระยะทาง ${widget.distance} กิโลเมตร",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "เวลารถติด ${widget.timetafficjam} นาที",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "คิดเป็นเงินที่ต้องจ่าย ${fm.format(widget.totalPrice)} บาท",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
