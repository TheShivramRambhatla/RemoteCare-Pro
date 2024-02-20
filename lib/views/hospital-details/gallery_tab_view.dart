import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../resources/data/data.dart';

class GalleryTabViewWidget extends StatefulWidget {
  const GalleryTabViewWidget({super.key});

  @override
  State<GalleryTabViewWidget> createState() => _GalleryTabViewWidgetState();
}

class _GalleryTabViewWidgetState extends State<GalleryTabViewWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "Gallery",
                style: Theme.of(context).textTheme.titleLarge!,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                "(${DataClass.imagesList.length})",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
              Expanded(child: Container()),
              Icon(
                Icons.add_photo_alternate_outlined,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
              TextButton(
                onPressed: () {
                  // This function will uncomment when images from network
                  // showBottomModalView();
                },
                child: Text(
                  "add photo",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              )
            ],
          ),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: DataClass.imagesList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SingleImageViewWidget(
                                  image:
                                      DataClass.imagesList[index].toString())));
                    },
                    child: Hero(
                      tag: "image${DataClass.imagesList[index]}",
                      child: Image.asset(
                        DataClass.imagesList[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  // ignore: unused_field
  File? _image;

  final picker = ImagePicker();

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        pickedFile.path;
        DataClass.imagesList.add(pickedFile.path);
      }
    });
    if (!context.mounted) return;
    Navigator.of(context).pop();
    // Close the modal sheet after selecting a photo.
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      // Check if pickedFile is not null
      if (pickedFile != null) {
        // Create a File object using the path of pickedFile
        _image = File(pickedFile.path);
      }
    });
    if (!context.mounted) return;
    Navigator.of(context).pop();
    // Close the modal sheet after selecting a photo.
  }

  showBottomModalView() {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text('Take a photo'),
              onTap: () {
                getImageFromCamera();
              },
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Choose from gallery'),
              onTap: () {
                getImageFromGallery();
              },
            ),
          ],
        );
      },
    );
  }
}

class SingleImageViewWidget extends StatelessWidget {
  const SingleImageViewWidget({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Hero(tag: "image", child: Image.asset(image));
  }
}
