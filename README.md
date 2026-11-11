# Crypto Coders | Solidity Mapping, Enum & Struct

مجموعه کدهای آموزشی ساختارهای داده پیشرفته در Solidity شامل `enum`، `struct`، `mapping`، نگاشت تودرتو (`Nested Mapping`) و پروژه ترکیبی سیستم سفارش‌گیری.

## ساختار فایل‌های ریپازیتوری

| فایل | نام قرارداد | نسخه کامپایلر | توضیحات |
|---|---|---|---|
| `Enum.sol` | `OrderContract` | `^0.8.0` | آموزش تعریف `enum OrderStatus` (`Pending`, `Shipped`, `Delivered`, `Canceled`) و تبدیل آن به عدد صحیح |
| `Mapping.sol` | `BalanceContract` | `^0.8.0` | مدیریت موجودی کاربران با `mapping(address => uint)` شامل واریز، برداشت و ریست موجودی با `delete` |
| `NestedMapping.sol` | `NestedMappingContract` | `^0.8.0` | ثبت و گزارش تاریخچه تراکنش‌های بین دو آدرس با `mapping(address => mapping(address => uint))` |
| `Struct.sol` | `UserManagement` | `^0.8.0` | تعریف `struct User` و مدیریت آرایه کاربران (`addUser1`، `addUser2`، ویرایش نام و غیرفعال‌سازی) |
| `OrderingSystem.sol` | `AdvancedOrderSystem` | `^0.8.0` | پروژه ترکیبی مدیریت سفارش‌ها با استفاده هم‌زمان از `Enum`، `Struct`، `Mapping` و `Event` |
