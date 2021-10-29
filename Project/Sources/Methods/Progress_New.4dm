//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// Progress_New () : progressIdentifier
//
// DESCRIPTION
//   Pre-emptive capable replacement for the "Progress New" command.
//
var $0; $progressIdentifier : Integer
// ----------------------------------------------------
// HISTORY
//   Created by: DB (08/10/2021)
// ----------------------------------------------------
ASSERT:C1129(Count parameters:C259=0)

var $signal; $inputs : Object
var $signaled : Boolean
$signal:=New signal:C1641("progress signal")
$inputs:=New object:C1471

CALL WORKER:C1389(WorkerName; "Worker"; "NEW"; $signal; $inputs)

$signaled:=$signal.wait(120)  // wait for 120 seconds max (need to make sure we get our # back)

If ($signaled)
	$progressIdentifier:=$signal.progressId
End if 

$0:=$progressIdentifier