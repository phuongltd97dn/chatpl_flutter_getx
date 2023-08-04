import 'package:chat_pl/app/common/constants.dart';
import 'package:chat_pl/app/data/interceptor.dart';
import 'package:chat_pl/app/data/models/message_model/message_request_model.dart';
import 'package:chat_pl/app/data/repository/api_helper.dart';
import 'package:get/get.dart';

class ApiHelperImpl extends GetConnect implements ApiHelper {
  @override
  void onInit() {
    httpClient.baseUrl = Constants.baseUrl;
    httpClient.timeout = Constants.timeout;
    addRequestModifier();

    httpClient.addResponseModifier(
      (request, response) => interceptor(httpClient, request, response),
    );
  }

  void addRequestModifier() {
    httpClient.addRequestModifier<dynamic>((request) {
      request.headers['Authorization'] = 'Bearer ${Constants.apiKey}';
      request.headers['Content-Type'] = 'application/json';

      printInfo(
        info: 'REQUEST ║ ${request.method.toUpperCase()}\n'
            'url: ${request.url}\n'
            'Headers: ${request.headers}\n'
            'Body: ${request.files?.toString() ?? ''}\n',
      );

      return request;
    });
  }

  @override
  Future<Response> postMessage(String msg) {
    final MessageRequest messageRequest = MessageRequest(
      model: 'gpt-3.5-turbo',
      messages: List.from({
        {'role': 'user', 'content': msg}
      }),
    );

    return post("/chat/completions", messageRequest.toJson());
  }
}
