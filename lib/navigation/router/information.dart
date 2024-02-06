part of '../router.dart';

class MyRouterInformationParser
    extends RouteInformationParser<MyNavigationState> {
  @override
  Future<MyNavigationState> parseRouteInformation(
      RouteInformation routeInformation) async {
    final url = routeInformation.uri;
    if (url.pathSegments.isEmpty) {
      log('empty');
      return MyNavigationState.auth();
    }
    log('base url: $url');
    if (url.pathSegments.length == 1) {
      final page = url.pathSegments[0];
      log('2, page: $page');
      return page == 'auth'
          ? MyNavigationState.auth()
          : MyNavigationState.home();
    }

    return MyNavigationState.auth();
  }

  @override
  RouteInformation? restoreRouteInformation(MyNavigationState configuration) {
    log('parser');
    if (configuration.home) {
      return RouteInformation(
        uri: Uri.parse('/home'),
      );
    }
    if (configuration.auth) {
      return RouteInformation(
        uri: Uri.parse('/auth'),
      );
    }
    return RouteInformation(uri: Uri.parse('/auth'));
  }
}
