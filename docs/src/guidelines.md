# Coding guidelines

This section is a reference for commonly used coding guidelines adopted in JuliaReach
projects. There are several style guides in the Julia ecosystem;
see [Other style guides](@ref) for some of them.

```@contents
Pages = ["guidelines.md"]
Depth = 3
```

## Source-code guidelines

- Use 4 space characters for indentation.

- In error messages, make the first word lowercase and do not add a period in the end.

- Use empty space in assignments:

  -  `n=length(q)` (no)
  -  `n = length(q)` (yes)

- The previous convention has an exception: using `=` in keyword arguments:

  - `convex_hull(p, algorithm = "monotone_chain")` (no)
  - `convex_hull(p, algorithm="monotone_chain")` (yes)

- Use empty space after commas:

  - `evaluate(p,D)` (no)
  - `evaluate(p, D)` (yes)

- Try to stay within 80 characters both for code and documentation. For type and function signatures this usually requires line breaks if there are many arguments or they have long names. In this case we write each argument in a new line if it looks better. If the offending line is a string, you can divide it into smaller chunks with `*`, as in:

```julia
    @assert dim(P) == size(M, 2) "a linear map of size $(size(M)) cannot be " *
                                 "applied to a set of dimension $(dim(P))"
```

!!! note
    The 80 characters rule should not be enforced in all cases, but is rather a soft guideline.

- Use the full `function f() ... end` instead of `f() = ...`. However, the short
  form is preferable in constructors and aliases such as `×(X::LazySet, Y::LazySet) = CartesianProduct(X, Y)`.

- Use the following conventions for type parameters:
  * `N` for numeric types
  * `VN` for vectors of numeric type `N`
  * `MN` for matrices of numeric type `N`
  * `S` for set types

- To indicate helper functions that are not part of the API, use a leading
  underscore for the function name, as in `_myfun`.

- Read [Julia's Style Guide](https://docs.julialang.org/en/v1/manual/style-guide/#Style-Guide-1).

## Documentation guidelines

### Generating the documentation

To generate the HTML documentation we rely on the `docs/make.jl` script that is interpreted using Julia's documentation generator package [Documenter.jl](https://juliadocs.github.io/Documenter.jl/stable/). You can build the documentation locally and verify the changes with the following command:

```
$ julia --color=yes docs/make.jl
```
This will deploy the docs in `docs/build` with `index.html` being the start page.

Observe that the `docs/build` folder is and should not be included in the `master` branch: in fact, the build system automatically pushes this folder to the `gh-pages` branch after each commit. This means that each time that a commit is merged into the `master` branch in Github, the updated documentation will be available as soon as the continuous integration finishes (this usually takes a couple of minutes).

### Mathematical notation

Mathematical formulas are written in LaTeX inside double backticks. If possible you should use Unicode; otherwise remember that the backslash character should be written twice.

```
``\delta[TAB]A``
```

Notice that the string is inside double back-ticks, and that we use the TAB key to transform into Unicode. In those cases where there is no Unicode character, you can use *two* backslash characters.

```
``\\mathcal{X}_0``
```

Finally, Documenter can also parse usual LaTeX dollar sign notation for the Markdown files. In that case, only one backslash is needed. For more examples consult [Documenter.jl](https://juliadocs.github.io/Documenter.jl/stable/) or check the various examples in our project's source code.

### Writing docstrings

In this section we give the guidelines for writing docstrings of functions and types. We give two concrete examples. You can find more examples by searching in the source files.

#### Documenting functions

The docstring of a function should consist of following parts, in the given order:

|Part|Category|Description|
|-----|-----|-----|
|Signature | Mandatory|List the function's name and arguments (include the argument types and the return type, i.e., just copy the signature from the source code; mark optional arguments in brackets)|
|Brief description | Mandatory|One-line purpose of the function|
|Input|Mandatory|All input arguments, optional or not, and valid keyword arguments|
|Output|Mandatory|The return value(s) of the function together with a description; "Nothing." if no value is returned.|
|Notes|Optional|Additional details about the function|
|Algorithm|Optional but recommended|Details on the implementation and the relation to other functions|
|Examples|Optional but recommended|Give concrete, self-contained applications of this function|

Below we provide a concrete example:

```julia
"""
    monotone_chain!(points::Vector{VN}; sort::Bool=true
                   )::Vector{VN} where {VN<:AbstractVector{N}} where {N<:Real}

Compute the convex hull of points in the plane using Andrew's monotone chain
method.

### Input

- `points` -- list of 2D vectors; is sorted in-place inside this function
- `sort`   -- (optional, default: `true`) flag for sorting the vertices
              lexicographically; sortedness is required for correctness

### Output

List of vectors containing the 2D coordinates of the corner points of the
convex hull.

### Notes

For large sets of points, it is convenient to use static vectors to get
maximum performance. For information on how to convert usual vectors
into static vectors, see the type `SVector` provided by the
[StaticArrays](http://juliaarrays.github.io/StaticArrays.jl/stable/)
package.

### Algorithm

This function implements Andrew's monotone chain convex hull algorithm to
construct the convex hull of a set of ``n`` points in the plane in
``O(n \\log n)`` time.
For further details see
[Monotone chain](https://en.wikibooks.org/wiki/Algorithm_Implementation/Geometry/Convex_hull/Monotone_chain)
"""
function monotone_chain!(points::Vector{VN}; sort::Bool=true
                        )::Vector{VN} where {VN<:AbstractVector{N}} where {N<:Real}
    ...
end
```

The following example has an optional argument, and it is surrounded with square brackets in the docstring by convention.

```julia
"""
    radius(H::Hyperrectangle, [p]::Real=Inf)::Real

Return the radius of a hyperrectangle.

### Input

- `H` -- hyperrectangle
- `p` -- (optional, default: `Inf`) norm

### Output

A real number representing the radius.

### Notes

The radius is defined as the radius of the enclosing ball of the given
``p``-norm of minimal volume with the same center.
"""
function radius(H::Hyperrectangle, p::Real=Inf)::Real
    ...
end
```

#### Documenting types

The docstring of a type should consist of the following parts:

|Part|Category|Description|
|-----|-----|-----|
|Signature |Mandatory|Describe the interface of this type (just copy the signature from the source code)|
|Brief description | Mandatory |One-line purpose of the type|
|Fields|Mandatory|Describe each field|
|Notes|Optional|Additional details about the type|
|Examples|Optional but recommended|Construction example (recommended if it has different constructors)|

Below we provide a concrete example:

```julia

"""
    DiscreteSystem <: AbstractSystem

Type that represents a system of discrete-time affine ODEs with nondeterministic
inputs,

``x_{k+1} = A x_{k} + u_{k}``

where:

- ``A`` is a square matrix
- ``x(0) ∈ \\mathcal{X}_0`` and ``\\mathcal{X}_0`` is a convex set
- ``u_{k} ∈ \\mathcal{U}_{k}``, where ``\\{\\mathcal{U}_{k}\\}_k`` is a
  set-valued sequence defined over ``[0, δ], ..., [(N-1)δ, N δ]`` for some
  ``δ>0``

### Fields

- `A`  -- square matrix, possibly of type `SparseMatrixExp`
- `X0` -- set of initial states
- `U`  -- nondeterministic inputs
- `δ`  -- discretization step

### Examples

- `DiscreteSystem(A::Union{AbstractMatrix{Float64}, SparseMatrixExp{Float64}},
                  X0::LazySet,
                  δ::Float64,
                  U::NonDeterministicInput)` -- default constructor
- `DiscreteSystem(A::Union{AbstractMatrix{Float64}, SparseMatrixExp{Float64}},
                  X0::LazySet,
                  δ::Float64)` -- constructor with no inputs
- `DiscreteSystem(A::Union{AbstractMatrix{Float64}, SparseMatrixExp{Float64}},
                  X0::LazySet,
                  δ::Float64,
                  U::LazySet)` -- constructor that creates a
  `ConstantNonDeterministicInput`
- `DiscreteSystem(A::Union{AbstractMatrix{Float64}, SparseMatrixExp{Float64}},
                  X0::LazySet,
                  δ::Float64,
                  U::Vector{<:LazySet})` -- constructor that creates a
  `TimeVaryingNonDeterministicInput`
"""
struct DiscreteSystem <: AbstractSystem
    ...
end
```

The following is an example of an abstract type, parametric in `N`, which defines an interface and includes a doctest.

````julia
"""
    AbstractHPolygon{N<:Real} <: AbstractPolygon{N}

Abstract type for polygons in H-representation (i.e., constraints).

### Notes

Every concrete `AbstractHPolygon` must have the following fields:
- `constraints_list::Vector{LinearConstraint{N}}` -- the constraints

```jldoctest
julia> subtypes(AbstractHPolygon)
2-element Array{Union{DataType, UnionAll},1}:
 LazySets.HPolygon
 LazySets.HPolygonOpt
```
"""
abstract type AbstractHPolygon{N<:Real} <: AbstractPolygon{N} end
````

### Writing doctests

Using [Documenter.jl](https://juliadocs.github.io/Documenter.jl/stable/), docstring examples can be incorporated to the doctesting framework using the `jldoctest` environment, see the [Doctests](https://juliadocs.github.io/Documenter.jl/stable/man/doctests/#Doctests-1) section of the documentation.

Here are some additional tips:

- To have the required modules available in the current file, write the following in triple backticks (e.g., see `docs/src/lib/representations.md` or [the documentation](https://juliadocs.github.io/Documenter.jl/stable/man/doctests/#Setup-Code-1)):

```
@meta
DocTestSetup = quote
    using LazySets
end
```

- To preserve definitions between blocks of code you can use [labels](https://juliadocs.github.io/Documenter.jl/stable/man/doctests/#Preserving-definitions-between-blocks-1). For example, use the environment `jldoctest ball2_label`.

- If you use several lines in REPL mode (`julia> ...`), you will have to include empty lines between the commands. Otherwise the variables from the previous commands are not available below.

- The doctests currently take a long time (~1min) because they generate some plots using `Plots.jl`. There is a line `doctest = true` in `make.jl` which you can set to `false` to allow building the documentation but skipping the doctests.

### Extending the online documentation

To add a function or a type in the online documentation, put the function's signature or type in a `@docs` block on the appropriate markdown (`.md`) file of the `/docs/src` folder.

For example, let the function

```julia
function dim(P::AbstractPolygon)::Int
   ...
end
```

It is added in the documentation of the `AbstractPolygon` interface, `/docs/src/lib/interfaces.md`, in the following way:

```julia
@docs
...
dim(P::AbstractPolygon)
```

Note that output type annotations is not needed. Also the variable's name is not needed and one could equally have written `dim(::AbstractPolygon)`.

In some cases, the function to be added contains an optional input. In those cases only the required arguments are needed. For instance, let:

```julia
    linear_map(M::AbstractMatrix, P::AbstractPolygon{N};
               output_type::Type{<:LazySet}=typeof(P)) where {N}
```

This function can be documented in a `@docs` block as:

```julia
linear_map(::AbstractMatrix, P::AbstractPolygon{N}) where N
```

In cases when there is no function overload, it is sufficient to write the function's name. For example, the function with signature

```julia
function convex_hull!(points::Vector{VN};
                      algorithm::String="monotone_chain"
                     )::Vector{VN} where {N<:Real, VN<:AbstractVector{N}}
...
end
```

Is documented in `/docs/src/lib/operations.md` as:

```julia
@docs
...
convex_hull!
```

### Adding plot recipe docstrings

A plot recipe can be added to the docs using the extension `RecipesBase.apply_recipe`. Moreover, it is important that you use pass the `Dict{Symbol,Any}`-type argument that corresponds to the plotting options; this argument is added automatically by the `@recipe` macro. Consider the example below:

```julia
"""
    plot_emptyset(∅::EmptySet, [ε]; ...)

Plot an empty set.

### Input

- `∅` -- empty set
- `ε` -- (optional, default: `0`) ignored, used for dispatch

### Output

An empty figure.
"""
@recipe function plot_emptyset(∅::EmptySet{N}, ε::N=zero(N); label="", grid=true,
                               legend=false) where {N<:Real}
    return []
end
```

This example has an optional argument with default value. Inside a `@docs` block we can add the docstring as follows:

```julia
RecipesBase.apply_recipe(::Dict{Symbol,Any}, ::EmptySet{N}, ::N=zero(N)) where {N<:Real}
```

## Other style guides

Below we list other Julia code style guides that we have found interesting.

- [Yet Another Style Guide For Julia](https://github.com/jrevels/YASGuide)
- [JuMP.jl style guide](http://www.juliaopt.org/JuMP.jl/dev/style/#Style-guide-and-design-principles-1)
- [Julia style guide](https://docs.julialang.org/en/v1.2/manual/style-guide/#Style-Guide-1)
- [ColPrac](https://github.com/SciML/ColPrac) -- Describes some best
  practices for collaborating on repositories. Following these practices makes it easier
  for contributors (new and old) to understand what is expected of them.
