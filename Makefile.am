VERSION=0.1.0
LANG1=hbs
LANG1a=hbs_BS
LANG1b=hbs_HR
LANG1c=hbs_SR
LANG2=mkd
VAR1=ijek
VAR2=ek
PREFIX1=$(LANG1)-$(LANG2)
PREFIX2=$(LANG2)-$(LANG1)
PREFIX2a=$(LANG2)-$(LANG1a)
PREFIX2b=$(LANG2)-$(LANG1b)
PREFIX2c=$(LANG2)-$(LANG1c)

BASENAME=apertium-$(PREFIX1)

TARGETS_COMMON = $(BASENAME).$(LANG1a).dix  $(BASENAME).$(LANG1b).dix $(BASENAME).$(LANG1c).dix \
	$(PREFIX2a).autogen.bin $(PREFIX2b).autogen.bin $(PREFIX2c).autogen.bin \
	$(BASENAME).$(LANG1).dix $(PREFIX1).rlx.bin $(PREFIX2).rlx.bin \
	$(PREFIX1).automorf.bin $(PREFIX1).autobil.bin $(PREFIX1).autogen.bin \
	$(PREFIX2).automorf.bin $(PREFIX2).autobil.bin \
	$(PREFIX1).autolex.bin $(PREFIX2).autolex.bin \
	$(PREFIX1).t1x.bin $(PREFIX1).t2x.bin $(PREFIX1).t3x.bin \
	$(PREFIX2).t1x.bin $(PREFIX2).t2x.bin $(PREFIX2).t3x.bin \
	$(PREFIX1).autopgen.bin $(PREFIX2).autopgen.bin

#    $(PREFIX1).autopgen.bin $(PREFIX2).autopgen.bin 

$(BASENAME).$(LANG1a).dix: $(BASENAME).$(LANG1).metadix
	xsltproc --stringparam alt $(LANG1a) --stringparam var $(VAR1) alt.xsl $(BASENAME).$(LANG1).metadix >$@

$(PREFIX2a).autogen.bin: $(BASENAME).$(LANG1a).dix
	apertium-validate-dictionary $(BASENAME).$(LANG1a).dix
	lt-comp rl $(BASENAME).$(LANG1a).dix $@

$(BASENAME).$(LANG1b).dix: $(BASENAME).$(LANG1).metadix
	xsltproc --stringparam alt $(LANG1b) --stringparam var $(VAR1) alt.xsl $(BASENAME).$(LANG1).metadix >$@

$(PREFIX2b).autogen.bin: $(BASENAME).$(LANG1b).dix
	apertium-validate-dictionary $(BASENAME).$(LANG1b).dix
	lt-comp rl $(BASENAME).$(LANG1b).dix $@

$(BASENAME).$(LANG1c).dix: $(BASENAME).$(LANG1).metadix
	xsltproc --stringparam alt $(LANG1c) --stringparam var $(VAR2) alt.xsl $(BASENAME).$(LANG1).metadix >$@

$(PREFIX2c).autogen.bin: $(BASENAME).$(LANG1c).dix
	apertium-validate-dictionary $(BASENAME).$(LANG1c).dix
	lt-comp rl $(BASENAME).$(LANG1c).dix $@

$(BASENAME).$(LANG1).dix: $(BASENAME).$(LANG1).metadix
	xsltproc --stringparam alt $(LANG1) --stringparam var $(VAR1) alt.xsl $(BASENAME).$(LANG1).metadix >$@ 

$(PREFIX1).automorf.bin: $(BASENAME).$(LANG1).dix
	apertium-validate-dictionary $(BASENAME).$(LANG1).dix
	lt-comp lr $(BASENAME).$(LANG1).dix $@

$(PREFIX1).autobil.bin: $(BASENAME).$(PREFIX1).dix
	if [ ! -d .deps ]; then mkdir .deps; fi
	apertium-validate-dictionary $(BASENAME).$(PREFIX1).dix
	lt-comp lr $(BASENAME).$(PREFIX1).dix $@

$(PREFIX1).autogen.bin: $(BASENAME).$(LANG2).dix
	apertium-validate-dictionary $(BASENAME).$(LANG2).dix
	lt-comp rl $(BASENAME).$(LANG2).dix $@

$(PREFIX1).rlx.bin: $(BASENAME).$(PREFIX1).rlx
	cg-comp $(BASENAME).$(PREFIX1).rlx $@

$(PREFIX2).rlx.bin: $(BASENAME).$(PREFIX2).rlx
	cg-comp $(BASENAME).$(PREFIX2).rlx $@

$(PREFIX1).autolex.bin: $(BASENAME).$(PREFIX1).lrx
	lrx-comp $(BASENAME).$(PREFIX1).lrx $@

$(PREFIX2).autolex.bin: $(BASENAME).$(PREFIX2).lrx
	lrx-comp $(BASENAME).$(PREFIX2).lrx $@

$(PREFIX1).autopgen.bin: $(BASENAME).post-$(LANG2).dix
	apertium-validate-dictionary $(BASENAME).post-$(LANG2).dix
	lt-comp lr $(BASENAME).post-$(LANG2).dix $@

$(PREFIX1).translit.bin: $(BASENAME).translit.dix
#	apertium-validate-dictionary $(BASENAME).translit.dix
	lt-comp lr $(BASENAME).translit.dix $@

$(PREFIX2).automorf.bin: $(BASENAME).$(LANG2).dix

$(PREFIX2).translit.bin: $(BASENAME).translit.dix
#	apertium-validate-dictionary $(BASENAME).translit.dix
	lt-comp rl $(BASENAME).translit.dix $@

$(PREFIX2).automorf.bin: $(BASENAME).$(LANG2).dix
	apertium-validate-dictionary $(BASENAME).$(LANG2).dix
	lt-comp lr $(BASENAME).$(LANG2).dix $@

$(PREFIX2).autobil.bin: $(BASENAME).$(PREFIX1).dix
	if [ ! -d .deps ]; then mkdir .deps; fi
	apertium-validate-dictionary $(BASENAME).$(PREFIX1).dix
	lt-comp rl $(BASENAME).$(PREFIX1).dix $@

#$(PREFIX2).autogen.bin: $(BASENAME).$(LANG1).dix
#	apertium-validate-dictionary $(BASENAME).$(LANG1).dix
#	lt-comp rl $(BASENAME).$(LANG1).dix $@

$(PREFIX2).autopgen.bin: $(BASENAME).post-$(LANG1).dix
	apertium-validate-dictionary $(BASENAME).post-$(LANG1).dix
	lt-comp lr $(BASENAME).post-$(LANG1).dix $@

#
#	TRANSFER
#

$(PREFIX1).t1x.bin: $(BASENAME).$(PREFIX1).t1x
	apertium-validate-transfer $(BASENAME).$(PREFIX1).t1x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX1).t1x $@

$(PREFIX1).t2x.bin: $(BASENAME).$(PREFIX1).t2x
	apertium-validate-interchunk $(BASENAME).$(PREFIX1).t2x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX1).t2x $@

$(PREFIX1).t3x.bin: $(BASENAME).$(PREFIX1).t3x
	apertium-validate-postchunk $(BASENAME).$(PREFIX1).t3x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX1).t3x $@

$(PREFIX2).t1x.bin: $(BASENAME).$(PREFIX2).t1x
	apertium-validate-transfer $(BASENAME).$(PREFIX2).t1x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX2).t1x $@

$(PREFIX2).t2x.bin: $(BASENAME).$(PREFIX2).t2x
	apertium-validate-interchunk $(BASENAME).$(PREFIX2).t2x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX2).t2x $@

$(PREFIX2).t3x.bin: $(BASENAME).$(PREFIX2).t3x
	apertium-validate-postchunk $(BASENAME).$(PREFIX2).t3x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX2).t3x $@


EXTRA_DIST=$(BASENAME).$(LANG1).dix $(BASENAME).$(PREFIX1).dix \
           $(BASENAME).$(LANG2).dix $(BASENAME).$(LANG1).tsx \
           $(BASENAME).$(LANG2).tsx  \
           $(PREFIX1).prob $(PREFIX2).prob \
           $(BASENAME).$(PREFIX1).t1x $(BASENAME).$(PREFIX1).t2x \
           $(BASENAME).$(PREFIX1).t3x $(BASENAME).$(PREFIX2).t1x \
           $(BASENAME).$(PREFIX2).t2x $(BASENAME).$(PREFIX2).t3x \
           modes.xml

#           $(LANG1)-tagger-data/README $(LANG2)-tagger-data/README 
#           $(BASENAME).post-$(LANG1).dix $(BASENAME).post-$(LANG2).dix 

modes/$(PREFIX1).mode: modes.xml
	apertium-validate-modes modes.xml
	apertium-gen-modes modes.xml
	cp *.mode modes/

# All modes are created by the same goal, listing several will just give problems with make -j2
noinst_DATA=modes/$(PREFIX1).mode

apertium_modesdir=$(prefix)/share/apertium/modes/
apertium_hbs_mkddir=$(prefix)/share/apertium/apertium-$(PREFIX1)/
apertium_hbs_mkd_DATA=$(PREFIX1).automorf.bin $(PREFIX2).automorf.bin \
		    $(PREFIX2a).autogen.bin $(PREFIX2b).autogen.bin $(PREFIX2c).autogen.bin \
                    $(PREFIX1).autobil.bin $(PREFIX2).autobil.bin \
                    $(PREFIX1).autogen.bin \
                    $(PREFIX1).rlx.bin \
                    $(PREFIX2).rlx.bin \
                    $(PREFIX1).autolex.bin \
                    $(PREFIX2).autolex.bin \
                    $(PREFIX1).prob $(PREFIX2).prob \
		    $(PREFIX1).t1x.bin $(PREFIX1).t2x.bin $(PREFIX1).t3x.bin \
		    $(PREFIX2).t1x.bin $(PREFIX2).t2x.bin $(PREFIX2).t3x.bin \
		    $(BASENAME).$(PREFIX1).t1x $(BASENAME).$(PREFIX1).t2x $(BASENAME).$(PREFIX1).t3x\
		    $(BASENAME).$(PREFIX2).t1x $(BASENAME).$(PREFIX2).t2x $(BASENAME).$(PREFIX2).t3x\
		    $(PREFIX1).autopgen.bin \
		    $(PREFIX2).autopgen.bin \
		    $(PREFIX1).translit.bin $(PREFIX2).translit.bin

#                    $(PREFIX1).autopgen.bin 
 #                   $(PREFIX2).autopgen.bin 
# 		     $(PREFIX2).autogen.bin 

install-data-local:
	mv modes modes.bak
	apertium-gen-modes modes.xml apertium-$(PREFIX1)
	rm -rf modes
	mv modes.bak modes
	test -d $(DESTDIR)$(apertium_modesdir) || mkdir $(DESTDIR)$(apertium_modesdir)
	$(INSTALL_DATA) $(PREFIX1).mode $(DESTDIR)$(apertium_modesdir)
	$(INSTALL_DATA) $(PREFIX2a).mode $(DESTDIR)$(apertium_modesdir)
	$(INSTALL_DATA) $(PREFIX2b).mode $(DESTDIR)$(apertium_modesdir)
	$(INSTALL_DATA) $(PREFIX2c).mode $(DESTDIR)$(apertium_modesdir)
	$(INSTALL_DATA) $(BASENAME).$(PREFIX1).t1x $(BASENAME).$(PREFIX2).t1x $(DESTDIR)$(apertium_hbs_mkddir)
	$(INSTALL_DATA) $(BASENAME).$(PREFIX1).t2x $(BASENAME).$(PREFIX2).t2x $(DESTDIR)$(apertium_hbs_mkddir)
	$(INSTALL_DATA) $(BASENAME).$(PREFIX1).t3x $(BASENAME).$(PREFIX2).t3x $(DESTDIR)$(apertium_hbs_mkddir)

CLEANFILES = -r $(TARGETS_COMMON) 
