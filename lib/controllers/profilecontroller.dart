// app/modules/profile/controllers/profile_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/profilemodel.dart';

class ProfileController extends GetxController {
  final isLoading = false.obs;
  final profileData = Rx<ProfileModel?>(null);
  final isEditing = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadProfileData();
  }

  Future<void> loadProfileData() async {
    try {
      isLoading.value = true;

      // Simulate API call delay
      await Future.delayed(Duration(milliseconds: 800));

      // Mock data - replace with actual API call
      final mockData = ProfileModel(
        memberNo: '41221',
        memberName: 'KAMLESHKUMAR BABUBHAI PANCHAL',
        registrationDate: '2021-10-15',
        division: 'IT Division',
        subDivision: 'Software Development',
        empNo: 'EMP41221',
        designation: 'Senior Software Developer',
      );

      profileData.value = mockData;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load profile data',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void toggleEditMode() {
    isEditing.value = !isEditing.value;
  }

  void updateProfile(ProfileModel updatedProfile) {
    profileData.value = updatedProfile;
    isEditing.value = false;

    // Here you would typically make an API call to update the profile
    Get.snackbar(
      'Success',
      'Profile updated successfully',
      backgroundColor: Get.theme.primaryColor,
      colorText: Colors.white,
    );
  }

  void refreshProfile() {
    loadProfileData();
  }
}