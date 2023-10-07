extends Node


# PLEASE DON'T USE THIS TO TIME YOUR GAME.
# This goes from 0 to 100 as a percentage of progress.
# It is not the standard timer.
# Your shit will break.
var timer = 0

# This is redundant, if you leave immediately after.
var timerToggle = false

# Set timer to 0.
func _ready():
	$ConfirmButton.pressed.connect(_startGame)
	$ConfirmButton.show()
	$Instructions.show()
	$BlackoutScreen.show()
	$Countdown.hide()
	$Timer.value = 0

# Update timer, stop when done.
func _process(delta):
	if(timerToggle):
		timer += delta * 100 / $Timer.get_meta("TimerDuration")
		$Timer.value = timer
		if($Timer.value == 100):
			timerToggle = false
			# REPLACE THIS WITH A CALL TO ANY FINISH FUNC
			print("DONE OMG")
	
func _startGame():
	$ConfirmButton.hide()
	$Instructions.hide()
	$BlackoutScreen.hide()
	print("Start game")
	_countdown()
	
func _countdown():
	$Countdown.show()
	$Countdown.text = "3"
	await get_tree().create_timer(0.75).timeout
	$Countdown.text = "2"
	await get_tree().create_timer(0.75).timeout
	$Countdown.text = "1"
	await get_tree().create_timer(0.75).timeout
	$Countdown.text = "GO!"
	await get_tree().create_timer(0.75).timeout
	$Countdown.hide()
	timerToggle = true
