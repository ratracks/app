import 'package:flutter/material.dart';

enum AppButtonType {
  filled,
  elevated,
}

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final String text;
  final AppButtonType buttonType;

  const AppButton({
    super.key,
    this.isLoading = false,
    this.buttonType = AppButtonType.elevated,
    required this.onPressed,
    required this.text,
  });

  factory AppButton.filled({
    Key? key,
    bool isLoading = false,
    required VoidCallback? onPressed,
    required String text,
  }) {
    return AppButton(
      key: key,
      onPressed: onPressed,
      isLoading: isLoading,
      text: text,
      buttonType: AppButtonType.filled,
    );
  }

  factory AppButton.elevated({
    Key? key,
    bool isLoading = false,
    required VoidCallback? onPressed,
    required String text,
  }) {
    return AppButton(
      key: key,
      onPressed: onPressed,
      isLoading: isLoading,
      text: text,
      buttonType: AppButtonType.elevated,
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (buttonType) {
      case AppButtonType.filled:
        return FilledButton(
          onPressed: isLoading ? null : onPressed,
          child: buildButtonContent(iconColor: Colors.white),
        );
      case AppButtonType.elevated:
        return ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          child: buildButtonContent(),
        );
      default:
        return ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          child: buildButtonContent(),
        );
    }
  }

  Widget buildButtonContent({ Color iconColor = Colors.orange }) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Visibility(
          visible: !isLoading,
          child: Text(text),
        ),
        Visibility(
          visible: isLoading,
          child: SizedBox(
            height: 24,
            width: 24,
            child: CircularProgressIndicator(
              color: iconColor,
              strokeWidth: 3,
            ),
          ),
        ),
      ],
    );
  }
}
