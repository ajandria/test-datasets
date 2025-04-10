d <- getGEO(file='GSE43976_series_matrix.txt', GSEMatrix = TRUE)
d2 <- pData(phenoData(d))
d3 <- d2 %>% select(sample_id=geo_accession, group=`sample_group:ch1`, pheno_sex=`gender:ch1`, pheno_age=`age_sampling:ch1`,pheno_smokeFreeYears=characteristics_ch1.11)
d3$group[is.na(d3$group)] <- "NORMAL"
d3$pheno_age[is.na(d3$pheno_age)] <- 50
d3$pheno_smokeFreeYears <- gsub("smoke_free_years: ", "", as.character(d3$pheno_smokeFreeYears))
d3$pheno_smokeFreeYears[is.na(d3$pheno_smokeFreeYears) | d3$pheno_smokeFreeYears == ""] <- "0"
d3$pheno_smokeFreeYears <- as.integer(d3$pheno_smokeFreeYears)
