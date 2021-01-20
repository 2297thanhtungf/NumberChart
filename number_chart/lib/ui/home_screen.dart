import 'dart:io';
import 'package:flutter/material.dart';
import 'package:number_chart/utils/util.dart';
import 'package:syncfusion_officechart/officechart.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column, Alignment;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:open_file/open_file.dart' as open_file;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.titleApp),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              child: const Text(
                'Generate Excel',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: generateOfficeChart,
            ),
          ],
        ),
      ),
    );
  }
  Future<void> generateOfficeChart() async {
// Create a new Excel document.
    final Workbook workbook = Workbook();
// Accessing worksheet via index.
    final Worksheet sheet = workbook.worksheets[0];
// Setting value in the cell.
    sheet.getRangeByName('A1').setText('John');
    sheet.getRangeByName('A2').setText('Amy');
    sheet.getRangeByName('A3').setText('Jack');
    sheet.getRangeByName('A4').setText('Tiya');
    sheet.getRangeByName('B1').setNumber(10);
    sheet.getRangeByName('B2').setNumber(12);
    sheet.getRangeByName('B3').setNumber(20);
    sheet.getRangeByName('B4').setNumber(21);
// Create an instances of chart collection.
    final ChartCollection charts = ChartCollection(sheet);
// Add the chart.
    final Chart chart = charts.add();
// Set Chart Type.
    chart.chartType = ExcelChartType.column;
// Set data range in the worksheet.
    chart.dataRange = sheet.getRangeByName('A1:B4');
// set charts to worksheet.
    sheet.charts = charts;
// save and dispose the workbook.
    List<int> bytes = workbook.saveAsStream();
    File('Chart.xlsx').writeAsBytes(bytes);
    workbook.dispose();

    // //Get the storage folder location using path_provider package.
    // final Directory directory =
    // await path_provider.getApplicationDocumentsDirectory();
    // final String path = directory.path;
    // final File file = File('$path/output.xlsx');
    // await file.writeAsBytes(bytes);
    //
    // //Launch the file (used open_file package)
    // await open_file.OpenFile.open('$path/output.xlsx');
  }
}
