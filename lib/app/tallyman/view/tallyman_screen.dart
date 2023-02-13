import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/config/routes/pages.dart';

class TallymanScreen extends StatelessWidget {
  const TallymanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.2,
              width: size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                image: DecorationImage(
                  alignment: Alignment.center,
                  image: AssetImage(
                    "assets/images/background.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: size.width * 0.1),
            Card(
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.LIST_TEAM_OF_TALLYMAN);
                },
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    // color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: Colors.orangeAccent.withOpacity(0.6),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.create_outlined, size: 30),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Text(
                        "Danh sách đội chờ làm hàng",
                        style: TextStyle(
                          color: Theme.of(context).primaryColorLight,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: size.width * 0.1),
            Card(
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.TALLYMAN_WAREHOME_SCREEN);
                },
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    // color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: Colors.orangeAccent.withOpacity(0.6),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.create_outlined, size: 30),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Text(
                        "Danh sách kho",
                        style: TextStyle(
                          color: Theme.of(context).primaryColorLight,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: size.width * 0.1),
            Card(
              child: GestureDetector(
                onTap: () {
                  // Get.to(() => const ListFinishedWorking());
                  Get.toNamed(Routes.LIST_FINISHED_WORKING);
                },
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    // color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: Colors.orangeAccent.withOpacity(0.6),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.create_outlined, size: 30),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Text(
                        "Danh sách đã làm hàng",
                        style: TextStyle(
                          color: Theme.of(context).primaryColorLight,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
