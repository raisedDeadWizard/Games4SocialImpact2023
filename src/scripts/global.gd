extends Node

var num_books = 9
var is_minigame_ready = false
var highest_book = 1000

var max_drops = 0
var water_timer = 0

var book_timer = 0
var weed_timer = 0

var totalScoreCurrAct = 0
var totalScore = 0

const akleda_dialog : Array = [
	"So I was collecting apples today, and I feel like I got less than I usually do. Do you know a way to get more apples?",
	"What did you find out about?",
	"If you want to get more apples, you should prune your trees in the early spring before the trees begin growing in the spring. This can be done by cutting off dead or diseased branches.",
	"I’ll try that out next spring thanks!",
	"I didn’t find much but you can try pruning the branches before they start growing, and that should help.",
	"Hmmm, alright, I’ll see how it goes."
	]
const eumann_dialog : Array = [
	"Hey there, so I’ve been growing cabbage for a while and wanted to try growing corn, do you know why they haven’t been growing well?",
	"So, how do I get these corn to grow?",
	"Unlike cabbage, corn doesn’t grow well in winter, you should try to grow it in summer when you aren’t growing cabbage.",
	"Sounds like a good idea.",
	"Maybe it’s something to do with your soil?",
	"Huh, guess I can check it out then."]
const walden_dialog : Array = [
	"Hey there! I was trying to grow some tomatoes but there are too many weeds! Can you help me figure out what to do?",
	"So what did you find out?",
	"Weeds leach nutrients from plants. The best way to deal with them is to remove all of the weeds before planting to make sure they don’t grow again later on, and the tomatoes can thrive.",
	"Thanks a lot! I’ll try that out as soon as I can!",
	"I wasn’t able to find much, but try to pull as many as you can to allow the plants to grow.",
	"I’ll do my best, thanks for trying."
	]

const harold_dialog : Array = [
	"Hey do you know how to deal with all the rain we’ve been having recently? All my carrots keep getting washed away.",
	"So, got a solution for me?",
	"If you make ditches along the edges of your field and till your soil with a hoe then the water will have a place to drain to and avoid flooding.",
	"I should have thought of that, I’ll get right on that, thanks.",
	"Just add some ditches so that the water has a place to pool rather than wash away your crops.",
	"Oh, alright I guess."
	]
const gilbert_dialog : Array = [
	"Hello, do you know why my potatoes aren't growing well? I have them all grouped together in a sunny area with plenty of water, but they just aren’t growing.",
	"So what did you find out?",
	"Potatoes grow better when they're spaced out in rows rather than in groups. If you space them out a bit they grow much better and won’t be competing for sunlight.",
	"Thanks for the help, I’ll get right on it!",
	"Try giving them more water to help them grow more, they are sucking up all the water in a pile like that.",
	"Huh, didn’t know that I’ll have to try that out."
	]
const judith_dialog : Array = [
	"Heya, I really like having asparagus with my dinners and with winter coming up I was wondering if there was some way to keep growing them.",
	"Did you find a solution?",
	"Yes, if you build an enclosed glass room with proper temperature control you can grow asparagus in something called a “greenhouse” and then you can enjoy it all year round. ",
	"Wow, that's amazing, thanks!",
	"Unfortunately I couldn’t find anything, but you could try growing extra in advance and storing them in a cold environment.",
	"I’ll try my best then…"
	]

const riley_dialog : Array = [
	"Hello, I have an unusual question for you. I am trying to breed desired traits from my plants. Do you have any ideas of how I could achieve that?",
	"So find anything good?",
	"From what I found, there are many options, but the best for what you’re doing would be grafting plants and collecting the seeds produced by them later. ",
	"Really? That’s crazy, but yeah I’ll give it a shot. Hopefully it goes well!",
	"I haven’t been keeping up with my botany studies, but I’ve heard of self-pollinating plants which could be helpful to you.",
	"I guess I can give it a look and see how it goes."
	]
const brendan_dialog : Array = [
	"Hello, my name is Brendan and I’ve been trying to increase crop growth without changing the crop itself, and I’ve hit a brick wall, got any ideas?",
	"So what have you discovered in your research?",
	"Through the process of an irrigation pump, you can enrich fertilizer with nitrogen by dropping it into the soil overtime and it will help crops grow with more nutrients.",
	"I never even thought of that, I’ll try it out immediately.",
	"Well, I’m not an expert at chemistry but you can try using manure to increase crop growth.",
	"I mean yeah, but it smells so bad. I’ll see what I can do."
	]
const vivian_dialog : Array = [
	"So I’ve been trying to deal with insects, specifically spider mites, and was wondering if you have any solutions to dealing with them?",
	"Got a solution to my mite problem?",
	"Using an organic insecticide should do the trick but you can also use a strong stream of water to deal with them as well. I’d also recommend culling nearby plants as well just in case if it is a widespread issue.",
	"They make organic insecticides? Who knew, thanks for the info!",
	"I did some searching and found that you can mix some soap and water together to make a diy insecticide to spray on your plants to treat them.",
	"That seems really simple but I’ll try it out."
	]

var scene_array : Array = [
	# exposition
	
	"res://src/scenes/StartMenu.tscn",
	"res://src/scenes/TreeExpo.tscn",
	"res://src/scenes/PlayerExpo.tscn",
	
	# act 1
	
	"res://src/scenes/act1/walden-prompt.tscn",
	"res://src/scenes/Garden.tscn",
	"res://src/scenes/act1/walden-research.tscn",
	"res://src/scenes/act1/walden-response.tscn",
	
	"res://src/scenes/act1/akelda-prompt.tscn",
	"res://src/scenes/Weed.tscn",
	"res://src/scenes/act1/akelda-research.tscn",
	"res://src/scenes/act1/akelda-response.tscn",
	
	"res://src/scenes/act1/eumann-prompt.tscn",
	"res://src/scenes/book_stack.tscn",
	"res://src/scenes/act1/eumann-research.tscn",
	"res://src/scenes/act1/eumann-response.tscn",
	
	
	
	# act 2
	"res://src/scenes/transitionact1to2.tscn",
	
	"res://src/scenes/act2/harold-prompt.tscn",
	"res://src/scenes/Garden.tscn",
	"res://src/scenes/act2/harold-research.tscn",
	"res://src/scenes/act2/harold-response.tscn",
	
	"res://src/scenes/act2/gilbert-prompt.tscn",
	"res://src/scenes/Weed.tscn",
	"res://src/scenes/act2/gilbert-research.tscn",
	"res://src/scenes/act2/gilbert-response.tscn",
	
	"res://src/scenes/act2/judith-prompt.tscn",
	"res://src/scenes/book_stack.tscn",
	"res://src/scenes/act2/judith-research.tscn",
	"res://src/scenes/act2/judith-response.tscn",
	
	# act 3
	"res://src/scenes/transitionact2to3.tscn",
	
	"res://src/scenes/act3/riley-prompt.tscn",
	"res://src/scenes/Garden.tscn",
	"res://src/scenes/act3/riley-research.tscn",
	"res://src/scenes/act3/riley-response.tscn",
	
	"res://src/scenes/act3/brendan-prompt.tscn",
	"res://src/scenes/Weed.tscn",
	"res://src/scenes/act3/brendan-research.tscn",
	"res://src/scenes/act3/brendan-response.tscn",
	
	"res://src/scenes/act3/vivian-prompt.tscn",
	"res://src/scenes/book_stack.tscn",
	"res://src/scenes/act3/vivian-research.tscn",
	"res://src/scenes/act3/vivian-response.tscn"
]
var scene_index = -1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
