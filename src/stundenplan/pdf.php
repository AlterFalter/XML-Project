<?php

////////////////////////////////
// Step #0: Preparation
////////////////////////////////

require_once 'stundenplan-client/stundenplan_client.php';

$stundenplanClient = new StundenplanClient();
$stundenplanClient->tempSaveSelectedClass();

////////////////////////////////
// Step #1: create FO
////////////////////////////////

/**
 * perform XSLT transformation with PHP
 * @author Roland Christen <roland.christen@hslu.ch>
 * API: http://php.net/manual/en/class.xsltprocessor.php
 */

// load XML
$data = file_get_contents('fo/fo.xml');
$xml = new DOMDocument();
$xml->loadXML($data);

// load XSL
$xsl = new DOMDocument();
$xsl->load('fo/fo.xsl');

// transform
$processor = new XSLTProcessor();
$processor->importStylesheet($xsl);
$dom = $processor->transformToDoc($xml);

// save result as FO file
$foFile = 'fo/generated.fo';
file_put_contents($foFile, $dom->saveXML());

////////////////////////////////
// Step #2: send to FO service
////////////////////////////////

// load the FOP client.
require_once 'fo/fop-client/fop_service_client.php';

// locate the source FO file.
$foFile = 'fo/generated.fo';

// create an instance of the FOP client and perform service request.
$serviceClient = new FOPServiceClient();
$pdfFile = $serviceClient->processFile($foFile);

header ("Content-Type: ".filetype($pdfFile));
header ("Content-Length: ".filesize($pdfFile));
header ("Content-Disposition: attachment; filename=Stundenplan");
readfile($pdfFile);

?>
