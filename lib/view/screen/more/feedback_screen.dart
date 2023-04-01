import 'dart:developer';

import 'package:simple_bank/utils/assets.dart';
import 'package:simple_bank/utils/import.dart';
import 'package:simple_bank/view/screen/authentication/signup_screen.dart';
import 'package:simple_bank/view/home.dart';
import 'package:simple_bank/view/widget/button_widget.dart';
import 'package:simple_bank/view/widget/textfield_widget.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController userIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode userIdFn = FocusNode();
  FocusNode passwordFn = FocusNode();
  FocusNode emailFn = FocusNode();

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool obscureText = true;

  _changeLoading(bool loading) {
    isLoading = loading;
    _notify();
  }

  _notify() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    passwordFn.unfocus();
    userIdController.clear();
    passwordController.clear();
    userIdFn.unfocus();
    super.dispose();
  }

  void gotoHomeScreen() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
      (route) => false,
    );
  }

  void gotoSignUpPage() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUpPage(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        // centerTitle: true,
        // title: const DMWidget(textAlign: TextAlign.center),

        title: const Text("Feedback"),
      ),
      body: ListView(
        padding:
            const EdgeInsets.only(top: kToolbarHeight, left: 20, right: 20),
        children: [
          Text(
            "Give Feedback",
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
          Text(
            'Tell us all about your experience? What new Feature you want to see. Also you can share issue or query facing using the app.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 12,
                  color: Theme.of(context).disabledColor,
                ),
          ),
          const SizedBox(
            height: 50,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormWidget(
                  controller: userIdController,
                  focusNode: userIdFn,
                  label: '78***65',
                  prefixIcon: Icons.person,
                  validator: (val) {
                    log(val.toString());
                    if (val == null || val == '') {
                      return 'Enter the UCC Id';
                    }
                    return null;
                  },
                  onChanged: (val) {},
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
                  contentPadding:
                      const EdgeInsets.only(left: 10, right: 20, top: 10),
                  minLines: 4,
                  maxLines: 5,
                  controller: userIdController,
                  focusNode: userIdFn,
                  label: 'Write message here...',
                  // prefixIcon: Icons.feedback,
                  validator: (val) {
                    log(val.toString());
                    if (val == null || val == '') {
                      return 'Enter the UCC Id';
                    }
                    return null;
                  },
                  onChanged: (val) {},
                ),
                const SizedBox(height: 20),
                ButtonWidget(
                  text: 'Submit',
                  onTap: () {
                    if (_formKey.currentState != null &&
                        _formKey.currentState!.validate()) {
                      // loginApiCall();
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
