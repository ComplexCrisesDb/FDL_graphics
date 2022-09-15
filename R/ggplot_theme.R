
#  FDL color palette ####

FinDevLab_colours = list(
  FDL_1 =c("#709899","#395966","#c24c2c","#c99561","#e9be72"),
  FDL = c("#709899","#395966","#c99561","#c24c2c","#618e78","#e9be72",
          "#d3714e","#abc6b1","#5e6d68")
)

FinDevLab_palettes = function(name, n, all_palettes = FinDevLab_colours, type = c("discrete", "continuous")) {
  palette = all_palettes[[name]]
  if (missing(n)) {
    n = length(palette)
  }
  type = match.arg(type)
  out = switch(type,
               continuous = grDevices::colorRampPalette(palette)(n),
               discrete = palette[1:n]
  )
  structure(out, name = name, class = "palette")
}


scale_colour_FinDevLab_d = function(name) {
  ggplot2::scale_colour_manual(values = FinDevLab_palettes(name,
                                                           type = "discrete"))
}

scale_colour_FinDevLab_c = function(name) {
  ggplot2::scale_colour_gradientn(colours = FinDevLab_palettes(name = name,
                                                               type = "continuous"))
}

scale_fill_FinDevLab_c = function(name) {
  ggplot2::scale_fill_gradientn(colours = FinDevLab_palettes(name = name,
                                                             type = "continuous"))
}

scale_fill_FinDevLab_d= function(name) {
  ggplot2::scale_fill_manual(values = FinDevLab_palettes(name,
                                                         type = "discrete"))
}


scale_color_FinDevLab_d = scale_colour_FinDevLab_d
scale_color_FinDevLab_c = scale_colour_FinDevLab_c
