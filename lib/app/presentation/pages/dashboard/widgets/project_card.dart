import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:promodoro/app/application/store/actions/projects/delete_project_action.dart';
import 'package:promodoro/app/application/store/actions/projects/set_projects_state_action.dart';
import 'package:promodoro/app/application/utils/helpers.dart';
import 'package:promodoro/app/domain/constant/enums.dart';
import 'package:promodoro/app/domain/constant/strings.dart';
import 'package:promodoro/app/domain/core/entities/project/project_entity.dart';
import 'package:promodoro/app/presentation/routes/routes.dart';
import 'package:promodoro/app/presentation/theme/colors.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    required this.project,
    super.key,
  });

  final ProjectEntity project;

  @override
  Widget build(BuildContext context) {
    Widget getTrailingWidget(bool isCompleted) {
      String text =
          isCompleted ? AppStrings.completedText : AppStrings.pendingText;
      return Text(
        text.toUpperCase(),
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: isCompleted
                  ? AppColors.primaryGreenColor
                  : AppColors.warningColor,
            ),
      );
    }

    return Dismissible(
      key: Key('dismiss-${project.id}'),
      background: Container(color: Colors.red),
      direction: DismissDirection.endToStart,
      onDismissed: (DismissDirection direction) {
        StoreProvider.dispatch(
          context,
          DeleteProjectAction(context: context, id: project.id.toString()),
        );
      },
      child: ListTile(
        onTap: () {
          if (project.isCompleted!) {
            showNotification(
              context,
              notificationStatus: NotificationStatus.warning,
              message: AppStrings.projectIsAlreadyCompleted,
            );
            return;
          }

          StoreProvider.dispatch(
            context,
            SetProjectsStateAction(currentProject: project),
          );
          Navigator.of(context).pushNamed(
            AppRoutes.focusPage,
          );
        },
        title: Text(
          project.name ?? '',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        subtitle: Text(
          project.description ?? '',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        trailing: getTrailingWidget(project.isCompleted ?? false),
      ),
    );
  }
}
