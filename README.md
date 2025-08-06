# Gnatt

[![Docs](https://img.shields.io/badge/docs-dev-blue.svg)](https://grahamedwards.github.io/Gnatt.jl/dev/)
[![Build Status](https://github.com/grahamedwards/Gnatt.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/grahamedwards/Gnatt.jl/actions/workflows/CI.yml?query=branch%3Amain)

🦟 🦟 For all your Gantt chart needs 🦟 🦟


For each task that you need to include on your chart, create a `Job` instance, with information like the `start` date, the `stop` date, the task's `name`, the `lead`ing user/PI/party, and any other relevant `detail`s. 

Then, plop these bad boys into the convenience function `ganttify` to produce a NamedTuple that you can easily deposit into the [`Makie`](https://docs.makie.org/stable/)'s [barplot](https://docs.makie.org/stable/reference/plots/barplot#barplot) function. 


### Example coming eventually...