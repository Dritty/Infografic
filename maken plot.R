## Plotjes Infografic maken

library(likert)

## Selecteer likert vragen om te plotten

Likert_vragen <- Resultaten_100Dagen_gekoppeld2 %>% select(L19:L20) %>% as.data.frame() %>%
  mutate_if(is.numeric, as.factor) %>% mutate_all(factor, levels=1:5) %>% mutate_all(fct_recode, 
                                                                                     "zeer onees" = "1", 
                                                                                     "oneens" = "2",
                                                                                     "neutraal" = "3",
                                                                                     "eens" = "4",
                                                                                     "zeer eens" = "5")

Likert_overzicht <- likert::likert(Likert_vragen)

selectie_likert <- names(Likert_vragen)

legenda <- labels2 %>% 
  filter(Varcode %in% selectie_likert) %>% 
  rename("Stelling" = Variables,
         "Vraagcode" = Varcode)



## Plot vragen
testplot <- likert::likert.bar.plot(Likert_overzicht, ordered = FALSE,
                        group.order=names(Likert_vragen),
                        col=myColor, legend = "",
                        legend.position = "top")+ggtitle("Activiteiten bij start van de opleiding")


p1 <- testplot + kobe_theme()



