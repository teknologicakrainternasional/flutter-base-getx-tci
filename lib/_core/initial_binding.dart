import 'package:base_flutter_tci/data/data_binding.dart';
import 'package:base_flutter_tci/domain/domain_binding.dart';
import 'package:base_flutter_tci/presentation/presentation_binding.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    DataBinding().dependencies();
    DomainBinding().dependencies();
    PresentationBinding().dependencies();
  }
}
