package array;

import java.util.*;

/**
*优先级队列
*/
public class PriorityQueueTest
{
	public static void main(String[] args)
	{
		PriorityQueue<GregorianCalendar> pq = new PriorityQueue<>();
		pq.add(new GregorianCalendar(1906,Calendar.DECEMBER,9));
		pq.add(new GregorianCalendar(1916,Calendar.DECEMBER,9));
		pq.add(new GregorianCalendar(1906,Calendar.DECEMBER,5));
		pq.add(new GregorianCalendar(1956,Calendar.DECEMBER,9));
		pq.add(new GregorianCalendar(1905,Calendar.DECEMBER,9));

		System.out.println("Iterating over elements");
		for(GregorianCalendar date : pq)
		{
			System.out.println(date.get(Calendar.YEAR));
		}
		System.out.println("Removeing elements");
		while(!pq.isEmpty())
		{
			System.out.println(pq.remove().get(Calendar.YEAR));
		}
	}

}
