library(tidyr)
library(dplyr)
library(reshape2)
library(ggplot2)

powers = 0:10
cores = 2^powers
perfect_strong = cores
one_weak = 5
perfect_weak = rep(one_weak, length(cores))
good_strong = cores*(0.99^(powers*powers))
bad_strong = cores*(0.95^(powers*powers))
good_weak = perfect_weak + (1:length(cores) - 1)*one_weak*0.05
bad_weak = perfect_weak + (1:length(cores) - 1)*one_weak*0.5

df = data.frame(cores, perfect_strong, perfect_weak, good_strong, good_weak, bad_strong, bad_weak)
df_melt = melt(df, id="cores")
df_melt$variable = levels(df_melt$variable)[df_melt$variable]
df_melt = separate(df_melt, variable, c("kind", "scaling"), "_")

png("scaling_strong.png")
p = ggplot(filter(df_melt, scaling == "strong"), aes(cores, value, color=kind)) + geom_point() + theme_bw() + geom_line() + scale_y_log10() + scale_x_log10() + theme(legend.position="bottom") + ylab("Scalability") + xlab("Compute Resources") + labs(color="")
print(p)
dev.off()

png("scaling_weak.png")
p = ggplot(filter(df_melt, scaling == "weak"), aes(cores, value, color=kind)) + geom_point() + theme_bw() + geom_line() + scale_x_log10() + theme(legend.position="bottom") + ylab("Scalability") + xlab("Compute Resources") + labs(color="")
print(p)
dev.off()

