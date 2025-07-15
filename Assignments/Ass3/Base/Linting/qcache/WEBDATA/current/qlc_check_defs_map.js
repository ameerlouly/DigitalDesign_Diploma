var setupInfo = { "setupInfo" : [
{ "HOME_0IN" : "F:/QFT_2021.1/QFT_2021.1/QFT/V2021.1/win64" },{ "QHOME" : "F:/QFT_2021.1/QFT_2021.1/QFT/V2021.1/win64" },{ "ZSH" : "" },{ "ZI_RTLD_LIB" : "" }]};
var category = { "category" : [
{ "categoryId" : "0" , "categoryName":"Rtl Design Style" },
{ "categoryId" : "1" , "categoryName":"Simulation" },
{ "categoryId" : "2" , "categoryName":"Synthesis" },
{ "categoryId" : "3" , "categoryName":"Connectivity" },
{ "categoryId" : "4" , "categoryName":"Reset" },
{ "categoryId" : "5" , "categoryName":"Clock" },
{ "categoryId" : "6" , "categoryName":"Testbench" },
{ "categoryId" : "7" , "categoryName":"Nomenclature Style" },
{ "categoryId" : "8" , "categoryName":"Setup Checks" }]};
var severity = { "severity" : [
{ "severityId" : "0" , "severityName":"Error" },
{ "severityId" : "1" , "severityName":"Warning" },
{ "severityId" : "2" , "severityName":"Info" }]};
var statusObj = { "status" : [
{ "statusId" : "0" , "statusName":"uninspected" },
{ "statusId" : "1" , "statusName":"pending" },
{ "statusId" : "2" , "statusName":"waived" },
{ "statusId" : "3" , "statusName":"bug" },
{ "statusId" : "4" , "statusName":"fixed" },
{ "statusId" : "5" , "statusName":"verified" }]} ;
var checks = { "checks":[
{ "checksId":"0", "checksName":"assigns_mixed_in_always_block","severityId":"2","categoryId":"1"},
{ "checksId":"1", "checksName":"assigns_mixed","severityId":"2","categoryId":"1"},
{ "checksId":"2", "checksName":"async_reset_active_high","severityId":"2","categoryId":"5"},
{ "checksId":"3", "checksName":"multi_ports_in_single_line","severityId":"2","categoryId":"0"},
{ "checksId":"4", "checksName":" ","severityId":"3","categoryId":"9"}]};
var schematicStatus = {  
"assigns_mixed_in_always_block" : "off",
"assigns_mixed" : "off",
"async_reset_active_high" : "off",
"multi_ports_in_single_line" : "off"};
var adaptiveModeStatus = {  
"assigns_mixed_in_always_block" : "off",
"assigns_mixed" : "off",
"async_reset_active_high" : "off",
"multi_ports_in_single_line" : "off"};
var checkAliasMap = { };
var argMap = {  
"1":"module",
"2":"file",
"3":"line1",
"4":"line2",
"5":"signal",
"6":"file1",
"7":"file2",
"8":"reset",
"9":"line"};
