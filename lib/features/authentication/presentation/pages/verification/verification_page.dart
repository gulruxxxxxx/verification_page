import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';
import '../../../../../assets/constants/colors.dart';
import '../../../../../assets/constants/icons.dart';
import '../../../../home/home.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  PinTheme defaultPinTheme = PinTheme(
    width: 51,
    height: 55,
    textStyle: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      color: textFieldBackgroundColor2,
      border: Border.all(
        color: Colors.blueAccent.withOpacity(0.1),
      ),
      borderRadius: BorderRadius.circular(8),
    ),
  );
  final TextEditingController pinPutController = TextEditingController();
  bool isPinPutValid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Email verification'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [const Gap(36),
              Image.asset(
                AppIcons.profilePicture,
                height: 130,
                width: 130,
              ),
              const Gap(30),

              const Text(
                'Please enter the 4 digital code that send\nto your email address',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const Gap(12),
              Pinput(
                length: 4,
                controller: pinPutController,
                enableSuggestions: isPinPutValid,
                defaultPinTheme: isPinPutValid
                    ? defaultPinTheme.copyBorderWith(
                    border: Border.all(
                      color: Colors.green,
                    ))
                    : defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(
                    color: Colors.blueAccent,
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(
                      color: Colors.red
                  ),
                ),
                onChanged: (value) {
                  if (value == '1111') {
                    isPinPutValid = true;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  const HomeScreen()),
                    );

                    setState(() {});
                  } else {
                    isPinPutValid = false;

                    setState(() {});
                  }
                },
              )
            ],
          ),
        ));
  }
}