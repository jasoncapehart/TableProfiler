\documentclass{article}
\usepackage{graphicx}

\title{Table Profile}
\parskip 7.2pt

\begin{document}

\maketitle
\pagebreak

<% source("DataGen.R") ; source("FeatureProfileFunctions.R") %>
<%# Create the histograms %>
<% hist.list <- feature.hist(df) %>

<%# Create the descriptive statistics %>
<% stats.df <- descr.stats(df) %>

<%# Calculate the proportion of Nulls %>
<% missing.pct <- na.pct(df) %>

<% ncols <- dim(df)[2] %>
<% for(i in 1:ncols) { %>
<%= paste("\\noindent{\\Large\\underline{", i, ".) ", "{\\bfseries ", colnames(df)[i], "}}}", sep="") %>
\par\noindent
<%= paste("Percentage of Missing Values: ", missing.pct[i]) %>
\par\noindent
Descriptive Statistics
\par\noindent
<%= paste("\\subfloat{", "\\begin{minipage}[h]{", 1, "\\linewidth}\\centering", print(xtable(stats.df[i, ]), file = stderr(), table.placement = "", latex.environments = "", include.rownames = FALSE, floating = FALSE), "\\end{minipage}}", sep = "") %>
\par\noindent
Distribution
<% hist.filename <- paste("hist", i, ".pdf", sep="") %>
<%= ggsave(hist.list[[i]], filename=hist.filename) %>
<%= paste("\\includegraphics[width=", 1, "\\linewidth]{", hist.filename, "}", sep = "") %>


\pagebreak

<% } -%>

\end{document}

