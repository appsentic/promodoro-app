import 'package:flutter/material.dart';
import 'package:promodoro/app/application/utils/space_utils.dart';
import 'package:promodoro/app/domain/constant/enums.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.label,
    required this.onPressed,
    this.loading = false,
    this.variant = ButtonVariant.filled,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;
  final bool loading;
  final ButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SpaceUtils.verySmallSpace),
        border: Border.all(
          color: variant == ButtonVariant.outline
              ? Theme.of(context).colorScheme.primary
              : Colors.transparent,
        ),
      ),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(
              horizontal: SpaceUtils.commonSpace,
              vertical: SpaceUtils.commonSpace,
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            variant == ButtonVariant.filled
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.background,
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(width: SpaceUtils.mediumSpace),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: variant == ButtonVariant.outline
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.background,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(width: SpaceUtils.smallSpace),
            SizedBox(
              height: SpaceUtils.mediumSpace,
              width: SpaceUtils.mediumSpace,
              child: loading
                  ? const CircularProgressIndicator.adaptive(
                      strokeWidth: 2,
                    )
                  : const SizedBox.shrink(),
            )
          ],
        ),
      ),
    );
  }
}
