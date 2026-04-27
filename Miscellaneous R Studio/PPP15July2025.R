y=rep("a",10)
ypaste(x,y,sep="",collapse = "+")

# For date, some points need to be noted
my_date <- Sys.date() # get today's date ad assign it to variable
my_date # display variable which is of type Date

#For date value given as string use as .Date to convert it to a Date type
#my_date <- "2020-08-15"
my_date <- as.Date("2021-03-07")
my_date

# Vectors

my_vect <- c(1,2,3,4) #integer vector
my_vect
my_vect<- 100:200  # integer vector, defined as a sequence
my_vect
my_vect[28]

my_vect <- c(1.1,2.34,3.45,4) # integer vector
my_vect

my_vect <- c("a","b","c")  # character vector
my_vect
my_vect <- c("abra","ka","dabra")  # string of vectors
my_vect

vect_basic <- c(5000, 6000, 7000,8000)
vect_vpay <- c(500, 600, 1900,800)
vect_sal <- vect_basic + vect_vpay  # component wise addition
vect_sal

sum(vect_sal)    # Total Salary of the employees

max(vect_sal)    # Maximum Salary among the employees
which.max(vect_sal) # Which employee gets the maximum salary

min(vect_sal)    # Minimum Salary among the employees
which.min(vect_sal) # Which employee gets the miniimum salary

mean(vect_sal, na.rm = TRUE)  # Compute average Salary and remove NA value; 
sum(vect_sal)/length(vect_sal)  # Same as mean

vect_names <- c("Sachin", "Sourav",NA, "Rahul","Laxman","Sehwag","Yuvraj","Harbhajan")
vect_names
vect_names<-replace(vect_names, is.na(vect_names), "Virat")
vect_names
#OR#
names_na <- is.na(vect_names) # Creates a Logical vector
names_na              # Only TRUE for 3rd component, FALSE otherwise

vect_names[names_na] <- "Kohli"

vect_sal <- seq(3000, 10000, by = 500)  #MATRIX
vect_sal
length(vect_sal)  # How many elements in the Vector?
mat_sal <- matrix(vect_sal, 3,5, byrow = TRUE)  # By default, matrix is filled by columns
mat_sal
mat_sal <- matrix(vect_sal, 3,5, byrow = FALSE)  # By default, matrix is filled by columns
mat_sal # we can ignore writing by row as default is column wise when wanting to entry by column wise
mat_sal[2,3]  # Element at 2nd row and 3rd column
rowSums(mat_sal)  # Compute Row wise Total

colSums(mat_sal)  # Compute Col wise Total

matr=max(mat_sal)  # Maximum Salary as per the matrix
matr
max(mat_sal[2,]) # Maximum Salary in the 2nd row of the matrix
max(mat_sal[,2]) # Maximum Salary in the 2nd column of the matrix
A <- matrix(c(1:10), 2,5)
A
B <- matrix(c(11:20), 2,5)
B

A * B  # Element wise multiplication of square matrix

AB <- A %*% t(B)  # Matrix Multiplcation, t(B) is transpose of B
AB
abb <- t(B)    # putting transpose in another variable
ABBB <- A %*% abb  # notation - apply formula actually using matrix multi
ABBB
dim(AB)   # Dimension of matrix AB
nrow(AB)  # Number of Rows in AB matrix
ncol(AB)  # Number of Columns in AB matrix

## List

# Creates a list including 3 components, digits, vowels and players
# of varying length
my_list <- list(digits=seq(10, 20, by=2),vowels=c("a","e","i","o","u"),
                my_matrix=matrix(c(11:20), 5,2, byrow = F))
my_list
View(my_list)
# code is write_excel for export to excel maybe
length(my_list)  # Number of components in the list, i.e 3

# [[]]
my_list[[1]]         # The 1st component of the list
my_list[['vowels']] # The 2nd component of the list, accessed using name
my_list$my_matrix  # The 3rd component of the list
my_list$digits

my_list[[3]][,2]   # Extracting all row 2nd column from the 3rd component
my_list[[2]][c(5)] # Extracting 5th element from 2nd component
my_list[[1]][c(3)] # Extracting 3rd element from 1st component

## ************ 
## Data Frames
## ************

empno_vect <- c(1:11)# showing integer, writing C(1,2,3,4,5,6,7,8,9,10,11) will show numeric
empname_vect <- c(NA,"Steve","Larry",NA,"Elon","Jeff","Tim","Mark","Jack","Satya","Sundar")
emp_dep <- c("Strategy","Strategy","Strategy",NA,"R&D","Marketing","Sales","HR","Sales","Admin","Admin")
empsal_vect <- c(10000, 7000, 6000,9999999,12000,12500,11000,13000,13500,14000, 14500)
empage_vect <- c(27, 20, 22,2,30,34,45,26,40,34, 26)
emp_df <- data.frame(empno = empno_vect,
                     empname = empname_vect,
                     emp_dept = emp_dep,
                     empsalary = empsal_vect,
                     empage=empage_vect
)
str(emp_df)

library(writexl)
write_xlsx(emp_df, path="output.xlsx")
getwd()# <- working directory

