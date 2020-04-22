import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PieChart extends StatelessWidget {
  final String title;
  final int news;
  final int deaths;
  final int recovers;

  PieChart({this.title, this.news, this.deaths, this.recovers});

  _createData() {
    final data = [
      Data('Nuevos', news),
      Data('Muertos', deaths),
      Data('Recuperados', recovers),
    ];
    final blue = charts.MaterialPalette.blue.makeShades(2);
    final red = charts.MaterialPalette.red.makeShades(2);
    final green = charts.MaterialPalette.green.makeShades(2);

    return [
      new charts.Series<Data, String>(
          id: title,
          displayName: '$title',
          data: data,
          labelAccessorFn: (Data datos, _) => '${datos.value}',
          domainFn: (Data datos, _) => datos.name,
          colorFn: (Data datos, _) {
            switch (datos.name) {
              case ('Nuevos'):
                return blue[0];
                break;
              case ('Muertos'):
                return red[0];
                break;
              case ('Recuperados'):
                return green[0];
                break;
              default:
                return charts.MaterialPalette.blue.shadeDefault;
            }
          },
          measureFn: (Data datos, _) => datos.value),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 500,
      width: 300,
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: charts.PieChart(
            _createData(),
            animate: true,
            defaultRenderer: charts.ArcRendererConfig(arcRendererDecorators: [
              charts.ArcLabelDecorator(
                  labelPosition: charts.ArcLabelPosition.auto),
            ]),
          ),
        ),
      ),
    );
  }
}

class Data {
  final int value;
  final String name;

  Data(this.name, this.value);
}
