// SPDX-License-Identifier: MIT
// Author: Crypto Coders
pragma solidity ^0.8.0;

contract OrderContract {
    /*
     * 📌 Enum در Solidity چیست؟
     * Enum (Enumerations) یک نوع داده شمارشی است که به ما اجازه می‌دهد 
     * مجموعه‌ای از مقادیر از پیش تعریف‌ شده را در قالب یک نوع داده سفارشی تعریف کنیم.
     * 
     * ✅ مزایای استفاده از Enum:
     * 1️⃣ خوانایی بهتر کد با استفاده از نام‌های معنادار به‌جای اعداد.
     * 2️⃣ کاهش احتمال خطا، زیرا مقدارهای مشخصی را می‌توان به یک متغیر نسبت داد.
     * 3️⃣ مصرف گس (Gas) کم، زیرا Enum به‌صورت عدد ذخیره می‌شود.
     * 
     * 📌 کاربردهای Enum در Solidity:
     * - تعیین وضعیت‌های مختلف در یک قرارداد هوشمند (مثلاً وضعیت یک سفارش، درخواست، یا تراکنش).
     * - کنترل سطح دسترسی در یک سیستم (مثلاً کاربر، مدیر، ادمین).
     * - مشخص کردن نوع یک عملیات یا حالت خاص در قرارداد هوشمند.
     */

    /*
     * ✅ تعریف Enum برای مدیریت وضعیت یک سفارش
     * در این مثال، یک سفارش می‌تواند یکی از چهار وضعیت زیر را داشته باشد:
     * 
     * 1️⃣ Pending   - در انتظار تأیید
     * 2️⃣ Shipped   - ارسال‌شده
     * 3️⃣ Delivered - تحویل داده‌شده
     * 4️⃣ Canceled  - لغو‌شده
     * 
     * 🔹 مقدار پیش‌فرض همیشه اولین مقدار تعریف‌شده (Pending) خواهد بود.
     */
    enum OrderStatus { Pending, Shipped, Delivered, Canceled }

    // ⏳ متغیر برای ذخیره وضعیت سفارش (با مقدار پیش‌فرض Pending)
    OrderStatus public status = OrderStatus.Pending;

    /*
     * 🔄 تابع برای تغییر وضعیت سفارش
     * کاربر می‌تواند یکی از مقدارهای Enum را به این تابع ارسال کند
     * و وضعیت سفارش را تغییر دهد.
     */
    function setStatus(OrderStatus _status) public {
        status = _status;
    }

    /*
     * 📢 تابع برای دریافت وضعیت سفارش
     * این تابع مقدار فعلی Enum را برمی‌گرداند.
     */
    function getStatus() public view returns (OrderStatus) {
        return status;
    }

    /*
     * ℹ️ تابع برای دریافت مقدار عددی یک وضعیت
     * اگر بخواهیم مقدار عددی یک Enum را بدانیم، می‌توانیم از این تابع استفاده کنیم.
     * مقادیر عددی:
     * - Pending   → 0
     * - Shipped   → 1
     * - Delivered → 2
     * - Canceled  → 3
     */
    function getStatusAsUint() public view returns (uint) {
        return uint(status);
    }
}
