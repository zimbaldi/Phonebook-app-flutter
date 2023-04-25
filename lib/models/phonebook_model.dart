class PhonebookModel {
  int id = 0;
  String name = '';
  String phoneNumber = '';
  String email = '';

  PhonebookModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
  });

  PhonebookModel.create({
    required this.name,
    required this.phoneNumber,
    required this.email,
  });

  PhonebookModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
  }

  Map<String, dynamic> toPostJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    return data;
  }
}
