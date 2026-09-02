#### Custom ggplot theme
# Fiona Messer
# 02/09/2026

theme_FM <- function() {
  # Set base theme and font family =============================================
  theme_minimal(
    base_family = "Apple SD Gothic Neo"
  ) +
    # Overwrite base theme defaults ============================================
  theme(
    # Text elements ==========================================================
    plot.title = element_text(
      size = 16,
      face = "bold",
      color = "#010010",
      margin = margin(b = 10)
    ),
    plot.subtitle = element_text(
      size = 13,
      color = "#999999",
      margin = margin(b = 10)
    ),
    plot.caption = element_text(
      size = 13,
      color = "#777777",
      margin = margin(t = 15),
      hjust = 0
    ),
    axis.title = element_text(
      size = 12,
      color = "#010010"
    ),
    axis.text = element_text(
      size = 11,
      color = "#555555"
    ),
    plot.title.position = "plot",
    plot.caption.position = "plot",
    # Line elements ==========================================================
    panel.background = element_rect(
      fill = "transparent", 
      colour = "#010010", 
      linewidth = 0.5),
    panel.grid.minor = element_blank(),
    panel.grid.major = element_line(
      linetype = "dashed",
      linewidth = 0.15,
      color = "#999999"
    ),
    panel.grid.major.x = element_blank(),
    axis.ticks = element_line(
      linetype = "solid",
      linewidth = 0.5,
      color = "#010010"
    ),
    axis.ticks.length = unit(4, units = "pt"),
  # Size and ratio =============================================================
    aspect.ratio = 0.75)
}
