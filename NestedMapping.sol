// SPDX-License-Identifier: MIT
// Author: Crypto Coders
pragma solidity ^0.8.0;

contract NestedMappingContract {
    /*
     * 📌 Mapping تو در تو برای ثبت تراکنش‌های کاربران
     * `transactions[فرستنده][گیرنده]` مقدار کل انتقالی بین دو کاربر را ذخیره می‌کند.
     */
     // key key value
     //برای مثال با شماره کارت-کدملی برسیم به موجودی حساب بانکی
    mapping(address => mapping(address => uint)) public transactions;

    /*
     * 🔄 تابع ثبت تراکنش
     * این تابع مقدار انتقالی بین دو کاربر را ذخیره می‌کند.
     */
    function recordTransaction(address _to, uint amount) public {
        require(amount > 0, "مقدار بايد بيشتر از صفر باشد!");

        transactions[msg.sender][_to] += amount; // ذخیره مقدار انتقالی
    }

    /*
     * 🔍 تابع دریافت مقدار کل انتقالات بین دو کاربر
     * این تابع مقدار کل انتقالی بین دو آدرس را برمی‌گرداند.
     */
    function getTransactionHistory(address _from, address _to) public view returns (uint) {
        return transactions[_from][_to]; // مقدار کل انتقالات
    }
}
