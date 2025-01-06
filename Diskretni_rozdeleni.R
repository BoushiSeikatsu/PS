# ---- Poisonovo rozdeleni ----
# Pocet vyskytu udalosti v uzavrene oblasti v case/na plose/objemu 
# Matematicky zapis - Po(lambda * t)
# stredni hodnota a rozptyl: E(X) = D(X) = lambda * t
# kde lambda je pocet udalosti v jednotce casu/na plose/objemu
# t je cas/plocha/objem
# v R - dpois(x, lambda * t)
# x - pocet udalosti

lambda_t = 22 # pocet udalosti v jednotce casu/na plose/objemu
x = 0:50 # pocet udalosti
poisson = dpois(x, lambda_t)
#graf pravdepodobnostni funkce
plot(x, poisson, type="h", lwd=2, col="blue", xlab="Pocet udalosti", ylab="P(X)", main="Poissonovo rozdeleni")
#graf distribucni funkce
plot(x, ppois(x, lambda_t), type="s", lwd=2, col="red", xlab="Pocet udalosti", ylab="P(X)", main="Poissonovo rozdeleni")
#smerodatna odchylka
sd_poisson = sqrt(lambda_t)
sd_poisson

#pravdepodobnost, ze pocet udalosti bude vice nez napr 30
# P(X > 30) = 1 - P(X <= 30)
events1 = 30
1 - ppois(events1, lambda_t)

#pravdepodobnost, ze pocet udalosti bude vice nez napr 35, pokud uz nastalo 30 udalosti
#pravdepodobnost pruniku / pravdepodobnost podminkova
# P(X > 35 | X > 30) = P(X > 35) / P(X > 30) = (1 - P(X <= 35)) / (1 - P(X <= 29))
events1 = 29
events2 = 35
(1 - ppois(events2, lambda_t)) / (1 - ppois(events1, lambda_t))

#pravdepodobnost ze udalosti bude za 5 * lambda_t  mene nez napr 130
# P(X < 130) = P(X <= 129)
events1 = 129
ppois(events1, lambda_t * 5)

#dalsi zadani
lambda_t = 4
#graf pravdepodobnostni funkce
x = 0:20 # pocet udalosti
poisson = dpois(x, lambda_t)
plot(x, poisson, type="h", lwd=2, col="blue", xlab="Pocet udalosti", ylab="P(X)", main="Poissonovo rozdeleni")
#graf distribucni funkce
plot(x, ppois(x, lambda_t), type="s", lwd=2, col="red", xlab="Pocet udalosti", ylab="P(X)", main="Poissonovo rozdeleni")
#smerodatna odchylka
sd_poisson = sqrt(lambda_t)
sd_poisson

#pravdepodobnost, ze pocet udalosti bude nejvyse 6
#P(X <= 6) = ppois(6, lambda_t)
events1 = 5
ppois(events1, lambda_t)

#pravdepodobnost, ze pocet udalosti bude alespon 5 jestlize uz ke 3 doslo
#P(X >= 5 | X >= 3)  = P(x>=5) / P(x>=3) = 1 - P(x<=4) / 1 - P(x<=2)
(1 - ppois(4, lambda_t)) / (1 - ppois(2, lambda_t))

#pravdepodobnost ze dojde k prave 10 udalostem za 2 jednotky casu
#P(X = 10) = dpois(10, lambda_t * 2)
events1 = 10
dpois(events1, lambda_t * 2)

# ---- Binomicke rozdeleni ----
# Pocet uspechu v n nezavislych pokusech
# Matematicky zapis - Bin(n, π)
# n - pocet pokusu
# π/p - pravdepodobnost uspechu
# stredni hodnota : E(X) = n * p
# rozptyl: D(X) = n * p * (1 - p)
# kde n je pocet pokusu

#graf pravdepodobnostni funkce
x = 0:30 # pocet uspechu
plot(x, dbinom(x, 200, 0.05), type="h", lwd=2, col="blue", xlab="Pocet uspechu", ylab="P(X)", main="Binomicke rozdeleni")
#graf distribucni funkce
plot(x, pbinom(x, 200, 0.05), type="s", lwd=2, col="red", xlab="Pocet uspechu", ylab="P(X)", main="Binomicke rozdeleni")

n = 200
p = 0.05
#stredni hodnota
E = n * p
# smerodatna odchylka
sd_binom = sqrt(n * p * (1 - p))
sd_binom
#rozptyl
D = n * p * (1 - p)
D

#pravdepodobnost, ze pocet uspechu bude alespon napr 5
# P(X >= 5) = 1 - P(X < 5) = 1 - P(X <= 4)
events1 = 4
1 - pbinom(events1, n, p)

#pravdepodobnost, ze pocet uspechu bude alespon napr 10 ale nejvyse 20
# P(10 <= X <= 20) = P(X <= 20) - P(X < 10) = P(X <= 20) - P(X <= 9)
events1 = 20
events2 = 9
pbinom(events1, n, p) - pbinom(events2, n, p)

# ---- Negativne binomicke(Pascalovo) rozdeleni ----
# Pocet Bernoulli pokusu do dosazeni k-teho uspechu(vcetne k-teho)
# Matematicky zapis - NB(k, π)
# V R - pnbinom(n-k, k, p)
# k - pocet uspechu
# π/p - pravdepodobnost uspechu
# n - pocet vysledku s jinou hodnotou nez uspech
# stredni hodnota : E(X) = k / p
# rozptyl: D(X) = k * (1 - p) / p^2


p = 0.8
k = 10
#graf pravdepodobnostni funkce
x = 0:100 # pocet jinych vysledku (chcu tam mit celou pravdepodobnostni funkci-az zacne klesat)
plot(x, dnbinom(x, k, p), type="h", lwd=2, col="blue", xlab="Pocet pokusu", ylab="P(X)", main="Negativne binomicke rozdeleni")
#graf distribucni funkce
plot(x, pnbinom(x, k, p), type="s", lwd=2, col="red", xlab="Pocet pokusu", ylab="P(X)", main="Negativne binomicke rozdeleni")

#stredni hodnota
E = k / p
E
# smerodatna odchylka
sd_neg_binom = sqrt(k * (1 - p) / p^2)
sd_neg_binom

#pravdepodobnost, ze pocet pokusu bude must byt vice nez 15 na 10 uspechu
# P(X > 15) = 1 - P(X <= 15)
# v R - 1 - pnbinom(15-10, 10, 0.2)
events1 = 15
1 - pnbinom(events1 - k, k, p)

#pravdepodobnost, ze alespon 8 z 30 budou neuspechy
# pozor! prechazime na binomicke rozdeleni, protoze chceme pocet uspechu v n pokusech
#otocime uspechy a neuspechy
p = 0.2
k = 8
# P(X >= 8) = 1 - P(X < 8) = 1 - P(X <= 7)
#1 - pbinom(7, 30, p)

# ---- Hypergeometricke rozdeleni ----
# v souboru je N prvků, z nichz M ma danou vlastnost. Zbytek ne
# vybereme n prvků bez vraceni
# Matematicky zapis - H(N, M, n)
# v R - dhyper(x, M, N-M, n)
# N - pocet prvků
# M - pocet prvků s danou vlastnosti
# n - pocet vyberu
# x - pocet uspechu
# stredni hodnota : E(X) = n * M / N
# rozptyl: D(X) = n * (M / N) * (1 - (M/N)) * ((N - n) / (N - 1))

N = 200
M = 30 # pocet prvku se sledovanou vlastnosti
n = 20 # pocet vyberu

#graf pravdepodobnostni funkce
x = 0:20 # pocet uspechu
plot(x, dhyper(x, M, N-M, n), type="h", lwd=2, col="blue", xlab="Pocet uspechu", ylab="P(X)", main="Hypergeometricke rozdeleni")
#graf distribucni funkce
plot(x, phyper(x, M, N-M, n), type="s", lwd=2, col="red", xlab="Pocet uspechu", ylab="P(X)", main="Hypergeometricke rozdeleni")

#stredni hodnota
E = n * M / N
E
# smerodatna odchylka
sd_hyper = sqrt(n * (M / N) * (1 - (M/N)) * ((N - n) / (N - 1)))
sd_hyper

#pravdepodobnost, ze pocet uspechu bude 3 nebo 4
# P(3 <= X <= 4) = P(X <= 4) - P(X < 3) = P(X <= 4) - P(X <= 2)
# nebo P(X = 3) + P(X = 4)
events1 = 4
events2 = 2
phyper(events1, M, N-M, n) - phyper(events2, M, N-M, n)
dhyper(3, M, N-M, n) + dhyper(4, M, N-M, n)

#udelame jenom 1 pokus
n = 1
#pravdepodobnost, ze pocet uspechu bude 1
# P(X = 1)
dhyper(1, M, N-M, n)

#chceme 1 uspech a prave ve 4. pokusy
n = 4
#pravdepodobnost, ze prvni 3 pokusy budou neuspechy
dhyper(0, M, N-M, n-1) * dhyper(1, M, N-M-(n-1), 1)


