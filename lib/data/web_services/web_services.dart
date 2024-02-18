import 'package:dio/dio.dart';
import 'package:understand_api/constants/strings.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      receiveDataWhenStatusError: true,
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('character');
      print(response.data['results']);
      return response.data['results'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}




// var tempData = response.data['results'] as List<dynamic>;

//     return tempData.map((e) => AllCharacters.fromJson(e)).toList();