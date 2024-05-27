import 'package:safesuit_bank/core/domain/models/sidebarModel.dart';

class LoadSidebarData {
  Future<SidebarModel> call() async {
    return SidebarModel(
      username: 'Angel Zea',
      email: 'angelzea2024@gmail.com'
    );
  }
}