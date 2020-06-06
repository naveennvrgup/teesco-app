import 'package:flutter/material.dart';

class FullNameField extends StatelessWidget {
  const FullNameField({
    Key key,
    @required this.fullNameController,
    this.errorMsg,
  }) : super(key: key);

  final TextEditingController fullNameController;
  final String errorMsg;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: fullNameController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        errorText: errorMsg,
        prefixIcon: Icon(Icons.account_circle),
        border: OutlineInputBorder(),
        hintText: "Your name is ...",
        labelText: "Full Name",
        suffixText: '*',

        suffixStyle: TextStyle(color: Colors.red, fontSize: 20),
      ),
    );
  }
}
