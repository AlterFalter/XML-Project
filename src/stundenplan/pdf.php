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

header('Content-Description: File Transfer');
header('Content-Type: application/octet-stream');
#header('Content-Disposition: attachment; filename=' . $this->fileName);
header ("Content-Disposition: attachment; filename=Stundenplan" . $className . ".pdf");
header('Content-Transfer-Encoding: binary');
header('Expires: 0');
header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
header('Pragma: public');
# line from starterkit
#header('Content-Length: ' . filesize($this->fileName));
# our line
#header ("Content-Type: ".filetype($pdfFile));
header ("Content-Length: ".filesize($pdfFile));
$className = $stundenplanClient->getClassName();

ob_clean();
flush();
readfile($pdfFile);

?>
