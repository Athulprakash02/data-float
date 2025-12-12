import 'package:datafloat_test/constants/app_colors.dart';
import 'package:datafloat_test/constants/app_strings.dart';
import 'package:datafloat_test/modules/list_screen/controller/list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListScreen extends StatelessWidget {
  ListScreen({super.key});

  final ListController listCotroller = Get.find();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.secondary,
        title: Text(AppStrings.listings),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: SafeArea(
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.separated(
              itemBuilder: (context, index) => SizedBox(
                child: Row(
                  children: [
                    Container(
                      width: size.width * .25,
                      height: size.width * .25,
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),image: DecorationImage(image:NetworkImage(
                        listCotroller.houseList[index].pICTURE!.first,
                        // fit: BoxFit.fill,
                      ),fit: BoxFit.fill )),
                      // child: 
                    ),
                    SizedBox(width: 8),
                    SizedBox(
                      height: size.width * .25,
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
                                      AppStrings.space +
                                      listCotroller.houseList[index].iDCLISTPRICE!
                                          .toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                width: size.width * .3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  color: AppColors.primaryColor.withOpacity(.5),
                                ),
                                child: Center(
                                  child: Text(
                                    listCotroller.houseList[index].iDCSTATUS!
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: size.width * .6,
                            child: Text(
                              listCotroller.houseList[index].iDCFULLADDRESS!,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Row(
                            children: [
                              IconDataWidget(iconData: Icons.bed, text: listCotroller.houseList[index].bEDS?.toString()??"Nil",),
                          IconDataWidget(iconData: Icons.bathtub_outlined, text: listCotroller.houseList[index].bATHSTOTAL?.toString()??"Nil",),
                          IconDataWidget(iconData: Icons.straighten, text: (listCotroller.houseList[index].sQFT?.toString()??"-")+AppStrings.space+AppStrings.sqFt,),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: listCotroller.houseList.length,
            ),
          ),
        ),
      ),
    );
  }
}

class IconDataWidget extends StatelessWidget {
  const IconDataWidget({
    super.key, required this.iconData, required this.text,
  });
final IconData iconData;
final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(iconData, size: 20 ,color: AppColors.primaryColor),
          SizedBox(width: 3,),
          Text(
            text,
            style: TextStyle(fontSize: 18),
          ),
       
        ],
      ),
    );
  }
}
