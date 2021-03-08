<?php
$orgdoc = new DOMDocument;
$orgdoc->load('uploads\Noten.xml');

$node = $orgdoc->getElementsByTagName("Prüfung")->item(0);

$newdoc = new DOMDocument;
$newdoc->preserveWhiteSpace = false;
$newdoc->formatOutput = true;
$newdoc->load('..\database\Noten-DB.xml');

// Import the node, and all its children, to the document
$node = $newdoc->importNode($node, true);
// And then append it to the "<Prüfungen>" node
$newdoc->documentElement->appendChild($node);

$newdoc->save('..\database\Noten-DB.xml');
?>