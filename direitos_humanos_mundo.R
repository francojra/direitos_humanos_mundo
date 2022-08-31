
# Direitos Humanos ---------------------------------------------------------------------------------
# Autora do script: Jeanne Franco ------------------------------------------------------------------
# Data: 30/08/22 -----------------------------------------------------------------------------------
# Referência: https://ourworldindata.org/human-rights ----------------------------------------------

# Sobre os dados -----------------------------------------------------------------------------------

### Direitos humanos descrevem normas e padrões morais que são entendidos
### como direitos fundamentais inalienáveis de cada pessoa humana. Direitos
### humanos envolvem uma abrangente variedade de direitos, incluindo mas
### não limitado para o direito ao julgamento justo, proteção da integridade
### física, proteção contra escravidão, a liberdade de expressão, e o direito
### à educação.

### A proteção dos direitos humanos é certamente um dos mais importantes aspectos
### do desenvolvimento. No entanto, ele recebe muito menos atenção do que
### outros aspectos, presumivelmente em parte porque ele é muito difícil
### de medir. Se alguém se interessa em empiricamente estudar a proteção
### de direitos humanos, não é suficiente contar os países que ratificam
### tratados de direitos humanos; ao invés, estudos quantitativos de direitos
### humanos objetiva determinar se ou não certos direitos humanos são protegidos
### na prática.

# Carregar pacotes necessários -------------------------------------------------------------------------------------------------------------

library(tidyverse)
library(pals)

# Carregar dados ---------------------------------------------------------------------------------------------------------------------------

dh <- read.csv("human-rights-protection.csv")
view(dh)
names(dh)

dh1 <- dh %>%
  select(-Code) %>%
  rename(direitos = Human.rights.protection) %>%
  filter(Entity %in% c("Angola", "Brazil", "China", "Russsia",
                       "United States", "France", "Germany",
                       "Ghana", "India", "Haiti", "Hungary", 
                       "Iceland", "Israel", "Portugal", "Italy"))
view(dh1)

dh2 <- dh1 %>%
  group_by(Entity) %>%
  summarise(media = mean(direitos),
            sd = sd(direitos), n = n(),
            se = sd/sqrt(n)) %>%
  view()

# Gráficos ---------------------------------------------------------------------------------------------------------------------------------

ggplot(dh1, aes(x = Year, y = direitos, 
                group = Entity, color = Entity)) +
  geom_line(size = 1.4) +
  scale_color_manual(values = as.vector(alphabet(n = 14))) +
  labs(x = "Tempo (anos)", y = "Direitos humanos (pontuações)",
       color = "Países") +
  theme_minimal() +
  theme(axis.title = element_text(size = 14),
        axis.text = element_text(size = 11, colour = "black"))

ggplot(dh2, aes(x = fct_reorder(Entity, media), 
                y = media, fill = Entity)) +
  geom_col() +
  geom_errorbar(aes(x = Entity, y = media,
                    ymin = media - se, ymax = media + se),
                size = 0.8, width = 0.3) +
  scale_fill_manual(values = as.vector(alphabet(n = 14))) +
  labs(x = "Países", y = "Direitos humanos (pontuações)") +
  theme_minimal() +
  theme(legend.position = "none",
        axis.title = element_text(size = 14),
        axis.text = element_text(size = 11, colour = "black"))
