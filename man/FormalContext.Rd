% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/formal_context.R
\name{FormalContext}
\alias{FormalContext}
\title{R6 class for a formal context}
\description{
This class implements the data structure and methods for formal contexts.
}
\section{Public fields}{

\itemize{
\item \code{I}: the table for the formal context.
\item \code{attributes}: name of the attributes in the formal context.
\item \code{objects}: name of the objects in the context.
\item \code{grades_set}: set of grades (in [0, 1]) of the attributes.
\item \code{concepts}: list of concepts (extent, intent).
\item \code{implications}: extracted implications as an \code{ImplicationSet}.
}
}

\examples{
# Build and print the formal context
fc_planets <- FormalContext$new(planets)
print(fc_planets)

# Plot the formal context
fc_planets$plot()

# Define a set of attributes
S <- SparseSet$new(attributes = fc_planets$attributes)
S$assign(moon = 1, large = 1)

# Compute the closure of S
Sc <- fc_planets$closure(S)
# Is Sc a closed set?
fc_planets$is_closed(Sc)

# Clarify and reduce the formal context
fc2 <- fc_planets$reduce(TRUE)

# Find implications
fc_planets$find_implications()

}
\references{
Guigues J, Duquenne V (1986). “Familles minimales d'implications informatives résultant d'un tableau de données binaires.” \emph{Mathématiques et Sciences humaines}, \emph{95}, 5-18.

Ganter B, Wille R (1999). \emph{Formal concept analysis : mathematical foundations}. Springer. ISBN 3540627715.

Belohlavek R (2002). “Algorithms for fuzzy concept lattices.” In \emph{Proc. Fourth Int. Conf. on Recent Advances in Soft Computing}. Nottingham, United Kingdom, 200-205.

Hahsler M, Grun B, Hornik K (2005). “arules - a computational environment for mining association rules and frequent item sets.” \emph{J Stat Softw}, \emph{14}, 1-25.
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-new}{\code{FormalContext$new()}}
\item \href{#method-is_empty}{\code{FormalContext$is_empty()}}
\item \href{#method-intent}{\code{FormalContext$intent()}}
\item \href{#method-extent}{\code{FormalContext$extent()}}
\item \href{#method-closure}{\code{FormalContext$closure()}}
\item \href{#method-obj_concept}{\code{FormalContext$obj_concept()}}
\item \href{#method-att_concept}{\code{FormalContext$att_concept()}}
\item \href{#method-is_concept}{\code{FormalContext$is_concept()}}
\item \href{#method-is_closed}{\code{FormalContext$is_closed()}}
\item \href{#method-clarify}{\code{FormalContext$clarify()}}
\item \href{#method-reduce}{\code{FormalContext$reduce()}}
\item \href{#method-standardize}{\code{FormalContext$standardize()}}
\item \href{#method-find_concepts}{\code{FormalContext$find_concepts()}}
\item \href{#method-find_implications}{\code{FormalContext$find_implications()}}
\item \href{#method-to_transactions}{\code{FormalContext$to_transactions()}}
\item \href{#method-save}{\code{FormalContext$save()}}
\item \href{#method-load}{\code{FormalContext$load()}}
\item \href{#method-dim}{\code{FormalContext$dim()}}
\item \href{#method-print}{\code{FormalContext$print()}}
\item \href{#method-to_latex}{\code{FormalContext$to_latex()}}
\item \href{#method-plot}{\code{FormalContext$plot()}}
\item \href{#method-clone}{\code{FormalContext$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-new"></a>}}
\subsection{Method \code{new()}}{
Creator for the Formal Context class
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FormalContext$new(I, remove_const = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{I}}{(numeric matrix) The table of the formal context.}

\item{\code{remove_const}}{(logical) If \code{TRUE}, remove constant columns. The default is \code{FALSE}.}
}
\if{html}{\out{</div>}}
}
\subsection{Details}{
Columns of \code{I} should be named, since they are the names of the attributes of the formal context.

If no \code{I} is used, the resulting \code{FormalContext} will be empty and not usable unless for loading a previously saved one.
}

\subsection{Returns}{
An object of the \code{FormalContext} class.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-is_empty"></a>}}
\subsection{Method \code{is_empty()}}{
Check if the \code{FormalContext} is empty
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FormalContext$is_empty()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
\code{TRUE} if the \code{FormalContext} is empty, that is, has not been provided with a matrix, and \code{FALSE} otherwise.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-intent"></a>}}
\subsection{Method \code{intent()}}{
Get the intent of a fuzzy set of objects
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FormalContext$intent(S)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{S}}{(\code{SparseSet}) The set of objects to compute the intent for.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A \code{SparseSet} with the intent.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-extent"></a>}}
\subsection{Method \code{extent()}}{
Get the extent of a fuzzy set of attributes
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FormalContext$extent(S)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{S}}{(\code{SparseSet}) The set of attributes to compute the extent for.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A \code{SparseSet} with the intent.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-closure"></a>}}
\subsection{Method \code{closure()}}{
Get the closure of a fuzzy set of attributes
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FormalContext$closure(S)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{S}}{(\code{SparseSet}) The set of attributes to compute the closure for.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A \code{SparseSet} with the closure.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-obj_concept"></a>}}
\subsection{Method \code{obj_concept()}}{
Object Concept
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FormalContext$obj_concept(object)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{object}}{(character) Name of the object to compute its associated concept}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
The object concept associated to the object given.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-att_concept"></a>}}
\subsection{Method \code{att_concept()}}{
Attribute Concept
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FormalContext$att_concept(attribute)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{attribute}}{(character) Name of the attribute to compute its associated concept}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
The attribute concept associated to the attribute given.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-is_concept"></a>}}
\subsection{Method \code{is_concept()}}{
Is a Concept?
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FormalContext$is_concept(C)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{C}}{A \code{SparseConcept} object}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
\code{TRUE} if \code{C} is a concept.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-is_closed"></a>}}
\subsection{Method \code{is_closed()}}{
Testing closure of attribute sets
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FormalContext$is_closed(S)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{S}}{A \code{SparseSet} of attributes}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
\code{TRUE} if the set \code{S} is closed in this formal context.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clarify"></a>}}
\subsection{Method \code{clarify()}}{
Clarify a formal context
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FormalContext$clarify(copy = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{copy}}{(logical) If \code{TRUE}, a new \code{FormalContext} object is created with the clarified context, otherwise the current one is overwritten.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
The clarified \code{FormalContext}.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-reduce"></a>}}
\subsection{Method \code{reduce()}}{
Reduce a formal context
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FormalContext$reduce(copy = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{copy}}{(logical) If \code{TRUE}, a new \code{FormalContext} object is created with the clarified and reduced context, otherwise the current one is overwritten.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
The clarified and reduced \code{FormalContext}.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-standardize"></a>}}
\subsection{Method \code{standardize()}}{
Build the Standard Context
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FormalContext$standardize()}\if{html}{\out{</div>}}
}

\subsection{Details}{
All concepts must be previously computed.
}

\subsection{Returns}{
The standard context using the join- and meet- irreducible elements.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-find_concepts"></a>}}
\subsection{Method \code{find_concepts()}}{
Use Ganter Algorithm to compute concepts
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FormalContext$find_concepts(verbose = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{verbose}}{(logical) TRUE will provide a verbose output.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A list with all the concepts in the formal context.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-find_implications"></a>}}
\subsection{Method \code{find_implications()}}{
Use modified Ganter algorithm to compute both concepts and implications
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FormalContext$find_implications(save_concepts = TRUE, verbose = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{save_concepts}}{(logical) \code{TRUE} will also compute and save the concept lattice. \code{FALSE} is usually faster, since it only computes implications.}

\item{\code{verbose}}{(logical) \code{TRUE} will provide a verbose output.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
Nothing, just updates the internal fields \code{concepts} and \code{implications}.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-to_transactions"></a>}}
\subsection{Method \code{to_transactions()}}{
Convert the formal context to object of class \code{transactions} from the \code{arules} package
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FormalContext$to_transactions()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
A \code{transactions} object.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-save"></a>}}
\subsection{Method \code{save()}}{
Save a \code{FormalContext} to RDS format
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FormalContext$save(filename = tempfile(fileext = ".rds"))}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{filename}}{(character) Path of the RDS file where to store the \code{FormalContext}.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
Invisibly the current \code{FormalContext}.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-load"></a>}}
\subsection{Method \code{load()}}{
Load a \code{FormalContext} from a RDS file
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FormalContext$load(filename)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{filename}}{(character) Path of the RDS file to load the \code{FormalContext} from.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
The loaded \code{FormalContext}.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-dim"></a>}}
\subsection{Method \code{dim()}}{
Dimensions of the formal context
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FormalContext$dim()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
A vector with (number of objects, number of attributes).
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-print"></a>}}
\subsection{Method \code{print()}}{
Prints the formal context
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FormalContext$print()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
Prints information regarding the formal context.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-to_latex"></a>}}
\subsection{Method \code{to_latex()}}{
Write the context in LaTeX format
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FormalContext$to_latex(label = "", caption = "")}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{label}}{(character) The label for the table environment.}

\item{\code{caption}}{(character) The caption of the table.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A table environment in LaTeX.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-plot"></a>}}
\subsection{Method \code{plot()}}{
Plot the formal context table
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FormalContext$plot(to_latex = FALSE, ...)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{to_latex}}{(logical) If \code{TRUE}, export the plot as a \code{tikzpicture} environment that can be included in a \code{LaTeX} file.}

\item{\code{...}}{Other parameters to be passed to the \code{tikzDevice} that renders the lattice in \code{LaTeX}, or for the figure caption. See \code{Details}.}
}
\if{html}{\out{</div>}}
}
\subsection{Details}{
Particular parameters that control the size of the \code{tikz} output are: \code{width}, \code{height} (both in inches), and \code{pointsize} (in points), that should be set to the font size used in the \code{documentclass} header in the \code{LaTeX} file where the code is to be inserted.

If a \code{caption} is provided, the whole \code{tikz} picture will be wrapped by a \code{figure} environment and the caption set.
}

\subsection{Returns}{
Nothing, just plots the formal context.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FormalContext$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
