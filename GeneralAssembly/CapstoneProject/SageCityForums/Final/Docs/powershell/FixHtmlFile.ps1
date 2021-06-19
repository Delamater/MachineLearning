# Update results.html and make it searchable

 $myFile = "E:\g\MachineLearning\GeneralAssembly\CapstoneProject\SageCityForums\Final\Docs\results.html"
 $destinationFile = "E:\g\MachineLearning\GeneralAssembly\CapstoneProject\SageCityForums\Final\Docs\resultsFixed.html"
 $destinationFileDebug = "E:\g\MachineLearning\GeneralAssembly\CapstoneProject\SageCityForums\Final\Docs\resultsFixed_debug.html"
# $rawText = Get-Content $myFile
$prePend = '
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

#myInput {
  background-image: url(''/css/searchicon.png'');
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 100%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
  margin-left: 30px;
  margin-right: 30px;    
}

#myTable {
  border-collapse: collapse;
  width: 75%;
  border: 1px solid #ddd;
  font-size: 18px;
  margin-left: 30px;
  margin-right: 30px;  
}

#myTable th, #myTable td {
  text-align: left;
  padding: 12px;
}

#myTable tr {
  border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
  background-color: #f1f1f1;
}
</style>
</head>
<body>

<h2>Sage City Forum Data</h2>

<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">
'

$suffix = 
'
<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>

</body>
</html>'

$tableContent = Get-Content $myFile
#Write-Host $rawText


$tableContent = $tableContent -replace '<table border="1" class="dataframe">', '<table border="1" id="myTable">'
$tableContent = $tableContent -replace '<tr style="text-align: right;">', '<tr style="text-align: right;" class="header">'
$tableContent = $tableContent -replace '<th>Forum Name</th>', '<th style="width:10%">Forum Name</th>'
$tableContent = $tableContent -replace '<th>Forum_Post_Raw</th>', '<th style="width:60%">Forum Post Raw</th>'
$tableContent = $tableContent -replace '<th>topic0_pct</th>', '<th style="width:5%">Topic 0 %</th>'
$tableContent = $tableContent -replace '<th>topic1_pct</th>', '<th style="width:5%">Topic1 %</th>'
$tableContent = $tableContent -replace '<th>topic2_pct</th>', '<th style="width:5%">Topic2 %</th>'


# Remove file if exists
Remove-Item $destinationFile 
# Remove-Item $destinationFileDebug

Add-Content -Path $destinationFile $prePend
Add-Content -Path $destinationFile $tableContent
Add-Content -Path $destinationFile $suffix

# Add-Content -Path $destinationFileDebug $prePend
# Add-Content -Path $destinationFileDebug $tableContent
# Add-Content -Path $destinationFileDebug $suffix

