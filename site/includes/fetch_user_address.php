<?php
session_start();
require_once './db_connection.php';
require_once './functions.php';

/*
* upon a GET request, this script will return a JSON like this:
    * {'default_usr_addr_id' => <id in user_address that is user's default address>,
    *  'addresses' => [ ## an array of addresses]
    * }
*       
*/

$response = [
    'default_usr_addr_id' => null,
    'addresses' => []
];

$idUser = $_SESSION['id'];
$stmt = dbExecute("SELECT default_usr_address_id FROM user WHERE id = ?", [$idUser])['stmt'];
$response['default_usr_addr_id'] = $stmt->fetch(PDO::FETCH_ASSOC)['default_usr_address_id'];


$key_ua = [
    'contact_name', 'contact_phone', 'contact_email', 'address'
];
$key_a = [
    'country', 'region', 'city', 'street', 'streetno', 'apartment_no', 'postal_code'
];

// a json object that will be returned to the client which includes all
// the addresses of the user
$addresses = [];

// with the id, look in the address table, get the address info.
// need to cross referenc tables country, region, city to get the names
// of the country, region, city
$query_addrInfo = <<<SQL
    SELECT ua.id AS usr_addr_id,
        ua.contact_name, ua.contact_phone, ua.contact_email,
        a.street, a.streetno, a.apartment_no, a.postal_code,
        c.name AS country, r.name AS region, ct.name AS city
    FROM user_address AS ua
    INNER JOIN address AS a
        ON ua.idAddress = a.id
    INNER JOIN countries AS c
        ON a.country_id = c.id
    INNER JOIN regions AS r
        ON a.region_id = r.id
    INNER JOIN cities AS ct
        ON a.city_id = ct.id
    WHERE ua.idUser = ? AND NOT ua.deleted
SQL;
$addrInfo = dbExecute($query_addrInfo, [$idUser])['stmt']->fetchAll(PDO::FETCH_ASSOC);
$response['addresses'] = $addrInfo;

header('Content-Type: application/json');
echo json_encode($response);
?>