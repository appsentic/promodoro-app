import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:promodoro/app/application/store/states/app_state.dart';
import 'package:promodoro/app/application/store/view_models/projects_view_model.dart';
import 'package:promodoro/app/application/utils/space_utils.dart';
import 'package:promodoro/app/domain/constant/strings.dart';
import 'package:promodoro/app/domain/core/validators/validators.dart';
import 'package:promodoro/app/presentation/widgets/app_button.dart';
import 'package:promodoro/app/presentation/widgets/app_input_field.dart';
import 'package:promodoro/app/presentation/widgets/page_header.dart';

class CreateProjectPage extends StatefulWidget {
  const CreateProjectPage({super.key});

  @override
  State<CreateProjectPage> createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController sessionsController = TextEditingController();
  TextEditingController sessionLengthController = TextEditingController();
  TextEditingController shortBreakController = TextEditingController();
  TextEditingController longBreakController = TextEditingController();

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
              const PageHeader(title: AppStrings.createProjectText),
              const SizedBox(height: SpaceUtils.largeSpace),
              Expanded(
                child: StoreConnector<AppState, ProjectsViewModel>(
                  converter: (Store<AppState> store) =>
                      ProjectsViewModel.fromStore(store),
                  builder: (BuildContext context, ProjectsViewModel vm) {
                    return Form(
                      key: formKey,
                      autovalidateMode: autovalidateMode,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                              child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                AppInputField(
                                  controller: nameController,
                                  title: AppStrings.projectNameQuiz,
                                  hintText: AppStrings.youCanWriteAnythingText,
                                  keyboardType: TextInputType.name,
                                  validator: requiredFieldValidator,
                                ),
                                AppInputField(
                                  controller: descriptionController,
                                  title: AppStrings.projectDescQuiz,
                                  hintText: AppStrings.youCanWriteAnythingText,
                                  keyboardType: TextInputType.name,
                                  validator: optionalFieldValidator,
                                ),
                                AppInputField(
                                  controller: sessionsController,
                                  title: AppStrings.projectSessionsQuiz,
                                  hintText: AppStrings.timeGenericText,
                                  keyboardType: TextInputType.number,
                                  validator: requiredFieldValidator,
                                ),
                                AppInputField(
                                  controller: sessionLengthController,
                                  title: AppStrings.projectSessionLengthQuiz,
                                  hintText: AppStrings.timeGenericText,
                                  keyboardType: TextInputType.number,
                                  validator: requiredFieldValidator,
                                ),
                                AppInputField(
                                  controller: shortBreakController,
                                  title: AppStrings.projectShortBreakLength,
                                  hintText: AppStrings.timeGenericText,
                                  keyboardType: TextInputType.number,
                                  validator: requiredFieldValidator,
                                ),
                                AppInputField(
                                  controller: longBreakController,
                                  title: AppStrings.projectLongBreakLength,
                                  hintText: AppStrings.timeGenericText,
                                  keyboardType: TextInputType.number,
                                  validator: requiredFieldValidator,
                                ),
                                const SizedBox(height: SpaceUtils.largeSpace),
                              ],
                            ),
                          )),
                          AppButton(
                            label: AppStrings.createProject,
                            onPressed: () {
                              final bool valid =
                                  formKey.currentState!.validate();

                              if (!valid) {
                                setState(() {
                                  autovalidateMode =
                                      AutovalidateMode.onUserInteraction;
                                });
                              } else {
                                // fields are valid.
                                vm.createProject(
                                  context: context,
                                  focusSessions:
                                      int.parse(sessionsController.text),
                                  longBreakLength:
                                      int.parse(longBreakController.text),
                                  minutesPerSession:
                                      int.parse(sessionLengthController.text),
                                  shortBreakLength:
                                      int.parse(shortBreakController.text),
                                  name: nameController.text,
                                  description: descriptionController.text,
                                );
                              }
                            },
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
