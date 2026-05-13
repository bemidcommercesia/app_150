import 'dart:convert';

import 'package:play_install_referrer/play_install_referrer.dart';
import '../datasource/local/track_source_ns2kd7py_local_datasource.dart';

import '../../domain/repository/track_source_ns2kd7py_repository.dart';

class TrackSourcens2kd7pyRepositoryImpl implements TrackSourcens2kd7pyRepository {
  const TrackSourcens2kd7pyRepositoryImpl({
    required this.androidPlayInstallReferrer,
    required TrackSourcens2kd7pyLocalDatasource localDatasource,
  }) : _localDatasource = localDatasource;

  final PlayInstallReferrer androidPlayInstallReferrer;
  final TrackSourcens2kd7pyLocalDatasource _localDatasource;

  @override
  Future<void> init() async {
    final savedDetails = _localDatasource.load();

    

    if (savedDetails != null && savedDetails.isNotEmpty) {
      return;
    }
    final newDetails = await _getDetails();

    await _localDatasource.save(newDetails);
  }

  Future<String> _getDetails() async {
    
    final det = await PlayInstallReferrer.installReferrer;
    final bytes = utf8.encode(det.toString());
    final encodedDetails = base64UrlEncode(bytes);
    return encodedDetails;
  }




  @override
  String getDetails() {
    final det = _localDatasource.load() ?? 'Default';
    
    return det;
  }
}
