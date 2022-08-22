# load packages
library(tidyverse)
library(rstatix)
# data tidy
data <- iris %>%
  pivot_longer(1:4, names_to = "Types", values_to = "values") %>%
  group_by(Species, Types) %>%
  get_summary_stats(show = c("n","mean","sd","min","max")) %>%
  mutate(Types = as_factor(Types) %>% fct_relevel("Petal.Length", "Petal.Width","Sepal.Length","Sepal.Width"))

# barplot+errorbar
data %>% 
  ggplot(aes(Species, mean,fill = Types,
             ymin = mean-sd,
             ymax = mean+sd)) +
  geom_col(width = .5, position = position_dodge(.6),
           color = "black") +
  geom_errorbar(
    color = "#22292F",
    width = .1, position = position_dodge(.6)) +
  scale_y_continuous(expand = expansion(0),
                     limits = c(0, 10),
                     breaks = seq(0, 10, 2)) +
  ggsci::scale_fill_locuszoom() +
  #scale_fill_grey() +
  #scale_fill_brewer(palette="Set1")
  #scale_fill_manual(values = c("#FAFAFA", "#D4D4D4", "#737373")) +
  labs(
    y = "Mean"
  ) + 
  theme(
    plot.margin = unit(c(1, 1, 1, 1), "cm"),
    panel.background = element_blank(),
    plot.title = element_text(size = 22, face = "bold",
                              hjust = 0.5,
                              margin = margin(b = 15)),
    axis.line = element_line(color = "black"),
    axis.title = element_text(size = 22, color = "black",
                              face = "bold"),
    axis.text = element_text(size = 22, color = "black"),
    axis.text.x = element_text(margin = margin(t = 10)),
    axis.text.y = element_text(size = 17),
    axis.title.y = element_text(margin = margin(r = 10)),
    axis.ticks.x = element_blank(),
    legend.title = element_blank(),
    legend.position = c(.25, .8),
    legend.background = element_rect(color = "black"),
    legend.text = element_text(size = 15),
    legend.margin = margin(t = 5, l = 5, r = 5, b = 5),
    legend.key = element_rect(color = NA, fill = NA)
  ) +
  guides(
    fill = guide_legend(
      keywidth = 1,
      keyheight = 1,
      default.unit= "cm"
    )
  )

# point-line plot + errorbar
data %>% 
  ggplot(aes(Species, mean, color = Types, group = Types)) +
  geom_point() +
  geom_line() +
  geom_errorbar(
    aes(ymin = mean-sd,
        ymax = mean+sd),
    color = "#22292F",
    width = .1) +
  scale_y_continuous(expand = expansion(0),
                     limits = c(0, 10),
                     breaks = seq(0, 10, 2)) +
  ggsci::scale_color_locuszoom() +
  #scale_fill_grey() +
  #scale_fill_brewer(palette="Set1")
  #scale_fill_manual(values = c("#FAFAFA", "#D4D4D4", "#737373")) +
  labs(
    y = "Mean"
  ) + 
  theme(
    plot.margin = unit(c(1, 1, 1, 1), "cm"),
    panel.background = element_blank(),
    plot.title = element_text(size = 22, face = "bold",
                              hjust = 0.5,
                              margin = margin(b = 15)),
    axis.line = element_line(color = "black"),
    axis.title = element_text(size = 22, color = "black",
                              face = "bold"),
    axis.text = element_text(size = 22, color = "black"),
    axis.text.x = element_text(margin = margin(t = 10)),
    axis.text.y = element_text(size = 17),
    axis.title.y = element_text(margin = margin(r = 10)),
    axis.ticks.x = element_blank(),
    legend.title = element_blank(),
    legend.position = c(.25, .8),
    legend.background = element_rect(color = "black"),
    legend.text = element_text(size = 15),
    legend.margin = margin(t = 5, l = 5, r = 5, b = 5),
    legend.key = element_rect(color = NA, fill = NA)
  ) +
  guides(
    fill = guide_legend(
      keywidth = 1,
      keyheight = 1,
      default.unit= "cm"
    )
  )

# export png
ggsave("C:/Users/Dell/Desktop/barchart_apa.png", width = 10, height = 7, dpi = 300)