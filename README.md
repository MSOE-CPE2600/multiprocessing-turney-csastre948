# Lab 12: Multithreading Mandelbrot

## Overview
This lab enhances the previous implementation of the Mandelbrot set generation by introducing multithreading. The program now supports configurable thread counts (`-t`) alongside the existing multiprocessing capabilities (`-p`). The goal was to benchmark the performance of varying thread and process combinations to evaluate the efficiency of multithreading and multiprocessing.

## Benchmark Results
The following table shows the runtime (in seconds) for generating 50 frames of the Mandelbrot set with varying thread and process counts:

| Threads \ Processes | 1         | 2         | 4         | 8         | 16        | 20        |
|---------------------|-----------|-----------|-----------|-----------|-----------|-----------|
| 1                   | 70.834    | 47.806    | 42.538    | 20.939    | 13.941    | 11.290    |
| 2                   | 24.294    | 21.353    | 16.496    | 11.207    | 7.903     | 6.885     |
| 4                   | 14.495    | 12.158    | 9.151     | 6.867     | 6.429     | 5.906     |
| 8                   | 10.047    | 8.686     | 6.324     | 7.650     | 7.620     | 7.479     |
| 16                  | 6.819     | 5.412     | 5.357     | 5.216     | 7.379     | 6.578     |
| 20                  | 8.318     | 8.170     | 7.552     | 7.337     | 8.333     | 7.080     |

## Discussion

### Impact of Threads and Processes
- Increasing thread and process counts significantly reduces runtime, especially at lower configurations. 
  For example:
  - **1 thread and 1 process:** `70.834s`
  - **2 threads and 2 processes:** `21.353s`
- However, diminishing returns are observed at higher counts (e.g., **20 threads and 20 processes**).

### Optimal Configuration
- The optimal runtime was achieved with **4 threads and 20 processes**, resulting in a runtime of `5.906s`.
- This configuration balances computational load across threads and processes without overwhelming system resources.

### Unexpected Results
- At very high thread counts (e.g., **20 threads**) combined with high process counts, runtime increases slightly due to:
  - Thread scheduling overhead.
  - CPU core limitations on the system.

### Key Observations
- Processes generally have a larger impact on reducing runtime initially.
- Threads provide additional optimization when used in conjunction with multiple processes.

## How to Run

### Compile the Programs
Run the following commands to compile the programs:
```bash
gcc -o mandel mandel.c jpegrw.c -lpthread -ljpeg
gcc -o mandelmovie mandelmovie.c -lpthread
