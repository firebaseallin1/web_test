

import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class ConnectionChecker {
  Future<bool> isConnected();
}
class NetworkInfo implements ConnectionChecker {
  final InternetConnectionChecker connectionChecker;

  NetworkInfo(this.connectionChecker);

  @override
  Future<bool> isConnected() async {
    return await connectionChecker.hasConnection;
  }
}