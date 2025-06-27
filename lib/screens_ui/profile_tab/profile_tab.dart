import 'package:flutter/material.dart';
import 'package:movies_app/models/user_dm.dart';
import 'package:movies_app/util/app_colors.dart';

import '../../api_manager/auth_api_manager.dart';
import '../../common _widget/filled_button.dart';
import 'edit_profile.dart';

class ProfileTab extends StatefulWidget {
  static String routeName = "ProfileTab";

  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  UserDm? userData;
  bool isLoading = true;
  Future<void> _fetchUserData() async {
    final response = await AuthApiManager().getProfile();
    final data = response?.data;

    print("Profile Response: $response");
    if (data != null) {
      setState(() {
        userData = data;
        print("setState Data: $userData" );
        isLoading = false;
      });
    }
  }


  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            _buildProfileHeader(context),
            _buildActionButtons(context),
            Expanded(child: _buildTabBar()),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    if (isLoading) {
      return const Padding(
        padding: EdgeInsets.all(32.0),
        child: CircularProgressIndicator(color: Colors.yellow),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           Column(
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage('assets/popcorn.png'),
              ),
              SizedBox(height: 8),
              Text(userData?.name ?? "no Name",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)
              ), // Or NetworkImage

            ],
          ),
          SizedBox(width: 16),
          _buildCountColumn("12", "Wish List"),
          SizedBox(width: 16),
          _buildCountColumn("10", "History")
        ],
      ),
    );
  }

  Widget _buildCountColumn(String count, String label) {
    return Column(
      children: [
        Text(count, style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(color: Colors.white70, fontSize: 24, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CustomFilledButton(
              onClick: (){
                Navigator.pushNamed(context, EditProfile.routeName);
              },
              backgroundColor: WidgetStatePropertyAll(AppColors.yellow),
              text: "Edit Profile",
              textColor: AppColors.black,
              textFontSize: 16,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: CustomFilledButton(
              onClick: (){},
              backgroundColor: WidgetStatePropertyAll(AppColors.red),
              text: "Exit",
              textColor: AppColors.white,
              textFontSize: 16,
              icon: Icons.exit_to_app,
              iconColor: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  _buildTabBar() {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(icon: Icon(Icons.list, color: AppColors.yellow,), text: "Watch List"),
              Tab(icon: Icon(Icons.folder, color: AppColors.yellow,), text: "History"),
            ],
            indicatorColor: Colors.yellow,
          ),
          Expanded(
            child: TabBarView(
              children: [
                Center(
                  child: Image.asset('assets/popcorn.png',
                      width: 100), // your empty icon
                ),
                Center(
                  child: Image.asset('assets/popcorn.png',
                      width: 100), // your empty icon
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
