//
//  Messages.swift
//  Yazeed Fitness
//
//  Created by Hadeer Kamel on 2/1/18.
//  Copyright © 2018 googansolutions. All rights reserved.
//

import Foundation
class Messages {
    struct REG_Validation{
        static let ProfileImage = "برجاء إدخال صوره الحساب"
        static let EmptyUsername = "برجاء إدخال إسم المستخدم"
        static let ShortName = "يجب الا يقل الأسم عن ثلاثه أحرف"
        static let invalideUsername = "يجب ان يحتوي الاسم على احرف فقط"
        static let Email = "برجاء إدخال بريد الكتروني صحيح"
        static let EmptyBirthDate = "برجاء إدخال تاريخ الميلاد"
        static let InvalideBirthDate = "تاريخ الميلاد لم يآتي بعد"
        static let Height = "برجاء إدخال الطول"
        static let CurrentWeight = "برجاء إدخال الوزن الحالي"
        static let IdealWeight = "برجاء إدخال الوزن المثالي"
        static let InvalideWeight = "برجاء إدخال وزن صحيح"
        static let InvalideHeight = "برجاء إدخال طول صحيح"
        static let Password = "برجاء إدخال كلمه المرور"
        static let Passwordlength = "يجب الا تقل كلمه المرور عن ٦ أحرف"
        static let RepaetPassword = "من فضلك تأكد من مطابقه كلمه المرور"
    }
    struct REG_Response {
        static let Success = "تم تسجيل البيانات بنجاح"
    }
    struct Network{
        static let NoNetwork = "من فضلك تحقق من اتصالك بالانترنت "
        static let ErrorOccured = "حدث خطا ما , حاول مرة اخرى"
       
    }
    struct Doctors {
        static let NoDoctors = "لا يوجد أطباء بهذا التخصص"
    }
}
