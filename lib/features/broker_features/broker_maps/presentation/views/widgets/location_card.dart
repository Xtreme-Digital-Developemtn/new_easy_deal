import 'package:url_launcher/url_launcher.dart';
import '../../../../../../main_imports.dart';
import '../../../data/models/map_location_model.dart';

class LocationCard extends StatelessWidget {
  const LocationCard(this.location, {super.key});

  final MapLocation location;

  Future<void> _openMap(double lat, double lng, String label) async {
    final url = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$lat,$lng&query_place_id=$label',
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _openMapDirections(
    double lat,
    double lng,
    String destination,
  ) async {
    final url = Uri.parse(
      'https://www.google.com/maps/dir/?api=1&destination=$lat,$lng&destination_place_id=$destination',
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: InkWell(
        onTap: () =>
            _openMap(location.latitude, location.longitude, location.name),
        onLongPress: () => _openMapDirections(
          location.latitude,
          location.longitude,
          location.name,
        ),
        borderRadius: BorderRadius.circular(16.r),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image Section
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffEFF6FF),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12.r),
                          topLeft: Radius.circular(12.r),
                        ),
                      ),
                      child: Image.asset(
                        "assets/images/pngs/Container.png",
                        height: 160.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Container(
                    //   height: 120.h,
                    //   width: double.infinity,
                    //   color: Colors.grey[200],
                    //   child: location.imageUrl.isNotEmpty
                    //       ? Image.network(
                    //     location.imageUrl,
                    //     fit: BoxFit.cover,
                    //     errorBuilder: (context, error, stackTrace) {
                    //       return Center(
                    //         child: Icon(Icons.location_on, size: 50.sp, color: Colors.grey),
                    //       );
                    //     },
                    //   )
                    //       : Center(
                    //     child: Icon(Icons.location_on, size: 50.sp, color: Colors.grey),
                    //   ),
                    // ),
                    Positioned(
                      top: 8.h,
                      right: 8.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryDark,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          location.category,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: SvgPicture.asset(SvgImages.location2,height: 50.h,colorFilter: ColorFilter.mode(AppColors.primaryLight,
                          BlendMode.srcIn,
                      ),
                      ),
                    ),
                    Positioned(
                      bottom: 8.h,
                      left: 8.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/images/svgs/Icon.svg"),
                            Gap(6.w),
                            Text(
                              "2.5 km",
                              style: TextStyle(
                                color: AppColors.primaryLight,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Content Section
              Padding(
                padding: EdgeInsets.all(12.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          location.name,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(SvgImages.star,height: 20.h,),
                            Gap(4.w),
                            Text("2.5",style: AppStyles.black16SemiBold,),
                            Gap(4.w),
                            Text("(55)",style: AppStyles.gray12Medium,),
                          ],
                        ),

                      ],
                    ),
                    Gap(4.h),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 14.sp,
                          color: Colors.grey[600],
                        ),
                        Gap(4.w),
                        Expanded(
                          child: Text(
                            location.address,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey[600],
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Gap(8.h),
                    // Coordinates
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffF8F9FA),
                       // color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset("assets/images/svgs/Icon.svg"),
                          // Icon(
                          //   Icons.my_location,
                          //   size: 12.sp,
                          //   color: Colors.blue[700],
                          // ),
                          Gap(4.w),
                          Text(
                            '${location.latitude.toStringAsFixed(4)}, ${location.longitude.toStringAsFixed(4)}',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Color(0xff4A5565),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(8.h),
                    // Action Button
                    CustomButton(
                      text: 'Open in Maps',
                      onPressed: () => _openMap(
                        location.latitude,
                        location.longitude,
                        location.name,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
