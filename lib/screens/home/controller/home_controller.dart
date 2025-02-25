import 'package:get/get.dart';
import 'package:state_management_app/model/user_model.dart';
import 'package:state_management_app/repositories/firestore_repository.dart';

class HomeController extends GetxController{
  final FirestoreRepository _firestoreRepository = FirestoreRepository();

  var users = <User>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() {
    isLoading.value = true;

    //skema berhasil
    _firestoreRepository.getUsers().listen((snapshot){
      users.value = snapshot.docs
          .map((doc) =>
          User.fromFirestore(doc.data() as Map<String, dynamic>, doc.id)
      ).toList();
      isLoading.value = false;
    },

    // skema error
    onError: (error) {
      Get.snackbar("Error", "Gagal mengambil data: $error");
    });
  }
}