import 'package:flutter/material.dart';
import 'package:phonebook/pages/edit_page.dart';
import 'package:phonebook/repositories/phonebook_repository.dart';
import '../models/phonebook_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PhonebookRepository phonebookRepository;
  var phonebook = <PhonebookModel>[];

  @override
  void initState() {
    super.initState();
    phonebookRepository = PhonebookRepository();
    loadData();
  }

  loadData() async {
    phonebook = await phonebookRepository.getPhonebook();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditPage(
                        id: 0,
                        name: '',
                        phoneNumber: '',
                        email: '',
                      )));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Phonebook'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await loadData();
        },
        child: Visibility(
          visible: phonebook.isNotEmpty,
          replacement: const Center(
              child: Text(
            'No Contacts',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: phonebook.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: phonebook.length,
                          itemBuilder: (context, index) {
                            var phoneList = phonebook[index];
                            return Dismissible(
                              key: UniqueKey(),
                              child: SizedBox(
                                width: double.infinity,
                                height: 140,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => EditPage(
                                                    id: phoneList.id,
                                                    name: phoneList.name,
                                                    phoneNumber:
                                                        phoneList.phoneNumber,
                                                    email: phoneList.email,
                                                  )));
                                    },

                                    // onTap: () async {
                                    //   String refresh = await Navigator.push(
                                    //       context,
                                    //       MaterialPageRoute(
                                    //           builder: (context) => EditPage(
                                    //                 id: phoneList.id,
                                    //                 name: phoneList.name,
                                    //                 phoneNumber:
                                    //                     phoneList.phoneNumber,
                                    //                 email: phoneList.email,
                                    //               )));
                                    //   if (refresh == 'refresh') {
                                    //     loadData();
                                    //   }
                                    //},

                                    child: Dismissible(
                                      key: UniqueKey(),
                                      onDismissed: (DismissDirection
                                          dismissDirection) async {
                                        await phonebookRepository
                                            .deleteContact(phoneList.id);
                                        loadData();
                                      },
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        elevation: 8,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                'Name: ${phoneList.name}',
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Text(
                                                  'Phone Number: ${phoneList.phoneNumber}'),
                                              Text(
                                                  'E-mail: ${phoneList.email}'),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
