import 'package:get/get.dart';

abstract class ApiHelper {
  Future<Response> postMessage(String msg);
}
