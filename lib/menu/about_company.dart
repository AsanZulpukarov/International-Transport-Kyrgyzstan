import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/app_text_styles.dart';

class AboutCompany extends StatefulWidget {
  const AboutCompany({Key? key}) : super(key: key);

  @override
  State<AboutCompany> createState() => _AboutCompanyState();
}

class _AboutCompanyState extends State<AboutCompany> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('О компании'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Подробнее о АманЖол',
              style: AppTextStyles.about,
            ),
            SizedBox(height: 24.h),
            Text(
              'Добро пожаловать в нашу компанию по ремонту дорог - "АманЖол"! Мы - команда профессионалов, специализирующихся на качественном и эффективном восстановлении и обслуживании дорожного покрытия.Мы понимаем, что дороги играют ключевую роль в обеспечении безопасности и комфорта наших клиентов. Именно поэтому мы предлагаем широкий спектр услуг, чтобы гарантировать надежность и долговечность дорожных покрытий. Наша компания оснащена современным оборудованием и использует передовые технологии, чтобы решать самые сложные задачи ремонта и реконструкции дорог.',
              style: AppTextStyles.black14Medium,
            )
          ],
        ),
      ),
    );
  }
}
