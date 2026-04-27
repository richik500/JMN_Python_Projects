## ****************************** 
## Loops and Control  Structures
## ******************************
empno_vect <- 1:11
empname_vect <- c("Bill","Steve","Larry","Donald","Elon","Jeff","Tim","Mark","Jack","Satya","Sundar")
emp_dep <- c("Strategy","Strategy","Strategy","Trumpet","R&D","Marketing","Sales","HR","Sales","Admin","Admin")
empsal_vect <- c(10000, 7000, 6000,999999,12000,12500,11000,13000,13500,14000, 14500)

emp_df <- data.frame(empno = empno_vect,
                     empname = empname_vect,
                     emp_dept = emp_dep,
                     empsalary = empsal_vect)

str(emp_df)  # To see the details ofthe structure

emp_df <- data.frame(empno = empno_vect,
                     empname = empname_vect,
                     emp_dept = emp_dep,
                     empsalary = empsal_vect,
                     stringsAsFactors = F)  # We don't want name and dept as Factors

str(emp_df)

table(emp_df$emp_dept)
### Company has decided to give increment based on the following
### Sales, Admin, Marketing, HR,R&D and Starategy People will get 10%

