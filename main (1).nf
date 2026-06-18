#!/usr/bin/env nextflow

nextflow.enable.dsl=2

// Parameters defined in nextflow_schema.json
params.input       = null
params.outdir      = "results"
params.input_text  = "Hello from VWB"
params.max_cpus    = 4
params.max_memory  = "8.GB"
params.max_time    = "2.h"
params.debug_mode  = false
params.sample_ids  = []

process SAY_HELLO {
    publishDir params.outdir, mode: 'copy'

    input:
    val message

    output:
    path "hello_output.txt"

    script:
    """
    echo "${message}" > hello_output.txt
    echo "Run timestamp: \$(date)" >> hello_output.txt
    echo "Input: ${params.input}" >> hello_output.txt
    echo "Debug mode: ${params.debug_mode}" >> hello_output.txt
    """
}

workflow {
    SAY_HELLO(params.input_text)
}
