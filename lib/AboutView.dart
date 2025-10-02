// app/modules/about/views/about_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/AboutController.dart';


class AboutView extends GetView<AboutController> {
  final controller= Get.put(AboutController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            _buildHeaderSection(),
            _buildStatsSection(),
            _buildDescriptionSection(),
            _buildFeaturesSection(),
            _buildActionButtons(),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        'About Us',
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
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        color: Get.theme.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Get.theme.primaryColor.withOpacity(0.3),
            blurRadius: 15,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Company Logo/Icon
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              Icons.business_center_rounded,
              size: 40,
              color: Get.theme.primaryColor,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'APEX WEB INFOTECH',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontFamily: 'Poppins',
              letterSpacing: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'Innovative IT Solutions',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white.withOpacity(0.9),
              fontFamily: 'Poppins',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return Container(
      margin: EdgeInsets.only(top: -20, left: 20, right: 20),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem(
                value: controller.experienceYears.value,
                label: 'Years\nExperience',
              ),
              _buildStatItem(
                value: controller.websitesDelivered.value,
                label: 'Websites\nDelivered',
              ),
              _buildStatItem(
                value: controller.mobileAppsDelivered.value,
                label: 'Mobile\nApps',
              ),
              _buildStatItem(
                value: controller.satisfiedCustomers.value,
                label: 'Satisfied\nCustomers',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem({required int value, required String label}) {
    return Column(
      children: [
        Text(
          '$value+',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Get.theme.primaryColor,
            fontFamily: 'Poppins',
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
            fontFamily: 'Poppins',
            height: 1.2,
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What is Apex Web Infotech?',
            style: TextStyle(
              color: Get.theme.primaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 16),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Apex Web Infotech is IT company that provides websites and application development as per client requirements. '
                        'We have a 18+ experience in this field and we have delivered 50+ websites and 10+ mobiles applications to the customers. '
                        'We Have 500+ Satisfied Customers in Cooperative Sector.',
                    style: TextStyle(
                      height: 1.6,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'If you know more about our company please click on below button..',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturesSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Our Services',
            style: TextStyle(
              color: Get.theme.primaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.85,
            ),
            itemCount: controller.features.length,
            itemBuilder: (context, index) {
              final feature = controller.features[index];
              return _buildFeatureCard(feature);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(CompanyFeature feature) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Get.theme.primaryColor.withOpacity(0.05),
              Get.theme.primaryColor.withOpacity(0.1),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Get.theme.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                feature.icon,
                color: Get.theme.primaryColor,
                size: 24,
              ),
            ),
            SizedBox(height: 12),
            Text(
              feature.title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Get.theme.primaryColor,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
            SizedBox(height: 8),
            Text(
              feature.description,
              style: TextStyle(
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        children: [
          // Divider
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey[300],
            margin: EdgeInsets.only(bottom: 24),
          ),

          Text(
            'Want to know more about our services?',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Get.theme.primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),

          // Action Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: controller.showMoreInfo,
                  icon: Icon(Icons.info_outline_rounded),
                  label: Text('See More'),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(color: Get.theme.primaryColor),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: controller.launchWebsite,
                  icon: Icon(Icons.language_rounded),
                  label: Text('Visit Website'),
                  style: ElevatedButton.styleFrom(
                    
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: controller.contactUs,
              icon: Icon(Icons.email_rounded),
              label: Text('Contact Us'),
              style: ElevatedButton.styleFrom(
                
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}