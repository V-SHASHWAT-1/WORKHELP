import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:workrhelp_client/workrhelp_client.dart';
import 'package:workrhelp_flutter/components/abs_button_secondary.dart';
import 'package:workrhelp_flutter/components/abs_multiline_textfield.dart';
import 'package:workrhelp_flutter/components/abs_normal_text.dart';
import 'package:workrhelp_flutter/components/abs_text.dart';
import 'package:workrhelp_flutter/main.dart';

class CreateRequestPage extends StatefulWidget {
  const CreateRequestPage({super.key});

  @override
  State<CreateRequestPage> createState() => _CreateRequestPageState();
}

class _CreateRequestPageState extends State<CreateRequestPage> {
  TextEditingController descController = TextEditingController();
  List<File> uploadedImages = [];
  List<String> uploadedUrls = [];
  Location? location;
  bool isSubmitting = false;

  void pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (result != null) {
      final newImages =
          result.paths.whereType<String>().map((path) => File(path)).toList();

      setState(() {
        // Only add images up to the limit of 9
        int availableSlots = 9 - uploadedImages.length;
        if (availableSlots > 0) {
          uploadedImages.addAll(newImages.take(availableSlots));
        }
      });
    }
  }

  Future<Position> _determinePosition() async {
    bool enabled = await Geolocator.isLocationServiceEnabled();
    if (!enabled) throw 'Location services disabled';

    LocationPermission perm = await Geolocator.checkPermission();
    if (perm == LocationPermission.denied)
      perm = await Geolocator.requestPermission();
    if (perm == LocationPermission.deniedForever)
      throw 'Permissions permanently denied';

    var pos = await Geolocator.getCurrentPosition();
    setState(() {
      location = Location(latitude: pos.latitude, longitude: pos.longitude);
    });

    return await Geolocator.getCurrentPosition();
  }

  Future<void> uploadImage() async {
    List<String> urls = [];
    if (uploadedImages.isNotEmpty) {
      for (int i = 0; i < uploadedImages.length; i++) {
        var bytes = await uploadedImages[i].readAsBytes();
        ByteData byteData = ByteData.view(bytes.buffer);
        var imageUrl = await client.misc
            .uploadImage(byteData, "uploads/avatar_${DateTime.now()}.png");
        urls.add(imageUrl);
      }
      setState(() {
        uploadedUrls = urls;
      });
    }
  }

  Future<void> uploadRequest() async {
    if (location != null) {
      await uploadImage();
      // ignore: unused_local_variable
      var requestUpload = await client.request.createRequest(
          sessionManager.signedInUser!.id!,
          descController.text,
          uploadedUrls,
          location!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AbsText(
                text: "Create Request",
                headColor: true,
                fontSize: 24,
              ),
              const SizedBox(height: 20),
              AbsMultilineTextfield(
                hintText: "describe your issue...",
                controller: descController,
                border: true,
              ),
              const SizedBox(height: 10),
              AbsNormalText(displayString: "*max images: 9", fontSize: 16),
              const SizedBox(height: 10),
              Container(
                  height: 400,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      border: Border.all(width: 2, color: Colors.grey.shade700),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Column(
                          children: [
                            Expanded(
                              child: GridView.builder(
                                itemCount: uploadedImages.length < 9
                                    ? uploadedImages.length + 1
                                    : 9, // Limit to max 9 widgets (images + add button)
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                ),
                                itemBuilder: (context, index) {
                                  // Show the add button if under limit
                                  if (index == uploadedImages.length &&
                                      uploadedImages.length < 9) {
                                    return AbsButtonSecondary(
                                      onPressed: pickImage,
                                      child: const Icon(
                                          Icons.add_circle_outline,
                                          size: 40),
                                    );
                                  }

                                  // Image display with close option
                                  return Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: Image.file(
                                          uploadedImages[index],
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: double.infinity,
                                        ),
                                      ),
                                      Positioned(
                                        top: 4,
                                        right: 4,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              uploadedImages.removeAt(index);
                                            });
                                          },
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.black54,
                                              shape: BoxShape.circle,
                                            ),
                                            padding: const EdgeInsets.all(4),
                                            child: const Icon(Icons.close,
                                                size: 16, color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ))),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        isSubmitting = true;
                      });
                      await _determinePosition();
                      await uploadRequest();
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: isSubmitting
                          ? [
                              CircularProgressIndicator(
                                color: Colors.blue,
                              )
                            ]
                          : [
                              Icon(Icons.upload_rounded,
                                  size: 30, color: Colors.blue),
                              const SizedBox(width: 20),
                              AbsText(
                                text: "Upload Request",
                                fontSize: 20,
                              )
                            ],
                    ),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
