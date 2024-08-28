package utilities;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.Test;

import wran.Rnc;

public class HelperFunctionsTest {
	

	@Test
	public void testGetIdsAsAString1() {
		new HelperFunctions();
		
		 int id = 1;
		 int numOfLeadingZeros = 2;
		 assertEquals("01", HelperFunctions.getIdsAsAString(id, numOfLeadingZeros)); 
		
	}
	
	@Test
	public void testGetIdsAsAString2() {
		new HelperFunctions();
		
		 int id = 10;
		 int numOfLeadingZeros = 2;
		 assertEquals("10", HelperFunctions.getIdsAsAString(id, numOfLeadingZeros)); 
		
	}

	@Test
	public void testGetZeros() {
		new HelperFunctions();
		assertEquals("00", HelperFunctions.getZeros(2)); 
	}

	@Test
	public void testGetRoundToClosestDivisibleNumber1() {
		new HelperFunctions();
		assertEquals(15, HelperFunctions.getRoundToClosestDivisibleNumber(13, 3)); 
		
	}

	@Test
	public void testGetRoundToClosestDivisibleNumber2() {
		new HelperFunctions();
		assertEquals(12, HelperFunctions.getRoundToClosestDivisibleNumber(12, 3)); 
		
	}
	
	@Test
	public void testGetRoundToClosestDivisibleNumber3() {
		new HelperFunctions();
		assertEquals(20, HelperFunctions.getRoundToClosestDivisibleNumber(17, 5)); 
		
	} 
	
	@Test
	public void testGetLAStart() {
		new HelperFunctions();
		
		ArrayList<Rnc> rncsArray = new ArrayList<Rnc>(5);
		
		assertEquals(1, HelperFunctions.getLAStart(0, 0, rncsArray));
		
	}

	@Test
	public void testGetGroupId1() {

		new HelperFunctions();
		assertEquals(1,HelperFunctions.getGroupId(11, 11));
	}
	
	@Test
	public void testGetGroupId2() {

		assertEquals(2,HelperFunctions.getGroupId(11, 10));
	}

}
