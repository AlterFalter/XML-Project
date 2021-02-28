<?php

////////////////////////////////
// Step #1: create FO
////////////////////////////////

/**
 * perform XSLT transformation with PHP
 * @author Roland Christen <roland.christen@hslu.ch>
 * API: http://php.net/manual/en/class.xsltprocessor.php
 */

// load XML
$data = file_get_contents('../fo.xml');
$xml = new DOMDocument();
$xml->loadXML($data);

// load XSL
$xsl = new DOMDocument();
$xsl->load('fo.xsl');

// transform
$processor = new XSLTProcessor();
$processor->importStylesheet($xsl);
$dom = $processor->transformToDoc($xml);

// save result as FO file
$foFile = 'generated.fo';
file_put_contents($foFile, $dom->saveXML());

////////////////////////////////
// Step #2: send to FO service
////////////////////////////////

// load the FOP client.
require_once 'fop-client/fop_service_client.php';

// locate the source FO file.
$foFile = 'generated.fo';

// create an instance of the FOP client and perform service request.
$serviceClient = new FOPServiceClient();
$pdfFile = $serviceClient->processFile($foFile);
$pdfLink = sprintf ("download.php?file=%s", $serviceClient->encodeFilename($pdfFile));

// generate HTML output and show results of service request
echo sprintf('<p>Successfully rendered FO File<br><strong><a href="%s">%s</a></strong></p>', $foFile, $foFile);
echo sprintf('<p>Generated PDF:<br><strong><a href="%s">download PDF</a></strong></p>', $pdfLink);

?>
