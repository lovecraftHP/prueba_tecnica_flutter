import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  final int totalConfirmed;
  final String name;
  final int totalDeaths;
  final int totalRecovered;

  CardInfo(
      {this.name, this.totalConfirmed, this.totalDeaths, this.totalRecovered});

  Widget _buildOptions(String title, IconData icon, Color color) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 15, color: color),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                _buildOptions('Confirmados:$totalConfirmed', Icons.dashboard,
                    Colors.blue),
                _buildOptions(
                    'Muertos: $totalDeaths', Icons.warning, Colors.red),
                _buildOptions('Recuperados: $totalRecovered',
                    Icons.accessibility, Colors.green)
              ],
            )),
      ),
    );
  }
}
