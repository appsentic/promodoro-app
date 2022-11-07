import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:promodoro/app/application/utils/space_utils.dart';
import 'package:promodoro/app/domain/constant/assets.dart';
import 'package:promodoro/app/domain/constant/strings.dart';
import 'package:promodoro/app/presentation/routes/routes.dart';

class EmptyComponent extends StatelessWidget {
  const EmptyComponent({
    this.isOnProjects = false,
    Key? key,
  }) : super(key: key);

  final bool isOnProjects;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      margin: const EdgeInsets.symmetric(
        horizontal: SpaceUtils.verySmallSpace,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.05),
        ),
      ),
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: SpaceUtils.veryLargeSpace,
          ),
          SizedBox(
            child: SvgPicture.asset(AppAssets.noDataSVG),
            height: 150,
          ),
          const SizedBox(
            height: SpaceUtils.commonSpace,
          ),
          const Text(AppStrings.noProjectsFound),
          if (isOnProjects)
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.createProjectPage,
                );
              },
              child: const Text(
                AppStrings.newProject,
              ),
            )
        ],
      ),
    );
  }
}
