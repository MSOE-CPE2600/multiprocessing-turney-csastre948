# Mandelbrot Fractal Generator

## Overview
This program generates Mandelbrot fractals and saves the output as an image in `.jpg` format. The Mandelbrot set is computed based on user-provided parameters such as the center coordinates, scale, resolution, and maximum iterations. It supports customization through command-line arguments.

The program leverages parallel processing to generate multiple images efficiently, allowing for high-resolution and zoomed-in fractals.

---

## Features
- Generate Mandelbrot fractal images.
- Save images in `.jpg` format.
- Support for parallel processing with multiple child processes.
- Adjustable:
  - Center coordinates (`-x`, `-y`)
  - Scale (`-s`)
  - Image resolution (`-W`, `-H`)
  - Maximum iterations (`-m`)
  - Output file name (`-o`)

---

## How to Compile
To compile the program:
```bash
gcc -o mandel mandel.c jpegrw.c -lm
# System Programming Lab 11 Multiprocessing
