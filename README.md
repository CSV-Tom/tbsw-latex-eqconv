

# Tool 

## Description

Tool converts a **LaTeX formula** in the `svg` or `pdf` format.

## Howto

```
tbswlatexconv
```


## Example

```
The mass-energy equivalence is described by the famous equation
 
$$E=mc^2$$
 
discovered in 1905 by Albert Einstein. 
In natural units ($c$ = 1), the formula expresses the identity
 
\begin{equation}
E=m
\end{equation}
```

## Output

![](target/images/formula-1.svg?raw=true)


## Installation

### Required LaTeX packages
```
texlive-extra-utils
```

### Required tools
```
sudo apt-get install make
sudo apt-get install pdfcrop
sudo apt-get install pdf2svg
```
The mass-energy equivalence is described by the famous equation
 
$$E=mc^2$$
 
discovered in 1905 by Albert Einstein. 
In natural units ($c$ = 1), the formula expresses the identity
 
\begin{equation}
E=m
\end{equation}
