import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:rafiq_app/features/mother/widgets/widgets/photogrid_widget.dart';

import 'add_photo_header.dart';

class AddPhoto extends StatefulWidget {
  const AddPhoto({super.key});

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  List<AssetEntity> images = [];
  List<AssetEntity> selectedImages = [];

  @override
  void initState() {
    super.initState();
    requestPermissionsAndLoadImages();
  }

  Future<void> requestPermissionsAndLoadImages() async {
    PermissionStatus cameraStatus = await Permission.camera.request();
    PermissionStatus photosStatus = await Permission.photos.request();
    PermissionStatus storageStatus = await Permission.storage.request();

    bool granted =
        cameraStatus.isGranted &&
        (photosStatus.isGranted || storageStatus.isGranted);

    if (!granted) {
      openAppSettings();
      return;
    }

    loadGalleryImages();
  }

  Future<void> loadGalleryImages() async {
    List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      onlyAll: false,
    );

    if (albums.isEmpty) return;

    final AssetPathEntity album = albums.first;
    List<AssetEntity> media = await album.getAssetListPaged(page: 0, size: 50);

    setState(() {
      images = media;
    });
  }

  void toggleSelect(AssetEntity image) {
    setState(() {
      if (selectedImages.contains(image)) {
        selectedImages.remove(image);
      } else {
        selectedImages.add(image);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      body: SafeArea(
        child: Column(
          children: [
            AddPhotoHeader(
              selectedCount: selectedImages.length,
              onAddPressed: () => Navigator.pop(context, selectedImages),
            ),
            Expanded(
              child: PhotoGrid(
                images: images,
                selectedImages: selectedImages,
                toggleSelect: toggleSelect,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
