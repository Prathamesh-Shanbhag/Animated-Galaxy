uniform float uSize;
uniform float uTime;

attribute float aScale;
attribute vec3 aRandomness;

varying vec3 vColor;

void main(){
        // Position
    vec4 modelPosition = modelMatrix * vec4(position,1.0);


// Animating the Galaxy
// Angle of particles 
float angle = atan(modelPosition.x, modelPosition.z);
// Distance from Center of the Particles 
float distanceToCenter = length(modelPosition.xz);
// Incrementing the angle to move the particles & create Spin
float angleOffset = (1.0/distanceToCenter * uTime *0.2);
// Updating the Angle 
angle += angleOffset;

// Positioning Particles on the Circle after Knowing angle & Distance from Center
modelPosition.x = cos(angle) * distanceToCenter;
modelPosition.z = sin(angle) * distanceToCenter;


// Adding Randomness after SPIN only
modelPosition.xyz += aRandomness;

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;
    gl_Position = projectedPosition;

    // Size (Fixes Blank Screen)
    gl_PointSize = uSize * aScale;
    gl_PointSize *= (1.0 / - viewPosition.z);
    vColor = color;
    }
