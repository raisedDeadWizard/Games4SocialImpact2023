extends Node2D

var text_arr = [
	# Act 1
	"Attempts to remove weeds have been around since 10,000 BCE, but came into full swing during Roman and Medieval times.",
	"Manual weed removal before planting is done as part of pre-planting before you even put seeds in the soil.",
	
	"Pruning was discovered according to a legend where a donkey nibbled on a wild grape vine and it grew more grapes as a result, and is linked to 8,000 BCE in the Caucuses.",
	"Pruning removes diseased, dead, or any general branches of a plant that are doing unwell. Done in early spring before blooming and after the weather starts to warm.",
	
	"Seasonal planting goes back just as far as horticulture itself and can be tracked to 10,000 BCE.",
	"It was discovered by early humans when trying to develop and foster crops over time and learning at which points in the year they grew.",
	
	# Act 2
	"Drainage systems date back to 4,000 BCE in Mesopotamia and Iran.",
	"This is the practice of adding dedicated ditches and areas for water to pool to reduce risks of floods and storms ruining crops.",
	
	"Tilling began in Ancient Egypt, but wasn’t done extensively, as compared to the amount of tilling that appeared later during Roman and Medieval times.",
	"Tilling is a way to prep soil and properly space out crops so that they all get equal amounts of sun and nutrients.",
	
	"The first kinds of greenhouses appeared in Roman times but were extremely rudimentary, but became much more common and widespread leading into the 18th century.",
	"Greenhouses are controlled indoor growing environments to help grow crops out of season or longer to the beginning and end of their given growing seasons.",
	
	# Act 3
	"It is believed that farmers were using fertilizer as far back as 8,000 BCE, but chemically based fertilizer originates in the mid-19th century in Germany.",
	"Chemical fertilizers have key nutrients added into them to maximize the amount of nutrients plants receive and can use in the growth process.",
	
	"Vegetable Grafting originated in 500 CE in China and was developed further overtime until the 50s when grafting and research went into full swing in Japan.",
	"Grafting is mixing the root systems of two of the same or different plants in an attempt to increase plant size and disease and pest management.",
	
	"Pesticides were first recorded in 4,500 BCE, and have developed and changed overtime since then. Organic versions of pesticides started to show up in the 30s and 50s.",
	"Organic insecticides are food safe and safe to use on plants and still do their intended job of keeping pests and insects away from crops.",
]

# Called when the node enters the scene tree for the first time.
func _ready():
	$Book/Label1.text = text_arr[Global.research_index * 2]
	$Book/Label2.text = text_arr[Global.research_index * 2 + 1]
	Global.research_index += 1

	
func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_tree().change_scene_to_file("res://src/scenes/main.tscn")
