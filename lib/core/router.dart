import 'package:flutter_template/dashboard/dashboard.dart';
import 'package:flutter_template/users/detail/view/user_detail_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router() => GoRouter(
        initialLocation: '/wasd',

        // errorBuilder: (context, state) => ,
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const DashboardPage(),
          ),
          /* 
          To specify a path parameter, prefix a path segment with a : character,
          followed by a unique name, for example, :userId. You can access 
          the value of the parameter by accessing it through the GoRouterState 
          object provided to the builder callback:
           */
          GoRoute(
            path: '/users/:userId',
            builder: (context, state) =>
                UserDetailPage(state.pathParameters['userId']),
          ),
          /*
          Similarly, to access a query string parameter 
          (the part of URL after the ?), use GoRouterState.
          For example, a URL path such as /users?userId=admins 
          can read the filter parameter: 
          */
          GoRoute(
            path: '/users',
            builder: (context, state) =>
                UserDetailPage(state.uri.queryParameters['userId']),
          ),
        ],
      );
}
