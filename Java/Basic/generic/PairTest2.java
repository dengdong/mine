package generic;

import java.util.*;

public class PairTest2
{
	public static void main(String[] args)
	{
		GregorianCalendar[] birthdays = 
		{
			new GregorianCalendar(1911,Calendar.DECEMBER,5),
			new GregorianCalendar(1921,Calendar.DECEMBER,5),
			new GregorianCalendar(1931,Calendar.DECEMBER,5),
			new GregorianCalendar(1941,Calendar.DECEMBER,5),
			new GregorianCalendar(1951,Calendar.DECEMBER,5),
			new GregorianCalendar(1961,Calendar.DECEMBER,5)
		};
		Pair<GregorianCalendar> mm = ArrayAlg2.minmax(birthdays);
		System.out.println("min = " + mm.getFirst().getTime());
		System.out.println("max = " + mm.getSecond().getTime());
	}
}

class ArrayAlg2
{
	public static<T extends Comparable> Pair<T> minmax(T[] a)
	{
		if (a == null || a.length == 0) return null;
		T min = a[0];
		T max = a[0];
		for(int i = 1;i<a.length;i++)
		{
			if(min.compareTo(a[i]) > 0) min = a[i];
			if(max.compareTo(a[i]) < 0) max = a[i];
		}
		return new Pair<T>(min, max);
	}	
}