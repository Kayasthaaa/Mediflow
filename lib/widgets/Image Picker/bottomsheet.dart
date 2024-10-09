import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../button/profilebtns.dart';

class BottomSheetModel extends StatefulWidget {
  const BottomSheetModel({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomSheetModel> createState() => _BottomSheetModelState();
}

class _BottomSheetModelState extends State<BottomSheetModel> {
  bool visibleText = true;
  File? image, mainImage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: 200,
          margin: const EdgeInsets.symmetric(horizontal: 22.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(9.0)),
          width: size.width,
          child: Column(children: [
            const SizedBox(
              height: 20.0,
            ),
            ClipOval(
              child: image != null
                  ? Image.file(
                      image!,
                      height: 100.0,
                      width: 100.0,
                      fit: BoxFit.fill,
                    )
                  : ClipOval(
                      child: Container(
                        height: 110.0,
                        width: 110.0,
                        color: Colors.amber,
                      ),
                    ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Visibility(
              visible: visibleText,
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      child: Text(
                        'Change Profile Picture',
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              fontSize: 16, color: Colors.blueGrey),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          visibleText = !visibleText;
                        });
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 120.9,
                              color: Colors.grey.shade200,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    GestureDetector(
                                      onTap: (() {
                                        pickImage(ImageSource.camera);
                                      }),
                                      child: Container(
                                        height: 40,
                                        width: size.width / 1.5,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Camera",
                                                style: GoogleFonts.lato(
                                                    textStyle: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              const SizedBox(
                                                width: 5.0,
                                              ),
                                              const Icon(Icons.camera)
                                            ]),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        pickImage(ImageSource.gallery);
                                      },
                                      child: Container(
                                        height: 40,
                                        width: size.width / 1.5,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Gallery",
                                                style: GoogleFonts.lato(
                                                    textStyle: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              const SizedBox(
                                                width: 5.0,
                                              ),
                                              const Icon(
                                                Icons.image,
                                                color: Colors.black,
                                              )
                                            ]),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    const Icon(
                      Icons.brush,
                      size: 22,
                      color: Colors.blueGrey,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Visibility(
              visible: visibleText == true ? false : true,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageBtns(
                    onTap: (() {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 120.9,
                            color: Colors.grey.shade200,
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  GestureDetector(
                                    onTap: (() {
                                      pickImage(ImageSource.camera);
                                    }),
                                    child: Container(
                                      height: 40,
                                      width: size.width / 1.5,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Camera",
                                              style: GoogleFonts.lato(
                                                  textStyle: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            const SizedBox(
                                              width: 5.0,
                                            ),
                                            const Icon(Icons.camera)
                                          ]),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      pickImage(ImageSource.gallery);
                                    },
                                    child: Container(
                                      height: 40,
                                      width: size.width / 1.5,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Gallery",
                                              style: GoogleFonts.lato(
                                                  textStyle: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            const SizedBox(
                                              width: 5.0,
                                            ),
                                            const Icon(
                                              Icons.image,
                                              color: Colors.black,
                                            )
                                          ]),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }),
                    color: Colors.blueGrey,
                    label: "Change",
                    textColor: Colors.white,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  ImageBtns(
                    onTap: (() {
                      setState(() {});
                    }),
                    color: Colors.green,
                    label: "Post",
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
        mainImage = File(image.path);
        print("this isss$mainImage");
      });
    } on PlatformException catch (e) {
      print("Failed to pick Image: $e");
    }
  }
}
