module = "examx"
maindir = "."
installfiles = {"*.sty", "*.cls", "*.clo"}
sourcefiles = {"*.dtx", "*.ins", "examx-ltxdoc-commands.def", "examx.cfg"}
typesetfiles = {"*.dtx", "examx-master.tex"}

checkengines = "xetex"
checkruns = "2"
stdengine = "xetex"

packtdszip = true
uploadconfig = {
  pkg         = "examx",
  author      = "Sebastien Laclau",
  license     = "lppl1.3c",
  ctanPath    = "/macros/latex/contrib/examx",
  repository  = "https://github.com/slaclau/examx/",
  summary     = "Extension to exam class.",
}