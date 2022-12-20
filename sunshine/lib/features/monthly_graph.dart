import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(const ChartApp());
}

class ChartApp extends StatelessWidget {
  const ChartApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SunShine',
      theme: ThemeData(
        primarySwatch: Colors.green,
        // brightness: Brightness.dark,
      ),
      home: const ChartSampleGallery(),
    );
  }
}

class ChartSampleGallery extends StatefulWidget {
  const ChartSampleGallery({key}) : super(key: key);

  @override
  _ChartSampleGalleryState createState() => _ChartSampleGalleryState();
}

class _ChartSampleGalleryState extends State<ChartSampleGallery> {
  TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sunshine Data'),
        ),
        body: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
// Chart title
            title: ChartTitle(text: 'Solar Irradiance'),
            // Enable legend
            legend: Legend(isVisible: true),
            // Enable tooltip
            tooltipBehavior: _tooltipBehavior,
            series: <LineSeries<SunshineData, String>>[
              LineSeries<SunshineData, String>(
                  //Gives title to the legend
                  name: "KW/m^2/day",
                  dataSource: <SunshineData>[
                    SunshineData('Mon', 2.83),
                    SunshineData('Tue', 1.17),
                    SunshineData('Wed', 0.84),
                    SunshineData('Thur', 1.8),
                    SunshineData('Fri', 1.51),
                    SunshineData('Sat', 1.62),
                    SunshineData('Sun', 1.30)
                  ],
                  //mapping of axiz
                  xValueMapper: (SunshineData sun, _) => sun.day,
                  yValueMapper: (SunshineData sun, _) => sun.sun,
                  // Enable data label, add parameters to change according to the theme, make it circle
                  dataLabelSettings: const DataLabelSettings(
                      isVisible: true, color: Colors.green))
            ]));
  }
}

class SunshineData {
  //declaring variables
  SunshineData(this.day, this.sun); //??
  final String day; // double data type for numbers and string for string
  final double sun; //try converting double to string and day to mon tue
}
