// SPDX-License-Identifier: MIT
// Author:Crypto Coders
pragma solidity ^0.8.0;

contract OrderSystem {
    /*
     * 1️⃣ استفاده از Struct برای ذخیره اطلاعات مشتری
     * هر مشتری دارای نام و آدرس کیف پول است.
     */
    struct Customer {
        string name;
        address wallet;
    }

    /*
     * 2️⃣ استفاده از Enum برای مشخص کردن وضعیت سفارش
     * سفارش می‌تواند در یکی از چهار حالت زیر باشد:
     * - Pending (در انتظار تأیید)
     * - Shipped (ارسال‌شده)
     * - Delivered (تحویل داده‌شده)
     * - Canceled (لغو‌شده)
     */
    enum OrderStatus { Pending, Shipped, Delivered, Canceled }

    /*
     * 3️⃣ استفاده از Struct برای تعریف سفارش
     * هر سفارش دارای یک شناسه، اطلاعات مشتری، وضعیت و قیمت است.
     */
    struct Order {
        uint id; // شناسه سفارش
        Customer customer; // اطلاعات مشتری
        OrderStatus status; // وضعیت سفارش
        uint price; // مبلغ سفارش
    }

    /*
     * 4️⃣ استفاده از Mapping برای ذخیره سفارشات بر اساس شناسه
     * این نگاشت به ما اجازه می‌دهد که به‌سرعت اطلاعات یک سفارش خاص را پیدا کنیم.
     */
    mapping(uint => Order) public orders;

    // متغیر شمارنده برای تولید شناسه یکتا برای هر سفارش
    uint public nextOrderId = 1;

    // // رویدادی برای اعلان ایجاد سفارش جدید
    // event OrderCreated(uint orderId, string customerName, OrderStatus status, uint price);

    // // رویدادی برای تغییر وضعیت سفارش
    // event OrderStatusChanged(uint orderId, OrderStatus newStatus);

    /*
     * 5️⃣ تابع ثبت سفارش جدید
     * ورودی: نام مشتری، مبلغ سفارش
     * خروجی: ثبت سفارش در سیستم و ارسال رویداد
     */
    function createOrder(string memory _name, uint _price) public {
        orders[nextOrderId] = Order({
            id: nextOrderId,
            customer: Customer(_name, msg.sender),
            status: OrderStatus.Pending,
            price: _price
        });

        // emit OrderCreated(nextOrderId, _name, OrderStatus.Pending, _price);
        //++ = +1   -- = -1
        nextOrderId++; // افزایش شمارنده برای سفارش بعدی
    }

    /*
     * 6️⃣ تابع تغییر وضعیت سفارش
     * ورودی: شناسه سفارش و وضعیت جدید
     */
    function updateOrderStatus(uint _orderId, OrderStatus _status) public {
        require(_orderId > 0 && _orderId < nextOrderId, "Invalid order ID");

        orders[_orderId].status = _status;
        // emit OrderStatusChanged(_orderId, _status);
    }

    /*
     * 7️⃣ تابع دریافت اطلاعات یک سفارش خاص
     * خروجی: نام مشتری، آدرس، وضعیت و مبلغ
     */
    function getOrder(uint _orderId) public view returns (string memory, address, OrderStatus, uint) {
        require(_orderId > 0 && _orderId < nextOrderId, "Invalid order ID");

        Order memory order = orders[_orderId];
        return (order.customer.name, order.customer.wallet, order.status, order.price);
    }
}
