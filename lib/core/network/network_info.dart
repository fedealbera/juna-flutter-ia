import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Stream<List<ConnectivityResult>> get onConnectivityChanged;
}

@LazySingleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  final Connectivity _connectivity;

  NetworkInfoImpl() : _connectivity = Connectivity();

  NetworkInfoImpl.withConnectivity(Connectivity connectivity)
      : _connectivity = connectivity;

  @override
  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      _connectivity.onConnectivityChanged;

  @override
  Future<bool> get isConnected async {
    try {
      final connectivityResult = await _connectivity.checkConnectivity();
      
      // If no network interface is active, return false immediately
      final hasInterface = connectivityResult.any(
        (result) => result != ConnectivityResult.none,
      );

      if (!hasInterface) {
        return false;
      }

      // Check real internet reachability via quick DNS lookup
      final lookupResult = await InternetAddress.lookup('google.com')
          .timeout(const Duration(milliseconds: 2500));
          
      return lookupResult.isNotEmpty && lookupResult[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    } on TimeoutException catch (_) {
      return false;
    } catch (_) {
      return false;
    }
  }
}
