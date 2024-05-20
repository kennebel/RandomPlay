extends Node3D
class_name FlockBase

# Enums
enum FOV {
	Wide,
	Limited,
	Narrow,
}

# Variables
# Editor Variables
@export var ItemType: RandGlobal.ItemType = RandGlobal.ItemType.None
@export var Speed: float = 2.0
@export var Energetic: float = 1.0

# Local Variables
var ID: int = -1

# Overridden Node3D functions
func _ready():
	ID = RGlobal.GetNextID()
	RGlobal.RegisterItem(self)

func _exit_tree():
	RGlobal.UnregisterItem(self)

func _process(delta):
	DoMovement(delta)

# User functions
func DoMovement(delta:float):
	DoFlocking()
	self.translate_object_local(Vector3.FORWARD * delta * Speed)

func DoFlocking():
	#int         j;
	#int         N;      // Number of neighbors
	#Vector     Pave;  // Average position vector
	#Vector     Vave;  // Average velocity vector
	#Vector     Fs;     // Net steering force
	#Vector     Pfs;    // Point of application of Fs
	#Vector     d, u, v, w;
	#double     m;
	#bool        InView;
	#bool        DoFlock = WideView||LimitedView||NarrowView;
	#int         RadiusFactor;
	#// Initialize:
	#Fs.x = Fs.y = Fs.z = 0;
	#Pave.x = Pave.y = Pave.z = 0;
	#Vave.x = Vave.y = Vave.z = 0;
	#N = 0;
	#Pfs.x = 0;
	#Pfs.y = Units[i].fLength / 2.0f;
	
	"""
	# Neighbors
	for(j=1; j<_MAX_NUM_UNITS; j++)
		  {
			   if(i!=j)
			   {
					InView = false;
					d = Units[j].vPosition - Units[i].vPosition;
					w = VRotate2D(-Units[i].fOrientation, d);
					if(WideView)
					{
						 InView = ((w.y > 0) || ((w.y < 0) &&
									(fabs(w.x) >
									fabs(w.y)*
								  _BACK_VIEW_ANGLE_FACTOR)));
						 RadiusFactor = _WIDEVIEW_RADIUS_FACTOR;
					}
					if(LimitedView)
					{
						 InView = (w.y > 0);
						 RadiusFactor = _LIMITEDVIEW_RADIUS_FACTOR;
					}
					if(NarrowView)
					{
						 InView = (((w.y > 0) && (fabs(w.x) <
									   fabs(w.y)*
									  _FRONT_VIEW_ANGLE_FACTOR)));
						 RadiusFactor = _NARROWVIEW_RADIUS_FACTOR;
					}
					if(InView)
					{
						 if(d.Magnitude() <= (Units[i].fLength *
													 RadiusFactor))
						 {
							  Pave += Units[j].vPosition;
							  Vave += Units[j].vVelocity;
							  N++;
						 }
					}
					.
					.
					.
			   }
		  }
	"""
	"""
	# Cohesion
	if(DoFlock && (N > 0))
		  {
			   Pave = Pave / N;
			   v = Units[i].vVelocity;
			   v.Normalize();
			   u = Pave - Units[i].vPosition;
			   u.Normalize();
			   w = VRotate2D(-Units[i].fOrientation, u);
			   if(w.x < 0) m = -1;
			   if(w.x > 0) m = 1;
			   if(fabs(v*u) < 1)
					Fs.x += m * _STEERINGFORCE * acos(v * u) / pi;
		  }
	"""
	"""
	# Alignment
	if(DoFlock && (N > 0))
		  {
			   Vave = Vave / N;
			   u = Vave;
			   u.Normalize();
			   v = Units[i].vVelocity;
			   v.Normalize();
			   w = VRotate2D(-Units[i].fOrientation, u);
			   if(w.x < 0) m = -1;
			   if(w.x > 0) m = 1;
			   if(fabs(v*u) < 1)
					Fs.x += m * _STEERINGFORCE * acos(v * u) / pi;
		  }
	"""
	"""
	# Separation
	if(InView)
				 {
					  if(d.Magnitude() <=
						 (Units[i].fLength * _SEPARATION_FACTOR))
					  {
						   if(w.x < 0) m = 1;
						   if(w.x > 0) m = -1;
						   Fs.x += m * _STEERINGFORCE *
								   (Units[i].fLength *
									_SEPARATION_FACTOR) /
									d.Magnitude();
					  }
				 }
	"""
	pass
