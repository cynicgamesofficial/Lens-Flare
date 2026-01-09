# Lens-Flare
Cynic Games Lens Flare - Post-Processing Shader

A highly customizable post-processing shader mod that adds realistic, cinema-quality lens flare effects to GZDoom, UZDoom, and LZDoom. Transform your gameplay experience with dynamic optical artifacts that react to bright light sources in real-time.
Overview
This mod introduces a sophisticated lens flare system that simulates the optical imperfections and light scattering that occurs when bright light hits a camera lens. Instead of the simple bloom effects found in vanilla engines, you get layered, multi-colored flare elements with chromatic aberration for a truly cinematic look.

Key Features
Multi-Element Flare System
The shader generates lens flares using six independent flare elements, each fully customizable:

Element 0 (Warm) - Warm-toned primary flare with orange/yellow hues
Element 1 (Cool Blue) - Cool blue secondary reflections
Element 2 (Pink) - Soft pink/magenta ghost elements
Element 3 (Cyan) - Bright cyan accents
Element 4 (Yellow Zoom Out) - Large yellow halo with reverse scaling
Element 5 (Purple) - Purple/violet scattered light
Each element can be individually adjusted for size, intensity, color tint, and scaling behavior, giving you complete artistic control over the final look.

Chromatic Aberration
Adds realistic color fringing around bright light sources, simulating how real lenses separate light into its component wavelengths. The effect grows stronger toward screen edges, just like physical optics.

Performance-Conscious Design
Adjustable sample count (4-32 samples per element) lets you balance quality vs. performance
Intelligent brightness threshold system only processes pixels bright enough to create flares
Optimized shader code runs smoothly even on moderate hardware
Fully Configurable
Every aspect is controllable through an in-game menu:

Overall effect intensity and brightness threshold
Per-element size, scale direction, intensity, and RGB tint
Chromatic aberration strength and blend amount
Sample quality and distance parameters
Technical Highlights
GLSL Fragment Shader - Hardware-accelerated post-processing
Real-time Processing - Responds dynamically to all in-game lighting
ZScript Integration - Seamless GZDoom engine integration with live CVar updates
Non-Destructive - Can be toggled on/off at any time without affecting save games
Perfect For
Atmospheric horror mods seeking that found-footage camera aesthetic
Sci-fi total conversions wanting futuristic HUD camera effects
Cinematic gameplay videos and screenshots
Anyone who wants their classic Doom experience to look like a modern AAA title
Compatibility
Works with GZDoom, UZDoom, and LZDoom on any hardware that supports OpenGL 3.3+ shaders. No conflicts with other gameplay mods - this is purely a visual enhancement.
