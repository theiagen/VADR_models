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
/opt/vadr/infernal/binaries/esl-sfetch hav/hav.vadr.protein.fa M59809.1/718..7398:+ | /opt/vadr/hmmer/binaries/hmmbuild -n M59809/718..7398:+ --informat afa hav/hav.vadr.1.hmm - > hav/hav.vadr.1.hmmbuild
cat hav/hav.vadr.1.hmm > hav/hav.vadr.protein.hmm
rm  hav/hav.vadr.1.hmm
cat hav/hav.vadr.1.hmmbuild > hav/hav.vadr.protein.hmmbuild
rm  hav/hav.vadr.1.hmmbuild
/opt/vadr/hmmer/binaries/hmmpress hav/hav.vadr.protein.hmm > hav/hav.vadr.hmmpress
/opt/vadr/infernal/binaries/cmbuild -n M59809 --verbose --occfile hav/hav.vadr.cmbuild.occ --cp9occfile hav/hav.vadr.cmbuild.cp9occ --fp7occfile hav/hav.vadr.cmbuild.fp7occ  --noss hav/hav.vadr.cm hav/hav.vadr.stk > hav/hav.vadr.cmbuild
/opt/vadr/infernal/binaries/cmpress hav/hav.vadr.cm > hav/hav.vadr.cmpress
# Mon Feb  5 12:32:48 UTC 2024
# Linux 36379efc9cd3 5.4.0-1106-gcp #115~18.04.1-Ubuntu SMP Mon May 22 20:46:39 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
[ok]
