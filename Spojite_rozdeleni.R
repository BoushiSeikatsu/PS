# decil - hodnota, pod kterou padá 10% hodnot
# 6 decil - hodnota, pod kterou padá 60% hodnot
# V R to dostanu napr. takto:
# qbinom(0.6, 200, 0.05)
# ---- Rovnoměrné rozdělení ----
# Hustota prabděpodobnosti je konstantní v intervalu (a, b) a mimo něj je nulová
# Střední hodnota: E(X) = (a + b) / 2
# Rozptyl: D(X) = (b - a)^2 / 12
# Matematicky zapis - Ro(a; b)
# a - dolní mez intervalu
# b - horní mez intervalu
# v R - dunif(x, a, b)
# ---- Exponenciální rozdělení ----
# Délka časových intervalů mezi událostmi které se vyskytují nezávisle s konstantní intenzitou
# Poissonův proces: události se vyskytují nezávisle s konstantní intenzitou
# Matematicky zapis - Exp(lambda)
# v R - dexp(x, lambda)
# lambda - hustota událostí - 1 / střední hodnota
# x - délka intervalu
# strendni hodnota: E(X) = 1 / lambda
# rozptyl: D(X) = 1 / lambda^2

sd = 2
lambda = 1 / sd

#graf hustoty pravdepodobnosti
x = 0:10
plot(x, dexp(x, lambda), type="h", lwd=2, col="blue", xlab="Doba", ylab="P(X)", main="Exponencialni rozdeleni")
#graf distribucni funkce
plot(x, pexp(x, lambda), type="s", lwd=2, col="red", xlab="Doba", ylab="P(X)", main="Exponencialni rozdeleni")

#pravdepodobnost, ze doba bude kratsi nez 1 den
pexp(1, lambda)

#pravdepodobnost, ze doba bude delsi nez 3 dny jestlize je 2 dni porad v tele
# P(X > 3 | X > 2) = P(X > 3) / P(X > 2) = 1 - P(X <= 3) / 1 - P(X <= 2)
(1 - pexp(3, lambda)) / (1 - pexp(2, lambda))

# urcete dolni kvartil a interpretujte ho
qexp(0.25, lambda)
# je 25% pravdepodobnost, ze potrebna k vylouceni leku z tela dospleho bude kratsi nez 0.57 dne

#  ---- Weibullovo rozdělení ----
# zoobecneni exponencialniho rozdeleni - lze jim modelovat i obdobi detskych nemoci a obdobi stanuti
# Matematicky zapis - Wb(scale, shape)
# v R - dweibull(x, scale, shape)

shape = 1.2
scale = 300
# hustota pravdepodobnosti
x = 0:1000
plot(x, dweibull(x, scale = scale, shape = shape), type="h", lwd=2, col="blue", xlab="Doba", ylab="P(X)", main="Weibullovo rozdeleni")
# distribucni funkce
plot(x, pweibull(x, scale = scale, shape = shape), type="s", lwd=2, col="red", xlab="Doba", ylab="P(X)", main="Weibullovo rozdeleni")

#pravdepodobnost pro dobu kratsi nez 250
pweibull(250, scale = scale, shape = shape)

#pravdepodobnost pro dobu delsi nez 320 jestlize se po 290 nic nestalo
# P(X > 320 | X > 290) = P(X > 320) / P(X > 290) = 1 - P(X <= 320) / 1 - P(X <= 290)
(1 - pweibull(320, scale = scale, shape = shape)) / (1 - pweibull(290, scale = scale, shape = shape))

# urcete 7.decil a interpretujte ho
# 7.decil - hodnota, pod kterou padá 70% hodnot
qweibull(0.7, scale = scale, shape = shape)
# Je 70% pravdepodobnost, ze reakci doba osoby bezne populace bude kratsi nez 350.2

#  ---- Normální rozdělení ----
# Popisuje náhodné veličiny, jejichž hodnoty se symetricky shlukují kolem střední hodnoty(gausova krivka)
# Matematicky zapis - N(μ, σ^2)
# v R - dnorm(x, mean, sd)
# μ/mean - střední hodnota
# σ/sd - směrodatná odchylka
#  Pravidlo 3 sigma 
# 99.7% hodnot lezi v intervalu (μ - 3σ, μ + 3σ)
# 95.4% hodnot lezi v intervalu (μ - 2σ, μ + 2σ)
# 68.2% hodnot lezi v intervalu (μ - σ, μ + σ)

mean = 465
sd = 54

# hustota pravdepodobnosti
x = 200:700
plot(x, dnorm(x, mean = mean, sd = sd), type="h", lwd=2, col="blue", xlab="Doba", ylab="P(X)", main="Normalni rozdeleni")
# distribucni funkce
plot(x, pnorm(x, mean = mean, sd = sd), type="s", lwd=2, col="red", xlab="Doba", ylab="P(X)", main="Normalni rozdeleni")

#pravdepodobnost pro hodnotu vetsi nez 400
1 - pnorm(400, mean = mean, sd = sd)
# na grafu distribucni funkce je to cast osy y od hodnoty pro 400 do 1

#urcete 95. percentil a interpretujte ho
qnorm(0.95, mean = mean, sd = sd)
# 95% procent muzu ma silu stisku mensi nez 553.8N

# jaka je pravdepodobnost ze v nahodneho vyberu 30 osob bude prumer vyssu nez 480
n <- 30  # velikost výběru
x <- 480  # hodnota průměru

#Pravděpodobnost, že průměrná síla stisku bude větší než 480 N
1 - pnorm(x, mean = mean, sd = sd / sqrt(n))

