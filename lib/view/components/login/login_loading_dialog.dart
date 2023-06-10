import 'package:flutter/material.dart';

class LoginLoadingDialog extends StatelessWidget {
  const LoginLoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
      ),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
