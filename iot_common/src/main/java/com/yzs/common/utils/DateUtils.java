package com.yzs.common.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtils {
    public static String date2string(Date date, String pattern){
        String res = new SimpleDateFormat(pattern).format(date);
        return res;
    }
    public static Date string2date(String str, String pattern){
        Date res = null;
        try {
            res = new SimpleDateFormat(pattern).parse(str);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        return res;
    }
    public static String[] get7DayStr(){
        Date date = new Date();
        String[] dates = new String[7];
        for (int i = 6,j=0; i >=0; i--,j++) {

            String res = getPastDate(i, date);
            dates[j] = res;
        }
        return dates;
    }

    private static String getPastDate(int past,Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.DATE, calendar.get(Calendar.DATE) - past);
        Date today = calendar.getTime();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String result = sdf.format(today);
        return result;
    }

    //public static void main(String[] args) {
    //    System.out.println(Arrays.toString(get12HourStr()));
    //}

    public static String[] get12HourStr(){
        String[] res = new String[13];
        for (int i = 0; i <= 12; i++) {

            String prefix = i*2+"";
            if(i<5){
                prefix = "0"+prefix;
            }
            String temp = prefix+":00";
            res[i] = temp;
        }
        return res;
    }
}
