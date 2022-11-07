import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:promodoro/app/application/store/states/app_state.dart';
import 'package:promodoro/app/application/store/view_models/projects_view_model.dart';
import 'package:promodoro/app/application/utils/space_utils.dart';
import 'package:promodoro/app/domain/constant/enums.dart';
import 'package:promodoro/app/domain/constant/strings.dart';
import 'package:promodoro/app/presentation/pages/timer/widgets/timer_preview.dart';
import 'package:promodoro/app/presentation/widgets/app_button.dart';
import 'package:promodoro/app/presentation/widgets/page_header.dart';

class FocusPage extends StatelessWidget {
  const FocusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SpaceUtils.commonSpace,
            vertical: SpaceUtils.smallSpace,
          ),
          child: StoreConnector<AppState, ProjectsViewModel>(
            converter: (Store<AppState> store) =>
                ProjectsViewModel.fromStore(store),
            builder: (BuildContext context, ProjectsViewModel vm) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const PageHeader(
                    title: AppStrings.itsTimeToFocus,
                  ),
                  const Spacer(),
                  TimerPreview(
                    project: vm.currentProject!,
                  ),
                  const Spacer(),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: AppButton(
                          variant: ButtonVariant.outline,
                          label: AppStrings.stopTracking,
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: SpaceUtils.smallSpace),
                      Expanded(
                        child: AppButton(
                          label: AppStrings.takeABreak,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: SpaceUtils.largeSpace),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
