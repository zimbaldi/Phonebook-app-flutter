# Phonebook

A Phonebook app made in Flutter. It uses the [DIO package](https://pub.dev/packages/dio) to get, post, update, and delete contacts from the [Phonebook-API](https://github.com/zimbaldi/phonebook-api). 

As soon as you open the app, it loads the contacts from the API. If you click in the contact card, it loads the edit page, with the fiels filled with the contact data to edit, but if you click on the Floating Action Button, it opens the edit page with clean fields to create a new contact. And when you swipe the contact card to the side, it deletes this contact.

If there are no contacts on the list, will be displayed a message on the center "No Contacts".

The TextFormFields use the [Validatorless](https://pub.dev/packages/validatorless) package to check if the fields were filed correctly. And the phone number TextFormField has also a [mask text input formatter](https://pub.dev/packages/mask_text_input_formatter) to make the phone shows the brazilian regular phone format as (##)#####-#### with the user typing only the numbers.

![Captura de Tela 2023-04-26 às 20 35 21](https://user-images.githubusercontent.com/104802293/234724595-4ecb89fb-321f-4241-ac3f-6fada5d9a9af.png)

![Captura de Tela 2023-04-26 às 20 38 36](https://user-images.githubusercontent.com/104802293/234725281-8be7626b-cfb1-442a-b511-7f46a94ce8cf.png)

![Captura de Tela 2023-04-26 às 20 40 45](https://user-images.githubusercontent.com/104802293/234725292-2fd6f9e6-1848-4e0e-babb-b060df8d4f0a.png)

![Captura de Tela 2023-04-25 às 19 02 18](https://user-images.githubusercontent.com/104802293/234414412-d9e3f4f7-becd-4ed5-af2a-714c6944bf58.png)

![Captura de Tela 2023-04-25 às 19 02 45](https://user-images.githubusercontent.com/104802293/234414397-686183da-4707-4b6f-82d2-0f283626d04a.png)
