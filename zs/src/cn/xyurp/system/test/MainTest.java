package cn.xyurp.system.test;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

import cn.xyurp.zs.bean.Examinee;

public class MainTest {

	public static void main(String[] args) {
		
		// String ss = Examinee.class.getPackage().getName();
		Field[] fields = Examinee.class.getDeclaredFields();
		for (Field field : fields) {
			String fieldName = field.getName();
			String setMethodName = "set"+fieldName.substring(0, 1).toUpperCase()+fieldName.substring(1);
			try {
				Method setter =  Examinee.class.getMethod(setMethodName, new Class[]{field.getType()});
				Object objParam = null;
				String paramType = field.getType().getName();
				//System.out.println(paramType);
			} catch (SecurityException e) {
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				e.printStackTrace();
			}
			
		}
	}

}
