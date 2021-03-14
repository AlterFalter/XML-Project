<?php

// gather user input
foreach ($_POST as $key => $value) {
}
$class = $_POST['class'];

// load XML database
$dbFile = 'selectedClass.xml';
$dataRaw = file_get_contents($dbFile);
$db = new DOMDocument();
$db->loadXML($dataRaw);

// add new entry to xml
updateClass($db, $class);

// validate
validateDatabase($db);

// save XML database
file_put_contents($dbFile, $db->saveXML());

// redirect user
header("Cache-Control: no-cache, must-revalidate");
header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
header("Content-Type: application/xml; charset=utf-8");
header('Location: feature-abfrage-1.xml');
exit();

function updateClass($db, $class)
{
    // query stats
    $xPathQuery = "//selectedClass";
    $xPath = new DOMXPath($db);
    $nodes = $xPath->query($xPathQuery);

    // change
    $nodes->item(0)->nodeValue = $class;
}

function validateDatabase($db)
{
    // disable error output to client
    libxml_use_internal_errors(true);

    // validate against Schema
    $xsd = 'selectedClass.xsd';
    $result = $db->schemaValidate($xsd);
    if ($result) {
        libxml_use_internal_errors(false);
        return;
    }

    // create error description
    echo('<html><body></body><a href="../feature-notenauswertung.xml">back</a><p>');
    $errors = printErrors();
    print($errors);
    echo('</p></body></html>');
    libxml_use_internal_errors(false);
    exit();

}

function printErrors()
{
    $ret = array();
    $errors = libxml_get_errors();
    foreach ($errors as $error) {
        $ret[] = sprintf('Line [%d]: %s', $error->line, $error->message);
    }
    libxml_clear_errors();
    return implode($ret, '</br>');
}