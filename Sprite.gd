extends Sprite

# Shake parameters
var shake_intensity = 10
var shake_speed = 15
var shake_duration = 0.5

# Initial position of the sprite
var initial_position = Vector2()

func _ready():
	# Store the initial position of the sprite
	initial_position = position

# Function to start the shaking effect
func start_shake():
	# Start a timer to control the duration of the shaking effect
	$Timer.wait_time = shake_duration
	$Timer.start()

# Function called when the timer expires
func _on_Timer_timeout():
	# Set the position of the sprite to a random offset based on shake intensity
	position = initial_position + Vector2(rand_range(-shake_intensity, shake_intensity), rand_range(-shake_intensity, shake_intensity))

	# Restart the timer to continue shaking
	$Timer.start()

# Function to stop the shaking effect
func stop_shake():
	# Reset the position of the sprite to its initial position
	position = initial_position
