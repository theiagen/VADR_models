# Theiagen Genomics VADR Models

[VADR](https://github.com/ncbi/vadr) is a suite of tools for classifying and analyzing sequences homologous to a set of reference models of viral genomes or gene families.

VADR works with two main scripts: `v-build.pl` stores the RefSeq feature annotation in the model, and `v-annotate.pl` maps that annotation (e.g. CDS coordinates) onto the sequences it annotates. VADR's `v-build.pl` is used to create VADR models from [NCBI RefSeq](https://www.ncbi.nlm.nih.gov/refseq/) sequences, potentially with secondary structure annotation.

## Custom VADR Models

### HAV

The custom HAV VADR model was constructed with RefSeq sequence [NC_001489](https://www.ncbi.nlm.nih.gov/nuccore/NC_001489.1). The command used was the following

`v-build.pl -f --group HAV --subgroup IA  NC_001489 hav`

VADR, version 1.6.3, was executed with the container `us-docker.pkg.dev/general-theiagen/staphb/vadr:1.6.3`

Further details:
- reference sequence assembly: NC_001489
- version number of assembly: 1
- source of assembly: RefSeq
- URL where assembly was downloaded: https://www.ncbi.nlm.nih.gov/nuccore/NC_001489.1
- date of access and download of assembly: February 6th, 2024
- details of any modifications made to assembly: None performed

## Contact

For any inquiries please contact us at support@theiagen.com. 
