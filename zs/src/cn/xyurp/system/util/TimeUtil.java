package cn.xyurp.system.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.jsptags.navigation.pager.parser.ParseException;

/**
 * @author lichao
 * @time Nov 12, 2009 10:53:31 AM
 * @description 计算服务年限帮助�?	
 */
public class TimeUtil {
    public static String getHours(String start, String end)
	    throws ParseException, java.text.ParseException {
	SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
	Date d1 = fmt.parse(start);
	Date d2 = fmt.parse(end);

	long d = d2.getTime() - d1.getTime();
	long days = d / (3600000 * 24);
	int realyears = (int) (days / 365);
	int extraDays = (int) (days % 365);
	int months = extraDays / 30;
	int day=(int)(extraDays%30);
//	if(months==0 && realyears==0){
//	    return String.valueOf("无保质期");
//	}
//	if(months==0){
//	    return String.valueOf(realyears + "�?");
//	}
//	if(realyears==0){
//	    return String.valueOf(months+ "个月");
//	}
	return String.valueOf(realyears + "�?" + months + "个月"+day+"�?");
    }
}
