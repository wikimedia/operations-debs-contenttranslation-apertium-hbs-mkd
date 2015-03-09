INPUT=/tmp/sh-mk.gentest.transfer
DEV=bidix/

echo "SECTION

SELECT (inf);
SELECT (vblex);" > /tmp/temp_cg ;

cg-comp /tmp/temp_cg /tmp/temp_cg.bin ;

cat $INPUT | grep '<v' | grep '@' | cut -f2 -d'@' | cut -f1 -d'<' | lt-proc -w $DEV/../../sh-mk.automorf.bin | cg-proc /tmp/temp_cg.bin  | cut -f2- -d'/' | sed 's/<pres><p3><sg>//g' | grep '<v' | cut -f1 -d'$' | sort -f | uniq -c | sort -gr  | grep -v '[0-9] $' > $DEV/pending_verbs.txt

cat $INPUT | grep '@' | grep '<adv>' | grep -v '<v' | bash ~/scripts/lowercase.sh  | sort -f | sed 's/^\W*\^/^/g' | sort -f | uniq -c | sort -gr  | grep -v '[0-9] $' > $DEV/pending_adverbs.txt

cat $INPUT | grep '@' | grep '<pr>' | grep -v '<v' | bash ~/scripts/lowercase.sh  | sort -f | sed 's/^\W*\^/^/g' | sort -f | uniq -c | sort -gr  | grep -v '[0-9] $'  > $DEV/pending_prepositions.txt

cat $INPUT | grep '@' | grep '<adj>'  | sed 's/<\(f\|mi\|ma\|nt\|du\|m\|sg\|pl\|acc\|nom\|ins\|loc\|gen\|dat\|voc\)>//g' | sed 's/<\(ind\|def\)>//g' | bash ~/scripts/lowercase.sh  | sed 's/[ανρχί]/\n/g' | sed 's/^\W*\^/^/g' | sort -f | uniq -c  | sort -gr  | grep -v '[0-9] $' | grep '<adj>' | grep '@' > $DEV/pending_adjectives.txt

cat $INPUT | grep '@' | grep '<n>'  | sed 's/\(<pl>\|<du>\|<sg>\|<ins>\|<acc>\|<dat>\|<loc>\|<gen>\|<dir>\|<nom>\|<abl>\|<abs>\|<1s>\|<2s>\|<3s>\|<1p>\|<2p>\|<3p>\|<p1s>\|<p2s>\|<p3s>\|<p1p>\|<p2p>\|<p3p>\)//g' | sed 's/<pl>//g' | bash ~/scripts/lowercase.sh  | sed 's/^\W*\^/^/g' | sort -f | uniq -c  | sort -gr  | grep -v '[0-9] $'  > $DEV/pending_nouns.txt

cat $INPUT | grep '@' | grep '<prn>'  | sed 's/\(<pl>\|<du>\|<sg>\|<ins>\|<acc>\|<dat>\|<loc>\|<gen>\|<dir>\|<nom>\|<abl>\|<abs>\|<1s>\|<2s>\|<3s>\|<1p>\|<2p>\|<3p>\|<p1s>\|<p2s>\|<p3s>\|<p1p>\|<p2p>\|<p3p>\)//g' | sed 's/<pl>//g' | bash ~/scripts/lowercase.sh  | sed 's/^\W*\^/^/g' | sort -f | uniq -c  | sort -gr  | grep -v '[0-9] $'  > $DEV/pending_pronouns.txt

cat $INPUT | grep '@' | grep '<num>'  | sed 's/<sg>//g' | sed 's/<pl>//g' | bash ~/scripts/lowercase.sh  | sed 's/^\W*\^/^/g' | sort -f | uniq -c  | sort -gr  | grep -v '[0-9] $' > $DEV/pending_numerals.txt

cat $INPUT | grep '@' | grep '<np>'  | sed 's/\(<sg>\|<ins>\|<acc>\|<dat>\|<loc>\|<gen>\|<dir>\|<nom>\|<abl>\|<abs>\|<1s>\|<2s>\|<3s>\|<1p>\|<2p>\|<3p>\|<p1s>\|<p2s>\|<p3s>\|<p1p>\|<p2p>\|<p3p>\)//g' | sed 's/<pl>//g' | sed 's/^\W*\^/^/g' | sort -f | uniq -c  | sort -gr  | grep -v '[0-9] $' > $DEV/pending_proper_nouns.txt

cat $INPUT | grep '@' | grep '<cnj'  | sed 's/<sg>//g' | sed 's/<pl>//g' | bash ~/scripts/lowercase.sh | sed 's/^\W*\^/^/g' | sort -f | uniq -c  | sort -gr  | grep -v '[0-9] $' > $DEV/pending_conjunctions.txt

cat $INPUT | grep '@' | grep '<det>'  | sed 's/<sg>//g' | sed 's/<pl>//g' | sed 's/^\W*\^/^/g' | sort -f | uniq -c  | sort -gr  | grep -v '[0-9] $' > $DEV/pending_determiners.txt

cat bilingual-summary.txt

echo ""

wc -l $DEV/pending_* | sort -gr  > bilingual-summary.txt

cat bilingual-summary.txt
