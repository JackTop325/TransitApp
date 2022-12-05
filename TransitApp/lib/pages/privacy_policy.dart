import 'package:flutter/material.dart';
import 'package:transit_app/colors.dart';
import 'package:transit_app/widgets/title_dialog.dart';

class PrivacyPolicy extends StatelessWidget {
  PrivacyPolicy({super.key});

  TextStyle heading = TextStyle(fontSize: 18.0, color: ibmGreen['70']);
  TextStyle desc = TextStyle(fontSize: 14.0, color: ibmGray['60']);

  @override
  Widget build(BuildContext context) {
    return TitleDialog(
      title: 'Privacy Policy',
      child: Container(
        height: 600,
        padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Outline',
                style: heading,
              ),
              const SizedBox(height: 8.0),
              const Text(
                'This privacy policy applies to Durham Region Transit and explains how we collect, use, and protect your personal information.',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                'Information Collection',
                style: heading,
              ),
              const SizedBox(height: 8.0),
              Text(
                "We collect personal information from you when you voluntarily provide it to us, such as when you create an a scheduled route. The personal information we collect may include your name, email address, age, and any other information you choose to provide.",
                style: desc,
              ),
              const SizedBox(height: 16.0),
              Text(
                'Information Use',
                style: heading,
              ),
              const SizedBox(height: 8.0),
              Text(
                "We use the personal information we collect to operate, maintain, and improve our services. This may include using your information to process orders, provide support, send communications, and personalize your experience. We will not share your personal information with any third parties without your consent, except as required by law.",
                style: desc,
              ),
              const SizedBox(height: 16.0),
              Text(
                'Information Protection',
                style: heading,
              ),
              const SizedBox(height: 8.0),
              Text(
                "We take reasonable steps to protect your personal information from loss, misuse, and unauthorized access, disclosure, alteration, and destruction. However, no method of transmission over the Internet, or method of electronic storage, is 100% secure, and we cannot guarantee the security of your information.",
                style: desc,
              ),
              const SizedBox(height: 16.0),
              Text(
                'Contact Us',
                style: heading,
              ),
              const SizedBox(height: 8.0),
              Text(
                "If you have any questions or concerns about our privacy policy, please contact us at durhamtransit@drt.ca.",
                style: desc,
              ),
              const SizedBox(height: 8.0),
            ],
          ),
        ),
      ),
    );
  }
}
