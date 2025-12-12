import 'package:datafloat_test/constants/app_colors.dart';
import 'package:datafloat_test/constants/app_strings.dart';
import 'package:datafloat_test/modules/details_screen/controller/details_controller.dart';
import 'package:datafloat_test/modules/list_screen/view/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view_gallery.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key});
  final DetailsController detailsController = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: CircleAvatar(
              backgroundColor: AppColors.secondary,
              child: Icon(Icons.arrow_back, color: AppColors.primaryColor),
            ),
          ),
        ),
        title: Container(
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: Text(
              AppStrings.mlsNumber +
                  AppStrings.space +
                  detailsController.houseDetails.value.iDCMLSNUMBER!,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: AppColors.secondary,
              child: Icon(Icons.share, color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            detailsController.houseDetails.value.pICTURE!.isEmpty
                ? Container(
                    color: AppColors.primaryColor.withOpacity(.4),
                    height: size.height * .4,
                    child: Center(child: Text("No Image")),
                  )
                : Container(
                    color: AppColors.primaryColor.withOpacity(.4),
                    height: size.height * .4,
                    child: PhotoViewGallery.builder(
                      scrollPhysics: const BouncingScrollPhysics(),
                      builder: (BuildContext context, int index) {
                        return PhotoViewGalleryPageOptions(
                          imageProvider: NetworkImage(
                            detailsController
                                .houseDetails
                                .value
                                .pICTURE![index],
                          ),
                        );
                      },
                      itemCount:
                          detailsController.houseDetails.value.pICTURE!.length,
                      loadingBuilder: (context, event) => Center(
                        child: Container(
                          width: 20.0,
                          height: 20.0,
                          child: CircularProgressIndicator(
                            value: event == null
                                ? 0
                                : event.cumulativeBytesLoaded /
                                      event.expectedTotalBytes!.toInt(),
                          ),
                        ),
                      ),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: size.width * .35,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * .3,
                              child: Text(
                                AppStrings.dollar +
                                    detailsController
                                        .houseDetails
                                        .value
                                        .iDCLISTPRICE!
                                        .toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width * .3,
                              child: Text(
                                detailsController
                                        .houseDetails
                                        .value
                                        .iDCPROPERTYTYPE ??
                                    "",

                                // detailsController.houseDetails.value.iDCLISTPRICE!.toString(),
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Container(
                              width: size.width * .3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                color: AppColors.primaryColor.withOpacity(.4),
                              ),
                              child: Center(
                                child: Text(
                                  detailsController
                                      .houseDetails
                                      .value
                                      .iDCSTATUS!
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: size.width,
                          child: Text(
                            detailsController
                                .houseDetails
                                .value
                                .iDCFULLADDRESS!,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Row(
                          children: [
                            IconDataWidget(
                              iconData: Icons.bed,
                              text:
                                  detailsController.houseDetails.value.bEDS
                                      ?.toString() ??
                                  "Nil",
                            ),
                            IconDataWidget(
                              iconData: Icons.bathtub_outlined,
                              text:
                                  detailsController
                                      .houseDetails
                                      .value
                                      .bATHSTOTAL
                                      ?.toString() ??
                                  "Nil",
                            ),
                            IconDataWidget(
                              iconData: Icons.straighten,
                              text:
                                  (detailsController.houseDetails.value.sQFT
                                          ?.toString() ??
                                      "-") +
                                  AppStrings.space +
                                  AppStrings.sqFt,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconDataWidget(
                        iconData: Icons.language,
                        text: AppStrings.viewOnWebsite,
                        color: AppColors.primaryColor,
                      ),
                      IconDataWidget(
                        iconData: Icons.location_on_sharp,
                        text: AppStrings.viewOnMap,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  DefaultTabController(
                    length: 2,

                    child: Column(
                      children: [
                        TabBar(
                          labelColor: AppColors.primaryColor,
                          unselectedLabelColor: AppColors.grey,
                          indicatorColor: AppColors.primaryColor,
                          dividerColor: Colors.transparent,
                          tabs: [
                            Tab(text: AppStrings.details),
                            Tab(text: AppStrings.listingAgent),
                          ],
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: size.height * .4,
                          child: TabBarView(
                            children: [
                              Column(
                                children: [
                                  DetailsRowWidget(
                                    size: size,
                                    text: detailsController
                                        .houseDetails
                                        .value
                                        .iDCMLSNUMBER!,
                                    title: AppStrings.mlsNumber,
                                  ),
                                  Divider(),
                                  DetailsRowWidget(
                                    size: size,
                                    text:
                                        detailsController
                                            .houseDetails
                                            .value
                                            .iDCPROPERTYTYPE ??
                                        "Not Available",
                                    title: AppStrings.propertyType,
                                  ),
                                  Divider(),
                                  DetailsRowWidget(
                                    size: size,
                                    text:
                                        detailsController
                                            .houseDetails
                                            .value
                                            .iDCSTATUS ??
                                        "Not Available",
                                    title: AppStrings.status,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  DetailsRowWidget(
                                    size: size,
                                    text:
                                        detailsController
                                            .houseDetails
                                            .value
                                            .lISTAGENTNAME ??
                                        "Not Available",
                                    title: AppStrings.name,
                                  ),
                                  Divider(),
                                  DetailsRowWidget(
                                    size: size,
                                    text:
                                        detailsController
                                            .houseDetails
                                            .value
                                            .lISTAGENTOFFICE ??
                                        "Not Available",
                                    title: AppStrings.office,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsRowWidget extends StatelessWidget {
  const DetailsRowWidget({
    super.key,
    required this.size,
    required this.text,
    required this.title,
  });
  final Size size;
  final String text;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: size.width * .35,
          child: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: size.width * .55,
          child: Text(text, style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }
}
