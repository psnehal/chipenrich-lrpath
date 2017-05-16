
ld = locusdef.hg19.nearest_tss@dframe #this is dataframe of our locusdef in the package

newld = read.table("knowngenes_mm9_10kb_locusdef.txt",sep="\t",
	header=T,stringsAsFactor=F) #user input locusdef

	#test if geneids match
sum(newld$geneid %in% ld$geneid)
	#report which ones don't match
newld$geneid[!newld$geneid %in% ld$geneid]

chr.ranges = read.table("rangeCheckForHuman.txt", header=F, 
	sep="\t",stringsAsFactor=F,col.names=c("chrom","start","end")) #ranges for each chromosome

	#turn chr.ranges and newld in GRanges objects
chr.gr = GRanges(seqnames= Rle(chr.ranges$chrom),
	ranges = IRanges(start = chr.ranges$start, end = chr.ranges$end),
	names = 1:nrow(chr.ranges))

newld.gr = GRanges(seqnames= Rle(newld$chrom),
	ranges = IRanges(start = newld$start, end = newld$end),
	names = 1:nrow(newld))

newld$in.chr.range = newld.gr %in% chr.gr

