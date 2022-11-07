import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:promodoro/app/application/utils/space_utils.dart';
import 'package:promodoro/app/domain/constant/assets.dart';
import 'package:promodoro/app/domain/constant/enums.dart';
import 'package:promodoro/app/domain/constant/strings.dart';
import 'package:promodoro/app/presentation/routes/routes.dart';
import 'package:promodoro/app/presentation/widgets/app_button.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SpaceUtils.commonSpace,
            vertical: SpaceUtils.largeSpace,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                AnimatedContainer(
                  duration: kThemeAnimationDuration,
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width,
                  child: SvgPicture.asset(
                    isDarkMode
                        ? AppAssets.darkHomeImageSVG
                        : AppAssets.lightHomeImageSVG,
                  ),
                ),
                const SizedBox(height: SpaceUtils.commonSpace),
                Text(
                  AppStrings.timeIsMoney,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: SpaceUtils.smallSpace),
                Text(
                  AppStrings.timeIsMoneyDesc,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: SpaceUtils.veryLargeSpace),
                AppButton(
                  label: AppStrings.startSavingTimeNow,
                  variant: ButtonVariant.filled,
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(
                      AppRoutes.createProjectPage,
                    );
                  },
                ),
                const SizedBox(height: SpaceUtils.commonSpace),
                AppButton(
                  label: AppStrings.notReadyToSaveTime,
                  variant: ButtonVariant.outline,
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(
                      AppRoutes.dashboardPage,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
