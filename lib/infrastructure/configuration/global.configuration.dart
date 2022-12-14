class GlobalCIATConfiguration {
  String _apiServer = 'http://192.168.20.249:8081/api';
  String _authServer = 'http://192.168.20.249:8081/oauth';

  static final String CLIENT_ID = "defaultclient@localhost";
  static final String CLIENT_SECRET = "changeme";

  static final GlobalCIATConfiguration controller =
      GlobalCIATConfiguration._intern();

  GlobalCIATConfiguration._intern();

  factory GlobalCIATConfiguration() {
    return controller;
  }

  String get apiServer => this._apiServer;

  String get authServer => this._authServer;
}
