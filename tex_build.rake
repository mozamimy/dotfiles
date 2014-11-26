TEX_SOURCE = "main"

def execute_pdflatex
  sh "pdflatex #{TEX_SOURCE}"
end

def execute_bibtex
  sh "bibtex #{TEX_SOURCE}"
end

task :build do
  execute_pdflatex
  execute_bibtex
  2.times { execute_pdflatex }
end
