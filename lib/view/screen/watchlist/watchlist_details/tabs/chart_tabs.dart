import 'package:fl_chart/fl_chart.dart';
import 'package:simple_bank/utils/import.dart';
import 'package:simple_bank/view/screen/watchlist/watchlist_details/component/chart_tab_component.dart';
import 'package:simple_bank/view/screen/watchlist/watchlist_details/component/pie_chart_component.dart';
import 'package:simple_bank/view/screen/watchlist/watchlist_details/component/sublabel_component.dart';
import 'package:simple_bank/view/widget/chart/line_chart.dart';
import 'package:simple_bank/view/widget/chart/mini_hit_bar_chart.dart';

class ChartTab extends StatelessWidget {
  const ChartTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const LineChartWidget(),
        const SizedBox(height: 20),
        ChartTabComponent(
          accountNumber: "141XXXXXXXX457",
          branch: "Vasad (1452)",
          customerName: "Nitin Gamechi Arvindbhai",
          ifsc: "SBI0002510",
          micr: "562495545",
          currentBalance: "1,215,489,147.00",
          accountType: "Saving Account",
          lowAmount: "93.00",
          averageAmount: "3,555.00",
          highAmount: "50,004.85",
          color: Theme.of(context).appBarTheme.backgroundColor!,
          applyBorder: true,
        ),
        const SizedBox(height: 20),
        PieChartComponent(
          applyBorder: true,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
