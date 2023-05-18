import 'package:simple_bank/utils/import.dart';
import 'package:simple_bank/view/screen/watchlist/watchlist_details/account_tab/component/account_card_component.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const SizedBox(height: 16),
        AccountCardComponent(
          name: "Basic Information",
          date: "01 June 1996 - 17:05:30",
          colors: [kLightTealColor, kLightGreenColor],
          children: const [
            AccountTileWidget(l1: "Name", l2: "Gamechi Nitin Arvindbahi"),
            AccountTileWidget(l1: "Gender", l2: "Male"),
            AccountTileWidget(l1: "DOB", l2: "01 June 1996 (27 Age)"),
            AccountTileWidget(l1: "Email", l2: "nitingamechi@gmail.com"),
            AccountTileWidget(l1: "Mobile No.", l2: "+91 7984744697"),
            AccountTileWidget(l1: "Location", l2: "Vasad - 3883006"),
            AccountTileWidget(l1: "Marritial", l2: "Single"),
            AccountTileWidget(
              l1: "Address",
              l2: "ShivShakti Farm Vasad - 3883006",
              div: false,
            ),
          ],
        ),
        const SizedBox(height: 16),
        AccountCardComponent(
          name: "Account Information",
          date: "01 June 1996 - 17:05:30",
          colors: [kBlueAccentColor, kLightBlueAccentColor],
          children: const [
            AccountTileWidget(l1: "Account No.", l2: "57942357954"),
            AccountTileWidget(l1: "Account Type", l2: "Regular Saving Account"),
            AccountTileWidget(l1: "Customer Id", l2: "45846578"),
            AccountTileWidget(l1: "MICR", l2: "8787555"),
            AccountTileWidget(l1: "IFSC", l2: "SBI000555"),
            AccountTileWidget(l1: "Minimun Balance", l2: "2000"),
            AccountTileWidget(l1: "Minor", l2: "No"),
            AccountTileWidget(
                l1: "A/C open date", l2: "14/09/2016", div: false),
          ],
        ),
        const SizedBox(height: 16),
        AccountCardComponent(
          name: "Link Details",
          date: "01 June 1996 - 17:05:30",
          colors: [kPinkAccentColor, kRedAccentColor, kPinkAccentColor],
          children: const [
            AccountTileWidget(l1: "Addhar", l2: "75XX XXXX XX58"),
            AccountTileWidget(l1: "PAN", l2: "BS66D99FD3"),
            AccountTileWidget(l1: "Mobile No.", l2: "+91 7984744697"),
            AccountTileWidget(
                l1: "ATM & Debit Card", l2: "79XX XXXX XXXX XX97"),
            AccountTileWidget(
                l1: "Joint Holder Name", l2: "Gamechi Nitin Arvindbahi"),
            AccountTileWidget(
              l1: "Nomination",
              l2: "Not Registered",
              div: false,
            ),
          ],
        ),
        const SizedBox(height: 16),
        AccountCardComponent(
          name: "Branch Details",
          date: "01 June 1996 - 17:05:30",
          colors: [ktealAccentColor, ktealColor],
          children: const [
            AccountTileWidget(l1: "Branch Name", l2: "Vasad"),
            AccountTileWidget(l1: "Branch Code", l2: "3308"),
            AccountTileWidget(l1: "Branch Tel No.", l2: "235523"),
            AccountTileWidget(l1: "Email", l2: "sbi.45654@sbi.com"),
            AccountTileWidget(l1: "Current Manager Name", l2: "Ms Virat Patel"),
            AccountTileWidget(l1: "Manager No.", l2: "+91 7984744697"),
            AccountTileWidget(
                l1: "Branch Address",
                l2: "Ground Floor, Yogiraj Avvenue, Opp Payal Cinema, Vasad-Borsad Road Dist-Anand",
                div: false),
          ],
        ),
        const SizedBox(height: 16),
        AccountCardComponent(
          name: "Headquater",
          date: "01 June 1996 - 17:05:30",
          colors: [kpurpleAccentColor, kdeepPurpleAccentColor],
          children: const [
            AccountTileWidget(l1: "Chairman", l2: "Virat Patel"),
            AccountTileWidget(l1: "Website", l2: "https://sbi.com"),
            AccountTileWidget(l1: "Email", l2: "contact@sbi.com"),
            AccountTileWidget(l1: "Headquater", l2: "Mumbai"),
            AccountTileWidget(l1: "Zone office", l2: "8568"),
            AccountTileWidget(l1: "Head office", l2: "24"),
            AccountTileWidget(l1: "Helpline", l2: "1800 5445 4751"),
            AccountTileWidget(
                l1: "Address",
                l2: "Jio garden, Gatokopar West Mumbai",
                div: false),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
