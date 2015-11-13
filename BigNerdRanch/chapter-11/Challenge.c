#include <stdio.h>
#include <time.h>


//struct tm
//{
//	int tm_sec; /*除去分钟后的秒数[0-60]*/
//	int tm_min; /* 除去小时候的分钟数[0-29] */
//	int tm_hour; /* 从午夜算起的小时数[0-23] */
//	int tm_mday; /* 一个月的天数[1-31]*/
//	int tm_mon; /*从一月算起的月数[0-11]*/
//	int tm_year; /*从1900年算起的年数*/
//	int tm_wday; /*从周日算起的天数[0-6]*/
//	int tm_yday; /* 从1月1日算起的天数[0-365]*/
//	int tm_isdst; /* 夏时制标志位*/
//	long tm_gmtoff; /* 和UTC之间的时差，以秒为单位 */
//	char *tm_zone;/* 时区缩写*/
//};


int main(int argc, char const *argv[])
{
	//printf("%d\n", 4000000 / (60*60*24) );

	long secondsSince1970 = time(NULL);
	printf("It has been %ld seconds since 1970\n", secondsSince1970 );

	struct tm now;
	localtime_r(&secondsSince1970, &now);
	printf("The time is %d:%d:%d\n", now.tm_hour, now.tm_min, now.tm_sec);

	long secondsAfter4Billon = secondsSince1970 + 4000000;
	struct tm tm4b ;
	localtime_r(&secondsAfter4Billon, & tm4b);

	printf("The time after 4 billon is %d-%d-%d\n", tm4b.tm_year + 1900, tm4b.tm_mon+1, tm4b.tm_mday );
	return 0;
}
