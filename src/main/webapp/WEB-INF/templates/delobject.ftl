<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta charset="utf-8"/>
    <link rel='stylesheet' href='${model["app_path"]}/css/lab10.css'>
    <script src='${model["app_path"]}/js/lab10.js'></script>

    <title>Заказ еды</title>
</head>
<body>

<div class="menu-bar">
    <ul>
        <li><a class="active" href='${model["app_path"]}'>Главная</a></li>
        <li><a href='${model["app_path"]}/deliveryman'>Курьеры</a></li>
        <li><a href='${model["app_path"]}/adddeliveryman'>Новый курьер</a></li>
        <li><a href='${model["app_path"]}/deliverymanbyname'>Поиск курьера</a></li>
        <li><a href='${model["app_path"]}/delobject'>Удаление объекта</a></li>
    </ul>
</div>

<div class="c-wrapper">
    <H2>
        Заказ еды, удаление объекта
    </H2>

    <h3>
        Удаление курьера
    </h3>
    <form method="post" action='${model["app_path"]}/deliveryman/delete'>
        ID курьера<input name="deliverymanid"/>
        <input type="submit" value="Удалить"/>
    </form>

    <h3>
        Удаление заказа
    </h3>
    <form method="post" action='${model["app_path"]}/deliveryman/deleteorder'>
        ID заказа<input name="orderid"/>
        <input type="submit" value="Удалить"/>
    </form>

    <h3>
        Удаление всех заказов
    </h3>
    <form method="post" action='${model["app_path"]}/deliveryman/deleteallorders'>
        ID курьера<input name="deliverymanid"/>
        <input type="submit" value="Удалить"/>
    </form>
</div>
</body>
</html>




















