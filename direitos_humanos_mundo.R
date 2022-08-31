
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
