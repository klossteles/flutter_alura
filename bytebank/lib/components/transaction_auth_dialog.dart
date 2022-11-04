import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatefulWidget {
  final Function(String password) onConfirm;

  const TransactionAuthDialog({
    super.key,
    required this.onConfirm,
  });

  @override
  _TransactionAuthDialogState createState() => _TransactionAuthDialogState();
}

class _TransactionAuthDialogState extends State<TransactionAuthDialog> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Authenticate'),
      content: TextField(
        controller: _passwordController,
        obscureText: true,
        maxLength: 4,
        decoration: const InputDecoration(border: OutlineInputBorder()),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 64, letterSpacing: 24),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onConfirm(_passwordController.text);
            Navigator.pop(context);
          },
          child: const Text('Confirm'),
        ),
      ],
    );
  }
}
