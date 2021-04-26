import 'package:chopper/chopper.dart';

part 'api_service.chopper.dart';

@ChopperApi(baseUrl: 'https://reqres.in/api')
abstract class ApiService extends ChopperService {
  @Get(path: '/users')
  Future<Response> getListUser();

  static ApiService create() {
    final _client = ChopperClient(
      converter: JsonConverter(),
      errorConverter: JsonConverter(),
      interceptors: [HttpLoggingInterceptor()],
      services: [
        _$ApiService(),
      ],
    );

    return _$ApiService(_client);
  }
}
