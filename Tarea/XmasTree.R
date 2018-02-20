n <- 10 ^ 5
library('ggplot2')

x <- rnorm(n, mean = 0, sd = sqrt(n:1))
y <- 1:n
z <- rep(0, n)
w <- sample(y, 100)
w1 <- sample(y, 100)
for (i in y) {
  if (abs(x[i]) < 300 & y[i] < 25000) {
    z[i] = 1
  }
  else{
    if (i %in% w) {
      z[i] = 2
    }
    else{
      if (i %in% w1) {
        z[i] = 3
      }
      
    }
    
  }
}

w <- ifelse(z == 2 | z == 3 , 1, 0)

Datos <- as.data.frame(cbind(x, y, z, w))


ggplot(Datos, aes(x , y , color = as.factor(z), size = as.factor(w))) +
  geom_point() + scale_color_manual(values = c("green4", "peru", "red3", "blue"))
ggsave(
  "XmasTree1.png",
  height = 8,
  width = 8,
  dpi = 120,
  type = "cairo-png"
)
