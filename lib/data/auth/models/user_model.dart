import 'package:base_flutter_tci/domain/auth/entities/user.dart';

class UserModel {
  UserModel({
    this.employmentData,
    this.personalData,
    this.salary,
    this.user,
  });

  UserModel.fromJson(dynamic json) {
    employmentData = json['employment_data'] != null
        ? EmploymentDataModel.fromJson(json['employment_data'])
        : null;
    personalData = json['personal_data'] != null
        ? PersonalDataModel.fromJson(json['personal_data'])
        : null;
    if (json['salary'] != null) {
      salary = [];
      json['salary'].forEach((v) {
        salary?.add(SalaryModel.fromJson(v));
      });
    }
    user = json['user'] != null ? AccountModel.fromJson(json['user']) : null;
  }

  EmploymentDataModel? employmentData;
  PersonalDataModel? personalData;
  List<SalaryModel>? salary;
  AccountModel? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (employmentData != null) {
      map['employment_data'] = employmentData?.toJson();
    }
    if (personalData != null) {
      map['personal_data'] = personalData?.toJson();
    }
    if (salary != null) {
      map['salary'] = salary?.map((v) => v.toJson()).toList();
    }
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

  User toDomain() {
    return User(
      employmentData: employmentData?.toDomain(),
      personalData: personalData?.toDomain(),
      salary: salary?.map((e) => e.toDomain()).toList(),
      user: user?.toDomain(),
    );
  }
}

class AccountModel {
  AccountModel({
    this.username,
    this.role,
  });

  AccountModel.fromJson(dynamic json) {
    username = json['username'];
    role = json['role'];
  }

  String? username;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['role'] = role;
    return map;
  }

  Account toDomain() {
    return Account(
      username: username,
      role: role,
    );
  }
}

class SalaryModel {
  SalaryModel({
    this.employeeSalary,
    this.employeeSalaryUuid,
    this.value,
  });

  SalaryModel.fromJson(dynamic json) {
    employeeSalary = json['employee_salary'];
    employeeSalaryUuid = json['employee_salary_uuid'];
    value = json['value'];
  }

  String? employeeSalary;
  String? employeeSalaryUuid;
  int? value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['employee_salary'] = employeeSalary;
    map['employee_salary_uuid'] = employeeSalaryUuid;
    map['value'] = value;
    return map;
  }

  Salary toDomain() {
    return Salary(
      employeeSalary: employeeSalary,
      employeeSalaryUuid: employeeSalaryUuid,
      value: value,
    );
  }
}

class PersonalDataModel {
  PersonalDataModel({
    this.name,
    this.email,
    this.mobilePhone,
    this.nik,
    this.placeOfBirth,
    this.birthDate,
    this.gender,
    this.maritalStatus,
    this.bloodType,
    this.religion,
    this.address,
    this.photo,
    this.bankHolder,
    this.bankNumber,
    this.bankUuid,
    this.bank,
  });

  PersonalDataModel.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    mobilePhone = json['mobile_phone'];
    nik = json['nik'];
    placeOfBirth = json['place_of_birth'];
    birthDate = json['birth_date'];
    gender = json['gender'];
    maritalStatus = json['marital_status'];
    bloodType = json['blood_type'];
    religion = json['religion'];
    address = json['address'];
    photo = json['photo'];
    bankHolder = json['bank_holder'];
    bankNumber = json['bank_number'];
    bankUuid = json['bank_uuid'];
    bank = json['bank'];
  }

  String? name;
  String? email;
  String? mobilePhone;
  String? nik;
  String? placeOfBirth;
  String? birthDate;
  String? gender;
  String? maritalStatus;
  String? bloodType;
  String? religion;
  String? address;
  String? photo;
  String? bankHolder;
  String? bankNumber;
  String? bankUuid;
  String? bank;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['mobile_phone'] = mobilePhone;
    map['nik'] = nik;
    map['place_of_birth'] = placeOfBirth;
    map['birth_date'] = birthDate;
    map['gender'] = gender;
    map['marital_status'] = maritalStatus;
    map['blood_type'] = bloodType;
    map['religion'] = religion;
    map['address'] = address;
    map['photo'] = photo;
    map['bank_holder'] = bankHolder;
    map['bank_number'] = bankNumber;
    map['bank_uuid'] = bankUuid;
    map['bank'] = bank;
    return map;
  }

  PersonalData toDomain() {
    return PersonalData(
      name: name,
      email: email,
      mobilePhone: mobilePhone,
      nik: nik,
      placeOfBirth: placeOfBirth,
      birthDate: birthDate,
      gender: gender,
      maritalStatus: maritalStatus,
      bloodType: bloodType,
      religion: religion,
      address: address,
      photo: photo,
      bankHolder: bankHolder,
      bankUuid: bankUuid,
      bank: bank,
    );
  }
}

class EmploymentDataModel {
  EmploymentDataModel({
    this.employeeId,
    this.employee,
    this.division,
    this.position,
    this.startDate,
    this.endDate,
    this.schedule,
  });

  EmploymentDataModel.fromJson(dynamic json) {
    employeeId = json['employee_id'];
    employee = json['employee'];
    division = json['division'];
    position = json['position'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    schedule = json['schedule'];
  }

  int? employeeId;
  String? employee;
  String? division;
  String? position;
  String? startDate;
  String? endDate;
  String? schedule;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['employee_id'] = employeeId;
    map['employee'] = employee;
    map['division'] = division;
    map['position'] = position;
    map['start_date'] = startDate;
    map['end_date'] = endDate;
    map['schedule'] = schedule;
    return map;
  }

  EmploymentData toDomain() {
    return EmploymentData(
      employeeId: employeeId,
      employee: employee,
      division: division,
      position: position,
      startDate: startDate,
      endDate: endDate,
      schedule: schedule,
    );
  }
}
