using JuliaReachDevDocs, Test
import Aqua, ExplicitImports, JET

@testset "ExplicitImports tests" begin
    ExplicitImports.test_explicit_imports(JuliaReachDevDocs)
end

@testset "JET tests" begin
    JET.test_package(JuliaReachDevDocs)
end

@testset "Aqua tests" begin
    Aqua.test_all(JuliaReachDevDocs)
end
