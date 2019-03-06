//use of qsort to sort structure
// sort it ascending by the ID
//ref: https://stackoverflow.com/questions/8721189/how-to-sort-an-array-of-structs-in-c/8721241#8721241

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int md_comparator(const void *v1, const void *v2);

int main(int argc, char **argv)
{


typedef struct _my_data_ 
{
  unsigned int id;
  double latitude;
  double longitude;
  unsigned int content_len;
  char* name_dyn;
  char* descr_dyn;
} mydata;


    return 0;
}


//the comparator function for qsort
int md_comparator(const void *v1, const void *v2)
{
    const mydata *p1 = (mydata *)v1;
    const mydata *p2 = (mydata *)v2;
    int rc;
    if (p1->latitude < p2->latitude)
        return -1;
    else if (p1->latitude > p2->latitude)
        return +1;
    else if (p1->longitude < p2->longitude)
        return -1;
    else if (p1->longitude > p2->longitude)
        return +1;
    else if ((rc = strcmp(p1->name_dyn, p2->name_dyn)) < 0)
        return -1;
    else if (rc > 0)
        return +1;
    else
        return 0;
}


/*


You need a structure comparator function that matches the prototype
 of the function expected by qsort(), viz:

int md_comparator(const void *v1, const void *v2)
{
    const mydata *p1 = (mydata *)v1;
    const mydata *p2 = (mydata *)v2;
    if (p1->id < p2->id)
        return -1;
    else if (p1->id > p2->id)
        return +1;
    else
        return 0;
}

If you ever get to a more complex sort criterion, this is still
 a good basis because you can add secondary criteria using the same skeleton:

int md_comparator(const void *v1, const void *v2)
{
    const mydata *p1 = (mydata *)v1;
    const mydata *p2 = (mydata *)v2;
    if (p1->latitude < p2->latitude)
        return -1;
    else if (p1->latitude > p2->latitude)
        return +1;
    else if (p1->longitude < p2->longitude)
        return -1;
    else if (p1->longitude > p2->longitude)
        return +1;
    else
        return 0;
}

Clearly, this repeats for as many criteria as you need. 
If you need to call a function (strcmp()?) to compare values, 
call it once but assign the return to a local variable and use that twice:

int md_comparator(const void *v1, const void *v2)
{
    const mydata *p1 = (mydata *)v1;
    const mydata *p2 = (mydata *)v2;
    int rc;
    if (p1->latitude < p2->latitude)
        return -1;
    else if (p1->latitude > p2->latitude)
        return +1;
    else if (p1->longitude < p2->longitude)
        return -1;
    else if (p1->longitude > p2->longitude)
        return +1;
    else if ((rc = strcmp(p1->name_dyn, p2->name_dyn)) < 0)
        return -1;
    else if (rc > 0)
        return +1;
    else
        return 0;
}

Also, this template works when data members are unsigned integers, 
and it avoids overflow problems when comparing signed integers. 
Note that the short cut you might sometimes see, namely variations on:

int md_comparator(const void *v1, const void *v2)   // BAD 
{                                                 
    const mydata *p1 = (mydata *)v1;               
    const mydata *p2 = (mydata *)v2;               
    return(p1->id - p2->id);                       
}                                                  

is bad if id is unsigned (the difference of two unsigned integers 
is never negative), and subject to overflow if the integers are 
signed and of large magnitude and opposite signs.
shareedit

*/
