import 'package:flutter/material.dart';
import 'package:promodoro/app/application/utils/space_utils.dart';

class AppInputField extends StatelessWidget {
  const AppInputField({
    required this.title,
    this.hintText,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.validator,
    super.key,
  });

  final String? hintText;
  final String title;
  final TextEditingController? controller;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SizedBox(height: SpaceUtils.mediumSpace),
        Text(title),
        const SizedBox(height: SpaceUtils.smallSpace),
        TextFormField(
          keyboardType: keyboardType,
          textCapitalization: TextCapitalization.sentences,
          controller: controller,
          onChanged: onChanged,
          validator: validator,
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodySmall,
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: SpaceUtils.smallSpace),
      ],
    );
  }
}
