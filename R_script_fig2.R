library(ggplot2)
library(readxl)

#Import the data. The dates are in format YYYY-MM-DD.
table_for_fig <- read_excel("table for fig.xlsx", col_types = c("text", "text", "text", 
                                                +         "text", "numeric", "text", "text"))

table_for_fig$Date_r <- as.Date(table_for_fig$Date_r, origin="2014-01-01")    #transform data to Date

View(table_for_fig)


# For the presentation of the y-axis, I've then used the scales package according to this
# tutorial on log scales: https://www.datanovia.com/en/blog/ggplot-log-scale-transformation/
require(scales)

# Plot the data according to Publication date (X) and Number of cells or nuclei sequenced (y).
# Each data point corresponds to a publication. Colour shows the technique used for seqeuncing, 
#and shape shows whether the starting sample was whole cells or nuclei. 

my_plot <- ggplot(table_for_fig, aes(x=Date_r, y=Number_cells)) +
  geom_point(aes(col = Technique, fill= Technique, shape = sample, size=Technique)) + xlab("Publication date") + ylab("Number of cells / Nuclei") + 
  coord_trans(y="log10") +
  scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  geom_smooth(method='lm', col="black", linetype="dashed", se=FALSE)

my_plot + 
  scale_color_manual(values=c("#87275c", "#368c51", "#3299aa", "#f67446", "#f6db46")) + 
  scale_fill_manual(values=c("#87275c", "#368c51", "#3299aa", "#f67446", "#f6db46")) + 
  scale_size_manual(values=c(5, 5, 5, 5, 5)) +
  scale_shape_manual(values = c(21, 24)) +
  theme_classic()+theme(
    axis.title.x = element_text(size = 16),
    axis.title.y = element_text(size = 16)) +
  scale_x_date(breaks = date_breaks("years"), labels = date_format("%Y"))

ggsave("graph_for_fig2.pdf", width = 20, height = 20, units = "cm")

