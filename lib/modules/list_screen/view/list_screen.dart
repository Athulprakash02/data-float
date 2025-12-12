import 'package:datafloat_test/constants/app_colors.dart';
import 'package:datafloat_test/constants/app_strings.dart';
import 'package:datafloat_test/data/models/house_data_model.dart';
import 'package:datafloat_test/modules/list_screen/controller/list_controller.dart';
import 'package:datafloat_test/routes/app_routes.dart';
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
        leading: Obx(
          () => Visibility(
            visible: listCotroller.isSearching.value,
            child: IconButton(
              onPressed: () {
                listCotroller.isSearching.value = false;
                  listCotroller.searchedHouseList.value = listCotroller.houseList;
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
        ),

        title: Obx(
          () => !listCotroller.isSearching.value
              ? Text(AppStrings.listings,style: TextStyle(fontWeight: FontWeight.bold),)
              : TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: AppColors.secondary.withOpacity(.7),
                    contentPadding: EdgeInsets.symmetric(vertical: 12),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    listCotroller.searchByAddress(value);
                  },
                ),
        ),
        actions: [
         Obx(() =>  Visibility(
            visible: !listCotroller.isSearching.value,
            child: IconButton(
              onPressed: () {
                listCotroller.isSearching.value = true;
              
              },
              icon: const Icon(Icons.search),
            ),
          ),)
        ],
      ),
      body: SafeArea(
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.separated(
              itemBuilder: (context, index) => GestureDetector(
                onTap: () =>
                    Get.toNamed(AppRoutes.detailsScreen, arguments: listCotroller.isSearching.value
                      ? listCotroller.searchedHouseList[index]
                      : listCotroller.houseList[index]),
                child: ListItemWidget(
                  houseItem: listCotroller.isSearching.value
                      ? listCotroller.searchedHouseList[index]
                      : listCotroller.houseList[index],
                  size: size,
                ),
              ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: listCotroller.isSearching.value
                  ? listCotroller.searchedHouseList.length
                  : listCotroller.houseList.length,
            ),
          ),
        ),
      ),
    );
  }
}

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({
    super.key,
    required this.houseItem,
    required this.size,
  });
  final HouseData houseItem;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Container(
            width: size.width * .25,
            height: size.width * .25,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(.1),
              borderRadius: BorderRadius.all(Radius.circular(5)),
              image: DecorationImage(
                image: NetworkImage(
                  houseItem.pICTURE!.length > 0 ? houseItem.pICTURE!.first : "",
                  // fit: BoxFit.fill,
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Center(
              child: Text(houseItem.pICTURE!.isEmpty ? "No Image" : ""),
            ),
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
                            
                            houseItem.iDCLISTPRICE!.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * .3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: AppColors.primaryColor.withOpacity(.4),
                      ),
                      child: Center(
                        child: Text(
                          houseItem.iDCSTATUS!.toString(),
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
                  width: size.width * .6,
                  child: Text(
                    houseItem.iDCFULLADDRESS!,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Row(
                  children: [
                    IconDataWidget(
                      iconData: Icons.bed,
                      text: houseItem.bEDS?.toString() ?? "Nil",
                    ),
                    IconDataWidget(
                      iconData: Icons.bathtub_outlined,
                      text: houseItem.bATHSTOTAL?.toString() ?? "Nil",
                    ),
                    IconDataWidget(
                      iconData: Icons.straighten,
                      text:
                          (houseItem.sQFT?.toString() ?? "-") +
                          AppStrings.space +
                          AppStrings.sqFt,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IconDataWidget extends StatelessWidget {
   IconDataWidget({super.key, required this.iconData, required this.text,this.color = Colors.black,});
  final IconData iconData;
  final String text;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(iconData, size: 20, color: AppColors.primaryColor),
          SizedBox(width: 3),
          Text(text, style: TextStyle(fontSize: 18,color: color)),
        ],
      ),
    );
  }
}
