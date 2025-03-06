import 'package:auto_route/auto_route.dart';
import 'package:flutter_nur_mobile/routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: DoaSetupRoute.page, initial: true),
      ];
}
