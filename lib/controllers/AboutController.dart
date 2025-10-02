// app/modules/about/controllers/about_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';


class AboutController extends GetxController {
  final isLoading = false.obs;

  // Company statistics
  final experienceYears = 18.obs;
  final websitesDelivered = 50.obs;
  final mobileAppsDelivered = 10.obs;
  final satisfiedCustomers = 500.obs;

  // Features list
  final List<CompanyFeature> features = [
    CompanyFeature(
      icon: Icons.code_rounded,
      title: 'Website Development',
      description: 'Custom websites built with latest technologies',
    ),
    CompanyFeature(
      icon: Icons.phone_iphone_rounded,
      title: 'Mobile Applications',
      description: 'Native and cross-platform mobile apps',
    ),
    CompanyFeature(
      icon: Icons.design_services_rounded,
      title: 'UI/UX Design',
      description: 'Beautiful and intuitive user interfaces',
    ),
    CompanyFeature(
      icon: Icons.cloud_rounded,
      title: 'Cloud Solutions',
      description: 'Scalable cloud infrastructure and deployment',
    ),
  ];

  Future<void> launchWebsite() async {
    const url = 'https://www.apexwebinfotech.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Get.snackbar(
        'Error',
        'Could not launch website',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> contactUs() async {
    final email = 'info@apexwebinfotech.com';
    final uri = Uri.parse('mailto:$email');
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      Get.snackbar(
        'Error',
        'Could not launch email',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void showMoreInfo() {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: Get.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Text(
                'More About Apex Web Infotech',
                style: TextStyle(
                  color: Get.theme.primaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16),
              _buildMoreInfoContent(),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: Get.back,
                  style: ElevatedButton.styleFrom(
                    // primary: Get.theme.primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Close'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMoreInfoContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Our Expertise:',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Get.theme.primaryColor,
          ),
        ),
        SizedBox(height: 8),
        Text(
          '• Custom Web Development\n'
              '• Mobile App Development (iOS & Android)\n'
              '• E-Commerce Solutions\n'
              '• ERP & CRM Systems\n'
              '• Digital Marketing\n'
              '• Maintenance & Support',
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(height: 16),
        Text(
          'Technologies:',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Get.theme.primaryColor,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Flutter, React Native, Angular, React, Node.js, '
              'Python, PHP, MySQL, MongoDB, AWS, Firebase',
          style: TextStyle(
            color: Colors.black26
          ),
        ),
      ],
    );
  }
}

class CompanyFeature {
  final IconData icon;
  final String title;
  final String description;

  CompanyFeature({
    required this.icon,
    required this.title,
    required this.description,
  });
}