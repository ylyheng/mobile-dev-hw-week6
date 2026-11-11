import 'package:flutter/material.dart';

void main() {
  runApp(const CustomButtonApp());
}

enum ButtonType { primary, secondary, disabled }

enum IconPosition { left, right }

class CustomButtonApp extends StatelessWidget {
  const CustomButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Buttons',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const CustomButtonPage(),
    );
  }
}

class CustomButtonPage extends StatelessWidget {
  const CustomButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom buttons')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomButton(
              label: 'Submit',
              icon: Icons.check,
              iconPosition: IconPosition.left,
              onPressed: () {},
            ),
            const SizedBox(height: 14),
            CustomButton(
              label: 'Time',
              icon: Icons.access_time,
              buttonType: ButtonType.secondary,
              iconPosition: IconPosition.right,
              onPressed: () {},
            ),
            const SizedBox(height: 14),
            const CustomButton(
              label: 'Account',
              icon: Icons.account_tree,
              buttonType: ButtonType.disabled,
              iconPosition: IconPosition.right,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.buttonType = ButtonType.primary,
    this.onPressed,
  });

  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType buttonType;
  final VoidCallback? onPressed;

  Color get _backgroundColor {
    switch (buttonType) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return Colors.grey;
    }
  }

  bool get _isDisabled => buttonType == ButtonType.disabled;

  @override
  Widget build(BuildContext context) {
    final iconWidget = Icon(icon, size: 18);
    final labelWidget = Text(label);
    final children = iconPosition == IconPosition.left
        ? [iconWidget, const SizedBox(width: 8), labelWidget]
        : [labelWidget, const SizedBox(width: 8), iconWidget];

    return ElevatedButton(
      onPressed: _isDisabled ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: _backgroundColor,
        disabledBackgroundColor: _backgroundColor,
        foregroundColor: Colors.white,
        disabledForegroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
}
