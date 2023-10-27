import 'dart:convert';

import 'package:dio/dio.dart';
import '../contact_model.dart';

class ContactApi {
  // Metode untuk mengambil daftar kontak dari API.
  Future<List<ContactModel>> getContact() async {
    List<ContactModel> contactList = [];
    final response = await Dio().get(
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2',
    );

    print("Response Status Code : ${response.statusCode}");
    print("Response Data : ${response.data}");
    if(response.data is List) {
      // Jika respons API adalah daftar kontak.
      for (var element in response.data) {
        contactList.add(ContactModel.fromJson(element));
      }
    } else {
      // Jika respons API adalah satu kontak.
      contactList.add(ContactModel.fromJson(response.data));
    }
    for(int i = 0; i<contactList.length;i++){
      print("Contact List dari GET API : id = ${contactList[i].id}, name = ${contactList[i].name}, phone = ${contactList[i].phone}");
    }

    return contactList;
  }

  // Metode untuk mengirim data kontak ke API (POST).
  Future<ContactModel> postContact(ContactModel contactData) async {
    String contactModelJson = jsonEncode(contactData.toJson());

    final response = await Dio().post(
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
      data: contactModelJson
    );

    print("Response Code : ${response.statusCode}");
    print("Response Data : ${response.data}");

    ContactModel contactItem = ContactModel.fromJson(response.data);
    print("Contact Item dari POST API : id = ${contactItem.id}, name = ${contactItem.name}, phone = ${contactItem.phone}");

    return contactItem;
  }
}