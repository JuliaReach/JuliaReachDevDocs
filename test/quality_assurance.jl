using JuliaReachDevDocs, Test
import Aqua, ExplicitImports

@testset "ExplicitImports tests" begin
    @test isnothing(ExplicitImports.check_all_explicit_imports_are_public(JuliaReachDevDocs))
    @test isnothing(ExplicitImports.check_all_explicit_imports_via_owners(JuliaReachDevDocs))
    @test isnothing(ExplicitImports.check_all_qualified_accesses_are_public(JuliaReachDevDocs))
    @test isnothing(ExplicitImports.check_all_qualified_accesses_via_owners(JuliaReachDevDocs))
    @test isnothing(ExplicitImports.check_no_implicit_imports(JuliaReachDevDocs))
    @test isnothing(ExplicitImports.check_no_self_qualified_accesses(JuliaReachDevDocs))
    @test isnothing(ExplicitImports.check_no_stale_explicit_imports(JuliaReachDevDocs))
end

@testset "Aqua tests" begin
    Aqua.test_all(JuliaReachDevDocs)
end
