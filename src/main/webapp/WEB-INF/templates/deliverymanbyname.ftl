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
	 Курьер
</H2>

    <form action='${model["app_path"]}/deliverymanbyname' method="post">
        <input type="text" name="name" placeholder="Укажите имя курьера"/>
        <input type="submit" value="Найти курьера"/>
    </form>

    <table>
        <thead>
        <th>
            id
        </th>
        <th>
            name
        </th>
        <th>
            surname
        </th>
        <th>
            age
        </th>
        <th>
            workerNumber
        </th>
        <tbody>
        <#if model["deliveryman"]??>
            <tr>
                <td>
                    <#if model["deliveryman"].id??>${model["deliveryman"].id}</#if>
                </td>
                <td>
                    <#if model["deliveryman"].name??>${model["deliveryman"].name}</#if>
                </td>
                <td>
                    <#if model["deliveryman"].surname??>${model["deliveryman"].surname}</#if>
                </td>
                <td>
                    <#if model["deliveryman"].age??>${model["deliveryman"].age}</#if>
                </td>
                <td>
                    <#if model["deliveryman"].workerNumber??>${model["deliveryman"].workerNumber}</#if>
                </td>
            </tr>
        </#if>
        </tbody>
        </thead>
    </table>

</div>
</body>
</html>