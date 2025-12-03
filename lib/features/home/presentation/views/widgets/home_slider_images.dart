import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_deal/features/home/presentation/view_model/home_cubit.dart';
import 'package:easy_deal/features/home/presentation/view_model/home_states.dart';
import 'package:easy_deal/main_imports.dart';

class HomeSliderImages extends StatelessWidget {
  const HomeSliderImages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit , HomeStates>(
      buildWhen:  (previous, current) {
        return current is ChangeHomeSliderImageState;
      },
      builder:  (context,state){
        var homeCubit = context.read<HomeCubit>();
        return CarouselSlider(
          items: homeCubit.sliderImagesList.map((slider) {
            return Stack(
              alignment: Alignment.bottomLeft,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 140.h,
                  child: CustomNetWorkImage(
                    imageUrl: slider,
                    raduis: 12.r,
                    fit: BoxFit.cover,
                  ),
                ),
                // SizedBox(
                //   width: MediaQuery.of(context).size.width,
                //   height: 140.h,
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(12.r),
                //     child: Image.asset(
                //       slider,
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
                Positioned(
                  bottom: 10.0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: homeCubit.sliderImagesList.asMap().entries.map((entry) {
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: homeCubit.currentSliderIndex == entry.key
                              ? Colors.white
                              : Colors.white.withValues(alpha: 0.5),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          }).toList(),
          options: CarouselOptions(
            autoPlay: true,
            height: 170,
            aspectRatio: MediaQuery.of(context).size.width / 250,
            viewportFraction: 0.8,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              homeCubit.changeHomeSliderImages(index);
            },
          ),
        );
      },

    );
  }
}
