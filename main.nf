#!/usr/bin/env nextflow

nextflow.enable.dsl=2

params.input_text = "Hello from VWB Nextflow test"
params.output_dir = "results"

process SAY_HELLO {
    publishDir params.output_dir, mode: 'copy'

    input:
    val message

    output:
    path "hello_output.txt"

    script:
    """
    echo "${message}" > hello_output.txt
    echo "Run timestamp: \$(date)" >> hello_output.txt
    """
}

workflow {
    SAY_HELLO(params.input_text)
}
