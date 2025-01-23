import 'dart:convert';
import 'package:http/http.dart' as http;

class CpService {
  // API para números
  static Future<Map<String, dynamic>?> datafromapinumber(String number) async {
    final url = Uri.parse('https://api.zippopotam.us/es/$number');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null; // No se encontraron datos
    }
  }

  // API para texto
  static Future<Map<String, dynamic>?> datafromapitext(String text) async {
    final url = Uri.parse('https://api.zippopotam.us/es/ct/$text');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null; // No se encontraron datos
    }
  }
}
