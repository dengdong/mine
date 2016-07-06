package interfaces.clone;

import java.util.*;

public class CloneTest
{
	public static void main(String[] args)
	{
		try
		{
			interfaces.clone.Employee original = new interfaces.clone.Employee("Jhon",5000);
			original.setHireDay(2000,1,1);
			interfaces.clone.Employee copy = original.clone();
			copy.raiseSalary(10);
			copy.setHireDay(2016,5,19);
			System.out.println("original=" + original);
			System.out.println("copy=" + copy);
		}
		catch(CloneNotSupportedException e)
		{
			e.printStackTrace();
		}
	}
}