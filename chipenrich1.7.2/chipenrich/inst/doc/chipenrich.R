### R code from vignette source 'chipenrich.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: chipenrich.Rnw:22-23
###################################################
options(width=60)


###################################################
### code chunk number 2: chipenrich_kegg_mappa
###################################################
library(chipenrich)
library(chipenrich.data)


###################################################
### code chunk number 3: load_peaks
###################################################
data(peaks_E2F4)
data(peaks_H3K4me3_GM12878)


###################################################
### code chunk number 4: head_peaks
###################################################
data(peaks_E2F4)
head(peaks_E2F4)


###################################################
### code chunk number 5: list_genomes
###################################################
supported_genomes()


###################################################
### code chunk number 6: list_locusdefs
###################################################
supported_locusdefs()


###################################################
### code chunk number 7: list_genesets
###################################################
supported_genesets()


###################################################
### code chunk number 8: list_methods
###################################################
supported_methods()


###################################################
### code chunk number 9: list_mappas
###################################################
supported_read_lengths()


###################################################
### code chunk number 10: fig1
###################################################
plot_dist_to_tss(peaks = peaks_E2F4, genome = 'hg19')


###################################################
### code chunk number 11: fig2
###################################################
plot_spline_length(peaks = peaks_E2F4, locusdef = 'nearest_tss', genome = 'hg19')


###################################################
### code chunk number 12: fig3
###################################################
plot_spline_length(peaks = peaks_E2F4, locusdef = 'nearest_tss',  genome = 'hg19', use_mappability = T, read_length = 24)


###################################################
### code chunk number 13: fig4
###################################################
plot_gene_coverage(peaks = peaks_H3K4me3_GM12878, locusdef = 'nearest_tss',  genome = 'hg19')


###################################################
### code chunk number 14: chipenrich
###################################################
results = chipenrich(peaks = peaks_E2F4, genesets = "biocarta_pathway",
	locusdef = "nearest_tss", max_geneset_size = 100, qc_plots = F,
	out_name = NULL,n_cores=2)
results.ce = results$results[order(results$results$P.value),]
results.ce[1:5,1:5]


###################################################
### code chunk number 15: chipenrich_with_mappa
###################################################
results = chipenrich(peaks = peaks_E2F4,genesets = "biocarta_pathway",
	locusdef = "nearest_tss", max_geneset_size = 100, use_mappability=T,
	read_length=24, qc_plots = F, out_name = NULL,n_cores=2)
results.cem = results$results[order(results$results$P.value),]
results.cem[1:5,1:5]


###################################################
### code chunk number 16: chipenrich
###################################################
results = chipenrich(peaks = peaks_H3K4me3_GM12878, genesets = "biocarta_pathway",
	method='broadenrich', locusdef = "nearest_tss", max_geneset_size = 100,
	qc_plots = F, out_name = NULL,n_cores=2)
results.be = results$results[order(results$results$P.value),]
results.be[1:5,1:5]


###################################################
### code chunk number 17: chipenrich_fisher
###################################################
results = chipenrich(peaks = peaks_E2F4, genesets = c("kegg_pathway"),
	locusdef = "5kb", method = "fet", fisher_alt = "two.sided",
	max_geneset_size = 100, qc_plots = F, out_name = NULL)
results.fet = results$results[order(results$results$P.value),]
results.fet[1:5,1:5]


###################################################
### code chunk number 18: show_peaks
###################################################
peaks_to_genes = results$peaks
head(peaks_to_genes)


###################################################
### code chunk number 19: show_results_colnames
###################################################
colnames(results$results)


