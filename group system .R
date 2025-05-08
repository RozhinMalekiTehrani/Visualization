




library(dplyr)
library(GGally)

library(tidyverse)
library(RNHANES)
library(ggalluvial)
library(ggsci)
library(ggforce)

colnames(data)

library(ggplot2)
ggplot(data = data, )


library(dplyr)


data <- read.csv(file = '~/Desktop/همکاران سیستم/data.csv')


data = as.data.frame(data)
# Select specific columns
data1 <- dplyr::select(data, اضطرار, نوع.خدمت, اثر)


colnames(data)

# Omit NA values
data2 <- na.omit(data1)
data2$اثر <- as.factor(data2$اثر)

selected_columns <- c('اضطرار' , 'نوع.خدمت', 'اثر')

p <- ggparcoord(data2, columns = selected_columns, groupColumn = "اثر", order = 1:3)

p + scale_color_brewer(palette = "Set2")







# Convert columns to factors
#data2$اثر <- as.factor(data2$اثر)
#data2$حوزه <- as.factor(data2$حوزه)
#data2$شرکت.مالک <- as.factor(data2$شرکت.مالک)

# Create parallel coordinate plot
#ggplot(data2) +
#geom_parallel_sets(aes(fill = اثر, axis1 = شرکت.مالک, axis2 = حوزه, axis3 = اثر)) 
#+ theme_minimal()

#data1






#mosaic plot:


library(vcd)
library(colorspace)

# فرض کنید 'data' یک فریم داده است و 'بسته.قرارداد' و 'اثر' نام ستونهای شما هستند
tbl <- structable(~ data$بسته.قرارداد + data$اثر)

# محاسبه درصدها
percentages <- round(100 * prop.table(tbl), 1)

# تعریف پالت رنگی
palette <- rainbow_hcl(nlevels(tbl))

# ایجاد نمودار موزاییکی با رنگها
mosaic(tbl, pop = FALSE, col = palette, labeling_args = list(text = percentages, cex = 0.8))
