import 'package:clean_arch_tdd_example/core/network/network_info.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'network_info_test.mocks.dart';

@GenerateMocks([Connectivity])
void main() {
  late NetworkInfoImpl networkInfo;
  late MockConnectivity mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockConnectivity();
    networkInfo = NetworkInfoImpl(mockDataConnectionChecker);
  });

  group('isConnected', () {
    test('should forward the call to DataConnectionChecker.hasConnection',
        () async {
      when(mockDataConnectionChecker.checkConnectivity())
          .thenAnswer((_) => Future.value(ConnectivityResult.mobile));

      final result = await networkInfo.isConnected;

      verify(mockDataConnectionChecker.checkConnectivity());
      expect(result, true);
    });
  });
}
