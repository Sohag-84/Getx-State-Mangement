abstract class BaseApiServices {
  Future<dynamic> getApi({required String url});
  Future<dynamic> postApi({required dynamic data, required String url});
}
