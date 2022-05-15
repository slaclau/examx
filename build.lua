module = "examx"
maindir = "."
installfiles = {"*.sty", "*.cls", "*.clo",
"*tikzconfigforworkbook.tex","examx-formulae.def"}
sourcefiles = {"*.dtx", "*.ins", "examx-ltxdoc-commands.def",
"examx-formulae.def", "tikzconfigforworkbook.tex"}
typesetfiles = {"*.dtx", "examxdoc.tex"}

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