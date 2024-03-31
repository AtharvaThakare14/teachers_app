import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewScreen extends StatefulWidget {
  const PDFViewScreen({super.key});

  @override
  State<PDFViewScreen> createState() => _PDFViewScreenState();
}

class _PDFViewScreenState extends State<PDFViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 15)]),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_rounded),
                      ),
                      const Text(
                        textAlign: TextAlign.center,
                        "Question paper",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 24)
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Mathematics",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("School of Computational Science"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Expanded(child: SfPdfViewer.asset("assets/testpdf.pdf"))
        ],
      ),
      // floatingActionButton: FabCircularMenu(
      //     animationDuration: const Duration(milliseconds: 600),
      //     fabCloseColor: kPrimaryColor,
      //     ringColor: kPrimaryColor,
      //     fabColor: Colors.white,
      //     fabOpenIcon: const Icon(
      //       Icons.menu,
      //       color: Colors.white,
      //     ),
      //     fabCloseIcon: Icon(
      //       Icons.close,
      //       color: kPrimaryColor,
      //     ),
      //     ringWidth: 195,
      //     ringDiameter: 450,
      //     children: [
      //       _fabMenuButton(
      //           label: "Print",
      //           icon: Icons.print_outlined,
      //           padding: const EdgeInsets.only(right: 40)),
      //       _fabMenuButton(
      //           label: "Download",
      //           icon: Icons.cloud_download_outlined,
      //           padding: const EdgeInsets.only(right: 40, bottom: 40)),
      //       _fabMenuButton(
      //           label: "Share",
      //           icon: Icons.share_outlined,
      //           padding: const EdgeInsets.only(bottom: 40)),
      //     ]),
    );
  }

  Widget _fabMenuButton(
          {void Function()? onTap,
          required String label,
          required IconData icon,
          required EdgeInsets padding}) =>
      Padding(
        padding: padding,
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white24,
                radius: 30,
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
              Text(
                label,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      );
}
