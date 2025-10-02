import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/profilecontroller.dart';
import 'models/profilemodel.dart';


class ProfileView extends GetView<ProfileController> {
  final controller= Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      appBar: _buildAppBar(),
      body: Obx(() {
        if (controller.isLoading.value) {
          return _buildLoadingShimmer();
        }

        return RefreshIndicator(
          onRefresh: () async => controller.refreshProfile(),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                _buildProfileHeader(),
                SizedBox(height: 24),
                _buildProfileDetails(),
                SizedBox(height: 32),
                _buildActionButtons(),
              ],
            ),
          ),
        );
      }),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        'Your Profile',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      backgroundColor: Get.theme.primaryColor,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
        onPressed: () => Get.back(),
      ),
      actions: [
        Obx(() => IconButton(
          icon: Icon(
            controller.isEditing.value ? Icons.close_rounded : Icons.edit_rounded,
            color: Colors.white,
          ),
          onPressed: controller.toggleEditMode,
        )),
      ],
    );
  }

  Widget _buildProfileHeader() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Get.theme.primaryColor,
              Get.theme.primaryColorDark,
            ],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            // Profile Avatar
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person_rounded,
                  size: 40,
                  color: Get.theme.primaryColor,
                ),
              ),
            ),
            SizedBox(height: 16),

            // Member Name
            Obx(() => Text(
              controller.profileData.value?.memberName ?? 'Loading...',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )),
            SizedBox(height: 8),

            // Designation
            Obx(() => Text(
              controller.profileData.value?.designation ?? '',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(0.9),
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.center,
            )),
            SizedBox(height: 8),

            // Member Number
            Obx(() => Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Member No: ${controller.profileData.value?.memberNo ?? ''}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileDetails() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Obx(() {
          final profile = controller.profileData.value;
          if (profile == null) return SizedBox();

          return Column(
            children: [
              _buildDetailItem(
                icon: Icons.badge_rounded,
                label: 'Member No.',
                value: profile.memberNo,
                isFirst: true,
              ),
              _buildDivider(),
              _buildDetailItem(
                icon: Icons.person_rounded,
                label: 'Member Name',
                value: profile.memberName,
              ),
              _buildDivider(),
              _buildDetailItem(
                icon: Icons.calendar_today_rounded,
                label: 'Registration Date',
                value: _formatDate(profile.registrationDate),
              ),
              _buildDivider(),
              _buildDetailItem(
                icon: Icons.account_tree_rounded,
                label: 'Division',
                value: profile.division,
              ),
              _buildDivider(),
              _buildDetailItem(
                icon: Icons.account_tree_outlined,
                label: 'Sub Division',
                value: profile.subDivision,
              ),
              _buildDivider(),
              _buildDetailItem(
                icon: Icons.work_rounded,
                label: 'Emp No.',
                value: profile.empNo,
              ),
              _buildDivider(),
              _buildDetailItem(
                icon: Icons.work_outline_rounded,
                label: 'Designation',
                value: profile.designation,
                isLast: true,
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildDetailItem({
    required IconData icon,
    required String label,
    required String value,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: isFirst ? Radius.circular(16) : Radius.zero,
          bottom: isLast ? Radius.circular(16) : Radius.zero,
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Get.theme.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: Get.theme.primaryColor,
              size: 20,
            ),
          ),
          SizedBox(width: 16),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 4),
                Obx(() => controller.isEditing.value && _isEditableField(label)
                    ? _buildEditableField(label, value)
                    : Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditableField(String label, String value) {
    return TextFormField(
      initialValue: value,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Get.theme.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Get.theme.primaryColor.withOpacity(0.5)),
        ),
      ),
      onChanged: (newValue) {
        // Update the profile data when editing
        _onFieldUpdate(label, newValue);
      },
    );
  }

  void _onFieldUpdate(String label, String newValue) {
    final currentProfile = controller.profileData.value;
    if (currentProfile == null) return;

    ProfileModel updatedProfile;

    switch (label) {
      case 'Member Name':
        updatedProfile = currentProfile.copyWith(memberName: newValue);
        break;
      case 'Division':
        updatedProfile = currentProfile.copyWith(division: newValue);
        break;
      case 'Sub Division':
        updatedProfile = currentProfile.copyWith(subDivision: newValue);
        break;
      case 'Designation':
        updatedProfile = currentProfile.copyWith(designation: newValue);
        break;
      default:
        return;
    }

    controller.profileData.value = updatedProfile;
  }

  bool _isEditableField(String label) {
    return [
      'Member Name',
      'Division',
      'Sub Division',
      'Designation'
    ].contains(label);
  }

  Widget _buildDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Divider(height: 1, color: Colors.grey[200]),
    );
  }

  Widget _buildActionButtons() {
    return Obx(() {
      if (controller.isEditing.value) {
        return Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: controller.toggleEditMode,
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  side: BorderSide(color: Colors.grey),
                ),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  if (controller.profileData.value != null) {
                    controller.updateProfile(controller.profileData.value!);
                  }
                },
                style: ElevatedButton.styleFrom(

                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Save Changes',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        );
      } else {
        return SizedBox(); // No action buttons when not editing
      }
    });
  }

  Widget _buildLoadingShimmer() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: 8,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          margin: EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 12,
                        color: Colors.grey[300],
                      ),
                      SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        height: 16,
                        color: Colors.grey[300],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _formatDate(String date) {
    try {
      final parsedDate = DateTime.parse(date);
      return '${parsedDate.day}/${parsedDate.month}/${parsedDate.year}';
    } catch (e) {
      return date;
    }
  }
}