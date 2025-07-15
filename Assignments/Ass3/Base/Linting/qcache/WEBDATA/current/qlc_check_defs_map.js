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
{ "checksId":"0", "checksName":"multi_ports_in_single_line","severityId":"2","categoryId":"0"},
{ "checksId":"1", "checksName":"re_entrant_output","severityId":"2","categoryId":"3"},
{ "checksId":"2", "checksName":"clk_port_conn_complex","severityId":"1","categoryId":"5"},
{ "checksId":"3", "checksName":" ","severityId":"3","categoryId":"9"}]};
var schematicStatus = {  
"multi_ports_in_single_line" : "off",
"re_entrant_output" : "on",
"clk_port_conn_complex" : "off"};
var adaptiveModeStatus = {  
"multi_ports_in_single_line" : "off",
"re_entrant_output" : "on",
"clk_port_conn_complex" : "off"};
var checkAliasMap = { };
var argMap = {  
"1":"module",
"2":"file",
"3":"line",
"4":"instance",
"5":"signal1",
"6":"signal2",
"7":"expression",
"8":"clock"};
