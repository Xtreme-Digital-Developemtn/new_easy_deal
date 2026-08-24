import 'dart:io';
import 'package:easy_deal/features/broker_features/broker_maps/presentation/views/widgets/header_section.dart';
import 'package:easy_deal/features/broker_features/broker_maps/presentation/views/widgets/locations_list_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../../core/utils/toast/toast.dart';
import '../../../../../main_imports.dart';
import '../view_model/broker_maps_cubit.dart';
import '../view_model/broker_maps_states.dart';

class BrokerMapsView extends StatefulWidget {
  const BrokerMapsView({super.key});

  @override
  State<BrokerMapsView> createState() => _BrokerMapsViewState();
}

class _BrokerMapsViewState extends State<BrokerMapsView> {
  @override
  void initState() {
    super.initState();
    final userId = CacheHelper.getData(key: StorageKeys.userId);
    final brokerId = CacheHelper.getData(key: StorageKeys.brokerId);
    context.read<BrokerMapsCubit>().getMaps(brokerId: brokerId ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: LangKeys.maps.tr()),
      body: BlocBuilder<BrokerMapsCubit, BrokerMapsStates>(
        buildWhen: (previous, current) {
          return current is GetMapsLoadingState ||
              current is GetMapsSuccessState ||
              current is GetMapsErrorState;
        },
        builder: (context, state) {
          final cubit = context.read<BrokerMapsCubit>();
          final data = cubit.mapsModel?.data?.data ?? [];

          if (state is GetMapsLoadingState && data.isEmpty) {
            return const CustomLoading();
          }

          if (state is GetMapsErrorState && data.isEmpty) {
            return Center(child: Text(state.error));
          }

          return Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              children: [
                // const HeaderSection(),
                // Gap(12.h),
                Expanded(child: LocationsListView(locations: data)),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blueDark,
        onPressed: _showAddFileDialog,
        child: const Icon(Icons.add, color: AppColors.white),
      ),
    );
  }

  void _showAddFileDialog() {
    final cubit = context.read<BrokerMapsCubit>();
    final formKey = GlobalKey<FormState>();
    final descriptionController = TextEditingController();

    File? selectedFile;
    String? selectedFileName;

    showDialog(
      context: context,
      builder: (dialogContext) {
        return ResponsiveBreakpoints.builder(
          breakpoints: const [
            Breakpoint(start: 0, end: 450, name: MOBILE),
            Breakpoint(start: 451, end: 800, name: TABLET),
            Breakpoint(start: 801, end: 1920, name: DESKTOP),
            Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
          child: BlocProvider.value(
            value: cubit,
            child: BlocConsumer<BrokerMapsCubit, BrokerMapsStates>(
              listener: (context, state) {
                // الاستماع لحالة إضافة الخريطة
                if (state is AddMapSuccessState) {
                  // إغلاق الـ Dialog
                  Navigator.pop(dialogContext);

                  // عرض رسالة نجاح
                  Toast.showSuccessToast(
                    msg: "تم إضافة الخريطة بنجاح",
                    context: context,
                  );

                  // تحديث القائمة
                  final brokerId = CacheHelper.getData(key: StorageKeys.brokerId);
                  context.read<BrokerMapsCubit>().getMaps(brokerId: brokerId ?? 0);
                } else if (state is AddMapErrorState) {
                  // عرض رسالة خطأ
                  Toast.showErrorToast(
                    msg: state.error,
                    context: context,
                  );
                }
              },
              builder: (context, state) {
                // التحقق من حالة التحميل
                final isLoading = state is AddMapLoadingState;

                return StatefulBuilder(
                  builder: (context, setState) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      contentPadding: EdgeInsets.all(20.r),
                      titlePadding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
                      title: Row(
                        children: [
                          CircleAvatar(
                            radius: 22.r,
                            backgroundColor: AppColors.blueDark.withOpacity(.1),
                            child: Icon(
                              Icons.map_outlined,
                              color: AppColors.blueDark,
                              size: 22.sp,
                            ),
                          ),
                          Gap(12.w),
                          Text(
                            "إضافة خريطة",
                            style: AppStyles.black18SemiBold,
                          ),
                        ],
                      ),
                      content: SizedBox(
                        width: 420.w,
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Gap(20.h),

                              /// Upload Area
                              InkWell(
                                borderRadius: BorderRadius.circular(16.r),
                                onTap: isLoading
                                    ? null // تعطيل الرفع أثناء التحميل
                                    : () async {
                                  final result =
                                  await FilePicker.platform.pickFiles();

                                  if (result != null &&
                                      result.files.single.path != null) {
                                    setState(() {
                                      selectedFile =
                                          File(result.files.single.path!);
                                      selectedFileName =
                                          result.files.single.name;
                                    });
                                  }
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 250),
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 24.h,
                                    horizontal: 16.w,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.blueDark.withOpacity(.05),
                                    borderRadius:
                                    BorderRadius.circular(16.r),
                                    border: Border.all(
                                      color: selectedFile == null
                                          ? Colors.grey.shade300
                                          : Colors.green,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      if (isLoading)
                                      // عرض مؤشر التحميل أثناء الرفع
                                        const CircularProgressIndicator(
                                          color: AppColors.blueDark,
                                          strokeWidth: 3,
                                        )
                                      else
                                        Icon(
                                          selectedFile == null
                                              ? Icons.cloud_upload_outlined
                                              : Icons.check_circle,
                                          color: selectedFile == null
                                              ? AppColors.blueDark
                                              : Colors.green,
                                          size: 42.sp,
                                        ),
                                      Gap(12.h),
                                      Text(
                                        isLoading
                                            ? "جاري رفع الملف..."
                                            : (selectedFileName ??
                                            "اضغط لاختيار صورة أو ملف"),
                                        style: AppStyles.black14Medium,
                                        textAlign: TextAlign.center,
                                      ),
                                      if (selectedFile == null &&
                                          !isLoading) ...[
                                        Gap(6.h),
                                        Text(
                                          "PNG • JPG • PDF",
                                          style: AppStyles.gray12Medium,
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              ),

                              Gap(20.h),

                              TextFormField(
                                controller: descriptionController,
                                maxLines: 4,
                                enabled: !isLoading, // تعطيل الحقل أثناء التحميل
                                decoration: InputDecoration(
                                  labelText: "الوصف",
                                  hintText: "اكتب وصفًا للخريطة...",
                                  prefixIcon: const Icon(Icons.description_outlined),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(12.r),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(12.r),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(12.r),
                                    borderSide: BorderSide(
                                      color: AppColors.blueDark,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().isEmpty) {
                                    return "يرجى إدخال الوصف";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      actionsPadding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                      actions: [
                        SizedBox(
                          width: 110.w,
                          child: OutlinedButton(
                            onPressed: isLoading
                                ? null // تعطيل الإلغاء أثناء التحميل
                                : () => Navigator.pop(dialogContext),
                            child: const Text("إلغاء"),
                          ),
                        ),
                        SizedBox(
                          width: 120.w,
                          child: ElevatedButton.icon(
                            icon: isLoading
                                ? SizedBox(
                              width: 20.w,
                              height: 20.h,
                              child: const CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                                : const Icon(Icons.save),
                            label: Text(isLoading ? "جاري الحفظ..." : "حفظ"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.blueDark,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            onPressed: isLoading
                                ? null // تعطيل الزر أثناء التحميل
                                : () {
                              if (!formKey.currentState!.validate()) return;

                              if (selectedFile == null) {
                                Toast.showErrorToast(
                                  msg: "يرجى اختيار ملف",
                                  context: context,
                                );
                                return;
                              }

                              final brokerId = CacheHelper.getData(
                                key: StorageKeys.brokerId,
                              );

                              context.read<BrokerMapsCubit>().addMap(
                                image: selectedFile!,
                                description:
                                descriptionController.text.trim(),
                                brokerId: brokerId ?? 0,
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}