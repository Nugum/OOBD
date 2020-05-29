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
	 Курьеры
</H2>

	<table>
		<thead>
			<th>id</th><th>Имя</th>
		</thead>
		<tbody>
		<#if model["deliverymen"]??>
		<#list model["deliverymen"] as deliveryman>
		<tr>
			<td>
				<#if deliveryman.id??>${deliveryman.id}</#if>
			</td>
			<td><#if deliveryman.name??><a href='${model["app_path"]}/adddeliveryman?id=${deliveryman.id}'>${deliveryman.name}</a></#if></td>
		</tr>
		</#list>
		</#if>
	</tbody>
	</table>

</div>
</body>
</html>