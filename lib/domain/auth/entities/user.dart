class User {
  final EmploymentData? _employmentData;
  final PersonalData? _personalData;
  final List<Salary>? _salary;
  final Account? _user;

  const User({
    EmploymentData? employmentData,
    PersonalData? personalData,
    List<Salary>? salary,
    Account? user,
  })  : _employmentData = employmentData,
        _personalData = personalData,
        _salary = salary,
        _user = user;

  Account get user => _user ?? const Account();

  List<Salary> get salary => _salary ?? [];

  PersonalData get personalData => _personalData ?? const PersonalData();

  EmploymentData get employmentData =>
      _employmentData ?? const EmploymentData();
}

class Account {
  final String? _username;
  final String? _role;

  const Account({
    String? username,
    String? role,
  })  : _username = username,
        _role = role;

  String get role => _role ?? '';

  String get username => _username ?? '';
}

class Salary {
  final String? _employeeSalary;
  final String? _employeeSalaryUuid;
  final int? _value;

  const Salary({
    String? employeeSalary,
    String? employeeSalaryUuid,
    int? value,
  })  : _employeeSalary = employeeSalary,
        _employeeSalaryUuid = employeeSalaryUuid,
        _value = value;

  int get value => _value ?? 0;

  String get employeeSalaryUuid => _employeeSalaryUuid ?? '';

  String get employeeSalary => _employeeSalary ?? '';
}

class PersonalData {
  final String? _name;
  final String? _email;
  final String? _mobilePhone;
  final String? _nik;
  final String? _placeOfBirth;
  final String? _birthDate;
  final String? _gender;
  final String? _maritalStatus;
  final String? _bloodType;
  final String? _religion;
  final String? _address;
  final String? _photo;
  final String? _bankHolder;
  final String? _bankNumber;
  final String? _bankUuid;
  final String? _bank;

  const PersonalData({
    String? name,
    String? email,
    String? mobilePhone,
    String? nik,
    String? placeOfBirth,
    String? birthDate,
    String? gender,
    String? maritalStatus,
    String? bloodType,
    String? religion,
    String? address,
    String? photo,
    String? bankHolder,
    String? bankNumber,
    String? bankUuid,
    String? bank,
  })  : _name = name,
        _email = email,
        _mobilePhone = mobilePhone,
        _nik = nik,
        _placeOfBirth = placeOfBirth,
        _birthDate = birthDate,
        _gender = gender,
        _maritalStatus = maritalStatus,
        _bloodType = bloodType,
        _religion = religion,
        _address = address,
        _photo = photo,
        _bankHolder = bankHolder,
        _bankNumber = bankNumber,
        _bankUuid = bankUuid,
        _bank = bank;

  String get bank => _bank ?? '';

  String get bankUuid => _bankUuid ?? '';

  String get bankNumber => _bankNumber ?? '';

  String get bankHolder => _bankHolder ?? '';

  String get photo => _photo ?? '';

  String get address => _address ?? '';

  String get religion => _religion ?? '';

  String get bloodType => _bloodType ?? '';

  String get maritalStatus => _maritalStatus ?? '';

  String get gender => _gender ?? '';

  String get birthDate => _birthDate ?? '';

  String get placeOfBirth => _placeOfBirth ?? '';

  String get nik => _nik ?? '';

  String get mobilePhone => _mobilePhone ?? '';

  String get email => _email ?? '';

  String get name => _name ?? '';
}

class EmploymentData {
  final int? _employeeId;
  final String? _employee;
  final String? _division;
  final String? _position;
  final String? _startDate;
  final String? _endDate;
  final String? _schedule;

  const EmploymentData({
    int? employeeId,
    String? employee,
    String? division,
    String? position,
    String? startDate,
    String? endDate,
    String? schedule,
  })  : _employeeId = employeeId,
        _employee = employee,
        _division = division,
        _position = position,
        _startDate = startDate,
        _endDate = endDate,
        _schedule = schedule;

  String get schedule => _schedule ?? '';

  String get endDate => _endDate ?? '';

  String get startDate => _startDate ?? '';

  String get position => _position ?? '';

  String get division => _division ?? '';

  String get employee => _employee ?? '';

  int get employeeId => _employeeId ?? 0;
}
