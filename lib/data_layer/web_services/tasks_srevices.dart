import 'package:dio/dio.dart';

import '../../const.dart';

class TasksWebServices {
  Dio dio = Dio();

  tasksWebSrevices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUri,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 300),
      receiveTimeout: const Duration(seconds: 300),
      sendTimeout: const Duration(seconds: 300),
    );
    dio = Dio(options);
    dio.options.headers = {
        'Authorization': 'Bearer ${tokeen}'
      };
  }

  Future<List<dynamic>> getAllTasks() async {
    try {
      
      final Response response = await dio.get('get/data');

      print('error response ${response.data}');
      return response.data;
    } catch (e) {
      print('CHTCH ${e.toString()}');
      return [];
    }
  }
}
