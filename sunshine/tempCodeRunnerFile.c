#include<studio.h>
void main(){
int year;
printf('Enter Year:');
scanf('%d',&year);
if(year%100==0 || year%400){
    printf('It is a leap year')
}
else{
    printf("It's not a leap year")
}
}