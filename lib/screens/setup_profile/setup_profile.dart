import 'dart:io';
import 'package:crudfirestore/screens/sign_in/cubits/sign_in_cubit.dart';
import 'package:crudfirestore/widgets/button_default.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/app_user.dart';
import '../../utils/app_palette.dart';
import '../../utils/constants.dart';
import '../../utils/helpers.dart';
import '../../utils/sizeconfig.dart';
import '../../widgets/avatar.dart';
import '../sign_in/storage/storage_repository.dart';

class SetupProfileScreen extends StatefulWidget {
  SetupProfileScreen({Key? key}) : super(key: key);

  @override
  State<SetupProfileScreen> createState() => _SetupProfileScreenState();
}

class _SetupProfileScreenState extends State<SetupProfileScreen> {
  File? image;
  String? photoUrl =
      'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg';

  List gender = ["male", "female"];

  String? selectedGender, selectedIntertedgender;

  bool isLoading = false;

  DateTime startDate = DateTime.now();

  DateTime endDate = DateTime.now().add(const Duration(days: 5));

  DateTime? dateOfBirth;

  final dateOfBithController = TextEditingController();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final bioController = TextEditingController();

  @override
  void didChangeDependencies() {
    populateView();
    super.didChangeDependencies();
  }

  void populateView() {
    String name = context.read<SignInCubit>().state.account?.displayName ?? '';
    List<String> nameSplit = name.split(' ');
    firstNameController.text = nameSplit[0];
    nameSplit.removeAt(0);
    lastNameController.text = nameSplit.join(' ');
    emailController.text =
        context.read<SignInCubit>().state.account?.email ?? '';
    phoneNumberController.text =
        context.read<SignInCubit>().state.appUser?.phoneNumber ?? '';
    photoUrl = context.read<SignInCubit>().state.account?.photoUrl ?? '';
    // dateOfBithController.text = context.read<SignInCubit>().state.account?.
  }

  void showCalender({required BuildContext context}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(1920),
      initialDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        dateOfBirth = picked;
        dateOfBithController.text = Helpers.formatDateMonth(picked);
      });
    }
  }
  XFile? file;
  ImagePicker? picker;
  Future selectGalery()async{
    picker = ImagePicker();
    final result = await picker?.pickImage(source: ImageSource.gallery);
    if(result==null) return;
    setState(() {
      file = result;
    });
  }
  // PlatformFile? pickedFile;
  // UploadTask? uploadTask;
  // Future uploadFile()async{
  //   final path ='files/${pickedFile!.name}';
  //   final file = File(pickedFile!.path!);
  //   final ref = FirebaseStorage.instance.ref().child(path);
  //   setState(() {
  //      uploadTask = ref.putFile(file);
  //   });
   

  //   final snapshot = await uploadTask!.whenComplete(() {});
  //   final urlDownload = await snapshot.ref.getDownloadURL();
  //   print('download link : $urlDownload');
  //   setState(() {
  //     uploadTask = null;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SizeConfig.init(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.padding,
        vertical: AppConstants.padding,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.085),
            _buildHeader(context),
            const SizedBox(height: 60),
            _buildUserAvatar(context),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: getsizeHeight(60),
              child: TextFormField(
                decoration: formFirstNameInputdecoration,
                controller: firstNameController,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: getsizeHeight(60),
              child: TextFormField(
                decoration: formLastNameInputdecoration,
                controller: lastNameController,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: getsizeHeight(60),
              child: TextFormField(
                decoration: formEmailInputdecoration,
                controller: emailController,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: getsizeHeight(60),
              child: TextFormField(
                decoration: formPhoneNumberInputdecoration,
                controller: phoneNumberController,
              ),
            ),
            const SizedBox(height: 20),
            Container(
                width: double.infinity,
                height: getsizeHeight(60),
                decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius:
                        BorderRadius.all(Radius.circular(getsizeWidth(20)))),
                child: Stack(
                  children: [
                    Center(
                      child: TextFormField(
                        decoration: formBirthdayInputdecoration,
                        controller: dateOfBithController,
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 15,
                      child: GestureDetector(
                        onTap: () {
                          showCalender(context: context);
                        },
                        child: Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.deepPurple,
                          size: getsizeHeight(30),
                        ),
                      ),
                    )
                  ],
                )),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: getsizeHeight(60),
              child: TextFormField(
                decoration: formBioInputdecoration,
                controller: bioController,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Gender',
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(),
                ),
                //Use the above widget where you want the radio button
                SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      addRadioButton(0, 'male', context),
                      addRadioButton(1, 'female', context),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Interested',
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(),
                ),
                //Use the above widget where you want the radio button
                SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      addRadioButtonInter(0, 'male', context),
                      addRadioButtonInter(1, 'female', context),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            ButtonDefault(
              press: (() async{
                final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
                final String uid = _firebaseAuth.currentUser!.uid;
                if(file == null){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No image selected')));
                }
                if(file !=null){
                  print('uploading..');
                  StorageRepository().uploadImageAvatar(file!);  
                }
                AppUser user = AppUser(
                  id: uid,
                  firstName: firstNameController.text,
                  lastName: lastNameController.text,
                  email: emailController.text,
                  dateOfBirthTimeMillis: dateOfBirth?.year,
                  imageAvatar: photoUrl,
                  phoneNumber: phoneNumberController.text,
                  bio: bioController.text,
                  gender: selectedGender,
                  interestedgender: selectedIntertedgender,
                  createDateTimeMillis: DateTime.now().millisecondsSinceEpoch,
                );
                context.read<SignInCubit>().saveUserProfile(user);
              }),
              title: 'Confirm',
            )
          ],
        ),
      ),
    );
  }

  Row _buildHeader(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Profile details',
          style: Theme.of(context)
              .textTheme
              .headline1
              ?.copyWith(color: Colors.black, fontSize: 35),
        ),
        // const Icon(Icons.menu),
      ],
    );
  }

  Row _buildUserAvatar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            (file!=null) ?
            Avatar(
              size: 110,
              imageFile: File(file!.path),
            ) : Avatar(
              size: 110,
              photoUrl: photoUrl,
            ) ,
            Positioned(
              bottom: -4,
              right: -4,
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    width: 2.5,
                    color: Colors.white,
                  ),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.deepPurple,
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      selectGalery();
                    },
                    borderRadius: BorderRadius.circular(100),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Row addRadioButton(int btnValue, String title, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio<String>(
          activeColor: Theme.of(context).colorScheme.secondary,
          value: gender[btnValue],
          groupValue: selectedGender,
          onChanged: (value) {
            setState(() {
              selectedGender = value;
            });
          },
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontSize: 14.0,
              ),
        )
      ],
    );
  }
  Row addRadioButtonInter(int btnValue, String title, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio<String>(
          activeColor: Theme.of(context).colorScheme.secondary,
          value: gender[btnValue],
          groupValue: selectedIntertedgender,
          onChanged: (value) {
            setState(() {
              selectedIntertedgender = value;
            });
          },
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontSize: 14.0,
              ),
        )
      ],
    );
  }
}
