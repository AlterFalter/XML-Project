<?php

require_once 'stundenplan-client/stundenplan_client.php';

$stundenplanClient = new StundenplanClient();
$stundenplanClient->tempSaveSelectedClass();
$stundenplanClient->redirectUser();

?>