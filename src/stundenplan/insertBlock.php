<?php

// gather user input
foreach ($_POST as $key => $value) {
}
$class = $_POST['class'];
$day = $_POST['day'];
$time = $_POST['time'];
$teacher = $_POST['teacher'];
$subject = $_POST['subject'];
$room = $_POST['room'];

// load XML database
$stundenplanFile = '../database/stundenplan.xml';
$dataRaw = file_get_contents($stundenplanFile);
$stundenplanDB = new DOMDocument();
$stundenplanDB->preserveWhiteSpace = false;
$stundenplanDB->formatOutput = true;
$stundenplanDB->loadXML($dataRaw);

// add new entry to xml
updateStundenplan($stundenplanDB, $class, $day, $time, $teacher, $subject, $room);

// validate
validateDatabase($stundenplanDB);

// save XML database
file_put_contents($stundenplanFile, $stundenplanDB->saveXML());

// redirect user
header("Cache-Control: no-cache, must-revalidate");
header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
header("Content-Type: application/xml; charset=utf-8");
header('Location: feature-stundenplan.done.xml');
exit();

function updateStundenplan($stundenplanDB, $class, $day, $time, $teacher, $subject, $room)
{
    $selectedBlockNode = getBlockNode($stundenplanDB, $class, $time, $day);
    $newBlockNode = createBlockNode($day, $time, $teacher, $subject, $room);

    if($selectedBlockNode->count() > 0) {
        //replace node
        $oldNode = $selectedBlockNode->item(0);
        $newNode = $stundenplanDB->importNode($newBlockNode->documentElement, true);
        $oldNode->parentNode->replaceChild($newNode, $oldNode);
    } else {
        //add node
        $selectedStundenplanNode = getStundenplanNode($stundenplanDB, $class);
        $newNode = $stundenplanDB->importNode($newBlockNode->documentElement, true);
        $selectedStundenplanNode->item(0)->appendChild($newNode);
    }
}

function getBlockNode($stundenplanDB, $class, $time, $day) {
    $xPathQuery = sprintf('//Stundenplan[@Klasse="%s"]/Block[Zeit/text()="%s" and Tag/text()="%s"]', $class, $time, $day);
    $xPath = new DOMXPath($stundenplanDB);
    $selectedBlockNode = $xPath->query($xPathQuery);
    return $selectedBlockNode;
}

function getStundenplanNode($stundenplanDB, $class) {
    $xPathQuery = sprintf('//Stundenplan[@Klasse="%s"]', $class);
    echo($xPathQuery);
    $xPath = new DOMXPath($stundenplanDB);
    $selectedStundenplanNode = $xPath->query($xPathQuery);
    return $selectedStundenplanNode;
}

function createBlockNode($day, $time, $teacher, $subject, $room) {
    $fragment = new DOMDocument;
    $blockNode = $fragment->createElement('Block');

    //add child nodes
    $blockNode->appendChild($fragment->createElement('Tag', $day));
    $blockNode->appendChild($fragment->createElement('Zeit', $time));
    $blockNode->appendChild($fragment->createElement('Fach', $subject));
    $blockNode->appendChild($fragment->createElement('Raum', $room));
    $blockNode->appendChild($fragment->createElement('Lehrperson', $teacher));

    //add block node to fragment
    $fragment->appendChild($blockNode);
    return $fragment;
}

function validateDatabase($stundenplanDB)
{
    // disable error output to client
    libxml_use_internal_errors(true);

    // validate against Schema
    $xsd = '../database/stundenplan.xsd';
    $result = $stundenplanDB->schemaValidate($xsd);
    if ($result) {
        libxml_use_internal_errors(false);
        return;
    }

    // create error description
    echo('<html><body></body><a href="feature-stundenplan.edit.xml">back</a><p>');
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