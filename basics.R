#==============================================================================!
# INTRO TO R PROGRAMMING AND RSTUDIO (29-Apr-2022) ####
#==============================================================================!

#==============================================================================!
# **KEY CONCEPTS**
#    + Loading data using RStudio
#    + Scripting
#    + Variables
#    + Data types (numbers, text, boolean)
#    + Data structures (scalar, vector, matrix, data frame)
#    + Functions
#    + Subsetting 1 and 2-dimensional data structures
#==============================================================================!

#==============================================================================!
# WORKSHOP CONTENTS
#  * RStudio
#  * Scripts
#  * Data structures (1): scalars and vectors
#  * Functions
#  * Variables
#  * Subsetting (1): Subsetting vectors
#  * Boolean/logical data
#  * Data structures (2): Matrices
#  * Calculations with vectors + matrices
#  * Data structures (3): Data frames
#  * Subsetting (2): Subsetting data frames
#  * Merging ("joining") data frames
#  * Packages
#  * Getting help + "stealing" code
#==============================================================================!


#------------------------------------------------------------------------------!
# RStudio ####
#------------------------------------------------------------------------------!
# Good video tutorial:
# https://rstudio.com/resources/webinars/programming-part-1-writing-code-in-rstudio/


#------------------------------------------------------------------------------!
# Scripts ####
#------------------------------------------------------------------------------!
# ALWAYS SAVE YOUR CODE IN SCRIPTS !
#   * To document your work (think of them as a data analyst's lab notebook)
#   * To quickly repeat an analysis in the future
#   * To re-use your code for new analyses
#   * To generate reports (rmarkdown scripts)

#------------------------------------------------------------------------------!
# Comments versus code
#------------------------------------------------------------------------------!
# Every R script is fundamentally just a text file.
# In a standard R script (such as this) each line that starts with a hash
# character (#) is just comments / annotations and will not be read as code.
# R assumes that everything else is code.

# (Later you will learn about "rmarkdown" scripts where the situation is
# reversed: by default text is interpreted as comments and code must be
# specifically indicated.)

# Typing four hash marks (#), dashes (-) or equal signs (=) at the end of a line
# makes that line appear in the RStudio navigation pane, available in the top
# right corner of the script window. Useful for creating headers that help
# organise and navigate a script.
# (add an exclamation mark and they will be ignored)

#------------------------------------------------------------------------------!
# Data structures (1): scalars and vectors ####
#------------------------------------------------------------------------------!
# Vectors are simple lists with each item being of the same type.
# Scalars are really just vectors with a single item.
# Some useful vectors are 'built' into R:
# (place the cursor anywhere in a line of code and press Ctrl-Enter to execute
# the code / Cmd-Enter on a Mac)
# Results / output will appear in the 'Console' window below the script window.
letters
LETTERS
month.abb
month.name

# Vectors can be generated using the c() function:
c(14, 6, 2016)

#------------------------------------------------------------------------------!
# Functions ####
#------------------------------------------------------------------------------!
# Functions are used to manipulate data.

# R includes all the standard arithmetic function symbols: + - * / ^
3 + 4
300 / 100
10 - 9
2 ^ 4
12 %% 5 # modulo

# Named R functions are very similar to worksheet functions in Excel:
#   1. Each function has a different name
#   2. Function names are always followed by brackets
#   3. Information typed between the brackets are called "arguments"
#   4. Two or more arguments are separated by commas

# To see a list of all (>1200) built-in functions that come with R
# (aka "base R") type:
help(package="base")

# So 'help()' is another example of a function. ' package="base" ' is the
# argument here.

# Some examples of frequently used functions:
# (note how we use vectors as arguments)
sum(c(3, 4, 10))
sqrt(121)
mean(c(3, 4, 10))
max(c(3, 4, 10))
min(c(3, 4, 10))


#------------------------------------------------------------------------------!
# Variables ####
#------------------------------------------------------------------------------!
# Usually data are stored in named VARIABLES
#   * Variables are defined with the '<-' assignment operator
#   * Variable names can be very long
#   * Variables CANNOT contain spaces
#   * Variables CANNOT start with a number (but numbers can appear elsewhere)

# Two scalars:
my.first.variable <- "Hello world!"
my.second.variable <- 2019

# *** Note that variables are listed in the 'Environment' tab in the top right
# RStudio panel ***

# Use the 'print()' or 'cat()' function to display the contents of a variable
# in the Console panel:
# Output from 'print()' is preceded by row numbers in square brackets:
print(my.first.variable)
print(my.second.variable)

# Vectors can be generated using the 'c()' function:
v1 <- c(14, 6, 2016)

# Typing just the variable is equivalent to 'print()':
v1       # output same as 'print(v1)'

# Output from 'cat()' has no row numbers:
cat(v1)
cat(v1, file="xxx.txt")
cat(v1, file="xxx.txt", sep="\n")

# The 'View()' function opens a new tab - mostly used to inspect large tables:
# The tab will include several useful ways of inspecting and filtering a table.
View(mtcars)      # (mtcars is a dataset that comes with R)

# A vector containing text:
v2 <- c("Hello", "world", "!")
print(v2)

# Vector items can be 'glued' together into a single piece of text using the
# 'paste()' function:
paste(v1, collapse="+")
paste(v2, collapse=" ")

# It's easy to generate vectors with simple series of numbers:
v3 <- 1:12
print(v3)

# The seq command can generate more complicated number vectors:
seq(from=1, to=22, by=3)
seq(from=1, to=10, length.out=19)

# Vector items can have names:
# The names() function is used both to define and to return the names
# of a data object.
v3
month.abb
names(v3) <- month.abb
print(v3)
names(v3)

# In R it is very easy to manipulate all items in a vector with simple code:L
v3 * 10

#------------------------------------------------------------------------------!
# Subsetting (1): Subsetting vectors ####
#------------------------------------------------------------------------------!
# You can select items from within a vector using square brackets + indices ...
# A single index number...
LETTERS
LETTERS[10]
# ... or a vector of index numbers ...
c(8,5,12,12,15)
LETTERS[c(8,5,12,12,15)]

# You can also refer to vector items by name, if defined ...
v3
v3[11]
v3["Nov"]
# Using a vector of names:
c("Jan", "Mar")
v3[c(1,3)]
v3[c("Jan", "Mar")]
# ... or using boolean/logical values (TRUE/FALSE):
v4 <- 1:3
v4
c(TRUE, FALSE, TRUE)
v4[c(TRUE, FALSE, TRUE)]

# It can be easier to save a vector in a variable first, then use the variable
# for subsetting:
v4 > 1
v4 >= 1
v4 == 2
x <- v4 > 1
x
v4[x]

#------------------------------------------------------------------------------!
# Data types in R ####
#------------------------------------------------------------------------------!
# As we have already seen the most important data TYPES in R are:
#   1. numeric
#   2. text (aka 'character' or 'strings')
#   3. Boolean (aka 'logical')

# (numeric data are split further into sub-categories but we don't to worry
# about that here)

# Numeric:
v3
is.numeric(v3)
typeof(v3) # integer = whole numbers

# Text format in R is called 'character':
v2
typeof(v2)
is.character(v2)
is.numeric(v2)

# Boolean format in R is called 'logical':

#------------------------------------------------------------------------------!
# Boolean/logical data ####
#------------------------------------------------------------------------------!
# Boolean/logical values are often generated through 'equal' or
# 'greather/lesser than' (<==>) operations:
10 > 2
2 > 10
3 == 3.0
4 == 5
# The following generates a vector of boolean values:
1:10         # generates a vector of numbers from 1 to 10
1:10 >= 5    # generates a vector of boolean values
v5 <- 1:10 >= 5
v5
names(v5) <- 1:10
print(v5)

class(v5) # Boolean values in R are called "logical"
is.logical(v5)
is.logical(letters)
typeof(letters)
is.numeric(1:10)
is.numeric(1.2)


#------------------------------------------------------------------------------!
# Data structures (2): Matrices ####
#------------------------------------------------------------------------------!
# Matrices are 2-dimensional arrays/tables where each item (think of Excel
# cells) has to be of the same data type:
1:24                            # generates a vector
mx1 <- matrix(1:24, ncol=6)     # turns vector into a matrix with 6 columns
mx1

# Fill by column:
mx2 <- matrix(LETTERS[1:24], nrow=6, byrow=FALSE)
mx2

# Fill by row:
mx3 <- matrix(LETTERS[1:24], nrow=6, byrow=TRUE)
mx3

#------------------------------------------------------------------------------!
# Calculations with vectors + matrices ####
#------------------------------------------------------------------------------!
# One of the great things about vectors and matrices in R is that they can be
# modified with simple code:
print(v3)
v3 * 100

print(mx1)
mx1 + 1000

mx1 > 10

# Transpose with 't()' function:
mx1
t(mx1)

#------------------------------------------------------------------------------!
# Data structures (3): Data frames ####
#------------------------------------------------------------------------------!
# Data frames are the most common container used to store data in R.
# Each column can be a different data type:
df1 <- data.frame(Name=c("Jane", "Jack", "Jaim"),
                  Age=c(5, 12, 30),
                  Female=c(TRUE, FALSE, FALSE))
df1
View(df1)

# To show what data type is found in each column of the data frame:
sapply(df1, class)

#------------------------------------------------------------------------------!
# Subsetting (2): Subsetting data frames ####
#------------------------------------------------------------------------------!
# Similar to vectors, extract data from data frames using square brackets;
# rows and columns are separated by a comma:
print(df1)
df1[1,1]
df1[3,2]

# Leaving the space before the comma blank will return entire columns (all rows):
df1[,1]

# Accordingly, leaving the space AFTER the comma blank will return entire rows:
df1[1,]

# As with vectors, extract several rows/columns using number/index vectors:
df1[c(2,3), c(1,3)]

# ... or boolean values:
df1[c(FALSE, TRUE, TRUE), c(TRUE, FALSE, TRUE)]

# For data frames the 'names()' command refers to column headers:
names(df1)
names(df1) <- c("Nom", "Age", "Femelle")
df1

# We often use the dollar sign to refer to entire column of a data frame
# (returns a vector):
df1$Nom
class(df1$Nom)

# Data frames can have row names as well:
row.names(df1) <- paste0("Row", seq_len(nrow(df1)))
df1

# And similar to vectors, we can use row names and column names to subset
# data frames:
# (NOTE that text always needs to be defined with quotation marks)
# Select 2 columns (all rows):
df1[, c("Nom", "Femelle")]

# Select rows (all columns):
df1[c("Row1", "Row3"), ]

# Select columns and rows:
df1[c("Row1", "Row3"), c("Nom", "Femelle")]


# Sometimes code becomes easier to read if indices vectors are first stored
# in a variable; then use the variable to subset the data frame:
a <- c(2,3)
b <- c(TRUE, FALSE, TRUE)
c <- c("Nom", "Age")

df1[a, b]
df1[b, c]

#------------------------------------------------------------------------------!
# Merging ("joining") data frames ####
#------------------------------------------------------------------------------!
# We often need to combine 2 data frames:
df2a <- data.frame(
        Gene = c("ABCG1", "IRF1", "STAT3", "NEU1"),
        Gene.ID = c(9619, 3659, 6774, 4758)
)

df2b <- data.frame(
        Gene = c("ABCG1", "IRF1", "STAT3", "NEU1"),
        Gene.Name = c("ATP binding cassette subfamily G member 1",
                      "interferon regulatory factor 1",
                      "signal transducer and activator of transcription 3",
                      "neuraminidase 1"
                      )
)

df2a
df2b

df3 <- merge(x=df2a, y=df2b, by="Gene")
df3

#------------------------------------------------------------------------------!
# Packages ####
#------------------------------------------------------------------------------!
# Packages extend the basic repertoire of R with new functions.
# There are three main depositories for R packages: CRAN, Bioconductor and github
# Packages from CRAN are installed as follows, e.g.:
# install.packages("magrittr")

# To install a package from Bioconductor, find the package's page through a
# Google search or at http://bioconductor.org;
# then copy the installation code and paste into your script

# Packages are then _loaded_ using the library() or require() functions:
# library(magrittr)
# library(Biostrings)

# FOR GEEKS:
# To avoid downloading an already installed package, use this code in your scripts:
# (If the package is already installed, it will only be loaded; otherwise it will
# be installed)
# if (!require(wordcloud2)) install.packages("wordcloud2"); library(wordcloud2)

#------------------------------------------------------------------------------!
# Getting help ####
#------------------------------------------------------------------------------!
median(c(1:3, 100, 1000))

# (1) To get help on a specific function the first option usually is to use the
#     'Help' tab in RStudio

# (2) Help is also available through code:
help(sd)
?median

sd(1:2)

??variance

# (3) Sometimes the same function name is used by different packages. To get help
#     on a function from a specific package, use:
help(sd, package="stats")

# (4) For most functions, there are code examples:
example(persp)

# (5) To see a list of help files for _all_ functions from a specific package, use:
help(package="stats")

# (6) For some (not all) packages, so-called 'vignettes' are available - articles that explain
#     packages with code examples that show how to work through a typical problem. If no
#     vignette is available from within R, go to the package's page on CRAN or Bioconductor
#     respectively.
vignette("magrittr")

# (7) Programmers spend a lot of time searching for help on Google, mostly looking
#     for search hits on the stackoverflow web site:
#     https://stackoverflow.com/documentation/r
#     https://stackoverflow.com/documentation/r/topics

# (8) To stay up-to-date on R consider subscribing to r-bloggers:
#     * https://www.r-bloggers.com/
#     * https://feeds.feedburner.com/RBloggers

#------------------------------------------------------------------------------!
# ********************************  EXERCISE!!  ********************************
#------------------------------------------------------------------------------!
# R comes with a built-in data frame 'mtcars', which lists a number of variables
# (in columns) for 32 different car models (in rows).

# Print first 6 rows:
head(mtcars)

# Print last 6 rows:
tail(mtcars)

# Print all rows:
mtcars

# Number of rows:
nrow(mtcars)

# Number of columns:
ncol(mtcars)

# Using the lessons above, subset the mtcars data frame to extract just those
# car models with 8 cylinders (see cyl column)



