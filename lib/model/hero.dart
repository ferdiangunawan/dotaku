import 'dart:convert';

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

  factory Heroes.fromJson(Map<String, dynamic> json) => Heroes(
        id: json["id"],
        name: json["name"],
        primaryAttr: json["primary_attr"],
        attackType: json["attack_type"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        img: json["img"],
        baseHealth: json["base_health"],
        baseAttackMax: json["base_attack_max"],
        moveSpeed: json["move_speed"],
      );
}
