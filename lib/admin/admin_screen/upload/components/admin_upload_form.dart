import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:blizzer/components/custom_surfix_icon.dart';
import 'package:blizzer/components/default_button.dart';
import 'package:blizzer/components/form_error.dart';
import 'package:blizzer/components/show_dialog.dart';
import 'package:blizzer/constants.dart';
import 'package:blizzer/screens/home/components/categories.dart';
import 'package:blizzer/size_config.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UploadForm extends StatefulWidget {
  const UploadForm({Key? key}) : super(key: key);

  @override
  State<UploadForm> createState() => _UploadFormState();
}

class _UploadFormState extends State<UploadForm> {
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
            buildItemNameFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPriceFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildDescriptionFormField(),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "You will be able to edit this information later",
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildCategories(userList),
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(30)),
            DefaultButton(
            text: "Upload",
            press: () async{
              if (_formKey.currentState!.validate()){
                _formKey.currentState!.save();
                
              }
            },
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
    return Stack(
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
                          onPressed: openFilterDelegate,
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
                                  child:
                                      Text(categories[index].name.toString(),style: TextStyle(color: kPrimaryColor),),
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
    );
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
