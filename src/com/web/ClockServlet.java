package com.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class ClockServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		SimpleDateFormat fmt = new SimpleDateFormat(
				"yyyy-MM-dd hh:mm:ss.SSSSSS");
//		fmt.setTimeZone(new SimpleTimeZone(-28800000, "America/Los_Angeles",
//				Calendar.APRIL, 1, -Calendar.SUNDAY, 7200000, Calendar.OCTOBER,
//				-1, Calendar.SUNDAY, 7200000, 3600000));
		fmt.setTimeZone(TimeZone.getTimeZone("America/Los_Angeles"));
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		out.println("<p>The time is: " + fmt.format(new Date()) + "</p>");
	}
}
