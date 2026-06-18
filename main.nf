#!/usr/bin/env nextflow

nextflow.enable.dsl=2

// Include subworkflow
include { SAY_HELLO } from './modules/say_hello'

params.input_text = "Hello from VWB"
params.outdir     = "results"

workflow {
    SAY_HELLO(params.input_text)
}
