import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}
class NetworkInfoImp implements NetworkInfo{
  final InternetConnectionChecker connectivity;
  NetworkInfoImp(this.connectivity);
  @override
  // TODO: implement isConnected
  Future<bool> get isConnected =>  connectivity.hasConnection;

}