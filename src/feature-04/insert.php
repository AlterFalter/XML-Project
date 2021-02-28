<?php

// gather user input
foreach ($_POST as $key => $value) {
}
$class = $_POST['class'];
$size = $_POST['size'];

// load XML database
$dbFile = '../database/database.xml';
$dataRaw = file_get_contents($dbFile);
$db = new DOMDocument();
$db->loadXML($dataRaw);

// add new entry to xml
updateClass($db, $class, $size);

// validate
validateDatabase($db);

// save XML database
file_put_contents($dbFile, $db->saveXML());

// redirect user
header('Location: ../feature-04.done.xml');
exit();

function updateClass($db, $class, $size)
{
    // query stats
    $xPathQuery = sprintf('//statistics/class[@name="%s"]', $class);
    $xPath = new DOMXPath($db);
    $nodes = $xPath->query($xPathQuery);

    // change
    $nodes->item(0)->nodeValue = $size;
}

function validateDatabase($db)
{
    // disable error output to client
    libxml_use_internal_errors(true);

    // validate against Schema
    $xsd = '../database/database.xsd';
    $result = $db->schemaValidate($xsd);
    if ($result) {
        libxml_use_internal_errors(false);
        return;
    }

    // create error description
    echo('<html><body></body><a href="../feature-04.xml">back</a><p>');
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