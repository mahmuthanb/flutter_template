import 'package:flutter/material.dart';
import 'package:flutter_template/core/widget/error_widget.dart';
import 'package:flutter_template/features/dashboard/view/dashboard_page.dart';
import 'package:flutter_template/features/users/detail/view/user_detail_page.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const initialPage = '/';
  static const usersPage = '/users';
  static const userDetailsPage = '/userDetails';
  static const welcomePage = '/welcome';
  static const loginPage = '/login';
}

class AppRouter {
  GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();
  GoRouter router() => GoRouter(
        initialLocation: '/',
        navigatorKey: mainNavigatorKey,
        // To see detailed log about router config and errors if having
        debugLogDiagnostics: true,
        errorBuilder: (context, state) => ErrorScreen(
          message: state.error!.message,
        ),
        routes: [
          GoRoute(
            path: '/',
            name: AppRoutes.initialPage,
            builder: (context, state) => const DashboardPage(),
          ),
          /* 
          To specify a path parameter, prefix a path segment with a : character,
          followed by a unique name, for example, :userId. You can access 
          the value of the parameter by accessing it through the GoRouterState 
          object provided to the builder callback:
           */
          GoRoute(
            path: '${AppRoutes.userDetailsPage}/:userId',
            // name: AppRoutes.userDetailsPage,
            builder: (context, state) =>
                UserDetailPage(state.pathParameters['userId']),
          ),
        ],
      );
}
