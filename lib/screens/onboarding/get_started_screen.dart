import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:insight/consts/enums.dart';
import 'package:insight/consts/global_methods.dart';
import 'package:insight/providers/user_provider.dart';
import 'package:insight/screens/bottom_navigation.dart';
import 'package:insight/widgets/text_form_box.dart';
import 'package:provider/provider.dart';
import '../../consts/values.dart';
import '../../widgets/status_container.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  int selected = -1;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool addingUser = false;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(23, 70, 23, 0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Get Started Now',
                  style: theme.textTheme.displayLarge,
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              Text(
                'It\'s free to join and gain full access to thousands of exciting investment opportunities',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 36,
              ),
              TextFormBox(
                controller: nameController,
                onChanged: (val) {},
                labelText: 'Enter name here',
                validator: (String? value) {
                  if (value!.trim().isEmpty) {
                    return 'Your name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 18,
              ),
              TextFormBox(
                textInputType: TextInputType.number,
                controller: phoneController,
                onChanged: (val) {},
                labelText: 'Enter phone number here',
                validator: (String? value) {
                  if (value!.trim().isEmpty) {
                    return 'Your phone number is required';
                  }
                  if (value.length != 10) {
                    return 'Enter a valid phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 18,
              ),
              ...List.generate(
                2,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: UserStatusContainer(
                    selected: selected,
                    theme: theme,
                    imageUrl: index == 0
                        ? 'assets/images/money.png'
                        : 'assets/images/person.png',
                    label: index == 0
                        ? 'I\'m an investor, looking to invest'
                        : 'I\'m an entrepreneur, looking for funds ',
                    onTap: index == 0
                        ? () => setState(() {
                              selected = 0;
                              user.setUserStatus(UserStatus.investor);

                              Hive.box('user').put(kuserStatus, 'investor');
                            })
                        : () => setState(() {
                              selected = 1;
                              user.setUserStatus(UserStatus.businessOwner);
                              Hive.box('user')
                                  .put(kuserStatus, 'business_owner');
                            }),
                    index: index,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              addingUser
                  ? const Center(
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : GlobalMethods.materialButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          user.setUser(
                            nameController.text,
                            int.parse(phoneController.text),
                          );
                          setState(() {
                            addingUser = true;
                          });
                          user.addUser().then((value) {
                            setState(() {
                              addingUser = false;
                            });
                            Hive.box('user').put(hasSignUp, true);
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              NavigationScreen.routeName,
                              (route) => false,
                            );
                          });
                        }
                      },
                      child: 'CONTINUE',
                      theme: theme,
                    ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
