# n-body-problem

This simulation solves the n-body-problem numerically for theoretically infinite objects in a 2D plane. This means computing the vector of acceleration of each object resulting from the gravitational pull of the other objects. The number of calculations per frame is given by the factor ``n * (n - 1)`` where ``n`` is the number of spawned objects.

The resulting force on each object will be calculated from a combination of all individual force vectors:

![newtons law of universal gravitation](https://wikimedia.org/api/rest_v1/media/math/render/svg/35e05bce060ddb6441ba83d482cd27a7f57e1998)

---

You can spawn as many objects as you like with arbitrary parameters such as mass, radius, etc. This however is at the moment only possible through code, GUI is still work in progress.

### Parameter description following.

---

**Controls:** You can control the camera with WASD or the arrow keys and the camera zoom with the mouse wheel.

**Impacts** are for now handled so that the heavier body gets all the mass from it's partners and then continues on unaffected. Conservation of momentum will follow, only looking at elastic collisions though.

**Stats:** You can enable and disable the resulting force vectors for each individual object. In the future you will be able to get more information by clicking on an object.

The 2D plane should be infinitely big and the maximum speed in this simulated universe should be light speed which no object is able to reach. This is ensured by time dilation which any fast object will experience according to you, the observer, resulting in an increasingly slower movement and acceleration. This is not fully tested though.

You can also scale the 2D plane to any arbitrary number of meters per pixel.

---

_Please note that this is still work in progress and the version you're seeing is a very early one. But if you find any bugs or want to contribute feel free to create issues or pull requests!_
