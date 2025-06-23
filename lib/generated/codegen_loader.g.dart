// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "onboard": {
    "1": {
      "headline": "يرجى اختيار لغتك\nلتحسين التجربة",
      "description": "عملية حجز سهلة وفعالة ستجعل تجربتك في اختيار المركبة أكثر سلاسة. لدينا مجموعة واسعة من السيارات التي تناسب جميع احتياجاتك، سواء كنت تبحث عن سيارة اقتصادية أو فاخرة. نوفر لك خيارات متعددة لتختار منها بأفضل الأسعار."
    },
    "2": {
      "headline": "عملية سلسة وفعالة\nتشكيلة سيارات واسعة متوفرة",
      "description": "احجز بسهولة و بسرعة مع تشكيلة متنوعة من السيارات التي تناسب جميع الأذواق والميزانيات."
    },
    "3": {
      "headline": "عروض سفر حصرية\nخصومات وعروض مخصصة",
      "description": "استفد من عروض وخصومات حصرية لحجوزات السفر تناسب احتياجاتك وميزانيتك."
    },
    "4": {
      "headline": "حجز فنادق سلس\nحجوزات آمنة ومرنة",
      "description": "استمتع بحجز فنادق مرن وآمن مع خيارات تعديل وإلغاء بسهولة، وبأفضل الأسعار."
    }
  },
  "failed_to_fetch_orders___e": "فشل في جلب الطلبات:  ",
  "screensName": {
    "notification": "الإشعارات",
    "activities": "الأنشطة",
    "hotels": "الفنادق",
    "orders": "الطلبات",
    "home": "الرئيسيه",
    "car": "السيارة",
    "hotel_booking": "حجز الفندق"
  },
  "errors": {
    "verify_email_error": "لم يتم التحقق من عنوان بريدك الإلكتروني. يرجى التحقق من صندوق الوارد وتأكيد بريدك الإلكتروني للمتابعة.",
    "invalid_credentials": "البريد الإلكتروني أو كلمة المرور غير صحيحة. حاول مرة أخرى.",
    "email_already_in_use": "البريد الإلكتروني مستخدم مسبقًا.",
    "invalid_email": "البريد الإلكتروني غير صالح.",
    "weak_password": "كلمة المرور ضعيفة جدًا.",
    "default_error": "حدث خطأ: ",
    "failed_to_send_otp": "فشل في إرسال رمز التحقق: يرجى المحاولة مرة أخرى",
    "error_message": "خطأ",
    "something_went_wrong": "حدث خطأ ما. يرجى المحاولة مرة أخرى لاحقًا.",
    "please_enter_your_number": "يرجى إدخال رقمك",
    "please_enter_firstname_and_lastname": "يرجى إدخال الاسم الأول والاسم الأخير",
    "something_went_wrong_please_try_again": "حدث خطأ ما، يرجى المحاولة مرة أخرى",
    "phone_number_can_t_be_empty": "رقم الهاتف لا يمكن أن يكون فارغًا",
    "route_not_found": "الطريق غير موجود",
    "please_choose_date": "يرجى اختيار التاريخ",
    "please_enter_your_phone_and_your_name": "يرجى إدخال رقم هاتفك واسمك",
    "please_choose_location_you_want_ro_recei": "يرجى اختيار المكان الذي تريد استلام السيارة منه",
    "booking_at_least_one_day": "يرجى حجز يوم على الأقل",
    "name_and_number_must_not_be_empty": "الاسم ورقم الهاتف لا يجب أن يكونا فارغين",
    "please_choose_your_location": "يرجى اختيار موقعك",
    "name_can_t_be_empty": "الاسم لا يمكن أن يكون فارغًا",
    "phone_number_is_required": "رقم الهاتف مطلوب",
    "please_choose_common_room_type": "يرجى اختيار نوع الغرفة المشتركة",
    "please_enter_a_valid_saudi_phone_number_": "يرجى إدخال رقم هاتف سعودي صالح مثل: 0501234567",
    "error__no_verification_id_found__please_": "❌ خطأ: لم يتم العثور على معرف التحقق. يرجى طلب OTP مرة أخرى.",
    "no_image_selected": "لم يتم اختيار صورة",
    "invalid_value_type": "نوع القيمة غير صالح",
    "auto_verification_failed___e": "❌ فشل التحقق التلقائي: يرجى المحاولة مرة أخرى"
  },
  "loading": "تحميل",
  "auth": {
    "auth_forgot_password": "هل نسيت كلمة المرور؟",
    "auth_reset_password_email_sent": "تم إرسال رابط إعادة تعيين كلمة المرور بنجاح.",
    "auth_forgot_password_title": "هل نسيت كلمة المرور؟",
    "auth_forgot_password_description": "أدخل عنوان بريدك الإلكتروني لتصلك رسالة لإعادة تعيين كلمة المرور.",
    "auth_reset_password_button": "إعادة تعيين كلمة المرور",
    "auth_back_to_login": "العودة لتسجيل الدخول",
    "no_account": "ليس لديك حساب؟",
    "create_account": "أنشئ حسابًا",
    "verification_sent_message": "تم إرسال رسالة تأكيد إلى بريدك الإلكتروني.\nيرجى الضغط على الرابط داخل الإيميل لتأكيد حسابك.",
    "verified_button": "تحققت من الإيميل",
    "resend_button": "إعادة إرسال رابط التحقق",
    "auth_email_hint": "أدخل بريدك الإلكتروني",
    "auth_password_hint": "أدخل كلمة المرور",
    "auth_create_account_title": "أنشئ حسابك",
    "auth_create_account_subtitle": "أدخل بياناتك للمتابعة",
    "create_account_title": "أنشئ حسابك للبدء.",
    "have_account_question": "هل لديك حساب بالفعل؟",
    "sign_in": "تسجيل الدخول",
    "no_saudi_number": "لا تمتلك رقم سعودي؟",
    "register_with_email": "سجل باستخدام بريدك الإلكتروني",
    "first_name": "الاسم الأول",
    "last_name": "اسم العائلة",
    "enter_your_first_name": "أدخل اسمك الأول",
    "enter_your_phone_number": "أدخل رقم هاتفك",
    "personal_detail": "التفاصيل الشخصية",
    "enter_mobile_number": "أدخل رقم الهاتف المحمول",
    "enter_your_6_digit": "أدخل أرقام الرموز المكونة من 6 أرقام المرسلة إلى"
  },
  "activity_screen": {
    "no_activity_found": "لا توجد أنشطة",
    "about_activity": "عن هذا النشاط",
    "step_choose_booking_day": "اختر يوم الحجز",
    "step_confirm_booking_data": "تأكيد بيانات الحجز",
    "step_confirm_booking_info": "تأكيد معلومات الحجز",
    "step_confirm_booking": "تأكيد الحجز",
    "select_date": "اختر التاريخ",
    "people_count": "عدد الأشخاص",
    "click_to_select": "انقر للاختيار",
    "where_do_you_want_to_move_from": "من أين تريد الانتقال؟"
  },
  "buttons_name": {
    "search": "بحث",
    "continue": "متابعة",
    "verify": "تحقق ",
    "back": "رجوع",
    "ok": "حسناً",
    "cancel_order": "إلغاء الطلب",
    "yes": "نعم",
    "no": "لا",
    "book_now": "احجز الآن",
    "next": "التالي "
  },
  "select_location": "اختر الموقع",
  "location": {
    "riyadh___nakheel": "الرياض - النخيل",
    "riyadh___malaz": "الرياض - الملز",
    "riyadh___suwaidi": "الرياض - السويدي"
  },
  "fedsmale": "أنثى",
  "masdfle": "ذكر",
  "hotelsScreen": {
    "hotel_booking_question": "من أين تريد حجز الفندق؟",
    "noHotelsFound": "لم يتم العثور على فنادق.",
    "choose_common_room_type": "اختر نوع الغرفة الشائعة",
    "per_day": "لكل يوم",
    "select_Date": "اختر التاريخ",
    "people_number": "عدد الأشخاص",
    "about_the_hotel": "عن الفندق",
    "check_in_out": "تسجيل الوصول / تسجيل المغادرة",
    "confirm_details": "تأكيد التفاصيل",
    "confirm_booking": "تأكيد الحجز",
    "special": "خاص",
    "where_do_you_want_to_hotel_booking_from": "من أين تريد حجز الفندق؟",
    "select_a_country": "اختر دولة",
    "common": "مشترك",
    "room_count": "عدد الغرف",
    "check_out": "تسجيل المغادرة",
    "please_choose_your_room_type": "يرجى اختيار نوع الغرفة؟",
    "hotel_common_room_pricing": "أسعار الغرف المشتركة للفندق",
    "hotel_special_room_pricing": "أسعار الغرف الخاصة بالفندق"
  },
  "success_screen": {
    "order_successfully_placed_message": "تم تقديم طلبك بنجاح.\n سوف نقوم بتوصيل طلبك قريباً.",
    "order_successfully_placed": "تم تقديم الطلب بنجاح"
  },
  "car_screen": {
    "receipt": "الإيصال",
    "please_choose_your_location": "يرجى اختيار الموقع",
    "all_price": "كل الأسعار",
    "delivery": "التوصيل",
    "select_location_prompt": "اضغط للاختيار",
    "no_cars_available": "لا توجد سيارات متاحة",
    "cars": "السيارات",
    "about_the_car": "ماذا عن السيارة",
    "available_cars": "السيارات المتاحة",
    "choose_location": "اختر موقعك",
    "receipt_delivery": "الاستلام / التسليم",
    "confirm_booking_info": "تأكيد معلومات الحجز",
    "confirm_booking": "تأكيد الحجز"
  },
  "form": {
    "name_hint": "أدخل اسمك الأول",
    "name_empty": "الاسم لا يمكن أن يكون فارغًا",
    "phone_hint": "أدخل رقم هاتفك",
    "phone_empty": "رقم الهاتف مطلوب",
    "phone_invalid": "يرجى إدخال رقم هاتف سعودي صالح مثل: 0501234567"
  },
  "confirm_booking_screen": {
    "all_booking": "جميع الحجوزات",
    "booking": "حجز",
    "cancel": "إلغاء"
  },
  "locations": {
    "riyadh": "الرياض",
    "jeddah": "جدة",
    "makkah": "مكة",
    "madinah": "المدينة المنورة",
    "dammam": "الدمام",
    "khobar": "الخبر",
    "taif": "الطائف",
    "buraidah": "بريدة",
    "abha": "أبها",
    "hail": "حائل",
    "tabuk": "تبوك",
    "yanbu": "ينبع",
    "qassim": "القصيم",
    "jazan": "جازان",
    "najran": "نجران",
    "al_bahah": "الباحة"
  },
  "success_widget": {
    "your_order_has_been_successfully_placed_": "تم تقديم طلبك بنجاح.\\nسوف نرسل طلبك قريبًا.",
    "order_successfully_nplaced": "تم تقديم الطلب بنجاح ",
    "back_to_home": "الرجوع إلى الرئيسية",
    "go_to_orders": "انتقل إلى الطلبات"
  },
  "user_orders": {
    "cancel": "إلغاء",
    "all_booking": "جميع الحجوزات",
    "booking": "الحجز"
  },
  "notification_screen": {
    "view_detailed": "عرض التفاصيل",
    "notification_details": "تفاصيل الإشعار"
  },
  "home_screen": {
    "welcome": "مرحبًا،",
    "choose_your_service": "#اختر_الخدمة_الخاصة_بك",
    "recommended_hotels": "#فنادق_موصى_بها"
  },
  "select_a_location": "اختيار الموقع",
  "drawer": {
    "setting": "الإعدادات",
    "logout": "تسجيل الخروج",
    "delete_account": "حذف الحساب",
    "close": "إغلاق"
  },
  "splash_screen": {
    "manafea": "منافع",
    "easy_transportation": "وسائل النقل السهلة"
  },
  "orders_screen": {
    "time": "الوقت",
    "pending": "قيد الانتظار",
    "success": "ناجح",
    "failed": "فشل",
    "hotel_nae": "اسم الفندق",
    "cancel_order_confirmation": "هل أنت متأكد أنك تريد إلغاء\nالطلب؟",
    "total_price": "السعر الإجمالي",
    "booking_day": "يوم الحجز",
    "people_count": "عدد الأشخاص",
    "name": "الاسم",
    "phone": "رقم الهاتف",
    "payment_method": "طريقة الدفع",
    "activity_name": "اسم النشاط",
    "check_out": "تسجيل الخروج",
    "check_in": "تسجيل الدخول",
    "hotel_booking": "حجز فندق",
    "activity": "نشاط",
    "received_date": "تاريخ الاستلام",
    "delivery_date": "تاريخ التسليم",
    "car": "سيارة"
  }
};
static const Map<String,dynamic> _en = {
  "onboard": {
    "1": {
      "headline": "Please choose your language\nFor a better experience",
      "description": "A seamless and efficient booking process\nWide range of vehicle choices"
    },
    "2": {
      "headline": "Smooth, efficient process\nWide vehicle selection available",
      "description": "Easy booking process\nVariety of vehicle options available"
    },
    "3": {
      "headline": "Exclusive Travel Deals\nDiscounts, personalized offers",
      "description": "Stay updated with special discounts\nPersonalized offers for travel bookings"
    },
    "4": {
      "headline": "Seamless Hotel Booking\nSecure, flexible reservations",
      "description": "Simplify your travel with easy bookings\nSafe stays with flexible options"
    }
  },
  "failed_to_fetch_orders___e": "Failed to fetch orders:  ",
  "screensName": {
    "notification": "Notification",
    "activities": "activities",
    "hotels": "Hotels",
    "orders": "Orders",
    "home": "Home",
    "car": "Car",
    "hotel_booking": "Hotel Booking"
  },
  "errors": {
    "verify_email_error": "Your email address is not verified. Please check your inbox and verify your email to continue.",
    "invalid_credentials": "Email or password not correct. Please try again.",
    "failed_to_send_otp": "Failed to send OTP: Please try again",
    "email_already_in_use": "Email is already in use.",
    "invalid_email": "Invalid email.",
    "weak_password": "Password is too weak.",
    "default_error": "An error occurred: ",
    "error_message": "Error",
    "please_enter_your_number": "Please enter your number",
    "please_enter_firstname_and_lastname": "please enter firstName and lastName",
    "something_went_wrong_please_try_again": "Something went wrong please try again",
    "phone_number_can_t_be_empty": "Phone number can't be empty",
    "route_not_found": "Route Not Found",
    "please_choose_date": "Please Choose Date",
    "please_enter_your_phone_and_your_name": "Please enter your phone and your name ",
    "please_choose_location_you_want_ro_recei": "Please Choose location you want ro receive car",
    "booking_at_least_one_day": "booking at least one day",
    "name_and_number_must_not_be_empty": "Name and Number must not be empty",
    "please_choose_your_location": "Please Choose Your Location",
    "name_can_t_be_empty": "Name can't be empty",
    "phone_number_is_required": "Phone number is required",
    "please_choose_common_room_type": "Please Choose Common Room type ?",
    "please_enter_a_valid_saudi_phone_number_": "Please enter a valid Saudi phone number like: 0501234567 ",
    "error__no_verification_id_found__please_": "❌ Error: No verification ID found. Please request OTP again.",
    "no_image_selected": "No image selected",
    "something_went_wrong": "Something went wrong. Please try again later.",
    "invalid_value_type": "Invalid value type",
    "auto_verification_failed___e": "❌ Auto verification failed: Please try again"
  },
  "auth": {
    "auth_forgot_password": "Forgot Password?",
    "auth_reset_password_email_sent": "Password reset email sent successfully.",
    "auth_forgot_password_title": "Forgot Password?",
    "auth_forgot_password_description": "Enter your email address to receive a reset link.",
    "auth_reset_password_button": "Reset password",
    "auth_back_to_login": "Back to Login",
    "no_account": "Don't have an account?",
    "create_account": "Create an account",
    "verification_sent_message": "A verification email has been sent to your inbox.\nPlease click the link inside the email to verify your account.",
    "verified_button": "I've verified the email",
    "resend_button": "Resend verification link",
    "auth_email_hint": "Enter your email",
    "auth_password_hint": "Enter your password",
    "auth_create_account_title": "Create your account",
    "auth_create_account_subtitle": "Enter your details to continue",
    "have_account_question": "Already have an account?",
    "sign_in": "Sign in",
    "no_saudi_number": "Don't have a Saudi number?",
    "register_with_email": "Register using your email",
    "enter_your_first_name": "Enter your first name",
    "enter_your_phone_number": "Enter your phone number",
    "first_name": "First Name",
    "last_name": "Last Name",
    "personal_detail": "Personal Detail",
    "enter_mobile_number": "Enter Mobile Number",
    "enter_your_6_digit": "Enter your 6 digit code numbers sent to "
  },
  "loading": "Loading",
  "activity_screen": {
    "no_activity_found": "No Activity Found",
    "about_activity": "About this activity",
    "step_choose_booking_day": "Choose Your Booking Day",
    "step_confirm_booking_data": "Confirm Booking Data",
    "step_confirm_booking_info": "Confirm Booking Information",
    "step_confirm_booking": "Confirm Booking",
    "select_date": "Select Date",
    "people_count": "People Count",
    "click_to_select": "Click to Select",
    "where_do_you_want_to_move_from": "Where do you want to move from?"
  },
  "buttons_name": {
    "search": "Search",
    "continue": "Continue",
    "back": "Back",
    "next": "Next",
    "verify": "Verify",
    "ok": "Ok",
    "cancel_order": "Cancel Order",
    "yes": "Yes",
    "no": "No",
    "book_now": "Book Now"
  },
  "location": {
    "riyadh___nakheel": "Riyadh - Nakheel",
    "riyadh___malaz": "Riyadh - Malaz",
    "riyadh___suwaidi": "Riyadh - Suwaidi"
  },
  "fedsmale": "Female",
  "masdfle": "Male",
  "hotelsScreen": {
    "noHotelsFound": "No hotels found.",
    "per_day": "Per Day",
    "hotel_booking_question": "Where do you want to book the hotel from?",
    "about_the_hotel": "About the hotel",
    "people_number": "People Number",
    "room_number": "Room Count",
    "select_Date": "Select Date",
    "special": "Special",
    "confirm_details": "Confirm Details",
    "confirm_booking": "Confirm Booking",
    "where_do_you_want_to_hotel_booking_from": "Where do you want to hotel booking from?",
    "select_a_country": "Select a country",
    "common": "Common",
    "room_count": "Room Count",
    "check_out": "Check-out",
    "check_in": "Check-in",
    "choose_common_room_type": "Choose Common Room Type",
    "check_in_out": "Check-in / Check-out",
    "please_choose_your_room_type": "Please Choose your Room type ?",
    "hotel_common_room_pricing": "Hotel Common Room Pricing",
    "hotel_special_room_pricing": "Hotel Special Room Pricing"
  },
  "date_screen": {
    "check-in": "Check-in",
    "check-out": "check-out"
  },
  "car_screen": {
    "all_price": "All Price",
    "delivery": "Delivery",
    "select_location_prompt": "Click to Select",
    "no_cars_available": "No cars available",
    "receipt": " Receipt",
    "please_choose_your_location": "Please Choose Your Location",
    "cars": "Cars",
    "about_the_car": "About the Car",
    "available_cars": " Available Cars",
    "choose_location": "Choose Your Location",
    "receipt_delivery": "Receipt / Delivery",
    "confirm_booking_info": "Confirm Booking information",
    "confirm_booking": "Confirm Booking"
  },
  "confirm_booking_screen": {
    "all_booking": "All Booking",
    "booking": "Booking",
    "cancel": "Cancel"
  },
  "success_screen": {
    "order_successfully_placed": "Order Successfully\nPlaced",
    "order_successfully_placed_message": "Your order has been successfully placed.\nWe will deliver your order soon."
  },
  "form": {
    "name_hint": "Enter your name",
    "name_empty": "Name can't be empty",
    "phone_hint": "Enter your phone number",
    "phone_empty": "Phone number is required",
    "phone_invalid": "Please enter a valid Saudi phone number like: 0501234567"
  },
  "locations": {
    "riyadh": "Riyadh",
    "jeddah": "Jeddah",
    "makkah": "Makkah",
    "madinah": "Madinah",
    "dammam": "Dammam",
    "khobar": "Khobar",
    "taif": "Taif",
    "buraidah": "Buraidah",
    "abha": "Abha",
    "hail": "Hail",
    "tabuk": "Tabuk",
    "yanbu": "Yanbu",
    "qassim": "Qassim",
    "jazan": "Jazan",
    "najran": "Najran",
    "al_bahah": "Al Bahah"
  },
  "success_widget": {
    "your_order_has_been_successfully_placed_": "Your order has been successfully placed.\\nWe will deliver your order soon.",
    "order_successfully_nplaced": "Order Successfully\\nPlaced",
    "back_to_home": "Back to Home",
    "go_to_orders": "Go to Orders"
  },
  "user_orders": {
    "cancel": "Cancel",
    "all_booking": "All Booking",
    "booking": "Booking"
  },
  "notification_screen": {
    "view_detailed": "View Detailed",
    "notification_details": "Notification Details"
  },
  "home_screen": {
    "welcome": "Welcome,",
    "choose_your_service": "#ChooseYourService",
    "recommended_hotels": "#RecommendedHotels"
  },
  "select_a_location": "Select a Location",
  "drawer": {
    "setting": "Setting",
    "logout": "Logout",
    "delete_account": "Delete Account",
    "close": "Close"
  },
  "select_location": "Select a Location",
  "orders_screen": {
    "time": "Time",
    "pending": "Pending",
    "success": "Success",
    "cancel_order_confirmation": "Are you sure you want to cancel \norder?",
    "failed": "Failed",
    "total_price": "Total price",
    "booking_day": "Booking day",
    "people_count": "People Count",
    "name": "Name",
    "phone": "phone",
    "payment_method": "Payment method",
    "activity_name": "Activity name",
    "hotel_nae": "Hotel name",
    "check_out": "Check-out",
    "check_in": "Check-in",
    "hotel_booking": "Hotel Booking",
    "activity": "Activity",
    "received_date": "Received date",
    "delivery_date": "Delivery date",
    "car": "Car"
  },
  "splash_screen": {
    "manafea": "Manafea",
    "easy_transportation": "Easy Transportation"
  }
};
static const Map<String,dynamic> _ur = {
  "onboard": {
    "1": {
      "headline": "براہ کرم اپنی زبان کا انتخاب کریں\nبہتر تجربے کے لیے",
      "description": "ایک ہموار اور مؤثر بکنگ عمل\nگاڑیوں کی وسیع رینج"
    },
    "2": {
      "headline": "ہموار، مؤثر عمل\nگاڑیوں کا وسیع انتخاب دستیاب",
      "description": "آسان بکنگ عمل\nگاڑیوں کے مختلف اختیارات دستیاب"
    },
    "3": {
      "headline": "خصوصی سفری سودے\nرعایتیں، ذاتی نوعیت کی پیشکشیں",
      "description": "خصوصی رعایتوں سے باخبر رہیں\nسفری بکنگ کے لیے ذاتی نوعیت کی پیشکشیں"
    },
    "4": {
      "headline": "آسان ہوٹل بکنگ\nمحفوظ، لچکدار ریزرویشن",
      "description": "آسان بکنگ سے اپنے سفر کو آسان بنائیں\nمحفوظ قیام کے لیے لچکدار اختیارات"
    }
  },
  "failed_to_fetch_orders___e": "آرڈرز حاصل کرنے میں ناکامی:  ",
  "screensName": {
    "notification": "اطلاع",
    "activities": "سرگرمیاں",
    "hotels": "ہوٹلز",
    "orders": "آرڈرز",
    "home": "ہوم",
    "car": "گاڑی",
    "hotel_booking": "ہوٹل بکنگ"
  },
  "errors": {
    "verify_email_error": "آپ کا ای میل پتہ تصدیق شدہ نہیں ہے۔ براہ کرم اپنا ان باکس چیک کریں اور جاری رکھنے کے لیے ای میل کی تصدیق کریں۔",
    "invalid_credentials": "ای میل یا پاس ورڈ درست نہیں ہے۔ دوبارہ کوشش کریں۔",
    "failed_to_send_otp": "OTP بھیجنے میں ناکامی: براہ کرم دوبارہ کوشش کریں",
    "email_already_in_use": "ای میل پہلے ہی استعمال ہو چکا ہے۔",
    "invalid_email": "غلط ای میل۔",
    "weak_password": "پاسورڈ بہت کمزور ہے۔",
    "default_error": "ایک غلطی ہوئی ہے: {message}",
    "error_message": "خرابی",
    "please_enter_your_number": "براہ کرم اپنا نمبر درج کریں",
    "please_enter_firstname_and_lastname": "براہ کرم اپنا پہلا اور آخری نام درج کریں",
    "something_went_wrong_please_try_again": "کچھ غلط ہو گیا، دوبارہ کوشش کریں",
    "phone_number_can_t_be_empty": "فون نمبر خالی نہیں ہو سکتا",
    "route_not_found": "راستہ نہیں ملا",
    "please_choose_date": "براہ کرم تاریخ منتخب کریں",
    "please_enter_your_phone_and_your_name": "براہ کرم اپنا فون نمبر اور نام درج کریں",
    "please_choose_location_you_want_ro_recei": "براہ کرم وہ مقام منتخب کریں جہاں آپ گاڑی وصول کرنا چاہتے ہیں",
    "booking_at_least_one_day": "کم از کم ایک دن کی بکنگ",
    "name_and_number_must_not_be_empty": "نام اور نمبر خالی نہیں ہو سکتے",
    "please_choose_your_location": "براہ کرم اپنا مقام منتخب کریں",
    "name_can_t_be_empty": "نام خالی نہیں ہو سکتا",
    "phone_number_is_required": "فون نمبر ضروری ہے",
    "please_choose_common_room_type": "براہ کرم عام کمرے کی قسم منتخب کریں؟",
    "please_enter_a_valid_saudi_phone_number_": "براہ کرم ایک درست سعودی فون نمبر درج کریں جیسے: 0501234567",
    "error__no_verification_id_found__please_": "❌ خرابی: کوئی توثیقی ID نہیں ملی۔ براہ کرم دوبارہ OTP کی درخواست کریں۔",
    "no_image_selected": "کوئی تصویر منتخب نہیں کی گئی",
    "something_went_wrong": "کچھ غلط ہو گیا۔ براہ کرم بعد میں دوبارہ کوشش کریں۔",
    "invalid_value_type": "غلط ویلیو کی قسم",
    "auto_verification_failed___e": "❌ خودکار توثیق ناکام ہوئی: براہ کرم دوبارہ کوشش کریں"
  },
  "auth": {
    "auth_forgot_password_title": "پاسورڈ بھول گئے؟",
    "auth_forgot_password_description": "ری سیٹ لنک حاصل کرنے کے لیے اپنا ای میل ایڈریس درج کریں۔",
    "auth_reset_password_button": "پاسورڈ ری سیٹ کریں",
    "auth_back_to_login": "لاگ ان پر واپس جائیں",
    "auth_forgot_password": "پاس ورڈ بھول گئے؟",
    "auth_reset_password_email_sent": "پاس ورڈ ری سیٹ کرنے والا ای میل کامیابی سے بھیج دیا گیا۔",
    "no_account": "کیا آپ کا اکاؤنٹ نہیں ہے؟",
    "create_account": "اکاؤنٹ بنائیں",
    "verification_sent_message": "آپ کے ای میل پتے پر تصدیقی پیغام بھیج دیا گیا ہے۔\nبراہ کرم اکاؤنٹ کی تصدیق کے لیے ای میل میں موجود لنک پر کلک کریں۔",
    "verified_button": "میں نے ای میل کی تصدیق کر دی ہے",
    "resend_button": "تصدیقی لنک دوبارہ بھیجیں",
    "auth_email_hint": "اپنا ای میل درج کریں",
    "auth_password_hint": "اپنا پاس ورڈ درج کریں",
    "have_account_question": "کیا آپ کا پہلے سے اکاؤنٹ ہے؟",
    "sign_in": "سائن ان کریں",
    "auth_create_account_title": "اپنا اکاؤنٹ بنائیں",
    "auth_create_account_subtitle": "جاری رکھنے کے لیے اپنی تفصیلات درج کریں",
    "no_saudi_number": "سعودی نمبر نہیں ہے؟",
    "register_with_email": "اپنے ای میل سے رجسٹر کریں",
    "enter_your_first_name": "اپنا پہلا نام درج کریں",
    "enter_your_phone_number": "اپنا فون نمبر درج کریں",
    "first_name": "پہلا نام",
    "last_name": "آخری نام",
    "personal_detail": "ذاتی تفصیل",
    "enter_mobile_number": "موبائل نمبر درج کریں",
    "enter_your_6_digit": "اپنا 6 ہندسوں والا کوڈ درج کریں جو بھیجا گیا ہے"
  },
  "loading": "لوڈ ہو رہا ہے",
  "activity_screen": {
    "no_activity_found": "کوئی سرگرمی نہیں ملی",
    "about_activity": "اس سرگرمی کے بارے میں",
    "step_choose_booking_day": "اپنے بکنگ دن کا انتخاب کریں",
    "step_confirm_booking_data": "بکنگ کا ڈیٹا تصدیق کریں",
    "step_confirm_booking_info": "بکنگ کی معلومات کی تصدیق کریں",
    "step_confirm_booking": "بکنگ کی تصدیق کریں",
    "select_date": "تاریخ منتخب کریں",
    "people_count": "افراد کی تعداد",
    "click_to_select": "منتخب کرنے کے لیے کلک کریں",
    "where_do_you_want_to_move_from": "آپ کہاں سے جانا چاہتے ہیں؟"
  },
  "buttons_name": {
    "search": "تلاش کریں",
    "continue": "جاری رکھیں",
    "back": "پیچھے",
    "next": "اگلا",
    "verify": "تصدیق کریں",
    "ok": "ٹھیک ہے",
    "cancel_order": "آرڈر منسوخ کریں",
    "yes": "ہاں",
    "no": "نہیں",
    "book_now": "ابھی بک کریں"
  },
  "location": {
    "riyadh___nakheel": "ریاض - نخیل",
    "riyadh___malaz": "ریاض - ملز",
    "riyadh___suwaidi": "ریاض - سویدی"
  },
  "fedsmale": "خاتون",
  "masdfle": "مرد",
  "hotelsScreen": {
    "noHotelsFound": "کوئی ہوٹل نہیں ملا۔",
    "per_day": "فی دن",
    "hotel_booking_question": "آپ کہاں سے ہوٹل بک کرنا چاہتے ہیں؟",
    "about_the_hotel": "ہوٹل کے بارے میں",
    "people_number": "افراد کی تعداد",
    "room_number": "کمروں کی تعداد",
    "select_Date": "تاریخ منتخب کریں",
    "special": "خصوصی",
    "confirm_details": "تفصیلات کی تصدیق کریں",
    "confirm_booking": "بکنگ کی تصدیق کریں",
    "where_do_you_want_to_hotel_booking_from": "آپ ہوٹل کہاں سے بک کرنا چاہتے ہیں؟",
    "select_a_country": "ملک منتخب کریں",
    "common": "عام",
    "room_count": "کمروں کی تعداد",
    "check_out": "چیک آؤٹ",
    "check_in": "چیک ان",
    "choose_common_room_type": "عام کمرے کی قسم منتخب کریں",
    "check_in_out": "چیک ان / چیک آؤٹ",
    "please_choose_your_room_type": "براہ کرم اپنے کمرے کی قسم منتخب کریں؟",
    "hotel_common_room_pricing": "عام کمرے کی قیمت",
    "hotel_special_room_pricing": "خصوصی کمرے کی قیمت"
  },
  "date_screen": {
    "check-in": "چیک ان",
    "check-out": "چیک آؤٹ"
  },
  "car_screen": {
    "all_price": "تمام قیمتیں",
    "delivery": "ڈیلیوری",
    "select_location_prompt": "منتخب کرنے کے لیے کلک کریں",
    "no_cars_available": "کوئی گاڑیاں دستیاب نہیں",
    "receipt": "رسید",
    "please_choose_your_location": "براہ کرم اپنا مقام منتخب کریں",
    "cars": "گاڑیاں",
    "about_the_car": "گاڑی کے بارے میں",
    "available_cars": "دستیاب گاڑیاں",
    "choose_location": "مقام منتخب کریں",
    "receipt_delivery": "رسید / ڈیلیوری",
    "confirm_booking_info": "بکنگ کی معلومات کی تصدیق کریں",
    "confirm_booking": "بکنگ کی تصدیق کریں"
  },
  "confirm_booking_screen": {
    "all_booking": "تمام بکنگ",
    "booking": "بکنگ",
    "cancel": "منسوخ کریں"
  },
  "success_screen": {
    "order_successfully_placed": "آرڈر کامیابی سے\nدے دیا گیا",
    "order_successfully_placed_message": "آپ کا آرڈر کامیابی سے دے دیا گیا ہے۔\nہم جلد ہی آپ کا آرڈر پہنچائیں گے۔"
  },
  "form": {
    "name_hint": "اپنا نام درج کریں",
    "name_empty": "نام خالی نہیں ہو سکتا",
    "phone_hint": "اپنا فون نمبر درج کریں",
    "phone_empty": "فون نمبر درکار ہے",
    "phone_invalid": "براہ کرم ایک درست سعودی فون نمبر درج کریں جیسے: 0501234567"
  },
  "locations": {
    "riyadh": "ریاض",
    "jeddah": "جدہ",
    "makkah": "مکہ",
    "madinah": "مدینہ",
    "dammam": "دمام",
    "khobar": "خبر",
    "taif": "طائف",
    "buraidah": "بریدہ",
    "abha": "ابھا",
    "hail": "حائل",
    "tabuk": "تبوک",
    "yanbu": "ینبع",
    "qassim": "قصیم",
    "jazan": "جازان",
    "najran": "نجران",
    "al_bahah": "الباحہ"
  },
  "success_widget": {
    "your_order_has_been_successfully_placed_": "آپ کا آرڈر کامیابی سے دے دیا گیا ہے۔\\nہم جلد ہی آپ کا آرڈر پہنچائیں گے۔",
    "order_successfully_nplaced": "آرڈر کامیابی سے\\nدے دیا گیا",
    "back_to_home": "ہوم پر واپس جائیں",
    "go_to_orders": "آرڈرز پر جائیں"
  },
  "user_orders": {
    "cancel": "منسوخ کریں",
    "all_booking": "تمام بکنگ",
    "booking": "بکنگ"
  },
  "notification_screen": {
    "view_detailed": "تفصیلات دیکھیں",
    "notification_details": "اطلاع کی تفصیلات"
  },
  "home_screen": {
    "welcome": "خوش آمدید،",
    "choose_your_service": "#اپنی_سروس_منتخب_کریں",
    "recommended_hotels": "#تجویز_کردہ_ہوٹلز"
  },
  "select_a_location": "مقام منتخب کریں",
  "drawer": {
    "setting": "ترتیبات",
    "logout": "لاگ آؤٹ",
    "delete_account": "اکاؤنٹ حذف کریں",
    "close": "بند کریں"
  },
  "select_location": "مقام منتخب کریں",
  "orders_screen": {
    "time": "وقت",
    "pending": "زیر التوا",
    "success": "کامیاب",
    "cancel_order_confirmation": "کیا آپ واقعی آرڈر منسوخ کرنا چاہتے ہیں؟",
    "failed": "ناکام",
    "total_price": "کل قیمت",
    "booking_day": "بکنگ کا دن",
    "people_count": "افراد کی تعداد",
    "name": "نام",
    "phone": "فون",
    "payment_method": "ادائیگی کا طریقہ",
    "activity_name": "سرگرمی کا نام",
    "hotel_nae": "ہوٹل کا نام",
    "check_out": "چیک آؤٹ",
    "check_in": "چیک ان",
    "hotel_booking": "ہوٹل بکنگ",
    "activity": "سرگرمی",
    "received_date": "وصولی کی تاریخ",
    "delivery_date": "ڈیلیوری کی تاریخ",
    "car": "گاڑی"
  },
  "splash_screen": {
    "manafea": "منافع",
    "easy_transportation": "آسان سفری سہولت"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en, "ur": _ur};
}
