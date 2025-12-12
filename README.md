# datafloat_test

Model Structure & JSON Parsing (Simple Explanation)

The models in this project (HouseDataModel and HouseData) were generated automatically using an online JSON-to-Dart tool.
The tool created:

 * Proper field mappings based on JSON keys.

 * An auto-generated fromJson(Map<String, dynamic>) method.

 * An auto-generated toJson() method.

Chosen State Management & Reasoning

This project uses GetX for state management because it is lightweight, fast, and easy to use.
GetX lets the app update UI automatically using reactive variables (Obx).

How Search Is Implemented

Search works by taking the user’s text, converting it to lowercase, splitting it into words, and checking if each word exists inside the house’s full address.
If the search box is empty, the full house list is shown again.
The filtered results are stored in searchedHouseList, and the UI updates automatically using GetX.

How Image Gallery Is Implemented

The image gallery is built using the PhotoView package.
Each image URL from the model is displayed inside a PhotoView widget, which provides built-in zoom, pan, and pinch-to-zoom support.This makes the gallery interactive and easy to navigate.
