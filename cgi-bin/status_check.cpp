#include <iostream>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <regex>
using namespace std;

bool isValidInput(const char *value) {
    // Tillad kun alfanumeriske tegn og visse andre sikre tegn
    regex pattern("^[a-zA-Z0-9-_]+$");
    return regex_match(value, pattern);
}

int main () {
   int status;
   char t[1024]="ps -eo lstart,cmd | grep ";
   cout << "Content-type:text/html\r\n\r\n"<<endl;
   char *value = getenv("QUERY_STRING");

   // Valider input
   if (value != NULL && isValidInput(value)) {
       strcat(t,value);
       status = system(strcat(t," | grep -v grep | head -n 1 | awk '{ print $1\" \"$3\" \"$2\" \"$5\" \"$4}'"));
   } else {
       cout << "Invalid input" << endl;
   }
   
   return 0;
}
