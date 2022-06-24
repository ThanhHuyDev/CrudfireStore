import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../sign_in/storage/storage_repository.dart';

class CustomImageContainer extends StatelessWidget {
  const CustomImageContainer({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: const Border(
              bottom: BorderSide(color: Colors.black, width: 1),
              top: BorderSide(color: Colors.black, width: 1),
              right: BorderSide(color: Colors.black, width: 1),
              left: BorderSide(color: Colors.black, width: 1)),
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
            icon: const Icon(
              Icons.add_circle,
              color: Colors.red,
            ),
            onPressed: () async{
              ImagePicker _picker = ImagePicker();
                final XFile? _image = await _picker.pickImage(source: ImageSource.gallery);
                if(_image == null){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No image selected')));
                }
                if(_image !=null){
                  print('uploading..');
                  StorageRepository().uploadImage(_image);  
                }
            },
          ),
        ));
  }
}
