#!/usr/bin/env nextflow

nextflow.enable.dsl=2

process SAY_HELLO {
    publishDir params.outdir, mode: 'copy'

    input:
    val message

    output:
    path "hello_output.txt"

    script:
    """
    bash ${projectDir}/bin/helper.sh "${message}" > hello_output.txt
    """
}
