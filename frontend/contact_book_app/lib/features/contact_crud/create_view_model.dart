import 'package:contact_book_app/features/shared/ui/commom/snackbar_component.dart';
import 'package:contact_book_app/domain/model/contact_model.dart';
import 'package:contact_book_app/domain/service/contact_service_impl.dart';
import 'package:contact_book_app/domain/service/image_service.dart';
import 'package:contact_book_app/features/notifications/notifications_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class CreateViewModel extends ChangeNotifier{

TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController emailController = TextEditingController();
XFile? photo;
var imageService = ImageService();
var contactService = ContactServiceImpl();
var uuid = Uuid();
List<ContactModel> contacts = [];
NotificationsService notificationsService = NotificationsService();
bool? selectEdit = false;

takeImage(XFile? photo) async {
 imageService.takeImage(photo);
}


createContact(ContactModel contactModel) async {
  contactModel.phone = int.parse(phoneController.text);
  contactModel.name = nameController.text;
  contactModel.email = emailController.text;
  await contactService.createContact(contactModel);

  await updateListContact();
  notifyListeners();
}

handleCreate(ContactModel contactModel, BuildContext context) async {
  if (contactModel.name!.isNotEmpty &&
      contactModel.phone != null) {

//Verifica se o contato já existe na lista, se sim, envia uma mensagem de error
      if(checkIfContactExist(contactModel, context)){
         snackBarMessageCreateContactViewError(context, "Error in create contact");

      }else{

//Se não, criamos o contato, limpamos 
//sua área de input na tela Create, notificamos a aplicação 
//Enviamos uma mensagem de sucesso
        await createContact(contactModel);
        actionCreate(context);
        notifyListeners();
        clearForm();
        snackBarMessageCreateContactSucess(context);
      }
    }
  }


void snackBarMessageCreateContactSucess(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackbarComponent(
          "Create contact with sucess!",
          Colors.white,
        ),
      );
}

void snackBarMessageCreateContactViewError(BuildContext context, String message){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackbarComponent(
          "$message",
          Colors.red
        ),
  );
}

void actionCreate(BuildContext context){
  ContactModel contactModel = ContactModel(
    name: nameController.text,
    phone: int.parse(phoneController.text),
    email: emailController.text,
  );

  NotificationsService.showSimpleNotification(
    title: 'Contato criado com sucesso', 
    body: 'Fale agor com ${contactModel.name}', 
  payload: '');
  

}

void clearForm(){
  nameController.clear();
  emailController.clear();
  phoneController.clear();

//Limpa as áreas de input
}

//Após criar o novo contato, chamamos
// o update para atualizar a lista de contatos na tela
Future<void>  updateListContact() async {
  var contact = await contactService.getContact();
  contacts = contact.docs.map((doc) => ContactModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
  contacts.forEach((e){
    print(e.name);
  });
  notifyListeners();

}


//Verifica a existência de um contato na lista
bool checkIfContactExist(ContactModel contactModel, BuildContext context){
  for(var contact in contacts){
    if(contact.name! == contactModel.name){
      snackBarMessageCreateContactViewError(context, "The name: ${contact.name} alredy exist");
      return true;
  
    }
    if(contact.email! == contactModel.email){
      snackBarMessageCreateContactViewError(context, "The email: ${contact.email} alredy exist");
      return true;
    }
    if(contact.phone! == contactModel.phone){
      snackBarMessageCreateContactViewError(context, "The phone: ${contact.phone} alredy exist");
      return true;
  }

  
}

return false;
}
 
}