import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:simple_bank/data/local_db.dart';
import 'package:simple_bank/model/wallets_model.dart';
import 'package:simple_bank/utils/enum.dart';
import 'package:simple_bank/utils/helper.dart';
import 'package:simple_bank/utils/import.dart';
import 'package:simple_bank/view/home.dart';
import 'package:simple_bank/view/widget/button_widget.dart';
import 'package:simple_bank/view/widget/dropdown_widget.dart';
import 'package:simple_bank/view/widget/textfield_widget.dart';

class AddScribsPage extends StatefulWidget {
  const AddScribsPage({super.key, required this.watchlistModel});
  final WatchlistModel watchlistModel;

  @override
  State<AddScribsPage> createState() => _AddScribsPageState();
}

class _AddScribsPageState extends State<AddScribsPage> {
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  FocusNode mobileNumberFn = FocusNode();
  FocusNode accountNumberFn = FocusNode();
  FocusNode otpFn = FocusNode();
  FocusNode passwordFn = FocusNode();

  WatchListCategories? selectedWatchListCategories;

  bool isLoading = false;
  bool isTermOfUse = false;
  bool obscureText = true;

  int currentStep = 0;
  int kLength = 3;
  int? cancelStep;
  String? selectedbrand;
  String? accountNumberError;
  String? mobileNumberError;
  String? otpNumberError;
  List<String> brandList = [];
  List<String> wallets = [];

  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();

  _notify() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    passwordFn.unfocus();
    mobileNumberController.clear();
    passwordController.clear();
    mobileNumberFn.unfocus();
    super.dispose();
  }

  void onStepContinue() {
    switch (currentStep) {
      case 0:
        if (selectedWatchListCategories == null) {
          Helper.toast(context, "Select the Scribs type");
        } else if (selectedbrand == null) {
          Helper.toast(
              context, "Select the ${selectedWatchListCategories?.name} type");
        } else {
          incrementStep();
        }
        break;
      case 1:
        if (_formKey2.currentState != null &&
            _formKey2.currentState!.validate()) {
          incrementStep();
        }

        break;
      case 2:
        if (_formKey3.currentState != null &&
            _formKey3.currentState!.validate()) {
          incrementStep();
        }
        break;
      case 3:
        if (currentStep == kLength) {
          if (selectedWatchListCategories?.name ==
              WatchListCategories.wallets.name) {
            WalletModel data = WalletModel(
              balance: "54546.00",
              walletType: selectedbrand,
              userName: "Nitin Gamechi",
              id: int.parse(accountNumberController.text.trim()),
            );
            List<WalletModel> dataList = [];
            dataList = watchList.elementAt(0).walletModel ?? [];
            dataList.add(data);
            watchList.elementAt(0).walletModel = dataList;
            gotoHomePage();
            Helper.toast(context, "Done");
            _notify();
          } else {
            ScribsListModel data = ScribsListModel(
              balance: "54546.00",
              bankName: selectedbrand?.split(" - ").last,
              lastAmount: "325.00",
              percenttage: "10.2",
              shortBankName: selectedbrand?.split(" - ").first,
              type: selectedWatchListCategories?.name,
            );
            List<ScribsListModel> dataList = [];
            dataList = watchList.elementAt(0).scribsList ?? [];
            dataList.add(data);
            watchList.elementAt(0).scribsList = dataList;
            // Navigator.pop(context);
            gotoHomePage();
            Helper.toast(context, "Done");
            _notify();
          }
        }
        break;
      default:
    }
  }

  void incrementStep() {
    if (currentStep < kLength) {
      currentStep += 1;
      _notify();
    }
  }

  void onCancelStep() {
    if (currentStep != 0) {
      currentStep -= 1;
      _notify();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.watchlistModel.watchListName ?? "",
              style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                    fontSize: 12,
                  ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.watchlistModel.scribsCount.toString(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  height: 4,
                  width: 4,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: kPrimaryColor,
                  ),
                ),
                Text(
                  widget.watchlistModel.watchListType ?? "",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.info_rounded,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          Text(
            "Add Scribs",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: size20,
                ),
          ),
          Theme(
            data: Theme.of(context).brightness == Brightness.light
                ? AppTheme.lightTheme.copyWith(
                    colorScheme: AppTheme.lightTheme.colorScheme.copyWith(
                      primary: kBlackColor,
                      background: kRedColor,
                      secondary: kBlackColor,
                    ),
                  )
                : AppTheme.darkTheme.copyWith(
                    colorScheme: AppTheme.darkTheme.colorScheme.copyWith(
                      primary: kPrimaryColor,
                      background: kRedColor,
                      secondary: kWhiteColor,
                    ),
                  ),
            child: Stepper(
              type: StepperType.vertical,
              currentStep: currentStep,
              onStepContinue: onStepContinue,
              onStepCancel: onCancelStep,
              // margin: EdgeInsets.zero,

              controlsBuilder: (context, details) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (currentStep <= kLength)
                        Flexible(
                          child: ButtonWidget(
                            text: currentStep == kLength ? "Submit" : "Next",
                            onTap: onStepContinue,
                            margin: EdgeInsets.zero,
                          ),
                        ),
                      if (currentStep != 0 && currentStep < kLength)
                        const SizedBox(width: 16),
                      if (currentStep != 0)
                        TextButton(
                          onPressed: onCancelStep,
                          child: const Text("Back"),
                        )
                    ],
                  ),
                );
              },
              steps: [
                Step(
                  title: Text(
                    "Scribs Type",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  isActive: currentStep >= 0,
                  state: currentStep >= 0
                      ? StepState.complete
                      : StepState.disabled,
                  content: Column(
                    children: [
                      DropdownWidget(
                        hint: "Select Categorires",
                        icon: Icons.corporate_fare_rounded,
                        value: selectedWatchListCategories,
                        items: WatchListCategories.values
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e.name.toUpperCase(),
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .inputDecorationTheme
                                      .labelStyle
                                      ?.copyWith(fontSize: size12),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (onChanged) async {
                          selectedWatchListCategories = onChanged;
                          if (selectedWatchListCategories?.name ==
                              WatchListCategories.wallets.name) {
                            selectedbrand = null;
                            brandList.clear();
                            brandList.addAll(
                                WalletsEnum.values.map((e) => e.formatedName));
                          }
                          if (selectedWatchListCategories?.name ==
                              WatchListCategories.bank.name) {
                            String path = "assets/bank.json";
                            final res = await rootBundle.loadString(path);
                            final Map<String, dynamic> dataList =
                                await jsonDecode(res);

                            selectedbrand = null;
                            brandList.clear();
                            dataList.forEach((key, value) {
                              brandList.add("$value - $key");
                            });
                          }
                          _notify();
                        },
                      ),
                      if (brandList.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: DropdownWidget(
                            hint: "Select ${selectedWatchListCategories?.name}",
                            icon: Icons.corporate_fare_rounded,
                            value: selectedbrand,
                            items: brandList
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(
                                      e,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .inputDecorationTheme
                                          .labelStyle
                                          ?.copyWith(fontSize: size12),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (onChanged) {
                              selectedbrand = onChanged;
                              _notify();
                            },
                          ),
                        ),
                    ],
                  ),
                ),
                Step(
                  title: Text(
                    "Account Info",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  isActive: currentStep >= 1,
                  state: currentStep >= 1
                      ? StepState.complete
                      : StepState.disabled,
                  content: Form(
                    key: _formKey2,
                    child: Column(
                      children: [
                        TextFormWidget(
                          controller: accountNumberController,
                          focusNode: accountNumberFn,
                          label: 'Enter Account Number',
                          prefixIcon: Icons.account_balance,
                          keyboardType: TextInputType.number,
                          errorText: accountNumberError,
                          maxLength: 12,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              accountNumberError =
                                  AppString.mEnterAccountNumber;
                              return accountNumberError;
                            } else if (val.length < 12) {
                              accountNumberError =
                                  AppString.mEnter12DigitAccountNumber;
                              return accountNumberError;
                            } else {
                              accountNumberError = null;
                              return accountNumberError;
                            }
                          },
                          onChanged: (val) {
                            if (val.isEmpty) {
                              accountNumberError =
                                  AppString.mEnterAccountNumber;
                            } else if (val.length < 12) {
                              accountNumberError =
                                  AppString.mEnter12DigitAccountNumber;
                            } else {
                              accountNumberError = null;
                            }
                            _notify();
                          },
                          onEditingComplete: () {
                            if (accountNumberController.text.isEmpty) {
                              accountNumberError =
                                  AppString.mEnterAccountNumber;
                            } else if (accountNumberController.text.length <
                                12) {
                              accountNumberError =
                                  AppString.mEnter12DigitAccountNumber;
                            } else {
                              accountNumberError = null;
                            }
                            _notify();
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormWidget(
                          controller: mobileNumberController,
                          focusNode: mobileNumberFn,
                          label: 'Enter Mobile Number',
                          prefixIcon: Icons.smartphone_rounded,
                          keyboardType: TextInputType.number,
                          errorText: mobileNumberError,
                          maxLength: 10,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return mobileNumberError =
                                  AppString.mEnterMobileNumber;
                            } else if (val.length < 10) {
                              return mobileNumberError =
                                  AppString.mEnter10DigitMobileNumber;
                            } else {
                              return mobileNumberError = null;
                            }
                          },
                          onChanged: (val) {
                            if (val.isEmpty) {
                              mobileNumberError = AppString.mEnterMobileNumber;
                            } else if (val.length < 10) {
                              mobileNumberError =
                                  AppString.mEnter10DigitMobileNumber;
                            } else {
                              mobileNumberError = null;
                            }
                            _notify();
                          },
                          onEditingComplete: () {
                            if (mobileNumberController.text.isEmpty) {
                              mobileNumberError = AppString.mEnterMobileNumber;
                            } else if (mobileNumberController.text.length <
                                10) {
                              mobileNumberError =
                                  AppString.mEnter10DigitMobileNumber;
                            } else {
                              mobileNumberError = null;
                            }
                            _notify();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: Text(
                    "Verify Account",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  isActive: currentStep >= 2,
                  state: currentStep >= 2
                      ? StepState.complete
                      : StepState.disabled,
                  content: Form(
                    key: _formKey3,
                    child: TextFormWidget(
                      controller: otpController,
                      focusNode: otpFn,
                      label: 'Enter otp ',
                      keyboardType: TextInputType.number,
                      prefixIcon: Icons.password,
                      maxLength: 6,
                      errorText: otpNumberError,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return otpNumberError = AppString.mOTPNumber;
                        } else if (val.length < 6) {
                          return otpNumberError =
                              AppString.mEnter6DigitOTPNumber;
                        } else {
                          return otpNumberError = null;
                        }
                      },
                      onChanged: (val) {
                        if (val.isEmpty) {
                          otpNumberError = AppString.mOTPNumber;
                        } else if (val.length < 6) {
                          otpNumberError = AppString.mEnter6DigitOTPNumber;
                        } else {
                          otpNumberError = null;
                        }
                        _notify();
                      },
                      onEditingComplete: () {
                        if (otpController.text.isEmpty) {
                          otpNumberError = AppString.mOTPNumber;
                        } else if (otpController.text.length < 6) {
                          otpNumberError = AppString.mEnter6DigitOTPNumber;
                        } else {
                          otpNumberError = null;
                        }
                        _notify();
                      },
                    ),
                  ),
                ),
                Step(
                  title: Text(
                    "Submit",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  isActive: currentStep >= 3,
                  state: currentStep >= 3
                      ? StepState.complete
                      : StepState.disabled,
                  content: const SizedBox(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  gotoHomePage() {
    return Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
      (route) => false,
    );
  }
}
