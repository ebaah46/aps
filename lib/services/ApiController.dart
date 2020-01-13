import 'package:aps_final/models/ApiData.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class ApiController {
  Response response;
  Dio dio;

  // Constructor
  ApiController() {
    dio = Dio();
  }

  /*
   *  Responds with 1 if successful and 0 if unsuccessful
   */

  // Future<Response<dynamic>> login(phone, password) async {
  //   FormData formData = FormData.from({'phone': phone, 'password': password});
  //   response =
  //       await dio.post('https://apsys.herokuapp.com/login.php', data: formData);

  //   return response;
  // }

  Future<Data> login(phone, password) async {
    FormData formData = FormData.from({'phone': phone, 'password': password});
    Response response =
        await dio.post('https://apsys.herokuapp.com/login.php', data: formData);
    // print("From API controller\n");
    // print(response.data['success']);
    // return response.data;

    return Data.fromJson(jsonDecode(response.data));
  }

/*
 * 	responds with "-1" if user is not registered on the system.
 *  responds with "0" if wrong password 
 *  responds with "1" if successful 
 */
  // Future<Response<dynamic>> register(phone, password) async {
  //   FormData formData = FormData.from({'phone': phone, 'password': password});
  //   response = await dio.post('https://apsys.herokuapp.com/register.php',
  //       data: formData);
  //   return response;
  // }
  Future<Data> register(phone, password) async {
    FormData formData = FormData.from({'phone': phone, 'password': password});
    Response response = await dio
        .post('https://apsys.herokuapp.com/register.php', data: formData);
    return Data.fromJson(jsonDecode(response.data));
  }
}
