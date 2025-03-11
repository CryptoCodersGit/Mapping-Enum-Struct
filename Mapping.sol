// SPDX-License-Identifier: MIT
// Author: Crypto Coders
pragma solidity ^0.8.0;

contract BalanceContract {
    /*
     * 📌 Mapping در Solidity چیست؟
     * Mapping یک **ساختار داده‌ای کلید-مقدار (Key-Value)** است که امکان ذخیره 
     * و بازیابی سریع اطلاعات را فراهم می‌کند.
     *
     * ✅ مزایای Mapping:
     * 1️⃣ **سرعت بالا** در خواندن اطلاعات (دسترسی مستقیم به مقدار از طریق کلید).
     * 2️⃣ **بهینه بودن مصرف گس** نسبت به `Array` برای داده‌های حجیم.
     * 3️⃣ **مناسب برای ذخیره‌سازی اطلاعات کاربر مانند موجودی حساب و سطوح دسترسی.**
     *
     * ❗ محدودیت‌ها:
     * - **امکان پیمایش (Iteration) روی Mapping وجود ندارد.**
     * - **امکان گرفتن طول (length) وجود ندارد.**
     * - **نمی‌توان کل داده‌های موجود در Mapping را مستقیماً مشاهده کرد.**
     */

    /*
     * ✅ تعریف Mapping برای ذخیره موجودی کاربران
     * در اینجا، `mapping(address => uint)` به ازای **هر آدرس** یک **موجودی** نگهداری می‌کند.
     */
    mapping(address => uint) public balances;

    /*
     * 💰 تابع واریز موجودی به حساب کاربر
     * - `amount` → مقدار واریزی
     *
     * این تابع مقدار مشخصی را به موجودی (`balances`) کاربر (`msg.sender`) اضافه می‌کند.
     */
    function deposit(uint amount) public {
        require(amount > 0, "مقدار بايد بيشتر از صفر باشد!");
        balances[msg.sender] += amount; // افزایش موجودی کاربر
    }

    /*
     * 🔍 تابع بررسی موجودی یک آدرس خاص
     * - `_addr` → آدرس کاربر موردنظر
     * 
     * خروجی:
     * - موجودی (`uint`) آدرس مشخص‌شده
     */
    function getBalance(address _addr) public view returns (uint) {
        return balances[_addr]; // بازگرداندن مقدار موجودی از `mapping`
    }

    /*
     * 💸 تابع برداشت وجه (Withdraw)
     * - `amount` → مقدار برداشت
     * 
     * این تابع امکان برداشت وجه از حساب کاربر (`msg.sender`) را فراهم می‌کند.
     */
    function withdraw(uint amount) public {
        require(balances[msg.sender] >= amount, "موجودي كافي نيست!"); // بررسی موجودی
        require(amount > 0, "مقدار بايد بيشتر از صفر باشد!");

        balances[msg.sender] -= amount; // کسر موجودی از حساب کاربر
    }

    /*
     * 🗑️ تابع حذف موجودی کاربر (Reset Balance)
     * این تابع مقدار `Mapping` را برای یک کلید خاص صفر می‌کند.
     */
    function resetBalance(address _addr) public {
        require(balances[_addr] > 0, "اين آدرس موجودي ندارد!");
        delete balances[_addr]; // حذف مقدار (به مقدار پیش‌فرض `0` بازمی‌گردد)
    }

    /*
     * 🔄 تابع انتقال موجودی بین دو آدرس
     * - `_to`   → آدرس دریافت‌کننده
     * - `amount` → مقدار انتقالی
     * 
     * شرایط:
     * 1️⃣ فرستنده باید موجودی کافی داشته باشد.
     * 2️⃣ مقدار انتقالی نباید صفر باشد.
     * 
     * این تابع موجودی را از فرستنده کم کرده و به گیرنده اضافه می‌کند.
     */
    function transfer(address _to, uint amount) public {
        require(balances[msg.sender] >= amount, "موجودی کافی نیست!"); // بررسی موجودی فرستنده
        require(amount > 0, "مقدار باید بیشتر از صفر باشد!"); // بررسی مقدار انتقالی

        balances[msg.sender] -= amount; // کسر موجودی از فرستنده
        balances[_to] += amount; // اضافه کردن موجودی به گیرنده
    }
}
