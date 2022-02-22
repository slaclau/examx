module = "examx"
maindir = "."
sourcefiles = {"*.dtx", "*.ins", "examx-ltxdoc-commands.def"}
typesetfiles = {"*.dtx", "examx-master.tex"}
packtdszip = true
uploadconfig = {
  pkg         = "examx",
  author      = "Sebastien Laclau",
  license     = "lppl1.3c",
  ctanPath    = "/macros/latex/contrib/examx",
  repository  = "https://github.com/slaclau/examx/",
  summary     = "Extension to exam class.",
}