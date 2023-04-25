import 'package:phonebook/models/phonebook_model.dart';
import 'package:phonebook/repositories/jsonplaceholder_dio.dart';

class PhonebookRepository {
  var jsonplaceholderDio = JsonplaceholderDio();

  Future<List<PhonebookModel>> getPhonebook() async {
    var response = await jsonplaceholderDio.dio.get('/contacts');
    return (response.data as List)
        .map((e) => PhonebookModel.fromJson(e))
        .toList();
  }

  Future<void> createContact(PhonebookModel phonebookModel) async {
    await jsonplaceholderDio.dio
        .post('/contacts', data: phonebookModel.toPostJson());
  }

  Future<void> deleteContact(int id) async {
    await jsonplaceholderDio.dio.delete('/contacts/$id');
  }

  Future<void> updateContact(int id, PhonebookModel phonebookModel) async {
    await jsonplaceholderDio.dio
        .put('/contacts/$id', data: phonebookModel.toPostJson());
  }
}
