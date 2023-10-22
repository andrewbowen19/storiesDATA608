library(tidyverse)

# Simulate 100 normally-distributed project estimate and actual completion times
# Make the estimates' average lower than the actual
completion_times <- rnorm(100, 10, 2)
est_completion_times <- rnorm(100, 8, 1)

# df <- as.data.frame(cbind(completion_times, est_completion_times))
df = data.frame(x = c(completion_times, est_completion_times), 
               type=rep(c("Actual", "Estimate"), c(length(completion_times), length(est_completion_times))))

p_est <- ggplot(df) +
    geom_density(aes(x=x, color=type, fill=type), alpha=0.5) +
    geom_density(aes(x=x, color=type, fill=type), alpha=0.5) + 
    labs(x = "Completion Time", y="Percent of Projects")


p_est

