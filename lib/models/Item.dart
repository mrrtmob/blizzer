/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Item type in your schema. */
@immutable
class Item extends Model {
  static const classType = const _ItemModelType();
  final String id;
  final String? _name;
  final double? _price;
  final String? _description;
  final List<String>? _imageUrl;
  final User? _uploadBy;
  final List<ItemType>? _types;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;
  final String? _itemUploadById;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get price {
    try {
      return _price!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get description {
    return _description;
  }
  
  List<String>? get imageUrl {
    return _imageUrl;
  }
  
  User get uploadBy {
    try {
      return _uploadBy!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<ItemType>? get types {
    return _types;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String get itemUploadById {
    try {
      return _itemUploadById!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const Item._internal({required this.id, required name, required price, description, imageUrl, required uploadBy, types, createdAt, updatedAt, required itemUploadById}): _name = name, _price = price, _description = description, _imageUrl = imageUrl, _uploadBy = uploadBy, _types = types, _createdAt = createdAt, _updatedAt = updatedAt, _itemUploadById = itemUploadById;
  
  factory Item({String? id, required String name, required double price, String? description, List<String>? imageUrl, required User uploadBy, List<ItemType>? types, required String itemUploadById}) {
    return Item._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      price: price,
      description: description,
      imageUrl: imageUrl != null ? List<String>.unmodifiable(imageUrl) : imageUrl,
      uploadBy: uploadBy,
      types: types != null ? List<ItemType>.unmodifiable(types) : types,
      itemUploadById: itemUploadById);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Item &&
      id == other.id &&
      _name == other._name &&
      _price == other._price &&
      _description == other._description &&
      DeepCollectionEquality().equals(_imageUrl, other._imageUrl) &&
      _uploadBy == other._uploadBy &&
      DeepCollectionEquality().equals(_types, other._types) &&
      _itemUploadById == other._itemUploadById;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Item {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("price=" + (_price != null ? _price!.toString() : "null") + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("imageUrl=" + (_imageUrl != null ? _imageUrl!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("itemUploadById=" + "$_itemUploadById");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Item copyWith({String? id, String? name, double? price, String? description, List<String>? imageUrl, User? uploadBy, List<ItemType>? types, String? itemUploadById}) {
    return Item._internal(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      uploadBy: uploadBy ?? this.uploadBy,
      types: types ?? this.types,
      itemUploadById: itemUploadById ?? this.itemUploadById);
  }
  
  Item.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _price = (json['price'] as num?)?.toDouble(),
      _description = json['description'],
      _imageUrl = json['imageUrl']?.cast<String>(),
      _uploadBy = json['uploadBy']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['uploadBy']['serializedData']))
        : null,
      _types = json['types'] is List
        ? (json['types'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => ItemType.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null,
      _itemUploadById = json['itemUploadById'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'price': _price, 'description': _description, 'imageUrl': _imageUrl, 'uploadBy': _uploadBy?.toJson(), 'types': _types?.map((ItemType? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'itemUploadById': _itemUploadById
  };

  static final QueryField ID = QueryField(fieldName: "item.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField PRICE = QueryField(fieldName: "price");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField IMAGEURL = QueryField(fieldName: "imageUrl");
  static final QueryField UPLOADBY = QueryField(
    fieldName: "uploadBy",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (User).toString()));
  static final QueryField TYPES = QueryField(
    fieldName: "types",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (ItemType).toString()));
  static final QueryField ITEMUPLOADBYID = QueryField(fieldName: "itemUploadById");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Item";
    modelSchemaDefinition.pluralName = "Items";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Item.NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Item.PRICE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Item.DESCRIPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Item.IMAGEURL,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: Item.UPLOADBY,
      isRequired: true,
      ofModelName: (User).toString(),
      associatedKey: User.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Item.TYPES,
      isRequired: false,
      ofModelName: (ItemType).toString(),
      associatedKey: ItemType.ITEM
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Item.ITEMUPLOADBYID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _ItemModelType extends ModelType<Item> {
  const _ItemModelType();
  
  @override
  Item fromJson(Map<String, dynamic> jsonData) {
    return Item.fromJson(jsonData);
  }
}