class AppStrings {
  static const String dbName = String.fromEnvironment(
    'DB_NAME',
    defaultValue: 'com.appsentic.promodoro.db.s3l',
  );
  static const String projectsTableName = 'projects';

  static const String appTitle = 'Promodoro App';
  static const String appVersion = String.fromEnvironment(
    'APP_VERSION',
    defaultValue: '1.0.0',
  );
  static const String timeIsMoney = 'Time is money!';
  static const String timeIsMoneyDesc =
      'Time is money. The more you save time, the more money you save! Learn to save time using the promodoro planner. ';
  static const String startSavingTimeNow = 'Start Saving time NOW';
  static const String notReadyToSaveTime = 'I don’t want to save time now';
  static const String createProjectText = 'Create a project';
  static const String projectNameQuiz = 'What is the name of your project?';
  static const String projectDescQuiz =
      'Provide a brief description (Optional)';
  static const String projectSessionsQuiz =
      'How many focus sessions would you prefer?';
  static const String projectSessionLengthQuiz =
      'How long should each session last?';

  static const String projectShortBreakLength =
      'How long should one short break take? (in minutes)';
  static const String projectLongBreakLength =
      'How long should one long break take? (in minutes)';
  static const String youCanWriteAnythingText =
      'You can write anything here...';
  static const String timeGenericText = 'e.g 10';
  static const String createProject = 'Create Project';
  static const String itsTimeToFocus = 'It\'s time to focus!';
  static const String stopTracking = 'Stop Tracking';
  static const String takeABreak = 'Take a break';
  static const String dashboardText = 'My Dashboard';
  static const String statisticsText = 'My Statistics';
  static const String allProjects = 'All Projects';
  static const String newProject = 'Add a project';
  static const String noProjectText = 'No project';
  static const String noProjectDescText = 'No project description';
  static const String noProjectsFound = 'No projects found';
  static const String completedProjectsText = 'Completed Projects';
  static const String pendingProjectsText = 'Pending Projects';
  static const String pendingText = 'Pending';
  static const String completedText = 'Completed';
  static String getRoundsText({
    int round = 1,
    int totalRounds = 1,
  }) =>
      'Round $round of $totalRounds';

  static const String unknownError =
      'We were unable to process your action at the moment. Please try again later';
  static const String genericSuccess = 'Success! Your action was successful!';
  static const String projectIsAlreadyCompleted =
      'This project is already completed';

  static const String congratsText = 'Congratulations!';
  static const String congratsDescText =
      'You have successfully completed your project!';
  static const String breakTitle = 'You can take a long break now';
  static String breakDesc(int time) => 'Your break will last for $time minutes';
}
