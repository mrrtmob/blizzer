import 'dart:io';
import 'package:blizzer/api/mutation/post_product.dart';
import 'package:blizzer/api/query/query_categories.dart';
import 'package:blizzer/api/upload_image.dart';
import 'package:blizzer/components/custom_surfix_icon.dart';
import 'package:blizzer/components/default_button.dart';
import 'package:blizzer/components/form_error.dart';
import 'package:blizzer/components/show_dialog.dart';
import 'package:blizzer/constants.dart';

import 'package:blizzer/models/ModelProvider.dart';
import 'package:blizzer/screens/home/home_screen.dart';
import 'package:blizzer/size_config.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class UploadForm extends StatefulWidget {
  const UploadForm({Key? key}) : super(key: key);

  @override
  State<UploadForm> createState() => _UploadFormState();
}

class _UploadFormState extends State<UploadForm> {
  List<XFile> _imageFileList = [];

  List<Type?> categories = [];
  List<Type>? selectCategories = [];
  final _formKey = GlobalKey<FormState>();
  String productName = "";
  double productPrice = 0.0;
  String description = "";

  final List<String?> errors = [];
  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: buildProductNameFormField(),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: buildPriceFormField(),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: buildDescriptionFormField(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Text(
                  "You will be able to edit this information later",
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildCategories(selectCategories),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildImagePicker(_imageFileList),
            SizedBox(height: getProportionateScreenHeight(30)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(24)),
              child: FormError(errors: errors),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: DefaultButton(
                  text: "Upload",
                  press: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      showLoaderDialog(context, "Uploading...");
                      final key = DateTime.now().toString();
                      uploadImage(key, _imageFileList).then((value) {
                        createProduct(Item(
                                productName: productName,
                                price: productPrice,
                                imageUrl: _imageFileList
                                    .map((e) => key + e.name)
                                    .toList(),
                                userID: 'sdgsdgdsgdh',
                                types: selectCategories!
                                    .map((e) => e.id)
                                    .toList()))
                            .then((value) => Navigator.pop(context))
                            .then((value) => Navigator.popAndPushNamed(
                                context, HomeScreen.routeName));
                                
                      });
                    }
                  }),
            ),
          ],
        ));
  }

  TextFormField buildProductNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => productName = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please Enter Product name");
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: "Please Enter Product name");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Product name*",
        hintText: "Enter Product name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Cart Icon.svg"),
      ),
    );
  }

  TextFormField buildPriceFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => productPrice = double.parse(newValue!),
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please Enter Product Price");
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: "Please Enter Product Price");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Price*",
        hintText: "Price",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/Cash.svg",
        ),
        suffixIconColor: kTextColor,
      ),
    );
  }

  TextFormField buildDescriptionFormField() {
    return TextFormField(
      minLines: 5,
      maxLines: 10,
      keyboardType: TextInputType.multiline,
      onSaved: (newValue) => description = newValue!,
      onChanged: (value) {},
      decoration: InputDecoration(
        labelText: "Description",
        hintText: "Write a detailed description",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  Widget buildCategories(List<Type?>? selectCategories) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            height: 75,
          ),
          Container(
            height: 65,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              border: Border.all(
                color: kTextColor,
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 32),
                        child: ElevatedButton(
                            onPressed: () async {
                              categories = await queryCategories();
                              print(categories);
                              openFilterDelegate(categories);
                            },
                            style: ElevatedButton.styleFrom(
                                primary: kTextColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                textStyle: TextStyle()),
                            child: Text("+ Add")),
                      ),
                      Container(
                        height: 40,
                        child: ListView.builder(
                            itemCount: selectCategories?.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: kPrimaryLightColor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    child: Text(
                                      selectCategories![index]!.typeName,
                                      style: TextStyle(color: kPrimaryColor),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ]),
              ),
            ),
          ),
          Positioned(
              top: 0,
              left: 36,
              child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "Categories*",
                      style: TextStyle(fontSize: 12),
                    ),
                  )))
        ],
      ),
    );
  }

  Widget buildImagePicker(List<XFile> imageList) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GestureDetector(
            onTap: pickImage,
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Container(
                  height: 160,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: getProportionateScreenWidth(20)),
                  child: Container(
                      height: 150,
                      width: 120,
                      decoration: BoxDecoration(
                          border: Border.all(color: kTextColor),
                          borderRadius: BorderRadius.circular(26)),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: CustomSurffixIcon(
                          svgIcon: "assets/icons/Plus Icon.svg",
                        ),
                      ))),
                ),
                Positioned(
                    top: 0,
                    left: 56,
                    child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "Image*",
                            style: TextStyle(fontSize: 12),
                          ),
                        )))
              ],
            ),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Stack(
                      children: [
                        Container(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(26),
                              child: Image.file(File(imageList[index].path))),
                          decoration: BoxDecoration(
                              color: kTextColor,
                              borderRadius: BorderRadius.circular(26)),
                          height: 150,
                          width: 120,
                        ),
                        Positioned(
                          left: 90,
                          bottom: 100,
                          child: GestureDetector(
                            onTap: () {
                              imageList.removeAt(index);
                              setState(() {});
                            },
                            child: CustomSurffixIcon(
                              svgIcon: "assets/icons/Close.svg",
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
                itemCount: imageList.length),
          ),
        ],
      ),
    );
  }

  Future pickImage() async {
    try {
      final images = await ImagePicker().pickMultiImage();
      if (images == null) return;
      setState(() {
        _imageFileList.addAll(images);
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void openFilterDelegate(List<Type?> categories) async {
    await FilterListDelegate.show<Type?>(
      context: context,
      list: categories,
      onItemSearch: (categories, query) {
        return categories!.typeName.toLowerCase().contains(query.toLowerCase());
      },
      tileLabel: (categories) => categories!.typeName,
      emptySearchChild: Center(child: Text('No user found')),
      selectedListData: selectCategories,
      searchFieldHint: 'Search Here..',
      theme: FilterListDelegateThemeData(tileColor: kPrimaryColor),
      onApplyButtonClick: (list) {
        setState(() {
          selectCategories = list!.cast<Type>();
          print(selectCategories);
        });
      },
    );
  }
}
