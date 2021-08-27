import 'package:flutter/material.dart';

class Patient {
  final int id;
  final String name;
  final String phone;
  final String rg;
  final String cpf;
  final String avatarUrl;

  const Patient({
    required this.id,
    required this.name,
    required this.phone,
    required this.rg,
    required this.cpf,
    required this.avatarUrl,
  });
}
