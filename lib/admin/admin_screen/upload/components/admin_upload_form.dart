import 'dart:io';

import 'package:blizzer/admin/api/query/query_categories.dart';
import 'package:blizzer/components/custom_surfix_icon.dart';
import 'package:blizzer/components/default_button.dart';
import 'package:blizzer/components/form_error.dart';
import 'package:blizzer/constants.dart';
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

  List<Type> userList = [
    Type(name: "Jon", imageUrl: ""),
    Type(name: "Lindsey ", imageUrl: ""),
    Type(name: "Valarie ", imageUrl: ""),
    Type(name: "Elyse ", imageUrl: ""),
    Type(name: "Ethel ", imageUrl: ""),
    Type(name: "Emelyan ", imageUrl: ""),
    Type(name: "Catherine ", imageUrl: ""),
    Type(name: "Stepanida  ", imageUrl: ""),
    Type(name: "Carolina ", imageUrl: ""),
    Type(name: "Nail  ", imageUrl: ""),
    Type(name: "Kamil ", imageUrl: ""),
    Type(name: "Mariana ", imageUrl: ""),
    Type(name: "Katerina ", imageUrl: ""),
  ];
  final _formKey = GlobalKey<FormState>();
  String itemName = "";
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
              child: buildItemNameFormField(),
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
            buildCategories(userList),
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
                  }
                },
              ),
            ),
          ],
        ));
  }

  TextFormField buildItemNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => itemName = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please Enter Item name");
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: "Please Enter Item name");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Item name*",
        hintText: "Enter item name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Cart Icon.svg"),
      ),
    );
  }

  TextFormField buildPriceFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => itemName = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please Enter Item Price");
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: "Please Enter Item Price");
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

  Widget buildCategories(List<Type> categories) {
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
                            onPressed: (){
                              queryCategories();
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
                            itemCount: categories.length,
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
                                      categories[index].name.toString(),
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
                              setState(() {
                              });
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

  void openFilterDelegate() async {
    await FilterListDelegate.show<Type>(
      context: context,
      list: userList,
      onItemSearch: (user, query) {
        return user.name!.toLowerCase().contains(query.toLowerCase());
      },
      tileLabel: (user) => user!.name,
      emptySearchChild: Center(child: Text('No user found')),
      searchFieldHint: 'Search Here..',
      theme: FilterListDelegateThemeData(tileColor: kPrimaryColor),
      onApplyButtonClick: (list) {},
    );
  }
}

class Type {
  final String? name;
  final String? imageUrl;
  Type({this.name, this.imageUrl});
}
