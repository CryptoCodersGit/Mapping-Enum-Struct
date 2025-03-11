// SPDX-License-Identifier: MIT
// Author: Crypto Coders
pragma solidity ^0.8.0;

contract StudentContract {
    /*
     * 📌 Struct در Solidity چیست؟
     * Struct (ساختار داده‌ای سفارشی) به ما اجازه می‌دهد که چندین متغیر مرتبط را 
     * در قالب یک ساختار واحد تعریف کنیم. این ویژگی باعث می‌شود که اطلاعات به‌صورت 
     * منظم و خوانا ذخیره شوند.
     *
     * ✅ مزایای استفاده از Struct:
     * 1️⃣ امکان تعریف یک نوع داده سفارشی متشکل از چندین متغیر.
     * 2️⃣ افزایش خوانایی کد و نگهداری بهتر اطلاعات.
     * 3️⃣ ترکیب‌پذیری بالا با سایر داده‌های Solidity (مانند `mapping` و `array`).
     *
     * ⚠️ نکته مهم:
     * - ذخیره Struct در **storage (حافظه دائمی بلاکچین)** هزینه گس بالایی دارد.
     * - برای مدیریت بهتر، می‌توان از `mapping` به‌جای `array` استفاده کرد.
     */

    /*
     * ✅ تعریف Struct برای ذخیره اطلاعات دانشجو
     * هر دانشجو دارای ویژگی‌های زیر است:
     * - `name`  → نام دانشجو (string)
     * - `age`   → سن دانشجو (uint)
     * - `id`    → شناسه دانشجویی (uint)
     */
    struct Student {
        string name;
        uint age;
        uint id;
    }

    /*
     * 📌 نحوه استفاده از Struct:
     * برای استفاده از `Struct` می‌توان:
     * 1️⃣ یک متغیر منفرد از نوع `Struct` تعریف کرد.
     * 2️⃣ یک `Array` از نوع `Struct` برای ذخیره لیستی از اطلاعات ایجاد کرد.
     * 3️⃣ یک `Mapping` از `Struct` برای دسترسی سریع‌تر به داده‌ها ایجاد کرد.
     *
     * در این مثال، از یک `Array` برای ذخیره لیستی از دانشجویان استفاده می‌کنیم.
     */
    Student[] public students; // آرایه‌ای از ساختار `Student`

    /*
     * 🔄 تابع افزودن دانشجو به لیست
     * ورودی‌ها:
     * - `_name` → نام دانشجو
     * - `_age`  → سن دانشجو
     * - `_id`   → شناسه دانشجو
     *
     * این تابع یک دانشجوی جدید را به آرایه `students` اضافه می‌کند.
     */
    function addStudent(string memory _name, uint _age, uint _id) public {
        students.push(Student(_name, _age, _id)); // افزودن دانشجو به آرایه
    }

    /*
     * 🔍 تابع جستجوی دانشجو بر اساس `index`
     * ورودی:
     * - `index` → شماره‌ایندکس دانشجو در آرایه
     *
     * خروجی‌ها:
     * - `name` → نام دانشجو
     * - `age`  → سن دانشجو
     * - `id`   → شناسه دانشجو
     *
     * این تابع اطلاعات دانشجو را برمی‌گرداند.
     */
    function getStudent(uint index) public view returns (string memory, uint, uint) {
        require(index < students.length, "Index out of range"); // بررسی معتبر بودن ایندکس
        Student memory s = students[index]; // دریافت اطلاعات دانشجو
        return (s.name, s.age, s.id);
    }

    /*
     * ℹ️ تابع دریافت تعداد کل دانشجویان
     * خروجی:
     * - تعداد دانشجویان ثبت‌شده در آرایه `students`
     */
    function getTotalStudents() public view returns (uint) {
        return students.length;
    }
}
