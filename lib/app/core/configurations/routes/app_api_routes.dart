class AppApiRoutes {
  final String _randomUser;

  static const _baseUrl = 'https://randomuser.me/api/';

  const AppApiRoutes({required String ramdomUser}) : _randomUser = ramdomUser;

  factory AppApiRoutes.api() {
    return const AppApiRoutes(ramdomUser: _baseUrl);
  }

  String getPersonDetails() => _randomUser;
}
