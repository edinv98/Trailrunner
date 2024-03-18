package se.iths;
 
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.*;
 
import java.util.Collection;
import java.util.Locale;
 
import java.time.LocalDate;
 
import org.junit.jupiter.api.Test;
 
public class TrailRunnerTest {
 
    @Test
    void saveRun_ShouldCallCreateRecordWithCorrectParameters() {   
      
        DatabaseAPI databaseMock = mock(DatabaseAPI.class);
        TrailRunner trailRunner = new TrailRunner(databaseMock);
 
        double distance = 10.5;
        int hours = 1;
        int minutes = 30;
        int seconds = 45;
        LocalDate date = LocalDate.of(2024, 1, 8);
 
        
        trailRunner.saveRun(distance, hours, minutes, seconds, date);
 
      
        verify(databaseMock).createRecord(anyString(), eq(distance), eq(5445), eq(date));
    }
 
    @Test 
    public void createUser() {
        
        double expectedLength = 175.0;  
        double expectedWeight = 70.0;   
 
        
        User user = new User(expectedLength, expectedWeight);
 
       
        assertEquals(expectedLength, user.getLength());
        assertEquals(expectedWeight, user.getWeight());
    }
    @Test // Användaren skall kunna beräkna sitt BMI (Body Mass Index)
    public void calculateBMIForValidUser() {
        
        double length = 175.0;  // Längd i cm
        double weight = 70.0;   // Vikt i kg
        double expectedBMI = weight / Math.pow(length / 100, 2); 
 
        User user = new User(length, weight);
 
       
        double calculatedBMI = user.calculateBMI();
 
       
        assertEquals(expectedBMI, calculatedBMI, 0.001);  
    }
    @Test
    public void calculateAverageSpeedForValidRun() {
        
        String runID = "testRun";
        double distanceInKilometers = 10.0;
        double timeInHours = 0.75;  // 45 minuter omvandlat till timmar
 
        RunningStatistics runningStats = new RunningStatistics();
        runningStats.createRunWithID(runID);
        runningStats.recordRunDistance(runID, distanceInKilometers);
        runningStats.recordRunTime(runID, timeInHours);
 
      
        double calculatedAverageSpeed = runningStats.calculateAverageSpeed(runID);
 
       
        double expectedAverageSpeed = distanceInKilometers / timeInHours;
        assertEquals(expectedAverageSpeed, calculatedAverageSpeed, 0.001);
    }
 
    @Test
    public void calculateKilometerTimeForValidRun() {
        
        String runID = "testRun";
        double distanceInKilometers = 10.0;
        double timeInMinutes = 45.0;
 
        RunningStatistics runningStats = new RunningStatistics();
        runningStats.createRunWithID(runID);
        runningStats.recordRunDistance(runID, distanceInKilometers);
        runningStats.recordRunTime(runID, timeInMinutes / 60);  // Omvandla tid till timmar
 
    
        double calculatedKilometerTime = runningStats.calculateKilometerTime(runID);
 
      
        double expectedKilometerTime = timeInMinutes / 60 / distanceInKilometers;
        assertEquals(expectedKilometerTime, calculatedKilometerTime, 0.001);
    }
   
    @Test
    public void createRunWithUniqueID() {
        
        RunningStatistics runningStats = new RunningStatistics();
 
        
        String run1ID = runningStats.createRun();
        String run2ID = runningStats.createRun();
 
       
        assertNotNull(run1ID);
        assertNotNull(run2ID);
        assertNotEquals(run1ID, run2ID);
    }
 
    @Test 
    public void preventDuplicateRunIDs() {
     
        RunningStatistics runningStats = new RunningStatistics();
 
        
        String runID = runningStats.createRun();
        IllegalArgumentException exception = assertThrows(IllegalArgumentException.class,
                () -> runningStats.createRunWithID(runID));
 
    
        assertEquals("Run ID already exists", exception.getMessage());
    }
    @Test 
    public void calculateTotalDistanceForRuns() {
       
        RunningStatistics runningStats = new RunningStatistics();
        String run1ID = runningStats.createRun();
        String run2ID = runningStats.createRun();
        double distance1 = 5.0;
        double distance2 = 7.0;
 
       
        runningStats.recordRunDistance(run1ID, distance1);
        runningStats.recordRunDistance(run2ID, distance2);
 
    
        assertEquals(distance1 + distance2, runningStats.calculateTotalDistance(), 0.001);
    }
 
    @Test 
    public void calculateAverageDistanceForRuns() {
        
        RunningStatistics runningStats = new RunningStatistics();
        String run1ID = runningStats.createRun();
        String run2ID = runningStats.createRun();
        double distance1 = 5.0;
        double distance2 = 7.0;
 
        
        runningStats.recordRunDistance(run1ID, distance1);
        runningStats.recordRunDistance(run2ID, distance2);
 
        
        assertEquals((distance1 + distance2) / 2, runningStats.calculateAverageDistance(), 0.001);
    }
    @Test 
    public void printRunDetailsForValidRun() {
        
        String runID = "testRun";
        double distanceInKilometers = 10.0;
        double timeInMinutes = 45.0;
 
        RunningStatistics runningStats = new RunningStatistics();
        runningStats.createRunWithID(runID);
        runningStats.recordRunDistance(runID, distanceInKilometers);
        runningStats.recordRunTime(runID, timeInMinutes / 60); 
 
      
        String printedDetails = runningStats.printRunDetails(runID);
       
 
        String expectedDetails = "Run ID: testRun\nDistance: 10.0 km\nTime: 45.0 minutes";
        assertEquals(expectedDetails, printedDetails);
    }
 
    @Test
public void deleteRunById_RemoveRunFromStatistics() {
   
    RunningStatistics runningStats = new RunningStatistics();
    String runID = runningStats.createRun();
   
    
    runningStats.deleteRunById(runID);
 
    
    assertThrows(IllegalArgumentException.class, () -> runningStats.printRunDetails(runID));
}
 
    @Test 
    public void deleteNonexistentRunById() {
    
        RunningStatistics runningStats = new RunningStatistics();
        String nonExistentRunID = "nonExistentRun";
 
    
        assertThrows(IllegalArgumentException.class, () -> runningStats.deleteRunById(nonExistentRunID));
    }
    @Test
    void createRun_ShouldAddRunToCollection() {
        
        DatabaseAPI databaseMock = mock(DatabaseAPI.class);
        TrailRunner trailRunner = new TrailRunner(databaseMock);
 
  
        String runID = trailRunner.createRun();
 
      
        assertTrue(trailRunner.containsRun(runID));
    }
 
    @Test
    void deleteRunById_ShouldRemoveRunFromCollection() {
      
        DatabaseAPI databaseMock = mock(DatabaseAPI.class);
        TrailRunner trailRunner = new TrailRunner(databaseMock);
        String runID = trailRunner.createRun();
 
   
        trailRunner.deleteRunById(runID);
 
    
        assertFalse(trailRunner.containsRun(runID));
    }
 
    @Test
    void containsRun_ShouldReturnTrueForExistingRun() {
  
        DatabaseAPI databaseMock = mock(DatabaseAPI.class);
        TrailRunner trailRunner = new TrailRunner(databaseMock);
        String runID = trailRunner.createRun();
 
     
        boolean containsRun = trailRunner.containsRun(runID);
 
      
        assertTrue(containsRun);
    }
 
    @Test
    void containsRun_ShouldReturnFalseForNonexistentRun() {
      
        DatabaseAPI databaseMock = mock(DatabaseAPI.class);
        TrailRunner trailRunner = new TrailRunner(databaseMock);
        String runID = "nonexistentRun";
 
       
        boolean containsRun = trailRunner.containsRun(runID);
 
        
        assertFalse(containsRun);
    }
   
}


        
    


    

    
    

    
