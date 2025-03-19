import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mediplus/utils/assets/app_colors.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen>
    with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> analyticsData = [
    {"title": "PATIENTS", "value": 14, "icon": Icons.groups},
    {"title": "ORDERS", "value": 15, "icon": Icons.receipt_long},
    {"title": "DELIVERY BOY", "value": 2, "icon": Icons.local_shipping},
    {"title": "CUSTOMERS", "value": 8, "icon": Icons.people},
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Analytics",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: analyticsData.map((item) {
                return Container(
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: AppColor.textColorLight,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.textColorDark.withAlpha(50),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: Icon(
                      item["icon"],
                      color: Colors.grey.shade600,
                    ),
                    title: Text(
                      item["title"],
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      item["value"].toString(),
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildReportCard("PRODUCT SALE REPORT", useMonths: true),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildReportCard("ORDER REPORT", useMonths: true),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildReportCard("DELAY REPORT", useMonths: false),
          )
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      labelColor: Colors.blue,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.blue,
      tabs: [
        Tab(text: "Monthly"),
        Tab(text: "Weekly"),
        Tab(text: "Yearly"),
      ],
    );
  }

  /// Function to create bar chart
  Widget _buildBarChart({required bool useMonths}) {
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          barGroups: List.generate(
            useMonths ? 12 : 30,
            (index) => BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(toY: (index + 5) % 10 + 10, color: Colors.blue)
              ],
            ),
          ),
          borderData: FlBorderData(show: true),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, TitleMeta meta) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      useMonths
                          ? [
                              "Jan",
                              "Feb",
                              "Mar",
                              "Apr",
                              "May",
                              "Jun",
                              "Jul",
                              "Aug",
                              "Sep",
                              "Oct",
                              "Nov",
                              "Dec"
                            ][value.toInt()]
                          : (value + 1).toInt().toString(),
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Function to create report card
  Widget _buildReportCard(String title, {required bool useMonths}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.textColorLight,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            _buildTabBar(),
            SizedBox(height: 10),
            _buildBarChart(useMonths: useMonths),
          ],
        ),
      ),
    );
  }
}
