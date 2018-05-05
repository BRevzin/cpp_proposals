define add_paper
PAPERS += $(1)

$(1) : $(2) ./md/barry_md.py ./md/style.html
	python ./md/barry_md.py "$$<" "$$@" --style ./md/style.html			
endef

define add_better_paper
PAPERS += $(1)

$(1) : $(2) ./md/better_md.py ./md/style.html
	python ./md/better_md.py -i "$$<" -o "$$@" --references
endef

$(eval $(call add_paper,0847r1_deducing_this.html,./md/deducing-this.md))
$(eval $(call add_better_paper,1061r0_sb_pack.html,./md/sb-extensions.md))

all : $(PAPERS)
.DEFAULT_GOAL := all

.PHONY: clean
clean:
	rm -f $(PAPERS)
