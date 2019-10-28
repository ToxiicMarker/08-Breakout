extends KinematicBody2D

var new_ball = preload("res://Scenes/Ball.tscn")

func _ready():
 set_process_input(true)

func _physics_process(delta):
 var mouse_x = get_viewport().get_mouse_position().x
 position = Vector2(mouse_x, position.y)

func _input(event):
 if event is InputEventMouseButton and event.pressed:
  if not get_parent().has_node("Ball"):
   var ball = new_ball.instance() #creates a new ball scene
   ball.position = position - Vector2(0, 32) #sets ball position = to the paddle's position plus 32 picels in the y direction
   ball.name = "Ball" #This names the node ball so that we get only one ball and not infinite balls as thsi depends on the fact that there is a node called ball 
   ball.linear_velocity = Vector2(200, -200) #initial linear velocity
   get_parent().add_child(ball) #adds the node I think 