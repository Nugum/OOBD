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

	<form action='${model["app_path"]}/adddeliveryman' method="post">
		<input type="hidden" name="id" value='${model["deliveryman"].id!}'/>
		<div>Имя        <input type="text" name="name" value='${model["deliveryman"].name!}'/></div>
		<div>Фамилия    <input type="text" name="surname" value='${model["deliveryman"].surname!}'/></div>
        <div>Возраст    <input type="text" name="age" value='${model["deliveryman"].age!}'/></div>
		<div>Номер счёта<input type="text" name="workernumber" value='${model["deliveryman"].workerNumber!}'/></div>

		<input type="submit" value="Сохранить"/>

	</form>

	<h3>Заказы курьера</h3>

	<table>
		<thead>
		<th>id</th><th>Название</th>
		</thead>
		<tbody>
		<#if model["orders"]??>
		<#list model["orders"] as orderEns>
		<tr>
			<td>
				<#if orderEns.id??>${orderEns.id}</#if>
			</td>
			<td>
                <#if orderEns.orderEn??>${orderEns.orderEn}</#if>
            </td>
		</tr>
		</#list>
	</#if>
	</tbody>
	</table>

	<#if model["deliveryman"].id??>
	<form action='${model["app_path"]}/addorder' method="post">
		<input type="hidden" name="id" value='${model["deliveryman"].id!}'/>
		<input type="text" name="name" placeholder="Укажите название заказа"/>
		<input type="submit" value="Добавить еду"/>
	</form>
	</#if>
</div>
</body>
</html>