using Gnatt
using Test

@testset "Gnatt.jl" begin


    
    j = Job()

    @test j.start == Gnatt.today()
    @test j.stop == Date(4200,12)
    @test isempty(j.detail)
    @test j.lead == "Lead name(s)"
    @test j.name == "Job name"

    j.start = Date(2000,2)
    @test j.start == Date(2000,2)

    @test Gnatt.yrmo(j.start) ≈ 2000 + 1/12


    @test keys(gantiffy(Job(), Job())) === (:jobs, :stops, :kwargs, :axis)

end
