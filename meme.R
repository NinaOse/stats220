# Meme creation

# Load packages
library(tidyverse)
library(magick)

# First cat with annotations
cat <- image_read("https://us-tuna-sounds-images.voicemod.net/78f23c41-369a-4769-9568-7aae749c4e06-1704762972412.jpg") %>% 
  image_scale("x400") %>%
  image_annotate("Me without coffee", font = "Comic Sans MS", size = 24, color = "black", gravity = "south")

# Second cat with annotations
cat2 <- image_read("https://upload.wikimedia.org/wikipedia/commons/0/04/So_happy_smiling_cat.jpg") %>%
  image_scale("x400") %>%
  image_annotate("Me with coffee", font = "Comic Sans MS", size = 24, color = "black", gravity = "south")
  
# Append images
meme <- c(cat,cat2)
meme <- image_append(meme)

# Save image
image_write(meme, "my_meme.png")


# Animation

# Cat 1 caption
Frame1 <- image_blank(width = 400, height = 400, color = "#ffffff") %>%
  image_annotate("Me without coffee", font = "Comic Sans MS", size = 24, color = "black", gravity = "center")

#Cat 1 image
Frame2 <- image_read("https://us-tuna-sounds-images.voicemod.net/78f23c41-369a-4769-9568-7aae749c4e06-1704762972412.jpg") %>% 
  image_scale("x400")
  
# Cat 2 caption
Frame3 <- image_blank(width = 400, height = 400, color = "#ffffff") %>%
  image_annotate("Me with coffee", font = "Comic Sans MS", size = 24, color = "black", gravity = "center")

# Cat 2 image
Frame4 <- image_read("https://upload.wikimedia.org/wikipedia/commons/0/04/So_happy_smiling_cat.jpg") %>%
  image_scale("x400")

#Create animation
gif <- c(Frame1, Frame2, Frame3, Frame4)
image_animate(gif,fps=1)

# Save animation
image_write(gif, "my_animation.gif")