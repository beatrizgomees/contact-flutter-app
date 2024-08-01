import 'package:contact_book_app/components/snackbar_component.dart';
import 'package:contact_book_app/model/contact_model.dart';
import 'package:contact_book_app/service/contact_service_impl.dart';
import 'package:contact_book_app/service/image_service.dart';
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

takeImage(XFile? photo) async {
 imageService.takeImage(photo);
}


createContact(ContactModel contactModel) async {
  contactModel.objectId = uuid.v4();
  contactModel.phone = phoneController.text;
  contactModel.name = nameController.text;
  contactModel.email = emailController.text;
  await contactService.createContact(contactModel);
  await updateContact();
  notifyListeners();
}

handleCreate(ContactModel contactModel, BuildContext context) async {
  if (contactModel.name!.isNotEmpty &&
      contactModel.phone!.isNotEmpty) {

      if(await checkIfContactExist(contactModel)){
        snackBarMessageCreateContactViewErrorPhone(context, "This Contact alredy exist");
       
      }else{
        await createContact(contactModel);
        notifyListeners();
        clearForm();
        snackBarMessageCreateContactSucess(context);
      }
      
      
      }else{
        snackBarMessageCreateContactViewErrorPhone(context, "");
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

void snackBarMessageCreateContactViewErrorPhone(BuildContext context, String message){
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
  phone: phoneController.text,
  email: emailController.text,
  favorite: false,
);
  
phoneController.text.isEmpty 
? snackBarMessageCreateContactViewErrorPhone(context, "Withou Phone! Please, put the phone ") 
: handleCreate(contactModel, context);
                    
                

}

void clearForm(){
  nameController.clear();
  emailController.clear();
  phoneController.clear();
}


Future<void>  updateContact() async {
  var contact = await contactService.getContact();
  contacts = contact.docs.map((doc) => ContactModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
  contacts.forEach((e){
    print(e.name);
  });
  notifyListeners();

}



Future<bool> checkIfContactExist(ContactModel contactModel) async {
  await updateContact();
  for(var contact in contacts){
    if(contact.name! == contactModel.name && contact.phone! == contactModel.phone!){
      return true;
    }
 
  }
  return false;
}

 
}