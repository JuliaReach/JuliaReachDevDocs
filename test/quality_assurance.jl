using JuliaReachDevDocs, Test
import Aqua

@testset "Aqua tests" begin
    Aqua.test_all(JuliaReachDevDocs)
end
