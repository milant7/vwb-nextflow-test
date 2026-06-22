#!/usr/bin/env nextflow

nextflow.enable.dsl=2

params.input_text = "Hello from VWB"
params.outdir     = "results"

// Include subworkflow
include { SAY_HELLO } from './modules/say_hello'

workflow {
    SAY_HELLO(params.input_text)
}
