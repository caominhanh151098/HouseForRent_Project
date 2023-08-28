package com.example.casestudy_hotelproject.controller;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CrawlData {
    public static void main(String[] args) {
        try {
            URL url = new URL("file:///D:/Zero/CodeGym/HouseForRent_Project/src/main/resources/templates/test.html");
            // open the stream and put it into BufferedReader
            Scanner scanner = new Scanner(new InputStreamReader(url.openStream()));
            scanner.useDelimiter("\\Z");
            String content = scanner.next();
            // close scanner
            scanner.close();
            // remove all new line
            // regex
            Pattern p = Pattern.compile("src=\"(.*?)\"");
            Matcher m = p.matcher(content);
            while (m.find()) {
                System.out.println(m.group(1));
            }
        } catch (
                IOException e) {
            e.printStackTrace();
        }
    }

}
