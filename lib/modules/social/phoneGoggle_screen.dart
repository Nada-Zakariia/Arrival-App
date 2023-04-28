import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/social/verifyPhone.dart';
import 'package:graduation_project_app/shared/components/components.dart';
import 'package:graduation_project_app/shared/components/phoneField.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class phoneScreen extends StatefulWidget {
  const phoneScreen({Key? key}) : super(key: key);

  @override
  State<phoneScreen> createState() => _phoneScreenState();
}

class _phoneScreenState extends State<phoneScreen> {
  @override
  Widget build(BuildContext context) {
    late var formKey = GlobalKey<FormState>();
    return BlocConsumer<AuthCubit, AuthStates>(
        listener: (BuildContext context, AuthStates state) {},
        builder: (BuildContext context, AuthStates state) {
          AuthCubit cubit = AuthCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: colortheme.lightGray,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: colortheme.lightPurple,
                ),
                onPressed: () {},
              ),
            ),
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'please enter your mobile number',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: colortheme.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'your number will be stored or used as a contact method after the first time time you register ',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Colors.grey,
                              ),
                        ),
                        SizedBox(
                          height: 34,
                        ),
                        phoneField(controller: cubit.phoneController),
                        SizedBox(
                          height: 20,
                        ),
                        defultButton(
                            background: colortheme.lightPurple,
                            function: () async {
                              if (formKey.currentState!.validate()) {
                                print('enterrrr');
                                cubit.submitPhoneNumber();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => verifyPhoneScreen(
                                            ))));
                                //   await FirebaseAuth.instance.verifyPhoneNumber(
                                //     verificationCompleted:
                                //         (PhoneAuthCredential credential) {
                                //       setState(() {
                                //         print('sucess');
                                //         print(credential);
                                //       });
                                //     },
                                //     verificationFailed: (error) {
                                //       setState(() {
                                //         print(error.toString());
                                //       });
                                //     },
                                //     timeout: const Duration(seconds: 10),
                                //     codeSent:
                                //         (verificationId, forceResendingToken) async {
                                //       await Navigator.push(
                                //           context,
                                //           MaterialPageRoute(
                                //               builder: ((context) => verifyPhoneScreen(
                                //                     verificationId: verificationId,
                                //                   ))));
                                //     },
                                //     codeAutoRetrievalTimeout: (verificationId) {},
                                //   );
                              }
                            },
                            text: 'verify your phone number',
                            context: context)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}