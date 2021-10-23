import 'dart:convert';

List<Hero> heroFromJson(String str) => List<Hero>.from(json.decode(str).map((x) => Hero.fromJson(x)));

class Hero {
  Hero({
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
  PrimaryAttr? primaryAttr;
  AttackType? attackType;
  List<Role>? roles;
  String? img;
  int? baseHealth;
  int? baseAttackMax;
  int? moveSpeed;

  factory Hero.fromJson(Map<String, dynamic> json) => Hero(
        id: json["id"],
        name: json["name"],
        primaryAttr: primaryAttrValues.map?[json["primary_attr"]],
        attackType: attackTypeValues.map?[json["attack_type"]],
        roles: List<Role>.from(json["roles"].map((x) => roleValues.map?[x])),
        img: json["img"],
        baseHealth: json["base_health"],
        baseAttackMax: json["base_attack_max"],
        moveSpeed: json["move_speed"],
      );
}

enum AttackType { melee, ranged }

final attackTypeValues = EnumValues({"Melee": AttackType.melee, "Ranged": AttackType.ranged});

enum PrimaryAttr { agi, str, int }

final primaryAttrValues = EnumValues({"agi": PrimaryAttr.agi, "int": PrimaryAttr.int, "str": PrimaryAttr.str});

enum Role { carry, escape, nuker, initiator, durable, disabler, jungler, support, pusher }

final roleValues = EnumValues({
  "Carry": Role.carry,
  "disabler": Role.disabler,
  "durable": Role.durable,
  "escape": Role.escape,
  "initiator": Role.initiator,
  "jungler": Role.jungler,
  "Nuker": Role.nuker,
  "pusher": Role.pusher,
  "support": Role.support
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);
}
