import 'package:flutter/material.dart';
import 'package:movies_app/util/app_colors.dart';
import '../../api_manager/auth_api_manager.dart';
import '../../common _widget/custometextfilled.dart';
import '../../common _widget/filled_button.dart';

class EditProfile extends StatefulWidget {
  static String routeName = "EditProfile";
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadProfileData();
  }

  Future<void> loadProfileData() async {
    final profileResponse = await AuthApiManager().getProfile();
    final data = profileResponse?.data;

    if (data != null) {
      nameController.text = data.name ?? "";
      phoneController.text = data.phone ?? "";
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildAvatarButton(),
            _buildNameField(),
            _buildPhoneField(),
            _buildResetPassText(),
            Spacer(),
            _buildDeleteButton(),
            _buildUpdateButton(),
          ],
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor:AppColors.black,
      leading: InkWell(
        onTap: (){Navigator.pop(context);},
        child: Icon(
          Icons.arrow_back,
          color: AppColors.yellow,
        ),
      ),
      title: Text("Pick Avatar", style: TextStyle(color: AppColors.yellow),),
      centerTitle: true,
    );
  }

  Widget _buildAvatarButton() {
    return InkWell(
        onTap: () {},
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/popcorn.png'),
          radius: 50,
        ));
  }

  Widget _buildPhoneField() {
    return CustomTextField(
      controller: phoneController,
      preIcon: Icons.phone,
      hintText: "Phone Number",
    );
  }

  Widget _buildNameField() {
    return CustomTextField(
      controller: nameController,
      hintText: "Name",
      preIcon: Icons.person,
    );
  }

  _buildResetPassText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton(
            onPressed: () {},
            child: Text(
              "Reset Password", style: TextStyle(color: AppColors.white),)
        ),
      ],
    );
  }

  _buildDeleteButton() {
    return CustomFilledButton(
      backgroundColor: WidgetStatePropertyAll(AppColors.red),
      onClick: (){},
      textFontSize: 20,
      textColor: AppColors.white,
      text: "Delete Account",
    );
  }

  _buildUpdateButton() {
    return CustomFilledButton(
      backgroundColor: WidgetStatePropertyAll(AppColors.yellow),
      onClick: (){},
      textFontSize: 20,
      textColor: AppColors.black,
      text: "Update Data",
    );
  }
}
