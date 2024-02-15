import 'dart:convert';
import 'package:http/http.dart' as http;

class EmailRepo {
  Future<List<String>> getEmail() async {
    try {
      final response = await http.get(Uri.parse(
          "https://emergingideas.ae/test_apis/read.php?email=?"));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<String> emails = [];

        for (var item in data) {
          final email = item['email'];
          emails.add(email.toString());
        }

        return emails;
      } else {
        throw Exception('Failed to fetch email list');
      }
    } catch (e) {
      throw Exception('Failed to fetch email list: $e');
    }
  }

  Future<void> deleteEmail({
    required String email,
    required int id,
    required String description,
    required String title,
    required String imgLink,
  }) async {
    try {
      final response = await http.delete(Uri.parse(
          "https://emergingideas.ae/test_apis/delete.php?email=?$id=?$description=?$title=?$imgLink=?"));

      if (response.statusCode == 200) {
        // print("email deleted successfully");
      } else {
        throw Exception('Failed to delete email');
      }
    } catch (e) {
      throw Exception('Failed to delete email: $e');
    }
  }

  Future<void> editEmail({
    required String email,
    required int id,
    required String description,
    required String title,
    required String imgLink,
  }) async {
    try {
      final response = await http.put(
        Uri.parse("https://emergingideas.ae/test_apis/edit.php"
            "?email=$email&id=$id&description=$description&title=$title&imgLink=$imgLink"),
      );

      if (response.statusCode == 200) {
        // Email edited successfully
      } else {
        throw Exception('Failed to edit email');
      }
    } catch (e) {
      throw Exception('Failed to edit email: $e');
    }
  }

  Future<void> createEmail({
    required String email,
    required String description,
    required String title,
    required String imgLink,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("https://emergingideas.ae/test_apis/create.php"),
        body: {
          'email': email,
          'description': description,
          'title': title,
          'imgLink': imgLink,
        },
      );

      if (response.statusCode == 200) {
        // Email created successfully
      } else {
        throw Exception('Failed to create email');
      }
    } catch (e) {
      throw Exception('Failed to create email: $e');
    }
  }
}
