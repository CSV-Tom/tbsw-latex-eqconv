# Script 

Script converts a **LaTeX formula** in the `svg` or `pdf` format.

## Howto

```
tbsw-texeqconv <file|directory>
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

### SVG

View not supported by GitHub!

![Formula 1](target/images/formula-1.svg?raw=true)


### PDF

View not supported by GitHub!

![Formula 1](target/images/formula-1.pdf?raw=true)


### Gif

![Formula 1](target/images/formula-1.gif?raw=true)


### PNG

![Formula 1](target/images/formula-1.png?raw=true)


### JPEG

![](target/images/formula-1.jpg?raw=true)



 
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
