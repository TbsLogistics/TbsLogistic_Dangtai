import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/config/routes/pages.dart';

class CustomerScreen extends StatefulWidget {
  CustomerScreen({Key? key}) : super(key: key);

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.REGISTER_CUSTOMER);
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
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.LIST_DRIVER_BY_CUSTOMER);
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
                      "Danh sách tài xế ",
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
                    "Danh sách đã đăng ký",
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
