import 'dart:async';
import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:quiver/core.dart';
import 'package:hive/hive.dart';


class ContactsService {
  static const MethodChannel _channel =
      MethodChannel('github.com/clovisnicolas/flutter_contacts');

  /// Fetches all contacts, or when specified, the contacts with a name
  /// matching [query]
  static Future<Iterable<Contact>> getContacts(
      {String query,
      bool withThumbnails = false,
      bool photoHighResolution = false,
      bool orderByGivenName = true}) async {
    Iterable contacts =
        await _channel.invokeMethod('getContacts', <String, dynamic>{
      'query': query,
      'withThumbnails': withThumbnails,
      'photoHighResolution': photoHighResolution,
      'orderByGivenName': orderByGivenName
    });
    return contacts.map((m) => Contact.fromMap(m));
   
  }

  /// Fetches all contacts, or when specified, the contacts with a name
  /// matching [query]
  static Future<Iterable<Contact>> getContactsForPhone(String phone,
      {bool withThumbnails = true,
      bool photoHighResolution = true,
      bool orderByGivenName = true}) async {
    if (phone == null || phone.isEmpty) return Iterable.empty();

    Iterable contacts =
        await _channel.invokeMethod('getContactsForPhone', <String, dynamic>{
      'phone': phone,
      'withThumbnails': withThumbnails,
      'photoHighResolution': photoHighResolution,
      'orderByGivenName': orderByGivenName
    });
    return contacts.map((m) => Contact.fromMap(m));
  }

  /// Loads the avatar for the given contact and returns it. If the user does
  /// not have an avatar, then `null` is returned in that slot. Only implemented
  /// on Android.
  static Future<Uint8List> getAvatar(
      final Contact contact, {final bool photoHighRes = true}) =>
      _channel.invokeMethod('getAvatar', <String, dynamic>{
        'contact': Contact._toMap(contact),
        'photoHighResolution': photoHighRes,
      });

  /// Adds the [contact] to the device contact list
  static Future addContact(Contact contact) =>
      _channel.invokeMethod('addContact', Contact._toMap(contact));

  /// Deletes the [contact] if it has a valid identifier
  static Future deleteContact(Contact contact) =>
      _channel.invokeMethod('deleteContact', Contact._toMap(contact));

  /// Updates the [contact] if it has a valid identifier
  static Future updateContact(Contact contact) =>
      _channel.invokeMethod('updateContact', Contact._toMap(contact));
}

class Contact {
  Contact({
    this.displayName,
    this.givenName,
    this.middleName,
    this.familyName,
    this.emails,
    this.phones,
    this.avatar,
  });

  String identifier, displayName, givenName, middleName, familyName;
  Iterable<Item> emails = [];
  Iterable<Item> phones = [];
  Uint8List avatar;

  String initials() {
    return ((this.givenName?.isNotEmpty == true ? this.givenName[0] : "") +
            (this.familyName?.isNotEmpty == true ? this.familyName[0] : ""))
        .toUpperCase();
  }

  Contact.fromMap(Map m) {
    displayName = m["displayName"];
    givenName = m["givenName"];
    middleName = m["middleName"];
    familyName = m["familyName"];
    emails = (m["emails"] as Iterable)?.map((m) => Item.fromMap(m));
    phones = (m["phones"] as Iterable)?.map((m) => Item.fromMap(m));
    avatar = m["avatar"];
  }

  static Map _toMap(Contact contact) {
    var emails = [];
    for (Item email in contact.emails ?? []) {
      emails.add(Item._toMap(email));
    }
    var phones = [];
    for (Item phone in contact.phones ?? []) {
      phones.add(Item._toMap(phone));
    }


  
    return {
      "displayName": contact.displayName,
      "givenName": contact.givenName,
      "middleName": contact.middleName,
      "familyName": contact.familyName,
      "emails": emails,
      "phones": phones,
      "avatar": contact.avatar,
    };
  }

  Map toMap() {
    return Contact._toMap(this);
  }

  /// The [+] operator fills in this contact's empty fields with the fields from [other]
  operator +(Contact other) => Contact(
      givenName: this.givenName ?? other.givenName,
      middleName: this.middleName ?? other.middleName,
      familyName: this.familyName ?? other.familyName,
      emails: this.emails == null
          ? other.emails
          : this.emails.toSet().union(other.emails?.toSet() ?? Set()).toList(),
      phones: this.phones == null
          ? other.phones
          : this.phones.toSet().union(other.phones?.toSet() ?? Set()).toList(),
      avatar: this.avatar ?? other.avatar,
    );

  /// Returns true if all items in this contact are identical.
  @override
  bool operator ==(Object other) {
    return other is Contact &&
        this.avatar == other.avatar &&
        this.displayName == other.displayName &&
        this.givenName == other.givenName &&
        this.familyName == other.familyName &&
        this.middleName == other.middleName &&
        DeepCollectionEquality.unordered().equals(this.phones, other.phones) &&
        DeepCollectionEquality.unordered().equals(this.emails, other.emails) ;
  }

  @override
  int get hashCode {
    return hashObjects([
      this.displayName,
      this.familyName,
      this.givenName,
      this.middleName,
    ].where((s) => s != null));
  }

  
}

class PostalAddress {
  PostalAddress(
      {this.label,
      this.street,
      this.city,
      this.postcode,
      this.region,
      this.country});
  String label, street, city, postcode, region, country;

  PostalAddress.fromMap(Map m) {
    label = m["label"];
    street = m["street"];
    city = m["city"];
    postcode = m["postcode"];
    region = m["region"];
    country = m["country"];
  }

  @override
  bool operator ==(Object other) {
    return other is PostalAddress &&
        this.city == other.city &&
        this.country == other.country &&
        this.label == other.label &&
        this.postcode == other.postcode &&
        this.region == other.region &&
        this.street == other.street;
  }

  @override
  int get hashCode {
    return hashObjects([
      this.label,
      this.street,
      this.city,
      this.country,
      this.region,
      this.postcode,
    ].where((s) => s != null));
  }

  static Map _toMap(PostalAddress address) => {
        "label": address.label,
        "street": address.street,
        "city": address.city,
        "postcode": address.postcode,
        "region": address.region,
        "country": address.country
      };

  @override
  String toString() {
    String finalString = "";
    if (this.street != null) {
      finalString += this.street;
    }
    if (this.city != null) {
      if (finalString.isNotEmpty) {
        finalString += ", " + this.city;
      } else {
        finalString += this.city;
      }
    }
    if (this.region != null) {
      if (finalString.isNotEmpty) {
        finalString += ", " + this.region;
      } else {
        finalString += this.region;
      }
    }
    if (this.postcode != null) {
      if (finalString.isNotEmpty) {
        finalString += " " + this.postcode;
      } else {
        finalString += this.postcode;
      }
    }
    if (this.country != null) {
      if (finalString.isNotEmpty) {
        finalString += ", " + this.country;
      } else {
        finalString += this.country;
      }
    }
    return finalString;
  }
}

/// Item class used for contact fields which only have a [label] and
/// a [value], such as emails and phone numbers
class Item {
  Item({this.label, this.value});

  String label, value;

  Item.fromMap(Map m) {
    label = m["label"];
    value = m["value"];
  }

  @override
  bool operator ==(Object other) {
    return other is Item &&
        this.label == other.label &&
        this.value == other.value;
  }

  @override
  int get hashCode => hash2(label ?? "", value ?? "");

  static Map _toMap(Item i) => {"label": i.label, "value": i.value};
}


