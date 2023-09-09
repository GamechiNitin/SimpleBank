import 'package:simple_bank/utils/import.dart';
import 'dart:developer';

class UpdateUserScreen extends StatefulWidget {
  const UpdateUserScreen({super.key});

  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode mobileNumberFn = FocusNode();
  FocusNode emailFn = FocusNode();
  FocusNode usernameFn = FocusNode();
  FocusNode passwordFn = FocusNode();

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool isTermOfUse = false;
  bool isConfirm = false;
  bool obscureText = true;

  _notify() {
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    // mobileNumberController.text = '+91-97477 84656';
    // emailController.text = 'digitalmoney@dm.com';
    // usernameController.text = 'Nitin Gamechi';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Update User"),
        bottom: PreferredSize(
          preferredSize: Size(
            MediaQuery.of(context).size.width,
            85,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    child: Image.network(
                      "https://picsum.photos/200/300",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "UCC : ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w500),
                              children: [
                                TextSpan(
                                  text: "78***65",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.verified_user_outlined,
                            size: kSmallIconSize,
                            color: kErrorColor,
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Nitin Gamechi",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "ni*********i@gmail.com",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "Supreme",
                    style: Theme.of(context).appBarTheme.titleTextStyle,
                    children: [
                      TextSpan(
                        text: "Plan",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(kBorderRadius),
                          child: Image.network(
                            "https://picsum.photos/200/300",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: kBlackColor.withOpacity(0.4),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(kBorderRadius),
                            bottomRight: Radius.circular(kBorderRadius),
                          ),
                        ),
                        child: Text(
                          "Verify",
                          style: Theme.of(context)
                              .appBarTheme
                              .titleTextStyle
                              ?.copyWith(
                                fontSize: 12,
                                color: kWhiteColor,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(kBorderRadius),
                      child: Image.network(
                        "https://picsum.photos/200/300",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Basic Info',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontSize: 16,
                      ),
                ),
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormWidget(
                      controller: mobileNumberController,
                      focusNode: mobileNumberFn,
                      label: 'Enter Mobile Number',
                      prefixIcon: Icons.smartphone_rounded,
                      validator: (val) {
                        log(val.toString());
                        if (val == null || val == '') {
                          return 'Enter the mobile number';
                        }
                        return null;
                      },
                      onChanged: (val) {
                        log(val);
                        _notify();
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormWidget(
                      controller: emailController,
                      focusNode: emailFn,
                      label: 'Enter email ',
                      prefixIcon: Icons.email,
                      onChanged: (val) {
                        log(val);
                        _notify();
                      },
                      validator: (val) {
                        log(val.toString());
                        if (val == null || val == '') {
                          return 'Enter the email';
                        } else if (!val.contains('@')) {
                          return 'Enter valid the email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormWidget(
                      controller: usernameController,
                      focusNode: usernameFn,
                      label: 'User Name',
                      prefixIcon: Icons.person,
                      maxLines: 1,
                      validator: (val) {
                        if (val == null || val == '') {
                          return 'Create the Password';
                        } else if (val.length < 6) {
                          return 'Create the Six Password';
                        }
                        return null;
                      },
                      onChanged: (val) {
                        log(val);
                        _notify();
                      },
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        // gotoHomePage();
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            margin: const EdgeInsets.only(right: 8, top: 3),
                            child: Checkbox(
                              value: isTermOfUse,
                              side: const BorderSide(
                                color: kPrimaryColor,
                                width: 2,
                              ),
                              onChanged: (onChanged) {
                                log(onChanged.toString());
                                if (onChanged != null) {
                                  isTermOfUse = onChanged;
                                  _notify();
                                }
                              },
                            ),
                          ),
                          Flexible(
                            child: RichText(
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              text: TextSpan(
                                text: "By procedding, I accept Digital",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontSize: 12,
                                    ),
                                children: [
                                  TextSpan(
                                    text: "Money",
                                    style: TextStyle(
                                      fontSize: size12,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: ' T&C ',
                                    style: TextStyle(
                                      fontSize: size12,
                                      color: kBlueColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' and ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontSize: 12,
                                        ),
                                  ),
                                  const TextSpan(
                                    text: ' Privacy Policy.',
                                    style: TextStyle(
                                      fontSize: size12,
                                      color: kBlueColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (isConfirm)
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Verification',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    fontSize: 16,
                                  ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormWidget(
                            controller: passwordController,
                            focusNode: passwordFn,
                            label: 'Enter confimation code',
                            prefixIcon: Icons.password,
                            maxLines: 1,
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ButtonWidget(
                      text: 'Proceed',
                      color: isConfirm ? null : kBlueColor,
                      onTap: () {
                        isConfirm = true;
                        _notify();
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
