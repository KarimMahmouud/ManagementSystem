import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../model/tasks_data.dart';

part 'tasks_srevices.g.dart';

@RestApi(
    baseUrl:
        'https://soc-opportunity-system-coaches.trycloudflare.com/karimTestAPI/public/api')
abstract class TasksWebServices {
  factory TasksWebServices(Dio dio, {String? baseUrl}) = _TasksWebServices;

  @GET('/Get/Data')
  Future<List<Tasks>> getTasks(@Header('Authorization') String token);

  @POST('/Add/Task')
  Future<Tasks> creatNewTask(
      @Body() Tasks newTask, @Header('Authorization') String token);
}
