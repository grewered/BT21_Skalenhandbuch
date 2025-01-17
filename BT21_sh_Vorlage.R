
### ----setup (von BT18, ProSach) ----------------------------------------------
#knitr::purl("c:/Repositories/Packages/eatCodebook/vignettes/minimal_example.Rmd")
#setwd("P:/Methoden/99_Arbeitsordner/ProSach_SHB/Erstellung SHB")

#install.packages("devtools")
#install.packages("tidyverse")
#remotes::install_github("beckerbenj/eatGADS", build_vignettes = TRUE)
#remotes::install_github("beckerbenj/eatCodebook")
#remotes::install_github("beckerbenj/eatAnalysis")

# documentation
#vignette("minimal_example", package = "eatCodebook")
#vignette("full_workflow", package = "eatCodebook")

library(eatCodebook)
library(eatGADS)

### 1. Datensätze laden --------------------------------------------------------

# mit readRDS() oder import_spss()

datenliste <- list() # Liste aller eingelesenen Datensätze


### 2. Kennwertdatensätze (InputForDescriptives) -------------------------------

# Beispieldatensatz ---------------

## Kennwerte erstellen ##
#descriptives_slfb <-  createInputForDescriptives(GADSdat = daten_slfb, nCatsForOrdinal = 4) 

## ggf. in Excel speichern zum überprüfen und bearbeiten ## 
#eatAnalysis::write_xlsx(df_list = list(Schulleiter = descriptives_slfb), row.names = FALSE,
#                        filePath = "Q:/BT2018/BT/90_Skalenhandbuch/07_SH_Erstellung/descriptives_SL.xlsx")

# Datensatz händisch bearbeiten -----------------

## bearbeiteten Datensatz wieder einlesen ##
#descriptives_slfb_b <- getInputForDescriptives("Q:/BT2018/BT/90_Skalenhandbuch/07_SH_Erstellung/descriptives_SL_bearbeitet.xlsx")

## ggf. Skalenkonsistenz checken (bei BT18 nur bei lfb und sus) ##
#check_scale_lfb_allg <- checkScaleConsistency(daten_lfb_allg, descriptives_lfb_allg_b, "IDTEACH")

## Kennwerte berechnen und in eigenem Objekt speichern ##
#kennwerte_slfb <- calculateDescriptives(GADSdat = daten_slfb, inputForDescriptives = descriptives_slfb_b, showCallOnly = FALSE)

# ---------------------------------

# neue Kennwertedatensätze in Listen speichern -------

kennwerte <- list() # Kennwerte aus calculateDescriptives()

input_descriptives <- list() # bearbeiteten Input aus der erstellten Excel

## Listen jeweils als RDS Dateien speichern ## 
#saveRDS(kennwerte, "Q:/BT2018/BT/90_Skalenhandbuch/07_SH_Erstellung/kennwerte.RDS")
#saveRDS(input_descriptives, "Q:/BT2018/BT/90_Skalenhandbuch/07_SH_Erstellung/input_descriptives.RDS")

## und wieder neu laden ##
#kennwerte <- readRDS("Q:/BT2018/BT/90_Skalenhandbuch/07_SH_Erstellung/kennwerte.RDS")
#input_descriptives <- readRDS("Q:/BT2018/BT/90_Skalenhandbuch/07_SH_Erstellung/input_descriptives.RDS")


### 3. Missingsobjekt erstellen ------------------------------------------------

# missings Objekt erstellen und in Excel speichern. idR keine Bearbeitung.

missings <- createMissings(datenliste, input_descriptives)

#eatAnalysis::write_xlsx(df_list = missings, row.names = FALSE,
#                        filePath = "Q:/BT2018/BT/90_Skalenhandbuch/07_SH_Erstellung/missings.xlsx")

# missings <- getMissings("Q:/BT2018/BT/90_Skalenhandbuch/07_SH_Erstellung/missings.xlsx")



### 4. Skalen erstellen --------------------------------------------------------

# SkalenInfo Objekt erstellen und in Excel speichern. idR keine Bearbeitung.

skalen <- createScaleInfo(input_descriptives)

#eatAnalysis::write_xlsx(df_list = skalen, row.names = FALSE,
#                        filePath = "Q:/BT2018/BT/90_Skalenhandbuch/07_SH_Erstellung/skalen.xlsx")

#skalen <- getScaleInfo("Q:/BT2018/BT/90_Skalenhandbuch/07_SH_Erstellung/skalen.xlsx")


### 5. Abkürzungsverzeichnis (abbr) --------------------------------------------

# Abbr_Liste erstellen und in Excel speichern. ggf. bearbeiten.
# kann idR von anderen BTs übernommen werden.

abbr_list <- createAbbrList()

#eatAnalysis::write_xlsx(df_list = abbr_list, row.names = FALSE,
#                        filePath = "Q:/BT2018/BT/90_Skalenhandbuch/07_SH_Erstellung/abkuerzung.xlsx")

# abb_list händisch bearbeiten -----------------

# abbr_list <- makeAbbrList("Q:/BT2018/BT/90_Skalenhandbuch/07_SH_Erstellung/abkuerzung_bearbeitet.xlsx")


### 6. varInfo -----------------------------------------------------------------

varinfo <- createVarInfo(datenliste, input_descriptives) # erstellt varinfo

# Layout (muss nicht jedes Mal ausgeführt werden) ---------
#varinfo <- inferLayout(varinfo, datenliste, input_descriptives)
# ---------------------

## varinfo speichern in Excel ##
#eatAnalysis::write_xlsx(df_list = varinfo, row.names = FALSE,
#                        filePath = "Q:/BT2018/BT/90_Skalenhandbuch/07_SH_Erstellung/varinfo.xlsx")

# varinfo händisch bearbeiten -----------------

## bearbeitete varinfo wieder einlesen ## 
# varinfo <- getVarInfo("Q:/BT2018/BT/90_Skalenhandbuch/07_SH_Erstellung/varinfo_bearbeitet.xlsx")


### 7. Gliederung --------------------------------------------------------------

gliederung <- createStructure(varinfo)

## gliederung speichern ## 
#eatAnalysis::write_xlsx(df_list = gliederung, row.names = FALSE,
#                        filePath = "Q:/BT2018/BT/90_Skalenhandbuch/07_SH_Erstellung/gliederung.xlsx")

# Gliederung händisch bearbeiten -----------------

## bearbeitete gliederung neu einlesen
# gliederung <- getStructure("Q:/BT2018/BT/90_Skalenhandbuch/07_SH_Erstellung/gliederung_bearbeitet.xlsx")


### 8. Literaturverzeichnis ----------------------------------------------------

literatur <- createLitInfo(varinfo) # Excel erstellen

## Excel speichern ## 
#eatAnalysis::write_xlsx(df_list = literatur, row.names = FALSE,
#                        filePath = "Q:/BT2018/BT/90_Skalenhandbuch/07_SH_Erstellung/literatur.xlsx")

# Lit Verzeichnis händisch bearbeiten -----------------

## Excel einlesen
#literatur <- getLitInfo("Q:/BT2018/BT/90_Skalenhandbuch/07_SH_Erstellung/literatur_bearbeitet.xlsx")

literatur_final <- makeLit(literatur)


### 9. Hintergrundmodell (HGM) -------------------------------------------------

hgm <- makeBGM(varinfo)

### 10. Cover ------------------------------------------------------------------

# Cover entweder direkt hier im Skript erstellen oder als pdf einlesen.

#cover <- makeCover(logoFile = "Q:/BT2018/BT/90_Skalenhandbuch/07_SH_Erstellung/Texte/iqb-logo.jpg",
#                   maintitle = "IQB-Bildungstrend~2018",
#                   subtitle = 'Skalenhandbuch zur Dokumentation der Erhebungsinstrumente \\newline in Mathematik und den naturwissenschaftlichen F{\\"a}chern',
#                   authors = "Benjamin Becker*, Johanna Busse*, Marleen Holtmann, Sebastian Weirch, \\newline Stefan Schipolowski, Nicole Mahler & Petra Stanat",
#                   addAuthors = 'Unter Mitarbeit von ERG{\\"A}NZEN',
#                   schriftenreihe = 'Schriftenreihe des Institutes zur Qualit{\\"a}tsentwicklung im Bildungswesen - Band~11',
#                   bibinfo = 'Band~11 \\par \\medskip
#                   Becker, B.*, Busse, J.*, Holtmann, M., Weirich, S., Schipolowski, S., Mahler, N. & Stanat P. (2022). \\textit{IQB-Bildungstrend~2018. Skalenhandbuch zur Dokumentation der Erhebungsinstrumente in Mathematik und den naturwissenschaftlichen F{\\"a}chern.} Berlin: Humboldt-Universit{\\"a}t zu Berlin, Institut zur Qualit{\\"a}tsentwicklung im Bildungswesen.'
#)

#pdf_cover <- '\\includepdf[pages=-]{q:/BT2018/BT/90_Skalenhandbuch/08_Einleitungstexte/cover_page_230110.pdf}'


### 11.0 Meta Data erstellen ---------------------------------------------------

#meta <- createMetadata()
#meta[1, "Title"] <- "IQB-Bildungstrend~2018. Skalenhandbuch zur Dokumentation der Erhebungsinstrumente in den naturwissenschaftlichen F?chern und Mathematik"
#meta[1, "Author"] <- "Stefan Schipolowski \\sep Petra Stanat"
#meta[1, "Keywords"] <- "Bildungstrend 2018\\sep IQB, Skalenhandbuch\\sep Erhebungsinstrumente Sekundarstufe I"
#meta[1, "Subject"] <- "Skalenhandbuch zum Bildungstrend 2018"

#eatAnalysis::write_xlsx(meta, "Q:/BT2018/BT/90_Skalenhandbuch/07_SH_Erstellung/meta.xlsx", row.names = FALSE)

#meta_final <- makeMetadata("Q:/BT2018/BT/90_Skalenhandbuch/07_SH_Erstellung/meta.xlsx")


### 11.1 Kapitel erstellen -----------------------------------------------------

chapters <- createChapters(varinfo)

#eatAnalysis::write_xlsx(chapters, "Q:/BT2018/BT/90_Skalenhandbuch/07_SH_Erstellung/chapters.xlsx", row.names = FALSE)

# Chapters händisch bearbeiten --------------

chapters <- getChapters("Q:/BT2018/BT/90_Skalenhandbuch/07_SH_Erstellung/chapters_bearbeitet.xlsx")


### 12. weitere Sachen: sonstige Texte -----------------------------------------

# Introtext
# intro_pages <- readLines("Q:/BT2018/BT/90_Skalenhandbuch/08_Einleitungstexte/Latex_Intro_snippet.tex")

# Outrotext
# lastpage <- readLines("Q:/BT2018/BT/90_Skalenhandbuch/08_Einleitungstexte/Latex_lastpage_snippet.tex")


### 13. Skalenhandbuch erstellen und speichern ---------------------------------

codebook <- codebook(varInfo = varinfo, missings = missings, struc = gliederung,
                     scaleInfo = skalen, register = NULL, dat = lapply(datenliste, eatGADS::extractData),
                     Kennwertedatensatz = kennwerte,
                     chapters = chapters, deckblatt = pdf_cover, intro = intro_pages, literatur = literatur_final, abkuerzverz = abbr_list,
                     hintmod = hgm, lastpage = lastpage)

# als .tex speichern
#write.table(codebook , file = "Q:/BT2018/BT/90_Skalenhandbuch/07_SH_Erstellung/Latex/IQB_BT2018_Skalenhandbuch_Stand2023_01_10.tex" , fileEncoding="UTF-8" ,
#            col.names=FALSE , row.names=FALSE , quote = FALSE )
# als .xmpdata speichern
#write.table(meta_final , file = "Q:/BT2018/BT/90_Skalenhandbuch/07_SH_Erstellung/Latex/IQB_BT2018_Skalenhandbuch_Stand2023_01_10.xmpdata", fileEncoding="UTF-8" ,
#            col.names=FALSE , row.names=FALSE , quote = FALSE )


### 14. ggf. Checks, etc. ------------------------------------------------------



