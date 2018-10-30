# Datenbereiningung der Journalistenbefragung
source('/Users/work/Documents/Projekte/Eigene Arbeit/R-Spielereien/Skripte/Publishing/Daten/Funktionen.R')

library(haven)
JOUR <- read_sav("/Users/work/Documents/Projekte/Eigene Arbeit/R-Spielereien/Skripte/Publishing/Daten/Datensatz_Journalistenbefragung_220118_final.sav")

JOUR_bereinigt <- JOUR

# Liste der Fragen mit IDs
name <- c()
text <- c()
for(n in names(JOUR)) {
  label <- attr(JOUR[[n]], "label")
  name <- c(name, n)
  if (is.null(label)) {
    text <- c(text, n)
  } else {
    text <- c(text, attr(JOUR[[n]], "label"))
  }
}
QUESTIONS <- data.frame(name, text)

# Frage 3
#  Offene Antworten müssen nachgetragen werden

# Frage 4
#  -1: NA
#  Cluster-Codierung: (3= klein, 1-3 MA, 2=Mittel (4-10, 1= groß, mehr als 10)
JOUR_bereinigt$f4 <- ifelse(JOUR_bereinigt$f4 == -1, NA, JOUR_bereinigt$f4)
JOUR_bereinigt$f4.cluster <- ifelse(JOUR_bereinigt$f4 <= 3, 3, 
                                    ifelse(JOUR_bereinigt$f4 <= 10, 2, 
                                           ifelse(JOUR_bereinigt$f4 > 10, 1, NA)))

# Frage 5
#  -1: NA
#  Cluster-Codierung: (3= klein, 1-3 MA, 2=Mittel (4-10, 1= groß, mehr als 10)
JOUR_bereinigt$f5 <- ifelse(JOUR_bereinigt$f5 == -1, NA, JOUR_bereinigt$f5)
JOUR_bereinigt$f5.cluster <- ifelse(JOUR_bereinigt$f5 <= 3, 3, 
                                    ifelse(JOUR_bereinigt$f5 <= 10, 2, 
                                           ifelse(JOUR_bereinigt$f5 > 10, 1, NA)))

# Frage 8
#  -1: NA
#  NaN: keine Antwort
JOUR_bereinigt$f8 <- ifelse(JOUR_bereinigt$f8 == -1, NA, JOUR_bereinigt$f8)
JOUR_bereinigt$f8 <- ifelse(is.nan(JOUR_bereinigt$f8), NA, JOUR_bereinigt$f8)

# Frage 9
#  99: NA
JOUR_bereinigt$f9 <- ifelse(JOUR_bereinigt$f9 == 99, NA, JOUR_bereinigt$f9)

# Frage 10
#  Wurde gestrichen
JOUR_bereinigt$f10 <- NULL

# Frage 11_1 bis 11_9
#  99: NA
JOUR_bereinigt$f11_1 <- ifelse(JOUR_bereinigt$f11_1 == 99, NA, JOUR_bereinigt$f11_1)
JOUR_bereinigt$f11_2 <- ifelse(JOUR_bereinigt$f11_2 == 99, NA, JOUR_bereinigt$f11_2)
JOUR_bereinigt$f11_3 <- ifelse(JOUR_bereinigt$f11_3 == 99, NA, JOUR_bereinigt$f11_3)
JOUR_bereinigt$f11_4 <- ifelse(JOUR_bereinigt$f11_4 == 99, NA, JOUR_bereinigt$f11_4)
JOUR_bereinigt$f11_5 <- ifelse(JOUR_bereinigt$f11_5 == 99, NA, JOUR_bereinigt$f11_5)
JOUR_bereinigt$f11_6 <- ifelse(JOUR_bereinigt$f11_6 == 99, NA, JOUR_bereinigt$f11_6)
JOUR_bereinigt$f11_7 <- ifelse(JOUR_bereinigt$f11_7 == 99, NA, JOUR_bereinigt$f11_7)
JOUR_bereinigt$f11_8 <- ifelse(JOUR_bereinigt$f11_8 == 99, NA, JOUR_bereinigt$f11_8)
JOUR_bereinigt$f11_9 <- ifelse(JOUR_bereinigt$f11_9 == 99, NA, JOUR_bereinigt$f11_9)

# Frage 11b
#  NaN: keine Antwort
JOUR_bereinigt$f11b <- ifelse(is.nan(JOUR_bereinigt$f11b), NA, JOUR_bereinigt$f11b)

# Frage 12_1 bis 12_8
#  99: NA
JOUR_bereinigt$f12_1 <- ifelse(JOUR_bereinigt$f12_1 == 99, NA, JOUR_bereinigt$f12_1)
JOUR_bereinigt$f12_2 <- ifelse(JOUR_bereinigt$f12_2 == 99, NA, JOUR_bereinigt$f12_2)
JOUR_bereinigt$f12_3 <- ifelse(JOUR_bereinigt$f12_3 == 99, NA, JOUR_bereinigt$f12_3)
JOUR_bereinigt$f12_4 <- ifelse(JOUR_bereinigt$f12_4 == 99, NA, JOUR_bereinigt$f12_4)
JOUR_bereinigt$f12_5 <- ifelse(JOUR_bereinigt$f12_5 == 99, NA, JOUR_bereinigt$f12_5)
JOUR_bereinigt$f12_6 <- ifelse(JOUR_bereinigt$f12_6 == 99, NA, JOUR_bereinigt$f12_6)
JOUR_bereinigt$f12_7 <- ifelse(JOUR_bereinigt$f12_7 == 99, NA, JOUR_bereinigt$f12_7)
JOUR_bereinigt$f12_8 <- ifelse(JOUR_bereinigt$f12_8 == 99, NA, JOUR_bereinigt$f12_8)

# Frage 12b
#  NaN: keine Antwort
JOUR_bereinigt$f12b <- ifelse(is.nan(JOUR_bereinigt$f12b), NA, JOUR_bereinigt$f12b)

# Frage 12c_1 bis 12c_14
#  NaN: keine Antwort
JOUR_bereinigt$f12c_1 <- ifelse(is.nan(JOUR_bereinigt$f12c_1), NA, JOUR_bereinigt$f12c_1)
JOUR_bereinigt$f12c_2 <- ifelse(is.nan(JOUR_bereinigt$f12c_2), NA, JOUR_bereinigt$f12c_2)
JOUR_bereinigt$f12c_3 <- ifelse(is.nan(JOUR_bereinigt$f12c_3), NA, JOUR_bereinigt$f12c_3)
JOUR_bereinigt$f12c_4 <- ifelse(is.nan(JOUR_bereinigt$f12c_4), NA, JOUR_bereinigt$f12c_4)
JOUR_bereinigt$f12c_5 <- ifelse(is.nan(JOUR_bereinigt$f12c_5), NA, JOUR_bereinigt$f12c_5)
JOUR_bereinigt$f12c_6 <- ifelse(is.nan(JOUR_bereinigt$f12c_6), NA, JOUR_bereinigt$f12c_6)
JOUR_bereinigt$f12c_7 <- ifelse(is.nan(JOUR_bereinigt$f12c_7), NA, JOUR_bereinigt$f12c_7)
JOUR_bereinigt$f12c_8 <- ifelse(is.nan(JOUR_bereinigt$f12c_8), NA, JOUR_bereinigt$f12c_8)
JOUR_bereinigt$f12c_9 <- ifelse(is.nan(JOUR_bereinigt$f12c_9), NA, JOUR_bereinigt$f12c_9)
JOUR_bereinigt$f12c_10 <- ifelse(is.nan(JOUR_bereinigt$f12c_10), NA, JOUR_bereinigt$f12c_10)
JOUR_bereinigt$f12c_11 <- ifelse(is.nan(JOUR_bereinigt$f12c_11), NA, JOUR_bereinigt$f12c_11)
JOUR_bereinigt$f12c_12 <- ifelse(is.nan(JOUR_bereinigt$f12c_12), NA, JOUR_bereinigt$f12c_12)
JOUR_bereinigt$f12c_13 <- ifelse(is.nan(JOUR_bereinigt$f12c_13), NA, JOUR_bereinigt$f12c_13)
JOUR_bereinigt$f12c_14 <- ifelse(is.nan(JOUR_bereinigt$f12c_14), NA, JOUR_bereinigt$f12c_14)
JOUR_bereinigt$f12c_1 <- ifelse(JOUR_bereinigt$f12c_1 == 99, NA, JOUR_bereinigt$f12c_1)
JOUR_bereinigt$f12c_2 <- ifelse(JOUR_bereinigt$f12c_2 == 99, NA, JOUR_bereinigt$f12c_2)
JOUR_bereinigt$f12c_3 <- ifelse(JOUR_bereinigt$f12c_3 == 99, NA, JOUR_bereinigt$f12c_3)
JOUR_bereinigt$f12c_4 <- ifelse(JOUR_bereinigt$f12c_4 == 99, NA, JOUR_bereinigt$f12c_4)
JOUR_bereinigt$f12c_5 <- ifelse(JOUR_bereinigt$f12c_5 == 99, NA, JOUR_bereinigt$f12c_5)
JOUR_bereinigt$f12c_6 <- ifelse(JOUR_bereinigt$f12c_6 == 99, NA, JOUR_bereinigt$f12c_6)
JOUR_bereinigt$f12c_7 <- ifelse(JOUR_bereinigt$f12c_7 == 99, NA, JOUR_bereinigt$f12c_7)
JOUR_bereinigt$f12c_8 <- ifelse(JOUR_bereinigt$f12c_8 == 99, NA, JOUR_bereinigt$f12c_8)
JOUR_bereinigt$f12c_9 <- ifelse(JOUR_bereinigt$f12c_9 == 99, NA, JOUR_bereinigt$f12c_9)
JOUR_bereinigt$f12c_10 <- ifelse(JOUR_bereinigt$f12c_10 == 99, NA, JOUR_bereinigt$f12c_10)
JOUR_bereinigt$f12c_11 <- ifelse(JOUR_bereinigt$f12c_11 == 99, NA, JOUR_bereinigt$f12c_11)
JOUR_bereinigt$f12c_12 <- ifelse(JOUR_bereinigt$f12c_12 == 99, NA, JOUR_bereinigt$f12c_12)
JOUR_bereinigt$f12c_13 <- ifelse(JOUR_bereinigt$f12c_13 == 99, NA, JOUR_bereinigt$f12c_13)
JOUR_bereinigt$f12c_14 <- ifelse(JOUR_bereinigt$f12c_14 == 99, NA, JOUR_bereinigt$f12c_14)

# Frage 15
#  99: keine Antwort
JOUR_bereinigt$f15 <- ifelse(JOUR_bereinigt$f15 == 99, NA, JOUR_bereinigt$f15)

# Frage 16
#  99: keine Antwort
JOUR_bereinigt$f16 <- ifelse(JOUR_bereinigt$f16 == 99, NA, JOUR_bereinigt$f16)

# Frage 17
#  -1: keine Antwort
#  NaN: keine Antwort
JOUR_bereinigt$f17 <- ifelse(JOUR_bereinigt$f17 == -1, NA, JOUR_bereinigt$f17)
JOUR_bereinigt$f17 <- ifelse(is.nan(JOUR_bereinigt$f17), NA, JOUR_bereinigt$f17)

# Frage 18
#  99: keine Antwort
JOUR_bereinigt$f18 <- ifelse(JOUR_bereinigt$f18 == 99, NA, JOUR_bereinigt$f18)

# Frage 19_1 bis 19_12
#  NaN: keine Antwort
#  Neue Variable: In Minuten
JOUR_bereinigt$f19s_1 <- ifelse(is.nan(JOUR_bereinigt$f19s_1), 0, JOUR_bereinigt$f19s_1)
JOUR_bereinigt$f19m_1 <- ifelse(is.nan(JOUR_bereinigt$f19m_1), 0, JOUR_bereinigt$f19m_1)
JOUR_bereinigt$f19_1 <- (JOUR_bereinigt$f19s_1 * 60) + JOUR_bereinigt$f19m_1
JOUR_bereinigt$f19s_2 <- ifelse(is.nan(JOUR_bereinigt$f19s_2), 0, JOUR_bereinigt$f19s_2)
JOUR_bereinigt$f19m_2 <- ifelse(is.nan(JOUR_bereinigt$f19m_2), 0, JOUR_bereinigt$f19m_2)
JOUR_bereinigt$f19_2 <- (JOUR_bereinigt$f19s_2 * 60) + JOUR_bereinigt$f19m_2
JOUR_bereinigt$f19s_3 <- ifelse(is.nan(JOUR_bereinigt$f19s_3), 0, JOUR_bereinigt$f19s_3)
JOUR_bereinigt$f19m_3 <- ifelse(is.nan(JOUR_bereinigt$f19m_3), 0, JOUR_bereinigt$f19m_3)
JOUR_bereinigt$f19_3 <- (JOUR_bereinigt$f19s_3 * 60) + JOUR_bereinigt$f19m_3
JOUR_bereinigt$f19s_4 <- ifelse(is.nan(JOUR_bereinigt$f19s_4), 0, JOUR_bereinigt$f19s_4)
JOUR_bereinigt$f19m_4 <- ifelse(is.nan(JOUR_bereinigt$f19m_4), 0, JOUR_bereinigt$f19m_4)
JOUR_bereinigt$f19_4 <- (JOUR_bereinigt$f19s_4 * 60) + JOUR_bereinigt$f19m_4
JOUR_bereinigt$f19s_5 <- ifelse(is.nan(JOUR_bereinigt$f19s_5), 0, JOUR_bereinigt$f19s_5)
JOUR_bereinigt$f19m_5 <- ifelse(is.nan(JOUR_bereinigt$f19m_5), 0, JOUR_bereinigt$f19m_5)
JOUR_bereinigt$f19_5 <- (JOUR_bereinigt$f19s_5 * 60) + JOUR_bereinigt$f19m_5
JOUR_bereinigt$f19s_6 <- ifelse(is.nan(JOUR_bereinigt$f19s_6), 0, JOUR_bereinigt$f19s_6)
JOUR_bereinigt$f19m_6 <- ifelse(is.nan(JOUR_bereinigt$f19m_6), 0, JOUR_bereinigt$f19m_6)
JOUR_bereinigt$f19_6 <- (JOUR_bereinigt$f19s_6 * 60) + JOUR_bereinigt$f19m_6
JOUR_bereinigt$f19s_7 <- ifelse(is.nan(JOUR_bereinigt$f19s_7), 0, JOUR_bereinigt$f19s_7)
JOUR_bereinigt$f19m_7 <- ifelse(is.nan(JOUR_bereinigt$f19m_7), 0, JOUR_bereinigt$f19m_7)
JOUR_bereinigt$f19_7 <- (JOUR_bereinigt$f19s_7 * 60) + JOUR_bereinigt$f19m_7
JOUR_bereinigt$f19s_8 <- ifelse(is.nan(JOUR_bereinigt$f19s_8), 0, JOUR_bereinigt$f19s_8)
JOUR_bereinigt$f19m_8 <- ifelse(is.nan(JOUR_bereinigt$f19m_8), 0, JOUR_bereinigt$f19m_8)
JOUR_bereinigt$f19_8 <- (JOUR_bereinigt$f19s_8 * 60) + JOUR_bereinigt$f19m_8
JOUR_bereinigt$f19s_9 <- ifelse(is.nan(JOUR_bereinigt$f19s_9), 0, JOUR_bereinigt$f19s_9)
JOUR_bereinigt$f19m_9 <- ifelse(is.nan(JOUR_bereinigt$f19m_9), 0, JOUR_bereinigt$f19m_9)
JOUR_bereinigt$f19_9 <- (JOUR_bereinigt$f19s_9 * 60) + JOUR_bereinigt$f19m_9
JOUR_bereinigt$f19s_10 <- ifelse(is.nan(JOUR_bereinigt$f19s_10), 0, JOUR_bereinigt$f19s_10)
JOUR_bereinigt$f19m_10 <- ifelse(is.nan(JOUR_bereinigt$f19m_10), 0, JOUR_bereinigt$f19m_10)
JOUR_bereinigt$f19_10 <- (JOUR_bereinigt$f19s_10 * 60) + JOUR_bereinigt$f19m_10
JOUR_bereinigt$f19s_11 <- ifelse(is.nan(JOUR_bereinigt$f19s_11), 0, JOUR_bereinigt$f19s_11)
JOUR_bereinigt$f19m_11 <- ifelse(is.nan(JOUR_bereinigt$f19m_11), 0, JOUR_bereinigt$f19m_11)
JOUR_bereinigt$f19_11 <- (JOUR_bereinigt$f19s_11 * 60) + JOUR_bereinigt$f19m_11
JOUR_bereinigt$f19s_12 <- ifelse(is.nan(JOUR_bereinigt$f19s_12), 0, JOUR_bereinigt$f19s_12)
JOUR_bereinigt$f19m_12 <- ifelse(is.nan(JOUR_bereinigt$f19m_12), 0, JOUR_bereinigt$f19m_12)
JOUR_bereinigt$f19_12 <- (JOUR_bereinigt$f19s_12 * 60) + JOUR_bereinigt$f19m_12
JOUR_bereinigt[53:112] <- NULL

# Frage 20
#  Wurde gestrichen
JOUR_bereinigt$f20_1 <- NULL
JOUR_bereinigt$f20_2 <- NULL
JOUR_bereinigt$f20_3 <- NULL
JOUR_bereinigt$f20_4 <- NULL
JOUR_bereinigt$f20_5 <- NULL
JOUR_bereinigt$f20_6 <- NULL
JOUR_bereinigt$f20_7 <- NULL
JOUR_bereinigt$f20_8 <- NULL
JOUR_bereinigt$f20_9 <- NULL
JOUR_bereinigt$f20_10 <- NULL
JOUR_bereinigt$f20_11 <- NULL
JOUR_bereinigt$f20_12 <- NULL
JOUR_bereinigt$f20_13 <- NULL
JOUR_bereinigt$f20_14 <- NULL
JOUR_bereinigt$f20_15 <- NULL

# Frage 22
#  Wurde gestrichen
JOUR_bereinigt[59:103] <- NULL

# Frage 23_1 bis 23_9
#  NaN: keine Antwort
#  Neue Variable: In Minuten
JOUR_bereinigt$f23s_1 <- ifelse(is.nan(JOUR_bereinigt$f23s_1), 0, JOUR_bereinigt$f23s_1)
JOUR_bereinigt$f23m_1 <- ifelse(is.nan(JOUR_bereinigt$f23m_1), 0, JOUR_bereinigt$f23m_1)
JOUR_bereinigt$f23_1 <- (JOUR_bereinigt$f23s_1 * 60) + JOUR_bereinigt$f23m_1
JOUR_bereinigt$f23s_2 <- ifelse(is.nan(JOUR_bereinigt$f23s_2), 0, JOUR_bereinigt$f23s_2)
JOUR_bereinigt$f23m_2 <- ifelse(is.nan(JOUR_bereinigt$f23m_2), 0, JOUR_bereinigt$f23m_2)
JOUR_bereinigt$f23_2 <- (JOUR_bereinigt$f23s_2 * 60) + JOUR_bereinigt$f23m_2
JOUR_bereinigt$f23s_3 <- ifelse(is.nan(JOUR_bereinigt$f23s_3), 0, JOUR_bereinigt$f23s_3)
JOUR_bereinigt$f23m_3 <- ifelse(is.nan(JOUR_bereinigt$f23m_3), 0, JOUR_bereinigt$f23m_3)
JOUR_bereinigt$f23_3 <- (JOUR_bereinigt$f23s_3 * 60) + JOUR_bereinigt$f23m_3
JOUR_bereinigt$f23s_4 <- ifelse(is.nan(JOUR_bereinigt$f23s_4), 0, JOUR_bereinigt$f23s_4)
JOUR_bereinigt$f23m_4 <- ifelse(is.nan(JOUR_bereinigt$f23m_4), 0, JOUR_bereinigt$f23m_4)
JOUR_bereinigt$f23_4 <- (JOUR_bereinigt$f23s_4 * 60) + JOUR_bereinigt$f23m_4
JOUR_bereinigt$f23s_5 <- ifelse(is.nan(JOUR_bereinigt$f23s_5), 0, JOUR_bereinigt$f23s_5)
JOUR_bereinigt$f23m_5 <- ifelse(is.nan(JOUR_bereinigt$f23m_5), 0, JOUR_bereinigt$f23m_5)
JOUR_bereinigt$f23_5 <- (JOUR_bereinigt$f23s_5 * 60) + JOUR_bereinigt$f23m_5
JOUR_bereinigt$f23s_6 <- ifelse(is.nan(JOUR_bereinigt$f23s_6), 0, JOUR_bereinigt$f23s_6)
JOUR_bereinigt$f23m_6 <- ifelse(is.nan(JOUR_bereinigt$f23m_6), 0, JOUR_bereinigt$f23m_6)
JOUR_bereinigt$f23_6 <- (JOUR_bereinigt$f23s_6 * 60) + JOUR_bereinigt$f23m_6
JOUR_bereinigt$f23s_7 <- ifelse(is.nan(JOUR_bereinigt$f23s_7), 0, JOUR_bereinigt$f23s_7)
JOUR_bereinigt$f23m_7 <- ifelse(is.nan(JOUR_bereinigt$f23m_7), 0, JOUR_bereinigt$f23m_7)
JOUR_bereinigt$f23_7 <- (JOUR_bereinigt$f23s_7 * 60) + JOUR_bereinigt$f23m_7
JOUR_bereinigt$f23s_8 <- ifelse(is.nan(JOUR_bereinigt$f23s_8), 0, JOUR_bereinigt$f23s_8)
JOUR_bereinigt$f23m_8 <- ifelse(is.nan(JOUR_bereinigt$f23m_8), 0, JOUR_bereinigt$f23m_8)
JOUR_bereinigt$f23_8 <- (JOUR_bereinigt$f23s_8 * 60) + JOUR_bereinigt$f23m_8
JOUR_bereinigt$f23s_9 <- ifelse(is.nan(JOUR_bereinigt$f23s_9), 0, JOUR_bereinigt$f23s_9)
JOUR_bereinigt$f23m_9 <- ifelse(is.nan(JOUR_bereinigt$f23m_9), 0, JOUR_bereinigt$f23m_9)
JOUR_bereinigt$f23_9 <- (JOUR_bereinigt$f23s_9 * 60) + JOUR_bereinigt$f23m_9
JOUR_bereinigt[59:103] <- NULL

# Frage 24
#  99: keine Antwort
JOUR_bereinigt$f24 <- ifelse(JOUR_bereinigt$f24 == -1, NA, JOUR_bereinigt$f24)

# Frage 25_1 bis 25_12
#  NaN: keine Antwort
JOUR_bereinigt$f25_1 <- ifelse(is.nan(JOUR_bereinigt$f25_1), NA, JOUR_bereinigt$f25_1)
JOUR_bereinigt$f25_2 <- ifelse(is.nan(JOUR_bereinigt$f25_2), NA, JOUR_bereinigt$f25_2)
JOUR_bereinigt$f25_3 <- ifelse(is.nan(JOUR_bereinigt$f25_3), NA, JOUR_bereinigt$f25_3)
JOUR_bereinigt$f25_4 <- ifelse(is.nan(JOUR_bereinigt$f25_4), NA, JOUR_bereinigt$f25_4)
JOUR_bereinigt$f25_5 <- ifelse(is.nan(JOUR_bereinigt$f25_5), NA, JOUR_bereinigt$f25_5)
JOUR_bereinigt$f25_6 <- ifelse(is.nan(JOUR_bereinigt$f25_6), NA, JOUR_bereinigt$f25_6)
JOUR_bereinigt$f25_7 <- ifelse(is.nan(JOUR_bereinigt$f25_7), NA, JOUR_bereinigt$f25_7)
JOUR_bereinigt$f25_8 <- ifelse(is.nan(JOUR_bereinigt$f25_8), NA, JOUR_bereinigt$f25_8)
JOUR_bereinigt$f25_9 <- ifelse(is.nan(JOUR_bereinigt$f25_9), NA, JOUR_bereinigt$f25_9)
JOUR_bereinigt$f25_10 <- ifelse(is.nan(JOUR_bereinigt$f25_10), NA, JOUR_bereinigt$f25_10)
JOUR_bereinigt$f25_11 <- ifelse(is.nan(JOUR_bereinigt$f25_11), NA, JOUR_bereinigt$f25_11)
JOUR_bereinigt$f25_12 <- ifelse(is.nan(JOUR_bereinigt$f25_12), NA, JOUR_bereinigt$f25_12)
JOUR_bereinigt$f25_1 <- ifelse(JOUR_bereinigt$f25_1 == 99, NA, JOUR_bereinigt$f25_1)
JOUR_bereinigt$f25_2 <- ifelse(JOUR_bereinigt$f25_2 == 99, NA, JOUR_bereinigt$f25_2)
JOUR_bereinigt$f25_3 <- ifelse(JOUR_bereinigt$f25_3 == 99, NA, JOUR_bereinigt$f25_3)
JOUR_bereinigt$f25_4 <- ifelse(JOUR_bereinigt$f25_4 == 99, NA, JOUR_bereinigt$f25_4)
JOUR_bereinigt$f25_5 <- ifelse(JOUR_bereinigt$f25_5 == 99, NA, JOUR_bereinigt$f25_5)
JOUR_bereinigt$f25_6 <- ifelse(JOUR_bereinigt$f25_6 == 99, NA, JOUR_bereinigt$f25_6)
JOUR_bereinigt$f25_7 <- ifelse(JOUR_bereinigt$f25_7 == 99, NA, JOUR_bereinigt$f25_7)
JOUR_bereinigt$f25_8 <- ifelse(JOUR_bereinigt$f25_8 == 99, NA, JOUR_bereinigt$f25_8)
JOUR_bereinigt$f25_9 <- ifelse(JOUR_bereinigt$f25_9 == 99, NA, JOUR_bereinigt$f25_9)
JOUR_bereinigt$f25_10 <- ifelse(JOUR_bereinigt$f25_10 == 99, NA, JOUR_bereinigt$f25_10)
JOUR_bereinigt$f25_11 <- ifelse(JOUR_bereinigt$f25_11 == 99, NA, JOUR_bereinigt$f25_11)
JOUR_bereinigt$f25_12 <- ifelse(JOUR_bereinigt$f25_12 == 99, NA, JOUR_bereinigt$f25_12)

# Frage 26_1 bis 26_12
#  99: keine Antwort
JOUR_bereinigt$f26_1 <- ifelse(JOUR_bereinigt$f26_1 == 99, NA, JOUR_bereinigt$f26_1)
JOUR_bereinigt$f26_2 <- ifelse(JOUR_bereinigt$f26_2 == 99, NA, JOUR_bereinigt$f26_2)
JOUR_bereinigt$f26_3 <- ifelse(JOUR_bereinigt$f26_3 == 99, NA, JOUR_bereinigt$f26_3)
JOUR_bereinigt$f26_4 <- ifelse(JOUR_bereinigt$f26_4 == 99, NA, JOUR_bereinigt$f26_4)
JOUR_bereinigt$f26_5 <- ifelse(JOUR_bereinigt$f26_5 == 99, NA, JOUR_bereinigt$f26_5)
JOUR_bereinigt$f26_6 <- ifelse(JOUR_bereinigt$f26_6 == 99, NA, JOUR_bereinigt$f26_6)
JOUR_bereinigt$f26_7 <- ifelse(JOUR_bereinigt$f26_7 == 99, NA, JOUR_bereinigt$f26_7)
JOUR_bereinigt$f26_8 <- ifelse(JOUR_bereinigt$f26_8 == 99, NA, JOUR_bereinigt$f26_8)
JOUR_bereinigt$f26_9 <- ifelse(JOUR_bereinigt$f26_9 == 99, NA, JOUR_bereinigt$f26_9)
JOUR_bereinigt$f26_10 <- ifelse(JOUR_bereinigt$f26_10 == 99, NA, JOUR_bereinigt$f26_10)
JOUR_bereinigt$f26_11 <- ifelse(JOUR_bereinigt$f26_11 == 99, NA, JOUR_bereinigt$f26_11)
JOUR_bereinigt$f26_12 <- ifelse(JOUR_bereinigt$f26_12 == 99, NA, JOUR_bereinigt$f26_12)

# Frage 27_1 bis 27_8
#  NaN: keine Antwort
JOUR_bereinigt$f27_1 <- ifelse(is.nan(JOUR_bereinigt$f27_1), NA, JOUR_bereinigt$f27_1)
JOUR_bereinigt$f27_2 <- ifelse(is.nan(JOUR_bereinigt$f27_2), NA, JOUR_bereinigt$f27_2)
JOUR_bereinigt$f27_3 <- ifelse(is.nan(JOUR_bereinigt$f27_3), NA, JOUR_bereinigt$f27_3)
JOUR_bereinigt$f27_4 <- ifelse(is.nan(JOUR_bereinigt$f27_4), NA, JOUR_bereinigt$f27_4)
JOUR_bereinigt$f27_5 <- ifelse(is.nan(JOUR_bereinigt$f27_5), NA, JOUR_bereinigt$f27_5)
JOUR_bereinigt$f27_6 <- ifelse(is.nan(JOUR_bereinigt$f27_6), NA, JOUR_bereinigt$f27_6)
JOUR_bereinigt$f27_7 <- ifelse(is.nan(JOUR_bereinigt$f27_7), NA, JOUR_bereinigt$f27_7)
JOUR_bereinigt$f27_8 <- ifelse(is.nan(JOUR_bereinigt$f27_8), NA, JOUR_bereinigt$f27_8)

# Frage 28
#  NaN: keine Antwort
JOUR_bereinigt$f28 <- ifelse(is.nan(JOUR_bereinigt$f28), NA, JOUR_bereinigt$f28)

# Frage 29_1 bis 29_4
#  NaN: keine Antwort
JOUR_bereinigt$f29_1 <- ifelse(is.nan(JOUR_bereinigt$f29_1), NA, JOUR_bereinigt$f29_1)
JOUR_bereinigt$f29_2 <- ifelse(is.nan(JOUR_bereinigt$f29_2), NA, JOUR_bereinigt$f29_2)
JOUR_bereinigt$f29_3 <- ifelse(is.nan(JOUR_bereinigt$f29_3), NA, JOUR_bereinigt$f29_3)
JOUR_bereinigt$f29_4 <- ifelse(is.nan(JOUR_bereinigt$f29_4), NA, JOUR_bereinigt$f29_4)

# Frage 30_1 bis 30_10
#  NaN: keine Antwort
JOUR_bereinigt$f30_1 <- ifelse(is.nan(JOUR_bereinigt$f30_1), NA, JOUR_bereinigt$f30_1)
JOUR_bereinigt$f30_2 <- ifelse(is.nan(JOUR_bereinigt$f30_2), NA, JOUR_bereinigt$f30_2)
JOUR_bereinigt$f30_3 <- ifelse(is.nan(JOUR_bereinigt$f30_3), NA, JOUR_bereinigt$f30_3)
JOUR_bereinigt$f30_4 <- ifelse(is.nan(JOUR_bereinigt$f30_4), NA, JOUR_bereinigt$f30_4)
JOUR_bereinigt$f30_5 <- ifelse(is.nan(JOUR_bereinigt$f30_5), NA, JOUR_bereinigt$f30_5)
JOUR_bereinigt$f30_6 <- ifelse(is.nan(JOUR_bereinigt$f30_6), NA, JOUR_bereinigt$f30_6)
JOUR_bereinigt$f30_7 <- ifelse(is.nan(JOUR_bereinigt$f30_7), NA, JOUR_bereinigt$f30_7)
JOUR_bereinigt$f30_8 <- ifelse(is.nan(JOUR_bereinigt$f30_8), NA, JOUR_bereinigt$f30_8)
JOUR_bereinigt$f30_9 <- ifelse(is.nan(JOUR_bereinigt$f30_9), NA, JOUR_bereinigt$f30_9)
JOUR_bereinigt$f30_10 <- ifelse(is.nan(JOUR_bereinigt$f30_10), NA, JOUR_bereinigt$f30_10)

# Frage 31_1 bis 31_6
#  Wurde gestrichen
JOUR_bereinigt$f31_1 <- NULL
JOUR_bereinigt$f31_2 <- NULL
JOUR_bereinigt$f31_3 <- NULL
JOUR_bereinigt$f31_4 <- NULL
JOUR_bereinigt$f31_5 <- NULL
JOUR_bereinigt$f31_6 <- NULL

# Frage 32_1 bis 32_8
#  NaN: keine Antwort
JOUR_bereinigt$f32_1 <- ifelse(is.nan(JOUR_bereinigt$f32_1), NA, JOUR_bereinigt$f32_1)
JOUR_bereinigt$f32_2 <- ifelse(is.nan(JOUR_bereinigt$f32_2), NA, JOUR_bereinigt$f32_2)
JOUR_bereinigt$f32_3 <- ifelse(is.nan(JOUR_bereinigt$f32_3), NA, JOUR_bereinigt$f32_3)
JOUR_bereinigt$f32_4 <- ifelse(is.nan(JOUR_bereinigt$f32_4), NA, JOUR_bereinigt$f32_4)
JOUR_bereinigt$f32_5 <- ifelse(is.nan(JOUR_bereinigt$f32_5), NA, JOUR_bereinigt$f32_5)
JOUR_bereinigt$f32_6 <- ifelse(is.nan(JOUR_bereinigt$f32_6), NA, JOUR_bereinigt$f32_6)
JOUR_bereinigt$f32_7 <- ifelse(is.nan(JOUR_bereinigt$f32_7), NA, JOUR_bereinigt$f32_7)
JOUR_bereinigt$f32_8 <- ifelse(is.nan(JOUR_bereinigt$f32_8), NA, JOUR_bereinigt$f32_8)

# Frage 33_1 bis 33_6
#  Wurde gestrichen
JOUR_bereinigt$f33_1 <- NULL
JOUR_bereinigt$f33_2 <- NULL
JOUR_bereinigt$f33_3 <- NULL
JOUR_bereinigt$f33_4 <- NULL
JOUR_bereinigt$f33_5 <- NULL
JOUR_bereinigt$f33_6 <- NULL

# Frage 34_1 bis 34_5
#  NaN: keine Antwort
JOUR_bereinigt$f34_1 <- ifelse(is.nan(JOUR_bereinigt$f34_1), NA, JOUR_bereinigt$f34_1)
JOUR_bereinigt$f34_2 <- ifelse(is.nan(JOUR_bereinigt$f34_2), NA, JOUR_bereinigt$f34_2)
JOUR_bereinigt$f34_3 <- ifelse(is.nan(JOUR_bereinigt$f34_3), NA, JOUR_bereinigt$f34_3)
JOUR_bereinigt$f34_4 <- ifelse(is.nan(JOUR_bereinigt$f34_4), NA, JOUR_bereinigt$f34_4)
JOUR_bereinigt$f34_5 <- ifelse(is.nan(JOUR_bereinigt$f34_5), NA, JOUR_bereinigt$f34_5)

# Frage 35_1 bis 35_4
#  NaN: keine Antwort
JOUR_bereinigt$f35_1 <- ifelse(is.nan(JOUR_bereinigt$f35_1), NA, JOUR_bereinigt$f35_1)
JOUR_bereinigt$f35_2 <- ifelse(is.nan(JOUR_bereinigt$f35_2), NA, JOUR_bereinigt$f35_2)
JOUR_bereinigt$f35_3 <- ifelse(is.nan(JOUR_bereinigt$f35_3), NA, JOUR_bereinigt$f35_3)
JOUR_bereinigt$f35_4 <- ifelse(is.nan(JOUR_bereinigt$f35_4), NA, JOUR_bereinigt$f35_4)

# Frage 36b_1 bis 36b_5
#  NaN: keine Antwort
JOUR_bereinigt$f36b_1 <- ifelse(is.nan(JOUR_bereinigt$f36b_1), NA, JOUR_bereinigt$f36b_1)
JOUR_bereinigt$f36b_2 <- ifelse(is.nan(JOUR_bereinigt$f36b_2), NA, JOUR_bereinigt$f36b_2)
JOUR_bereinigt$f36b_3 <- ifelse(is.nan(JOUR_bereinigt$f36b_3), NA, JOUR_bereinigt$f36b_3)
JOUR_bereinigt$f36b_4 <- ifelse(is.nan(JOUR_bereinigt$f36b_4), NA, JOUR_bereinigt$f36b_4)
JOUR_bereinigt$f36b_5 <- ifelse(is.nan(JOUR_bereinigt$f36b_5), NA, JOUR_bereinigt$f36b_5)

# Frage 36c_1 bis 36c_8
#  NaN: keine Antwort
JOUR_bereinigt$f36c_1 <- ifelse(is.nan(JOUR_bereinigt$f36c_1), NA, JOUR_bereinigt$f36c_1)
JOUR_bereinigt$f36c_2 <- ifelse(is.nan(JOUR_bereinigt$f36c_2), NA, JOUR_bereinigt$f36c_2)
JOUR_bereinigt$f36c_3 <- ifelse(is.nan(JOUR_bereinigt$f36c_3), NA, JOUR_bereinigt$f36c_3)
JOUR_bereinigt$f36c_4 <- ifelse(is.nan(JOUR_bereinigt$f36c_4), NA, JOUR_bereinigt$f36c_4)
JOUR_bereinigt$f36c_5 <- ifelse(is.nan(JOUR_bereinigt$f36c_5), NA, JOUR_bereinigt$f36c_5)
JOUR_bereinigt$f36c_6 <- ifelse(is.nan(JOUR_bereinigt$f36c_6), NA, JOUR_bereinigt$f36c_6)
JOUR_bereinigt$f36c_7 <- ifelse(is.nan(JOUR_bereinigt$f36c_7), NA, JOUR_bereinigt$f36c_7)
JOUR_bereinigt$f36c_8 <- ifelse(is.nan(JOUR_bereinigt$f36c_8), NA, JOUR_bereinigt$f36c_8)

# Frage 37_1 bis 37_6
#  NaN: keine Antwort
#  99: keine Antwort
JOUR_bereinigt$f37_1 <- ifelse(is.nan(JOUR_bereinigt$f37_1), NA, JOUR_bereinigt$f37_1)
JOUR_bereinigt$f37_2 <- ifelse(is.nan(JOUR_bereinigt$f37_2), NA, JOUR_bereinigt$f37_2)
JOUR_bereinigt$f37_3 <- ifelse(is.nan(JOUR_bereinigt$f37_3), NA, JOUR_bereinigt$f37_3)
JOUR_bereinigt$f37_4 <- ifelse(is.nan(JOUR_bereinigt$f37_4), NA, JOUR_bereinigt$f37_4)
JOUR_bereinigt$f37_5 <- ifelse(is.nan(JOUR_bereinigt$f37_5), NA, JOUR_bereinigt$f37_5)
JOUR_bereinigt$f37_6 <- ifelse(is.nan(JOUR_bereinigt$f37_6), NA, JOUR_bereinigt$f37_6)
JOUR_bereinigt$f37_1 <- ifelse(JOUR_bereinigt$f37_1 == 99, NA, JOUR_bereinigt$f37_1)
JOUR_bereinigt$f37_2 <- ifelse(JOUR_bereinigt$f37_2 == 99, NA, JOUR_bereinigt$f37_2)
JOUR_bereinigt$f37_3 <- ifelse(JOUR_bereinigt$f37_3 == 99, NA, JOUR_bereinigt$f37_3)
JOUR_bereinigt$f37_4 <- ifelse(JOUR_bereinigt$f37_4 == 99, NA, JOUR_bereinigt$f37_4)
JOUR_bereinigt$f37_5 <- ifelse(JOUR_bereinigt$f37_5 == 99, NA, JOUR_bereinigt$f37_5)
JOUR_bereinigt$f37_6 <- ifelse(JOUR_bereinigt$f37_6 == 99, NA, JOUR_bereinigt$f37_6)

# Frage 38
#  99: keine Antwort
JOUR_bereinigt$f38 <- ifelse(JOUR_bereinigt$f38 == 99, NA, JOUR_bereinigt$f38)

# Frage 40a
#  -1: keine Antwort
JOUR_bereinigt$f40a <- ifelse(JOUR_bereinigt$f40a == -1, NA, JOUR_bereinigt$f40a)

# Frage 42
#  99: keine Antwort
JOUR_bereinigt$f42 <- ifelse(JOUR_bereinigt$f42 == 99, NA, JOUR_bereinigt$f42)

# Frage 44_1 bis 44_9
#  Wurde gestrichen
JOUR_bereinigt$f44_1 <- NULL
JOUR_bereinigt$f44_2 <- NULL
JOUR_bereinigt$f44_3 <- NULL
JOUR_bereinigt$f44_4 <- NULL
JOUR_bereinigt$f44_5 <- NULL
JOUR_bereinigt$f44_6 <- NULL
JOUR_bereinigt$f44_7 <- NULL
JOUR_bereinigt$f44_8 <- NULL
JOUR_bereinigt$f44_9 <- NULL

# Frage 45_1 bis 45_14
#  99: keine Antwort
JOUR_bereinigt$f45_1 <- ifelse(JOUR_bereinigt$f45_1 == 99, NA, JOUR_bereinigt$f45_1)
JOUR_bereinigt$f45_2 <- ifelse(JOUR_bereinigt$f45_2 == 99, NA, JOUR_bereinigt$f45_2)
JOUR_bereinigt$f45_3 <- ifelse(JOUR_bereinigt$f45_3 == 99, NA, JOUR_bereinigt$f45_3)
JOUR_bereinigt$f45_4 <- ifelse(JOUR_bereinigt$f45_4 == 99, NA, JOUR_bereinigt$f45_4)
JOUR_bereinigt$f45_5 <- ifelse(JOUR_bereinigt$f45_5 == 99, NA, JOUR_bereinigt$f45_5)
JOUR_bereinigt$f45_6 <- ifelse(JOUR_bereinigt$f45_6 == 99, NA, JOUR_bereinigt$f45_6)
JOUR_bereinigt$f45_7 <- ifelse(JOUR_bereinigt$f45_7 == 99, NA, JOUR_bereinigt$f45_7)
JOUR_bereinigt$f45_8 <- ifelse(JOUR_bereinigt$f45_8 == 99, NA, JOUR_bereinigt$f45_8)
JOUR_bereinigt$f45_9 <- ifelse(JOUR_bereinigt$f45_9 == 99, NA, JOUR_bereinigt$f45_9)
JOUR_bereinigt$f45_10 <- ifelse(JOUR_bereinigt$f45_10 == 99, NA, JOUR_bereinigt$f45_10)
JOUR_bereinigt$f45_11 <- ifelse(JOUR_bereinigt$f45_11 == 99, NA, JOUR_bereinigt$f45_11)
JOUR_bereinigt$f45_12 <- ifelse(JOUR_bereinigt$f45_12 == 99, NA, JOUR_bereinigt$f45_12)
JOUR_bereinigt$f45_13 <- ifelse(JOUR_bereinigt$f45_13 == 99, NA, JOUR_bereinigt$f45_13)
JOUR_bereinigt$f45_14 <- ifelse(JOUR_bereinigt$f45_14 == 99, NA, JOUR_bereinigt$f45_14)

# Frage 46
#  99: keine Antwort
temp <- attr(JOUR_bereinigt$f46, "labels")[1:9]
JOUR_bereinigt$f46 <- ifelse(JOUR_bereinigt$f46 == 99, NA, JOUR_bereinigt$f46)
attr(JOUR_bereinigt$f46, "labels") <- temp
rm(temp)

# Frage 46b
#  99: keine Antwort
#  NaN: keine Antwort
temp <- attr(JOUR_bereinigt$f46b, "labels")
temp <- c(temp[4], temp[12], temp[19])
JOUR_bereinigt$f46b <- ifelse(is.nan(JOUR_bereinigt$f46b), NA, JOUR_bereinigt$f46b)
JOUR_bereinigt$f46b <- ifelse(JOUR_bereinigt$f46b == 99, NA, JOUR_bereinigt$f46b)
attr(JOUR_bereinigt$f46, "labels") <- temp
rm(temp)

# Neue Liste der Fragen mit IDs
FRAGEN <- subset(QUESTIONS, QUESTIONS$name %in% names(JOUR_bereinigt))
name <- as.character(FRAGEN$name)
text <- as.character(FRAGEN$text)
name <- c(name, c("f4.cluster", "f5.cluster", "f19_1 bis f19_12", "f23_1 bis f23_9"))
text <- c(text, c(
  "Cluster-Codierung: (3= klein, 1-3 MA, 2=Mittel (4-10, 1= groß, mehr als 10)",
  "Cluster-Codierung: (3= klein, 1-3 MA, 2=Mittel (4-10, 1= groß, mehr als 10)",
  "1.	Verfassen eigener journalistischer Texte
  2.	Redigieren bzw. Überarbeiten von Texten anderer (z.B. Agenturtexte)
  3.	Beobachtung anderer Nachrichtenseiten und deren Berichterstattung 
  4.	Beobachtung von Themen und Ereignissen auf Twitter 
  5.	oder sozialen Medien (wie z.B. Facebook) 
  6.	Online-Recherche (Internet, Online-Datenbanken) 
  7.	Offline-Recherche (z.B. telefonisch oder in Offline/Papier-Archiven)
  8.	Layout, Bild- und Videobearbeitung
  9.	Programmierung (z.B. mit HTML, Java o.ä.) und Datenorganisation
  10.	Community Management (Lesen, Moderieren, Bearbeiten von Nutzer-Kommentaren oder Leserbriefen)
  11.	Nutzerkommentare oder Leserbriefe lediglich beobachten (kein Community-Management)
  Sonstige organisatorische und verwaltende Tätigkeiten",
  "1.	überregionale Tageszeitung
  2.	Lokal- /Regionalzeitungen
  3.	Wochenzeitung, Zeitschrift, Illustrierte
  4.	Radio
  5.	Fernsehen
  6.	Online-Zeitungen
  7.	Soziale Netzwerke (z.B. Facebook, Twitter, LinkedIn)
  8.	Instant Messenger (z.B. Whatsapp)
  "))
FRAGEN <- data.frame(name, text)

# Objekte entfernen
rm(QUESTIONS)
rm(n)
rm(label)
rm(name)
rm(text)