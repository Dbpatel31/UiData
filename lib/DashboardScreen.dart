import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Dashboardscreen extends StatelessWidget {
  const Dashboardscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     drawer: const _SideDrawer(),
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: Colors.teal,
      ),
      body: LayoutBuilder(
          builder: (context, constraints){
            int crossAxisCount= constraints.maxWidth> 600 ? 3:2;

            return Column(
              children: [
                Expanded(
                   flex: 1,
                    child: GridView.count(
                        crossAxisCount: crossAxisCount,
                        padding: const EdgeInsets.all(12),
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                       children: const[
                         _StatCard(title: "Sales", value: "₹1,20,000"),
                         _StatCard(title: "Orders", value: "350"),
                         _StatCard(title: "Revenue", value: "₹95,000"),
                       ],

                    )
                ),

                Expanded(
                    flex: 1,
                    child: Padding(
                        padding: const EdgeInsets.all(12),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                        ),
                        elevation: 4,
                        child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Monthly Sales",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Expanded(
                                    child: BarChart(
                                      BarChartData(
                                        borderData: FlBorderData(
                                          show: false
                                        ),
                                        gridData: const FlGridData(show: false),
                                        titlesData: FlTitlesData(
                                          leftTitles: const AxisTitles(
                                            sideTitles: SideTitles(showTitles: false)
                                          ),
                                          topTitles: const AxisTitles(
                                            sideTitles: SideTitles(showTitles: false)
                                          ),
                                          rightTitles: const AxisTitles(
                                            sideTitles: SideTitles(showTitles: false)
                                          ),
                                          bottomTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: true,
                                              getTitlesWidget: (value, meta){
                                                switch(value.toInt()){
                                                  case 0:
                                                    return const Text("Jan");
                                                  case 1:
                                                    return const Text("Feb");
                                                  case 2:
                                                    return const Text("Mar");
                                                  case 3:
                                                    return const Text("Apr");
                                                  case 4:
                                                    return const Text("May");
                                                  default:
                                                    return const Text("");
                                                }
                                              }
                                            )
                                          )
                                        ),
                                        barGroups: [
                                          BarChartGroupData(
                                            x: 0,
                                            barRods: [BarChartRodData(toY: 8, color: Colors.teal)],
                                          ),
                                          BarChartGroupData(
                                            x: 1,
                                            barRods: [BarChartRodData(toY: 10, color: Colors.teal)],
                                          ),
                                          BarChartGroupData(
                                            x: 2,
                                            barRods: [BarChartRodData(toY: 14, color: Colors.teal)],
                                          ),
                                          BarChartGroupData(
                                            x: 3,
                                            barRods: [BarChartRodData(toY: 7, color: Colors.teal)],
                                          ),
                                          BarChartGroupData(
                                            x: 4,
                                            barRods: [BarChartRodData(toY: 12, color: Colors.teal)],
                                          ),
                                        ]
                                      )
                                    )
                                )
                              ],
                            ),
                        ),
                      ),
                    )
                )
              ],
            );
          }
      ),
    );
  }
}

class _SideDrawer extends StatelessWidget{
  const _SideDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const[
          DrawerHeader(
             decoration: BoxDecoration(color: Colors.teal),
              child: Text("Menu" , style: TextStyle(color: Colors.white, fontSize: 22 )),
          ),
          ListTile(leading: Icon(Icons.dashboard), title: Text("Dashboard")),
          ListTile(leading: Icon(Icons.person), title: Text("Profile")),
          ListTile(leading: Icon(Icons.settings), title: Text("Settings")),
        ],
      ),
    );
  }


}

class _StatCard extends StatelessWidget{
  final String title;
  final String value;

  const _StatCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
          padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal
              ),
            )
          ],
        ),
      ),
    );
  }


}

