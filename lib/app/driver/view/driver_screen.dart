import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/driver/view/create_register_view/create_register_screen.dart';
import 'package:tbs_logistics_dangtai/config/core/data/color.dart';

class DriverScreen extends StatefulWidget {
  const DriverScreen({super.key});

  @override
  State<DriverScreen> createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(gradient: CustomColor.gradient),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Column(
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
                Get.to(() => RegisterFormScreen());
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
                      "Đăng ký phiếu vào",
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
            SizedBox(height: size.width * 0.1),
            Container(
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
                    "Tình trạng đơn hàng",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: size.width * 0.1),
            Container(
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
                    "Danh sách các phiếu đã đăng ký",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
