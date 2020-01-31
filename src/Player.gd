extends RigidBody2D

const terminal_velocity: float = 500.0
const thrust: float = 1000.0

func _physics_process(delta):
	applied_force = Vector2(thrust - (linear_velocity.length()/terminal_velocity)*thrust, 0.0).rotated(rotation)

func _integrate_forces(state: Physics2DDirectBodyState):
	var screen_size: float = ProjectSettings.get_setting("display/window/size/width")
	if state.transform.origin.x <= 0.0:
		state.transform.origin.x += screen_size
	elif state.transform.origin.x >= screen_size:
		state.transform.origin.x -= screen_size

	elif state.transform.origin.y <= 0.0:
		state.transform.origin.y += screen_size
	elif state.transform.origin.y >= screen_size:
		state.transform.origin.y -= screen_size
