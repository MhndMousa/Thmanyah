<div dir="rtl" align="right">

# ثمانية

## 🙏 شكر وتقدير

أود أن أعبر عن امتناني للفريق بأكمله لتوفير هذه الفرصة الرائعة لي لعرض مهاراتي. كان هذا المشروع منصة ممتازة لإظهار خبرتي في تطوير

شكراً لكم على ثقتكم بي في هذا المشروع الصعب والمجزى. أنا متحمس للاستمرار في المساهمة والنمو مع الفريق.

---

## 📊 دليل الرموز التعبيرية

| الرمز | المعنى      | الوصف                               |
| ----- | ----------- | ----------------------------------- |
| ✅    | مكتمل       | تم تنفيذ الميزة بنجاح               |
| ❌    | غير مكتمل   | لم يتم تنفيذ الميزة بعد             |
| 🟡    | قيد التنفيذ | الميزة قيد التطوير أو جزئياً مكتملة |

---

## حول المشروع

تم تصميم التطبيق مع التركيز على تجربة المستخدم، حيث يوفر ميزات مثل:

- أقسام محتوى منظمة
- دعم متعدد اللغات (الإنجليزية والعربية)
- إدارة قائمة التشغيل الصوتية
- تصفح المحتوى السلس القائم على Carousel
- سحب للتحديث والتمرير اللانهائي
- تم تطوير المشروع باستخدام SwiftUI

## الميزات المكتملة

### 🏠 تنفيذ الشاشة الرئيسية

- **أقسام التمرير اللانهائي**: تعرض الشاشة الرئيسية الأقسام بتنسيق قابل للتمرير اللانهائي 🟡
- **أنواع الأقسام الديناميكية**: كل قسم له نوع عرض محدد ✅:
  - تخطيط شبكة ثنائية الخطوط ✅
  - تخطيط شبكة مربعات ✅
  - تخطيط مربع كبير ✅
- **المحتوى القائم على API**: يتم ملء الأقسام ببيانات يتم جلبها من API ✅
- **تحديثات الواجهة التلقائية**: تتحدث الأقسام تلقائياً عند تغير البيانات ✅

### 🌐 تكامل API

- **تنفيذ طلب GET**: بناء طلبات GET إلى نقاط نهاية API محددة لاسترجاع الأقسام ومحتواها ✅
- **معالجة الاستجابة الشاملة**: تتضمن استجابات API ✅:
  - أسماء وأنواع الأقسام ✅
  - أنواع المحتوى (podcasts, episodes, audiobooks, audio articles) ✅
  - ترتيب عرض الأقسام ✅
  - **بيانات الوصف**: metadata المحتوى (المدة، المؤلف، الوصف، إلخ) ✅

### 🎨 واجهة المستخدم

- **عرض المحتوى الديناميكي**: يتم عرض المحتوى داخل الأقسام بناءً على النوع المطلوب ❌:
  - عرض أفقي ✅
  - عرض كمربعات كبيرة ✅
  - عرض بتخطيطات شبكة مختلفة ✅
- **التصميم المتجاوب**: تتكيف الأقسام تلقائياً مع تغيرات المحتوى ✅
- **سحب للتحديث**: Pull-to-Refresh - يمكن للمستخدمين تحديث المحتوى بالسحب للأسفل ✅
- **حالات التحميل**: تأثيرات shimmer ومؤشرات التحميل ✅

### 🧪 الاختبار

- **اختبارات الوحدة**: Unit Tests - اختبارات شاملة للوحدات المنطقية ✅
- **بيانات وهمية**: Mock Data - تنفيذات mock لاختبار تدفقات البيانات ✅
- **اختبارات البروتوكول**: Protocol-Based Testing - معمارية قابلة للاختبار باستخدام protocols ✅

### 🔍 وظيفة البحث

- **شاشة البحث**: شاشة بحث مخصصة يمكن الوصول إليها من مواقع متعددة ❌
- **نتائج البحث**: عرض النتائج مشابه لأقسام الشاشة الرئيسية ❌
- **البحث الديناميكي**: قدرات البحث في الوقت الفعلي ❌
- **واجهة متسقة**: تتبع نتائج البحث نفس أنماط العرض مثل أقسام الشاشة الرئيسية ❌

### 🎵 مشغل الصوت

- **إدارة القائمة**: إضافة وإدارة المسارات الصوتية في القائمة ✅
- **ضوابط التشغيل**: وظائف التشغيل والإيقاف المؤقت والتالي والسابق ✅
- **إدارة الحالة**: تتبع حالة التشغيل الحالية ومعرف المسار ✅

### 🌍 الترجمة

- **دعم متعدد اللغات**: دعم اللغتين الإنجليزية والعربية ✅
- **كتالوج النصوص**: String Catalogs - ترجمة مناسبة باستخدام ملفات .xcstrings ✅
- **دعم الاتجاه**: دعم RTL - التخطيط من اليمين إلى اليسار للعربية 🟡

### 🏗️ المعمارية

- **نمط المعمارية**: MVVM Pattern - معمارية Model-View-ViewModel ✅
- **تصميم البروتوكولات**: Protocol-Oriented Design - فصل نظيف للمسؤوليات باستخدام protocols ✅
- **حقن التبعيات**: Dependency Injection - إدارة مناسبة للتبعيات من خلال AppComponents ✅
- **المكونات المعيارية**: مكونات واجهة قابلة لإعادة الاستخدام (Carousel, Square, TwoLine, BigSquare views) ✅

## 🚧 التحديات والصعوبات

### التحديات التقنية

- **التحدي 1**: تطوير تطبيق معقد من الصفر في 3 أيام فقط - على الرغم من أن التطبيق يحتوي على شاشتين فقط، إلا أن تعقيد المعمارية والمكونات المطلوبة جعل المهمة صعبة
- **التحدي 2**: تصميم معمارية قابلة للتوسع من البداية - كان من الضروري بناء نظام مرن يدعم أنواع محتوى متعددة (podcasts, episodes, audiobooks, articles) مع الحفاظ على قابلية الصيانة
- **التحدي 3**: اختيار المعمارية المناسبة من الصفر - يبدو الأمر بسيطاً على الورق، لكن يصبح أكثر تعقيداً عند البدء بالعمل واكتشاف الحالات الاستثنائية التي تتطلب إعادة هيكلة

### تحديات التصميم

- **التحدي 1**: التوازن بين البساطة والشخصية - كان التحدي الأكبر هو الحفاظ على تصميم بسيط ونظيف مع إضافة لمسة شخصية مميزة. التصميمات البسيطة غالباً ما تكون أصعب في التنفيذ لأن كل عنصر يجب أن يكون له هدف واضح
- **التحدي 2**: تصميم مكونات قابلة لإعادة الاستخدام مع الحفاظ على المرونة - كان من الصعب تصميم مكونات مثل CarouselView و SquareView لتكون قابلة لإعادة الاستخدام مع أنواع محتوى مختلفة مع الحفاظ على تناسق التصميم
- **التحدي 3**: عدم تطابق التصميم المقدم مع المتطلبات - بدأت العمل بالتصميم المقدم، ثم اكتشفت أنه مختلف عن المتطلبات المطلوبة في التكليف في منتصف المشروع، مما تطلب إعادة هيكلة كبيرة للواجهة والمكونات

### تحديات API

- **التحدي 1**: عدم وجود معيار موحد لمفاتيح JSON في API - بعض المفاتيح كانت snake_case وأخرى camelCase، مما جعل التصحيح والبناء أكثر صعوبة
- **التحدي 2**: مشكلة في endpoint الترقيم - كان endpoint الترقيم يبقى دائماً على ?page=2 للصفحة التالية حتى بعد استدعاء API لصفحات مختلفة، مما تطلب إعادة هيكلة منطق إدارة حالة الترقيم

## 💡 الاقتراحات والتحسينات المستقبلية

### تحسينات الأداء

- **الاقتراح 1**: توحيد معيار تسمية المفاتيح في API - استخدام camelCase بشكل موحد لجميع مفاتيح JSON لتحسين قابلية الصيانة والاتساق

### تحسينات إمكانية الوصول

- **الاقتراح 1**: إضافة دعم VoiceOver الكامل - تحسين إمكانية الوصول للمستخدمين المكفوفين من خلال إضافة labels وصفية مناسبة، hints مفيدة، وترتيب منطقي للعناصر في واجهة المستخدم
- **الاقتراح 2**: إضافة iOS Widget للوصول السريع - تطوير widget يعرض المحتوى الموصى به ويسمح بالتحكم السريع في التشغيل، مما يوفر وصولاً أسرع للمستخدمين ذوي الإعاقات الحركية
- **الاقتراح 3**: تطوير تطبيق Apple Watch - إنشاء تطبيق مخصص لساعة Apple Watch يوفر تحكماً سهلاً في التشغيل والإيقاف المؤقت، مع إمكانية الوصول السريع للمحتوى المفضل للمستخدمين ذوي الإعاقات

## 🎯 المتطلبات التقنية والميزات الإضافية

### 📱 المتطلبات التقنية للـ iOS

- **معمارية التطبيق**: MVVM Architecture - استخدام معمارية MVVM لهيكلية التطبيق ✅
- **تطوير الواجهة**: SwiftUI Development - تطوير الواجهة باستخدام SwiftUI ✅
- **معالجة البيانات**: Swift Concurrency - استخدام Swift Concurrency (Async/Await) لمعالجة البيانات ✅
- **إدارة المكتبات**: Swift Package Manager - الاعتماد على Swift Package Manager لإدارة المكتبات الخارجية ✅

### ⭐ نقاط اضافية (اختياري)

- **اختبارات الواجهة**: UI Testing - كتابة UI test واحد أو أكثر بشكل Maintainable وقابل للتوسع والتعديل مستقبلا ✅
- **نهج الواجهة**: Hybrid UI Approach - في الـ iOS: استخدام SwiftUI لشاشة وUIKit لشاشة أخرى ❌

</div>
