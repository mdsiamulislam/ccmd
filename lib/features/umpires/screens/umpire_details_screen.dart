import 'package:ccmd/core/models/umpire_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

class UmpireDetailsScreen extends StatelessWidget {
  final Umpire umpire;

  const UmpireDetailsScreen({super.key, required this.umpire});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(umpire.name),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16.w, 18.h, 16.w, 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Container(
                    width: 76.w,
                    height: 76.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: theme.colorScheme.primary,
                        width: 2.w,
                      ),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      umpire.name.isNotEmpty ? umpire.name.substring(0, 2).toUpperCase() : 'UM',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    umpire.name,
                    textAlign: TextAlign.center,
                    style: textTheme.titleLarge?.copyWith(
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'Experience: ${umpire.experience}',
                    textAlign: TextAlign.center,
                    style: textTheme.bodySmall?.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 10.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Umpire Details',
                        style: textTheme.titleSmall?.copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(height: 8.h),
                      _InfoRow(label: 'Age', value: umpire.age.toString()),
                      _InfoRow(label: 'Experience', value: umpire.experience),
                      ...umpire.contact.entries.map((entry) => _InfoRow(
                            label: entry.key.capitalizeFirst ?? entry.key,
                            value: entry.value,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: textTheme.bodySmall?.copyWith(fontSize: 12.sp)),
          Text(value, style: textTheme.bodySmall?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
