FROM openjdk:17-jdk-slim

# اختار فولدر التشغيل
WORKDIR /app

# انسخ كود الـ Java لجوا الكونتينر
COPY MyApp.class /app/


# الأمر اللي يتنفذ لما نشغل الكونتينر
CMD ["java", "MyApp"]