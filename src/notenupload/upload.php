<?php
$target_dir = "uploads/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
$imageFileName = strtolower(pathinfo($target_file,PATHINFO_BASENAME));

// Check file size
if ($_FILES["fileToUpload"]["size"] > 5242880) {
  echo('<html><body></body><a href="feature-notenupload.xml">back</a><p>');
  echo "Sorry, die Datei ist zu gross. Sie darf nicht gr&ouml;sser als 5 MB sein.";
  $uploadOk = 0;
}
 
// Allow only this file name
if($imageFileName != "noten.xml") {
  echo('<html><body></body><a href="feature-notenupload.xml">back</a><p>');
  echo "Sorry, die Datei muss Noten.xml heissen. ";
  $uploadOk = 0;
}

function libxml_display_error($error)
{
    $return = "<br/>\n";
    switch ($error->level) {
        case LIBXML_ERR_WARNING:
            $return .= "<b>Warning $error->code</b>: ";
            break;
        case LIBXML_ERR_ERROR:
            $return .= "<b>Error $error->code</b>: ";
            break;
        case LIBXML_ERR_FATAL:
            $return .= "<b>Fatal Error $error->code</b>: ";
            break;
    }
    $return .= trim($error->message);
    if ($error->file) {
        $return .=    " in <b>Noten.xml</b>";
    }
    $return .= " on line <b>$error->line</b>\n";

    return $return;
}

function libxml_display_errors() {
    $errors = libxml_get_errors();
    foreach ($errors as $error) {
        print libxml_display_error($error);
    }
    libxml_clear_errors();
}

// Enable user error handling
libxml_use_internal_errors(true);

$xml = new DOMDocument();
$xml->load($_FILES["fileToUpload"]["tmp_name"]);

if (!$xml->schemaValidate('uploads/Noten.xsd')) {
	echo('<html><body></body><a href="feature-notenupload.xml">back</a><p>');
    print '<b>Fehler: Die Datei Noten.xml wurde nicht korrekt ausgef&uuml;llt!</b>';
    libxml_display_errors();
	$uploadOk = 0;
	echo "<br /><br />";
}

// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
  echo "Die Datei wurde nicht hochgeladen.";
// if everything is ok, try to upload file
} else {
  if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {

	include 'insert.php';
	
	// redirect user
    header('Location: feature-notenupload.done.xml');
    exit();
	
  } else {
	echo('<html><body></body><a href="feature-notenupload.xml">back</a><p>');
    echo "Sorry, beim Hochladen der Datei gab es einen Fehler.";
  }
  
}

?>