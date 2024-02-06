rm -rf hav
mkdir hav
/opt/vadr/infernal/binaries/esl-reformat --informat afa  stockholm hav/hav.vadr.fa > hav/hav.vadr.stk
/opt/vadr/infernal/binaries/esl-reformat --informat fasta -d -u fasta hav/hav.vadr.fa > hav/hav.vadr.fa.tmp
/opt/vadr/ncbi-blast/bin/makeblastdb -in hav/hav.vadr.fa -dbtype nucl > /dev/null
rm hav/hav.vadr.fa.tmp
rm hav/hav.vadr.fa.tmp.ssi
/opt/vadr/infernal/binaries/esl-sfetch --index hav/hav.vadr.fa > /dev/null
/opt/vadr/infernal/binaries/esl-translate  -M -l 3 --watson hav/hav.vadr.cds.fa > hav/hav.vadr.cds.esl-translate.1.fa
rm hav/hav.vadr.cds.esl-translate.1.fa
rm hav/hav.vadr.cds.esl-translate.2.fa
rm hav/hav.vadr.cds.esl-translate.2.fa.ssi
/opt/vadr/ncbi-blast/bin/makeblastdb -in hav/hav.vadr.protein.fa -dbtype prot > /dev/null
/opt/vadr/infernal/binaries/esl-sfetch hav/hav.vadr.protein.fa NC_001489.1/735..7418:+ | /opt/vadr/infernal/binaries/hmmbuild -n NC_001489/735..7418:+ --informat afa hav/hav.vadr.1.hmm - > hav/hav.vadr.1.hmmbuild
/opt/vadr/infernal/binaries/esl-sfetch hav/hav.vadr.protein.fa NC_001489.1/741..7418:+ | /opt/vadr/infernal/binaries/hmmbuild -n NC_001489/741..7418:+ --informat afa hav/hav.vadr.2.hmm - > hav/hav.vadr.2.hmmbuild
cat hav/hav.vadr.1.hmm hav/hav.vadr.2.hmm > hav/hav.vadr.protein.hmm
rm  hav/hav.vadr.1.hmm hav/hav.vadr.2.hmm
cat hav/hav.vadr.1.hmmbuild hav/hav.vadr.2.hmmbuild > hav/hav.vadr.protein.hmmbuild
rm  hav/hav.vadr.1.hmmbuild hav/hav.vadr.2.hmmbuild
/opt/vadr/infernal/binaries/hmmpress hav/hav.vadr.protein.hmm > hav/hav.vadr.hmmpress
/opt/vadr/infernal/binaries/cmbuild -n NC_001489 --verbose  --noss --noh3pri hav/hav.vadr.cm hav/hav.vadr.stk > hav/hav.vadr.cmbuild
/opt/vadr/infernal/binaries/cmpress hav/hav.vadr.cm > hav/hav.vadr.cmpress
# Tue Feb  6 17:07:47 UTC 2024
# Linux fa1a86ad0f54 5.4.0-1106-gcp #115~18.04.1-Ubuntu SMP Mon May 22 20:46:39 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
[ok]
