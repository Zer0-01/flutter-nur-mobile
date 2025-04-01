import 'package:dio/dio.dart';
import 'package:flutter_nur_mobile/data/dio_utils.dart';
import 'package:flutter_nur_mobile/data/models/doas.dart';

class DoaRepository {
  DoaRepository();

  Future<void> getDoas() async {
    final Response response = await DioUtils().getRequest("/doa");
    
  }
}
