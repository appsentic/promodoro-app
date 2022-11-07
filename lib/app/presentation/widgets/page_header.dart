import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({
    required this.title,
    super.key,
    this.onBackTapped,
    this.showBack = true,
  });

  final VoidCallback? onBackTapped;
  final String title;
  final bool showBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        if (showBack)
          IconButton(
            onPressed: onBackTapped ?? () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.close,
            ),
          )
      ],
    );
  }
}
