<?php
// Объявление глоабльных переменных
// ** константы подключния к БД
  $host = 'localhost';
  $db = 'users';
  $userDV = 'root';

  // ** константы для поиска исполнителей
  $service = 'ремонт ноутбука';
  $dateIn = '145005062020';
  $dateOut = '145005062020';
  $serviceCategory = 'ремонт компьютерной техники';
  $price = '4500';

  // подключение к Базе данных
  $conn = mysqli_connect($host, $userDB, "", $db);
  if(!$conn){
    echo("Ошибка соединения");
    exit();
  }

  // Поместим запрос к БД в переменную
  $query = '
    select id
    from Исполнители
    where Исполнители.категория = $serviceCategory
    and услуги.название_услуги = $service

    and Исполнители.доступность = true
    and Исполнители.Начало_Доступности >= $dateIn
    and Исполнители.Конец_Доступности >= $dateOut

    and Исполнители.срднЦена Б<=$price
  ';

  if($res = mysqli_query($conn, $query)){
    // обрабатываем полученный результат
    // получаем количество записей
    $count = mysqli_num_rows($res);
    // записываем эти id в список и передаем на клиента
    while($row = $res->fetch_array(MYSQLI_ASSOC)){
      //
    }
  }
  // закрываем подключение и освобождаем переменную запрсоа
  mysqli_free_result($res);
  mysqli_close($conn);
?>
