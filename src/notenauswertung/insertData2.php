<?php

// gather user input
foreach ($_POST as $key => $value) {
}

$classData = $_POST['class'];
$subjectData = $_POST['subject'];
$examData = $_POST['exam'];
$dateData = $_POST['date'];
$pupilData = $_POST['pupil'];
$gradeData = $_POST['grade'];

$classDBFile = 'selectedClass.xml';
$subjectDBFile = 'selectedSubject.xml';
$examDBFile = 'selectedExam.xml';
$dateDBFile = 'selectedDate.xml';
$pupilDBFile = 'selectedPupil.xml';
$gradeDBFile = 'selectedGrade.xml';

$classXPathQuery = "//selectedClass";
$subjectXPathQuery = "//selectedSubject";
$examXPathQuery = "//selectedExam";
$dateXPathQuery = "//selectedDate";
$pupilXPathQuery = "//selectedPupil";
$gradeXPathQuery = "//selectedGrade";

$classXsd = 'selectedClass.xsd';
$subjectXsd = 'selectedSubject.xsd';
$examXsd = 'selectedExam.xsd';
$dateXsd = 'selectedDate.xsd';
$pupilXsd = 'selectedPupil.xsd';
$gradeXsd = 'selectedGrade.xsd';

insertData($classDBFile, $classData, $classXPathQuery, $classXsd);
insertData($subjectDBFile, $subjectData, $subjectXPathQuery, $subjectXsd);
insertData($examDBFile, $examData, $examXPathQuery, $examXsd);
insertData($dateDBFile, $dateData, $dateXPathQuery, $dateXsd);
insertData($pupilDBFile, $pupilData, $pupilXPathQuery, $pupilXsd);
insertData($gradeDBFile, $gradeData, $gradeXPathQuery, $gradeXsd);


// redirect user
header("Cache-Control: no-cache, must-revalidate");
header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
header("Content-Type: application/xml; charset=utf-8");
header('Location: feature-notentabelle-1.xml');
exit();

function insertData($dbFile, $data, $xPathQuery, $xsd)
{

	// load XML database
	
	$dataRaw = file_get_contents($dbFile);
	$db = new DOMDocument();
	$db->loadXML($dataRaw);

	// add new entry to xml
	updateData($db, $data, $xPathQuery);

	// validate
	validateDatabase($db, $xsd);

	// save XML database
	file_put_contents($dbFile, $db->saveXML());
}

function updateData($db, $class, $xPathQuery)
{
    // query stats
    
    $xPath = new DOMXPath($db);
    $nodes = $xPath->query($xPathQuery);

    // change
    $nodes->item(0)->nodeValue = $class;
}

function validateDatabase($db, $xsd)
{
    // disable error output to client
    libxml_use_internal_errors(true);

    // validate against Schema
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