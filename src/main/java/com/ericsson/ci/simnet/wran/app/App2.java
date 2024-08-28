package com.ericsson.ci.simnet.wran.app;

import java.io.*;
import java.util.*;
import org.apache.log4j.Logger;


public class App2
{

    static Logger logger = Logger.getLogger(App2.class);

    public static void main( String[] args )  throws IOException
    {
       //System.out.println( "Hello World!" );

       if(logger.isDebugEnabled()){
          logger.debug("Testing");
       }

//       String curDir = System.getProperty("user.dir");

       File file=new File("scripts/wran");


       ProcessBuilder processBuilder = new ProcessBuilder("./testScript-1.sh");
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

       OutputStream os=process.getOutputStream();
       OutputStreamWriter osw=new OutputStreamWriter(os);
       BufferedWriter bw=new BufferedWriter(osw);
       bw.write("create licensekey -x license-input.xml");

       while ((line = br.readLine()) != null) {
         System.out.println(line);
       }

    }
}


