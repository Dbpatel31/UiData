import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uipractice/controllers/BannerController.dart';

import 'CustomDrawer.dart';

class Homepage extends StatelessWidget {
   Homepage({super.key});

  final bannerController = Get.put(BannerController());


   final List<Map<String, dynamic>> menuItems = [
     {"icon": Icons.account_balance, "title": "Scheme Accounts"},
     {"icon": Icons.account_balance_wallet, "title": "Society Details"},
     {"icon": Icons.group, "title": "Board Of Director"},
     {"icon": Icons.newspaper, "title": "News & Events"},
     {"icon": Icons.receipt_long, "title": "Receipt Download"},
     {"icon": Icons.app_registration, "title": "Application"},
     {"icon": Icons.download, "title": "Download"},
     {"icon": Icons.lock, "title": "Change Password"},
     {"icon": Icons.book, "title": "Recovery Sheet"},
   ];
  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;
    final crossAxisCount = isTablet ? 4 : 3;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: false,
        backgroundColor: Colors.blue.shade800,
      ),
      drawer: Customdrawer(
        username: "Dhruv Patel",
        email: "dhruv@example.com",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔹 Banner Section
            SizedBox(
              height: 180,
              child: PageView.builder(
                itemCount: bannerController.banners.length,
                controller: bannerController.pageController,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      bannerController.banners[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            // 🔹 Grid Section
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                shrinkWrap: true, // important
                physics: const NeverScrollableScrollPhysics(), // avoid nested scroll
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: menuItems.map((item) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Colors.blue.shade50,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        Get.snackbar("Clicked", item["title"]);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(item["icon"], size: 35, color: Colors.blue.shade800),
                          const SizedBox(height: 6),
                          Text(item["title"], textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
