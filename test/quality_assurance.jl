using JuliaReachDevDocs, Test
import Aqua, ExplicitImports

@testset "ExplicitImports tests" begin
    ExplicitImports.test_explicit_imports(JuliaReachDevDocs)
end

@testset "Aqua tests" begin
    Aqua.test_all(JuliaReachDevDocs)
end
