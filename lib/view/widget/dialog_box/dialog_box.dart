import 'dart:developer';

import 'package:simple_bank/data/local_db.dart';
import 'package:simple_bank/utils/import.dart';
import 'package:simple_bank/view/widget/button_widget.dart';
import 'package:simple_bank/view/widget/textfield_widget.dart';

class DialogBox {
  static addWatchListDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (builder) {
        final watchListController = TextEditingController();
        final typeController = TextEditingController();
        final watchListFn = FocusNode();
        final typeFn = FocusNode();
        final formKey = GlobalKey<FormState>();

        return SimpleDialog(
          // titlePadding: EdgeInsets.zero,
          insetPadding: const EdgeInsets.symmetric(horizontal: 30),
          contentPadding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          title: Text(
            "Add WatchList",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: size20,
                ),
          ),
          children: [
            const SizedBox(height: 10),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormWidget(
                      controller: watchListController,
                      focusNode: watchListFn,
                      label: 'Enter watchlist name',
                      prefixIcon: Icons.person,
                      validator: (val) {
                        if (val == null || val == '') {
                          return 'Enter the name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormWidget(
                      controller: typeController,
                      focusNode: typeFn,
                      label: 'Enter type :  ',
                      prefixIcon: Icons.category_sharp,
                      validator: (val) {
                        log(val.toString());
                        if (val == null || val == '') {
                          return 'Enter the type';
                        }
                        return null;
                      },
                    ),
                  ],
                )),
            const SizedBox(height: 10),
            ButtonWidget(
              text: 'Create',
              onTap: () {
                if (formKey.currentState != null &&
                    formKey.currentState!.validate()) {
                  // signUpApiCall();
                  WatchlistModel watchlistModel = WatchlistModel(
                    watchListName: watchListController.text.trim(),
                    watchListType: typeController.text.trim(),
                    scribsCount: 1,
                  );
                  watchList.add(watchlistModel);
                  watchListController.clear();
                  typeController.clear();
                  watchListFn.unfocus();
                  typeFn.unfocus();
                  Navigator.pop(context, "refresh");
                }
              },
            ),
          ],
        );
      },
    );
  }
}
