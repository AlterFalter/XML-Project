<?php

class StundenplanClient {
    const DB_FILE_NAME = 'selectedClass.xml';

    public function tempSaveSelectedClass() {
        // gather user input
        foreach ($_POST as $key => $value) {
        }
        $class = $_POST['class'];

        $db = $this->getDatabase();

        // add new entry to xml
        $this->updateSelectedClass($db, $class);

        // validate
        $this->validateDatabase($db);

        // save XML database
        file_put_contents(self::DB_FILE_NAME, $db->saveXML());
    }

    public function redirectUser() {
        header("Cache-Control: no-cache, must-revalidate");
        header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
        header("Content-Type: application/xml; charset=utf-8");
        header('Location: feature-stundenplan-edit.xml');
    }

    public function getClassName() {
        $stundenplanDB = $this->getDatabase();
        
        $xPathQuery = '//selectedClass';
        $xPath = new DOMXPath($stundenplanDB);
        $selectedBlockNode = $xPath->query($xPathQuery);
        return $selectedBlockNode->item(0)->nodeValue;
    }

    private function getDatabase() {
        // load XML database
        $dataRaw = file_get_contents(self::DB_FILE_NAME);
        $db = new DOMDocument();
        $db->loadXML($dataRaw);

        return $db;
    }

    private function updateSelectedClass($db, $class) {
        // query stats
        $xPathQuery = "//selectedClass";
        $xPath = new DOMXPath($db);
        $nodes = $xPath->query($xPathQuery);
    
        // change
        $nodes->item(0)->nodeValue = $class;
    }
    
    private function validateDatabase($db) {
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
        echo('<html><body></body><a href="feature-stundenplan.xml">back</a><p>');
        $errors = printErrors();
        print($errors);
        echo('</p></body></html>');
        libxml_use_internal_errors(false);
        exit();
    }
    
    private function printErrors() {
        $ret = array();
        $errors = libxml_get_errors();
        foreach ($errors as $error) {
            $ret[] = sprintf('Line [%d]: %s', $error->line, $error->message);
        }
        libxml_clear_errors();
        return implode($ret, '</br>');
    }
}

?>