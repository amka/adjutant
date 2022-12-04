import 'package:go_router/go_router.dart';

import 'pages/home_page.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    name: 'home',
    builder: (context, state) => HomePage(),
  ),
]);
