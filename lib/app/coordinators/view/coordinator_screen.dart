import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/coordinators/view/coordinator_list_car_dook.dart';
import 'package:tbs_logistics_dangtai/app/coordinators/view/coordinator_list_car_in.dart';
import 'package:tbs_logistics_dangtai/app/coordinators/view/coordinator_warehome_screen.dart';

class CoordinatorScreen extends StatelessWidget {
  const CoordinatorScreen({super.key});

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
            GestureDetector(
              onTap: () {
                Get.to(() => const CoordinatorListCarIn());
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
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
                    const Text(
                      "Danh sách xe đã vào cổng",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            GestureDetector(
              onTap: () {
                Get.to(() => const CoordinatorListCarDook());
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
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
                    const Text(
                      "Danh sách xe đã đang làm",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            GestureDetector(
              onTap: () {
                Get.to(() => const WareHomeSreen());
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
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
                    const Text(
                      "Danh sách kho và tình trạng line",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
