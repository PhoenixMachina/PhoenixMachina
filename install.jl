Pkg.update()
Pkg.add("HttpServer")
Pkg.add("Logging")
Pkg.add("Markdown")
if !("MySQL" in keys(Pkg.installed()))
  Pkg.clone("https://github.com/JuliaComputing/MySQL.jl")
end
if !("Tlaloc" in keys(Pkg.installed()))
  Pkg.clone("https://github.com/PhoenixMachina/Tlaloc")
end
Pkg.add("SecureSessions")
