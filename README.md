# n-body-problem

This simulation solves the n-body-problem numerically for theoretically 
infinite objects in a 2D plane. This means computing the vector of 
acceleration of each object resulting from the gravitational pull of the 
other objects. The number of calculation cycles per frame is given by the 
factor ``n * (n - 1)`` where ``n`` is the number of spawned objects.

The resulting force on each object will be calculated from a combination 
of all individual force vectors:

![newtons law of universal gravitation](https://wikimedia.org/api/rest_v1/media/math/render/svg/35e05bce060ddb6441ba83d482cd27a7f57e1998)

Made with Godot Engine (no physics engine involved).

**This app is also available as a progressive web app. You can install it in Chrome and other Chromium-based browsers!**

---

You can spawn as many objects as you like with arbitrary parameters such 
as mass, radius, etc. This however is at the moment only possible through
code, GUI is still somewhat work in progress; pull requests are greatly
appreciated!

### Parameter description following.

---

**Controls:** You can control the camera with WASD or the arrow keys and 
the camera zoom with the mouse wheel. You can also click on any object 
to let the camera follow it and display some stats. Right-click or ESC 
to leave follow mode. Camera speed can be adjusted in the camera script 
itself. You can also add new objects by clicking on `add` in the top right
corner and then click at any arbitrary place to spawn it with a random
color and random velocity.

**Impacts** are handled so that the heavier body gets all the mass from 
it's collision partner(s). Conservation of momentum is also being 
taken into account, but only looking at _perfectly inelastic collisions_. This 
seems like a solid solution for this kind of overall simulation.

**Stats:** You can enable and disable the resulting force vectors for 
each individual object in code. The top left corner shows the total number
of objects in the world. Clicking on an object allows you to show
any object's velocity, mass and it's current/past orbit in fixed space.

The 2D plane is nearly infinitely big and there is _no_ maximum speed due to
this being an all classical newtonian simulation. That means you _can_ launch
your own objects at any speed, however, if you don't mess with that no
object will get even close to travelling at light speed.

You can also scale the 2D plane to any arbitrary number of meters per pixel. This needs to be done in code, though.
