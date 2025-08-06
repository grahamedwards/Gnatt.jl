module Gnatt

export Date, Job, gantiffy

using Dates

"""

    Job

`Job` wraps a `start` date, `stop` date, job `name`, job `lead`, and any relevant `detail`s. The `Job` type is mutable and accepts initial keyword definitions (e.g. `Job(start=(2000,01))`). 

"""
@kwdef mutable struct Job 
    start::Date=today()
    stop::Date= Date(4200,12)
    name::String="Job name"
    lead::String="Lead name(s)"
    detail::String=""
end 

"""

    Gnatt.yrmo(d::Date)

Convert a year-month `Date` to float where the month is the ¹/₁₂ decimal of the year. 

## Examples

    julia> Gnatt.yrmo(Date(1996,8))
    1996.5833333333333

"""
yrmo(d::Date) = year(d) + (month(d)-1) / 12



"""

    gantiffy(jobs...)

Provides inputs to Makie's `barplot` function. Returns a NamedTuple that should be used as shown below:

## Example

    julia> g = gantiffy(job1, job2, job3, ...)

    julia> f = Makie.Figure()

    julia> ax = Makie.Axis(f[1,1]; g.axis...) 

    julia> Makie.barplot!(ax,g.jobs, g.stops; g.kwargs...)

Note the use of the semicolon `;` operators to separate `args` from `kwargs` in the `Axis` and `barplot` functions.

### Add a legend
The example below shows how to add a legend above the plot.

    julia> Legend(f[0,1], ax, tellheight=true, tellwidth=false, orientation=:horizontal);f

"""
function gantiffy(jobs::Job ...)

    n = length(jobs)
    starts = Vector{Float64}(undef,n)
    names = Vector{String}(undef,n)
    stops, leads, details = similar.((starts,names, names))
    
    @inbounds @simd ivdep for i=1:n
        starts[i] = yrmo(jobs[i].start)
        stops[i] = yrmo(jobs[i].stop )
        names[i] = jobs[i].name
        leads[i] = jobs[i].lead
        details[i] = jobs[i].detail
    end

    axis = (; yticks = (1:n, names),  xticks=minimum(starts):maximum(stops), ygridvisible=false, yticksvisible=false, xminorticks=minimum(starts):0.25:maximum(stops), xminorgridvisible=true, limits=(minimum(starts)-.25, maximum(stops)+.25, nothing, nothing),
    )

    unleads = unique(leads)

    leadcolor = [findfirst(x -> x==i, unleads) for i in leads]
    labels = [unleads[i] => (; color = i) for i in eachindex(unleads)]

    kwargs=(; 
        direction = :x, gap = 0.25,
        fillto = starts,
        colorrange = (1, length(unleads)),
        color= leadcolor,
        label = labels,
        bar_labels = details, label_position = :center,label_color = :white
    )

    return (; jobs=1:n, stops, kwargs, axis)
end

end