#!/bin/bash
THREADS=(1 2 4 8 16 20)
PROCESSES=(1 2 4 8 16)
OUTPUT_FILE="benchmark_results.csv"

echo "Threads,Processes,Runtime" > $OUTPUT_FILE

for t in "${THREADS[@]}"; do
    for p in "${PROCESSES[@]}"; do
        echo "Running test: Threads=$t, Processes=$p"
        START=$(date +%s)
        
        # Run the command and log errors/output to debug
        ./mandelmovie -p $p -t $t > /dev/null 2>error_log.txt
        
        END=$(date +%s)
        RUNTIME=$((END - START))
        echo "$t,$p,$RUNTIME" >> $OUTPUT_FILE
        echo "Completed: Threads=$t, Processes=$p, Runtime=${RUNTIME}s"
    done
done
