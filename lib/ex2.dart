
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Custom Buttons')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const CustomButton(
                label: 'Submit',
                icon: Icons.check,
              ),
              const SizedBox(height: 15),

              const CustomButton(
                label: 'Time',
                icon: Icons.access_time,
                buttonType: ButtonType.secondary,
                iconPosition: IconPosition.right,
              ),
              const SizedBox(height: 15),

              const CustomButton(
                label: 'Account',
                icon: Icons.account_tree,
                buttonType: ButtonType.disabled,
                iconPosition: IconPosition.right,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

enum ButtonType { primary, secondary, disabled }

enum IconPosition { left, right }

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.buttonType = ButtonType.primary,
  });

  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType buttonType;

  @override
  Widget build(BuildContext context) {

    Color color;

    switch (buttonType) {
      case ButtonType.primary:
        color = Colors.blue;
        break;

      case ButtonType.secondary:
        color = Colors.green;
        break;

      case ButtonType.disabled:
        color = Colors.grey;
        break;
    }

    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        onPressed: buttonType == ButtonType.disabled ? null : () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconPosition == IconPosition.left)
              Icon(icon),

            const SizedBox(width: 8),

            Text(label),

            if (iconPosition == IconPosition.right)
              Icon(icon),
          ],
        ),
      ),
    );
  }
}
