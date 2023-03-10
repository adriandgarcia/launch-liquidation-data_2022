MFS <- Full %>% 
  filter(Branding.Name == "MFS",
         Obsolete_Year == 2022)

MFS2 <- Full %>% 
  filter(Branding.Name == "MFS",
         Inception_Year == 2022)

Converts <- Full %>% 
  filter(grepl("ETF", Merged.Into..Security),
         Obsolete_Year == 2022) %>% 
  group_by(Name.of..Fund.s..Oldest.Share.Class) %>% 
  count()

JPM <- Full %>% 
  filter(Branding.Name == "JPMorgan",
         Obsolete_Year == 2022)

Macquarie <- Full %>% 
  filter(Branding.Name == "Macquarie",
       Obsolete_Year == 2022)

Fidelity <- Full %>% 
  filter(Branding.Name == "Fidelity") %>% 
  group_by(Name.of..Fund.s..Oldest.Share.Class) %>% 
  summarise(Min = min(Inception..Date),
            Max = max(Inception_Year),
            count = n()) %>% 
  filter(Max == 2022)
  
  
  filter(Branding.Name == "Fidelity",
         Inception_Year == 2022) %>% 
  summarise(Name,
            FundId,
            Share.Class.Type,
            Inception..Date,
            Oldest..Share.Class)





AC <- Full %>% 
  filter(Branding.Name == "American Century") %>% 
  group_by(Name.of..Fund.s..Oldest.Share.Class) %>% 
  summarise(Min = min(Inception..Date),
            Max = max(Inception_Year),
            count = n()) %>% 
  filter(Max == 2022)

AC2 <- Full %>% 
  filter(Branding.Name == "American Century",
         Inception_Year == 2022)

Alive <- Full %>% 
  filter(is.na(Obsolete_Year) |
           Obsolete_Year == 2023)

fidelity <- company_funds %>% 
  filter(Branding.Name.Mod == "Fidelity",
         Count_2022 != Count_2018) %>%
  ungroup %>%
  mutate(Difference = sum(Count_2022,-Count_2018, na.rm = T))

fidelity2 <- company_level_change %>% 
  filter(Branding.Name.Mod == "Fidelity",
         !identical(Exists_2018, Exists_2022)) %>%
  ungroup %>%
  mutate(Difference = sum(Exists_2022,-Exists_2018, na.rm = T))

