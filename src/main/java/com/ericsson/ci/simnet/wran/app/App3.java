package com.ericsson.ci.simnet.wran.app;

import java.io.*;
import java.util.*;
import org.apache.log4j.Logger;


public class App3
{

    static Logger logger = Logger.getLogger(App3.class);

    public static void main( String[] args )  throws IOException
    {
       //System.out.println( "Hello World!" );

       if(logger.isDebugEnabled()){
          logger.debug("Testing");
       }

       String curDir = System.getProperty("user.dir");

       File file=new File("src/main/scripts/light-wran/bin");


       ProcessBuilder processBuilder = new ProcessBuilder("./createWranSimsParallel.sh", "O13-ST-13B-FP-50K_EU57_PICO.env");
       processBuilder.directory(file);
       processBuilder.redirectErrorStream(true);
       System.out.println("started...");
        Process process=processBuilder.start();

       InputStream is = process.getInputStream();
       InputStreamReader isr = new InputStreamReader(is);
       BufferedReader br = new BufferedReader(isr);
       
       String line;

       System.out.printf("Output of running %s is: %n",
          Arrays.toString(args));

       while ((line = br.readLine()) != null) {
         System.out.println(line);
       }

            
       //Wait to get exit value
       try {
           int exitValue = process.waitFor();
           System.out.println("\n\nExit Value is " + exitValue);
       } catch (InterruptedException e) {
           // TODO Auto-generated catch block
           e.printStackTrace();
       }
            
       
       System.out.println("");
       logger.debug("...exiting from java code" );

    }
}


