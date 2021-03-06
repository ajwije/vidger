% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vsBoxPlot.R
\name{vsBoxPlot}
\alias{vsBoxPlot}
\title{Box plot for \eqn{log_{10}}(FPKM or CPM) distributions}
\usage{
vsBoxPlot(data, d.factor = NULL, type = c("cuffdiff", "deseq", "edger"),
  title = TRUE, legend = TRUE, grid = TRUE, aes = c("box", "violin",
  "boxdot", "viodot", "viosumm", "notch"), fill.color = NULL,
  data.return = FALSE, xaxis.text.size = 10, yaxis.text.size = 10,
  xaxis.title.size = 12, yaxis.title.size = 12, main.title.size = 15,
  legend.text.size = 10, legend.title.size = 12)
}
\arguments{
\item{data}{output generated from calling the main routines of either
\code{cuffdiff}, \code{DESeq2}, or \code{edgeR} analyses. For
\code{cuffdiff}, this will be a \code{*_exp.diff} file. For \code{DESeq2},
this will be a generated object of class \code{DESeqDataSet}. For
\code{edgeR}, this will be a generated object of class \code{DGEList}.}

\item{d.factor}{a specified factor; for use with \code{DESeq2} objects only.
This input equates to the first parameter for the contrast argument when
invoking the \code{results()} function in \code{DESeq2}. Defaults to
\code{NULL}}

\item{type}{an analysis classifier to tell the function how to process the
data. Must be either \code{cuffdiff}, \code{deseq}, or \code{edger}.
\code{cuffdiff} must be used with \code{cuffdiff} data; \code{deseq} must
be used for \code{DESeq2} output; \code{edgeR} must be used with
\code{edgeR} data. See the \code{data} parameter for further details.}

\item{title}{display the main title of plot. Logical; defaults to
\code{TRUE}. If set to \code{FALSE}, no title will display in plot.}

\item{legend}{display legend of plot. Logical; defaults to \code{TRUE}.
If set to \code{FALSE}, no legend will display in plot.}

\item{grid}{display major and minor axis lines. Logical; defaults to
\code{TRUE}. If set to \code{FALSE}, no axis lines will display in plot.}

\item{aes}{changes overall layout of the graph. \code{box}: box plot;
\code{violin}: violin plot; \code{boxdot}: box plot with dots;
\code{viodot}: violin plot with dots; \code{viosumm}: violin plot with
summary statistics; \code{notch}: box plots with notches.
Defaults to \code{box}.}

\item{fill.color}{changes the fill color for the plots. See
\code{RColorBrewer::display.brewer.all()} function for further details.
If \code{NULL}, colors will default to standard \code{ggplot2}
aesthetics.}

\item{data.return}{returns data output of plot. Logical; defaults to
\code{FALSE}. If set to \code{TRUE}, a data frame will also be called.
Assign to object for reproduction and saving of data frame. See final
example for further details.}

\item{xaxis.text.size}{change the font size of the \code{x}-axis text. 
Defaults to \code{10}.}

\item{yaxis.text.size}{change the font size of the \code{y}-axis text. 
Defaults to \code{10}.}

\item{xaxis.title.size}{change the font size of the \code{x}-axis title 
text. Defaults to \code{12}.}

\item{yaxis.title.size}{change the font size of the \code{y}-axis title 
text. Defaults to \code{12}.}

\item{main.title.size}{change the font size of the plot title text. 
Defaults to \code{15}.}

\item{legend.text.size}{change the font size of the legend body text.
Defaults to \code{10}.}

\item{legend.title.size}{change the font size of the legend title text. 
Defaults to \code{12}.}
}
\value{
An object created by \code{ggplot}
}
\description{
This function allows you to extract necessary results-based data from
analytical objects to create a box plot comparing log10(FPKM or CPM)
distributions for experimental treatments.
}
\examples{
# Cuffdiff example
data("df.cuff")
vsBoxPlot(
     data = df.cuff, d.factor = NULL, type = "cuffdiff", title = TRUE,
     legend = TRUE, grid = TRUE
)

# DESeq2 example
data("df.deseq")
require(DESeq2)
vsBoxPlot(
     data = df.deseq, d.factor = "condition", type = "deseq",
     title = TRUE, legend = TRUE, grid = TRUE
)

# edgeR example
data("df.edger")
require(edgeR)
vsBoxPlot(
     data = df.edger, d.factor = NULL, type = "edger", title = TRUE,
     legend = TRUE, grid = TRUE
)

# Display different colors for plot
data("df.edger")
vsBoxPlot(
     data = df.edger, d.factor = NULL, type = "edger", title = TRUE,
     legend = TRUE, grid = TRUE, fill.color = "RdGy",
     data.return = FALSE
)

# Extract data frame from visualization
data("df.edger")
require(edgeR)
tmp <- vsBoxPlot(
     data = df.edger, d.factor = NULL, type = "edger", title = TRUE,
     legend = TRUE, grid = TRUE, data.return = FALSE
)
df_box <- tmp[[1]] ## or use tmp$data
head(df_box)

# Show plot from object (see prior example for more details)
tmp[[2]] ## or use tmp$plot
}
\author{
Brandon Monier, \email{brandon.monier@sdstate.edu}
}
