import 'package:base_flutter_tci/_core/utils/logger.dart';
import 'package:base_flutter_tci/data/_core/app_exceptions.dart';

class ResponseModel<T> {
  ResponseModel({
    bool? status,
    String? message,
    T? data,
    MetaModel? meta,
    List<ErrorModel>? errors,
  }) {
    _status = status;
    _message = message;
    _data = data;
    _meta = meta;
    _errors = errors;
  }

  /// Constructor for [ResponseModel] from json data
  /// An [AppException.parsingData] will be thrown when error while parsing json
  ResponseModel.fromJson(dynamic json, [T Function(dynamic)? fromJsonData]) {
    try {
      _status = json['status'];
      _message = json['message'];
      if (fromJsonData != null) {
        _data = json['data'] != null ? fromJsonData(json['data']) : null;
      }else{
        _data = json['data'];
      }
      _meta = json['meta'] != null ? MetaModel.fromJson(json['meta']) : null;
      if (json['errors'] != null) {
        _errors = [];
        json['errors'].forEach((v) {
          _errors?.add(ErrorModel.fromJson(v));
        });
      }
    } catch (e, s) {
      logger.e("ResponseModel.fromJson", error: e, stackTrace: s);
      throw const AppException.parsingData();
    }
  }

  bool? _status;
  String? _message;
  T? _data;
  MetaModel? _meta;
  List<ErrorModel>? _errors;

  bool get status => _status ?? false;

  String get message => _message ?? '';

  T? get data => _data;

  MetaModel get meta => _meta ?? MetaModel();

  List<ErrorModel> get errors => _errors ?? [];

  Map<String, dynamic> toJson([Map<String, dynamic> Function(T?)? toJsonData]) {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (data != null && toJsonData != null) {
      map['data'] = toJsonData(data);
    }
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    if (_errors != null) {
      map['errors'] = _errors?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ErrorModel {
  ErrorModel({
    String? attribute,
    String? text,
  }) {
    _attribute = attribute;
    _text = text;
  }

  ErrorModel.fromJson(dynamic json) {
    _attribute = json['attribute'];
    _text = json['text'];
  }

  String? _attribute;
  String? _text;

  String get attribute => _attribute ?? '';

  String get text => _text ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['attribute'] = _attribute;
    map['text'] = _text;
    return map;
  }
}

class MetaModel {
  MetaModel({
    int? count,
    int? total,
    int? perPage,
    int? currentPage,
    int? totalPage,
  }) {
    _count = count;
    _total = total;
    _perPage = perPage;
    _currentPage = currentPage;
    _totalPage = totalPage;
  }

  MetaModel.fromJson(dynamic json) {
    _count = json['count'];
    _total = json['total'];
    _perPage = json['per_page'];
    _currentPage = json['current_page'];
    _totalPage = json['total_page'];
  }

  int? _count;
  int? _total;
  int? _perPage;
  int? _currentPage;
  int? _totalPage;

  int get count => _count ?? 0;

  int get total => _total ?? 0;

  int get perPage => _perPage ?? 0;

  int get currentPage => _currentPage ?? 0;

  int get totalPage => _totalPage ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    map['total'] = _total;
    map['per_page'] = _perPage;
    map['current_page'] = _currentPage;
    map['total_page'] = _totalPage;
    return map;
  }
}
