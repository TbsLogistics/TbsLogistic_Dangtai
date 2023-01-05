import 'package:flutter/material.dart';

class CustomListTitle extends StatefulWidget {
  const CustomListTitle({
    super.key,
    // ignore: non_constant_identifier_names
    required this.Stt,
    required this.nameDriver,
    required this.numberPhone,
    required this.customer,
    required this.status,
  });
  // ignore: non_constant_identifier_names
  final String Stt;
  final String nameDriver;
  final String numberPhone;
  final String customer;
  final bool status;

  @override
  State<CustomListTitle> createState() => _CustomListTitleState();
}

class _CustomListTitleState extends State<CustomListTitle> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.orangeAccent.withOpacity(0.4),
              Colors.white.withOpacity(0.6),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.4, 0.8],
          ),
        ),
        width: size.width,
        height: 60,
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 15,
                    child: Center(
                      child: Text(widget.Stt),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: Text(widget.nameDriver,
                              style: const TextStyle(
                                  color: Colors.blueGrey, fontSize: 14)),
                        ),
                        Center(
                          child: Text(widget.numberPhone,
                              style: const TextStyle(
                                  color: Colors.blueGrey, fontSize: 14)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(widget.customer,
                    style:
                        const TextStyle(color: Colors.blueGrey, fontSize: 14)),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: widget.status == false
                    ? const Icon(
                        Icons.adjust_sharp,
                        color: Colors.redAccent,
                      )
                    : const Icon(
                        Icons.adjust_sharp,
                        color: Colors.green,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
