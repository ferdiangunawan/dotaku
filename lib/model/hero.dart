import 'dart:convert';
import 'package:dotaku/utils/constant.dart';

List<Heroes> heroFromJson(String str) => List<Heroes>.from(json.decode(str).map((x) => Heroes.fromJson(x)));

class Heroes {
  Heroes({
    this.id,
    this.name,
    this.primaryAttr,
    this.attackType,
    this.roles,
    this.img,
    this.baseHealth,
    this.baseAttackMax,
    this.moveSpeed,
    this.baseMana,
  });

  int? id;
  String? name;
  String? primaryAttr;
  String? attackType;
  List<String>? roles;
  String? img;
  int? baseHealth;
  int? baseAttackMax;
  int? moveSpeed;
  int? baseMana;

  factory Heroes.fromJson(Map<String, dynamic> json) => Heroes(
        id: json["id"],
        name: json["localized_name"],
        primaryAttr: json["primary_attr"],
        attackType: json["attack_type"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        img: ApiRef.heroImage + json["img"],
        baseHealth: json["base_health"],
        baseAttackMax: json["base_attack_max"],
        moveSpeed: json["move_speed"],
        baseMana: json["base_mana"],
      );
  String get role => roles.toString().substring(1, roles.toString().length - 1);
}
