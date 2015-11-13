#include <stdio.h>
#include <unistd.h>

void congratulateStudent(char *student , char * course , int numDays)
{
	printf("%s has doen as much %s Programming as I could fit into %d day.\n",  student, course, numDays);
}


int main(int argc, char const *argv[])
{
	/* code */
	congratulateStudent("Kate", "Cocoa", 5);
	sleep(2);
	congratulateStudent("Bo", "Objective-C", 2);
	sleep(2);
	congratulateStudent("Mike","Python",5);
	sleep(2);
	congratulateStudent("Liz", "iOS", 5);
	sleep(2);
	return 0;
}