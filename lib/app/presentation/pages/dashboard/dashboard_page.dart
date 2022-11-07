import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:promodoro/app/application/store/actions/projects/fetch_projects_action.dart';
import 'package:promodoro/app/application/store/states/app_state.dart';
import 'package:promodoro/app/application/store/view_models/dashboard_view_model.dart';
import 'package:promodoro/app/application/utils/space_utils.dart';
import 'package:promodoro/app/domain/constant/strings.dart';
import 'package:promodoro/app/domain/core/entities/project/project_entity.dart';
import 'package:promodoro/app/presentation/pages/dashboard/widgets/project_card.dart';
import 'package:promodoro/app/presentation/pages/dashboard/widgets/statistic_item.dart';
import 'package:promodoro/app/presentation/routes/routes.dart';
import 'package:promodoro/app/presentation/widgets/empty_component.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SpaceUtils.commonSpace,
            vertical: SpaceUtils.smallSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: SpaceUtils.largeSpace),
              Expanded(
                child: SingleChildScrollView(
                  child: StoreConnector<AppState, DashboardViewModel>(
                    converter: (Store<AppState> store) =>
                        DashboardViewModel.fromStore(store),
                    onInit: (Store<AppState> store) {
                      store.dispatch(
                        FetchProjectsAction(context: context),
                      );
                    },
                    builder: (BuildContext context, DashboardViewModel vm) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // dashboard statistics
                          Text(
                            AppStrings.statisticsText,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: SpaceUtils.smallSpace),
                          GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1.5,
                            children: <Widget>[
                              StatisticItem(
                                title: AppStrings.completedProjectsText,
                                isCompleted: true,
                                count: vm.projects
                                    .where(
                                      (ProjectEntity project) =>
                                          project.isCompleted != null &&
                                          project.isCompleted == true,
                                    )
                                    .length,
                              ),
                              StatisticItem(
                                title: AppStrings.pendingProjectsText,
                                isCompleted: false,
                                count: vm.projects
                                    .where(
                                      (ProjectEntity project) =>
                                          project.isCompleted != null &&
                                          project.isCompleted == false,
                                    )
                                    .length,
                              ),
                            ],
                          ),
                          const SizedBox(height: SpaceUtils.largeSpace),

                          // project listing
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  AppStrings.allProjects,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
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
                          const SizedBox(height: SpaceUtils.smallSpace),
                          Builder(
                            builder: (BuildContext context) {
                              if (vm.projects.isEmpty) {
                                return const EmptyComponent(
                                  isOnProjects: true,
                                );
                              }

                              return ListView.builder(
                                itemCount: vm.projects.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  final ProjectEntity project =
                                      vm.projects[index];
                                  return ProjectCard(project: project);
                                },
                              );
                            },
                          )
                        ],
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
