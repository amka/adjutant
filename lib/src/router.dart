import 'package:go_router/go_router.dart';

import 'pages/home_page.dart';
import 'pages/task_details_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/tasks/:taskId',
      name: 'taskDetails',
      pageBuilder: (context, state) => NoTransitionPage(
        child: TaskDetailsPage(
          taskId: int.tryParse(state.params['taskId'] ?? ''),
        ),
      ),
    )
  ],
);
