# Plot to be part of a logo (currently used for discord)
library(ggplot2)
library(palmerpenguins)

ggplot(penguins) +
    aes(x = flipper_length_mm, y = body_mass_g) +
    geom_point(shape = 16, size = 3,
        mapping = aes(colour = species)) +
    geom_smooth(method = "lm", se = FALSE, formula = y ~ x,
        mapping = aes(colour = species), linewidth = 2) +
    geom_smooth(method = "lm", se = FALSE, formula = y ~ x,
        colour = "black", linetype = 2, linewidth = 2) +
    geom_hline(yintercept = mean(penguins$body_mass_g, na.rm = TRUE),
        colour = "darkgrey", linetype = 4, linewidth = 2) +
    theme_void() +
    theme(legend.position = "none")
