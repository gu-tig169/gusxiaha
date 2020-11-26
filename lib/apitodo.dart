import 'package:http/http.dart' as http;
import 'model.dart';
import 'dart:convert';
import 'dart:async';

const API_Url = 'https://todoapp-api-vldfm.ondigitalocean.app';
const API_KEY = '29a3107c-3347-4359-96ca-9cf144ffab0b';

class APITodo {
  static Future addTodo(TodoInfo todo) async {
    Map<String, dynamic> json = TodoInfo.toJSON(todo);
    var jsonbody = jsonEncode(json);

    // http.Response response = await http.post(
    await http.post(
      '$API_Url/todos?key=$API_KEY',
      body: jsonbody,
      headers: {'Content-Type': 'application/json'},
    );
    print('done');

/*
    if (response.statusCode == 201) {
      return TodoInfo.fromJSON(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create stuff.');
    }
    */
  }

  static Future<List<TodoInfo>> fetchTodoList() async {
    var response = await http.get('$API_Url/todos?key=$API_KEY');
    print(response.body);

    var json = jsonDecode(response.body);
    print(json);

    return json.map<TodoInfo>((data) {
      return TodoInfo.fromJSON(data);
    }).toList();
  }

  static Future deleteTodo(String todoId) async {
    await http.delete('$API_Url/todos/$todoId?key=$API_KEY');
  }

  // http.put()!
  static Future updateTodo(TodoInfo todo) async {
    Map<String, dynamic> json = TodoInfo.toJSON(todo);
    var jsonbody = jsonEncode(json);

    var id = todo.todoId;

    // http.Response response = await http.post(
    await http.put(
      '$API_Url/todos/$id?key=$API_KEY',
      body: jsonbody,
      headers: {'Content-Type': 'application/json'},
    );
  }
}
