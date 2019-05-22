package com.t.test;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class Test {

	public static void main(String[] args) {
		Test test = new Test();
		test.inserUsers();
	}

	private void inserUsers() {
		// 声明Connection对象
		Connection con;
		// 驱动程序名
		String driver = "com.mysql.jdbc.Driver";
		// URL指向要访问的数据库名mydata
		String url = "jdbc:mysql://192.168.1.246:3306/testdb";
		// MySQL配置时的用户名
		String user = "root";
		// MySQL配置时的密码
		String password = "123456";
		// 遍历查询结果集
		try {
			// 加载驱动程序
			Class.forName(driver);
			// 1.getConnection()方法，连接MySQL数据库！！
			con = (Connection) DriverManager.getConnection(url, user, password);
			if (!con.isClosed())
				System.out.println("Succeeded connecting to the Database!");
			// 2.创建statement类对象，用来执行SQL语句！！
			Statement statement = (Statement) con.createStatement();
			// 要执行的SQL语句
			String sql = "";
			int total = 10;
			for (int i = 0; i < total; i++) {
				long t1 = System.currentTimeMillis();

				String recid = UUID.randomUUID().toString();
				String username = "username" + i;
				String pass = "密码" + i;
				String realname = "姓名" + t1;
				sql = "insert into userinfo(recid,username,password,realname)values('" + recid + "','" + username
						+ "','" + pass + "','" + realname + "')";
				statement.execute(sql);

				long t2 = System.currentTimeMillis();
				System.out.println("新增" + username + ",耗时[" + (t2 - t1) + "]");
			}
			con.close();

			System.out.println("执行成功[" + total + "]");
		} catch (ClassNotFoundException e) {
			// 数据库驱动类异常处理
			System.out.println("Sorry,can`t find the Driver!");
			e.printStackTrace();
		} catch (SQLException e) {
			// 数据库连接失败异常处理
			e.printStackTrace();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	private void queryUser() {
		// 声明Connection对象
		Connection con;
		// 驱动程序名
		String driver = "com.mysql.jdbc.Driver";
		// URL指向要访问的数据库名mydata
		String url = "jdbc:mysql://192.168.1.246:3306/test";
		// MySQL配置时的用户名
		String user = "root";
		// MySQL配置时的密码
		String password = "123456";
		// 遍历查询结果集
		try {
			// 加载驱动程序
			Class.forName(driver);
			// 1.getConnection()方法，连接MySQL数据库！！
			con = (Connection) DriverManager.getConnection(url, user, password);
			if (!con.isClosed())
				System.out.println("Succeeded connecting to the Database!");
			// 2.创建statement类对象，用来执行SQL语句！！
			Statement statement = (Statement) con.createStatement();
			// 要执行的SQL语句
			String sql = "select * from userinfo";
			// 3.ResultSet类，用来存放获取的结果集！！
			ResultSet rs = statement.executeQuery(sql);
			System.out.println("-----------------");
			System.out.println("执行结果如下所示:");
			System.out.println("-----------------");
			System.out.println("姓名" + "\t" + "职称");
			System.out.println("-----------------");

			String job = null;
			String id = null;
			while (rs.next()) {
				// 获取stuname这列数据
				job = rs.getString("job");
				// 获取stuid这列数据
				id = rs.getString("ename");

				// 输出结果
				System.out.println(id + "\t" + job);
			}
			rs.close();
			con.close();
		} catch (ClassNotFoundException e) {
			// 数据库驱动类异常处理
			System.out.println("Sorry,can`t find the Driver!");
			e.printStackTrace();
		} catch (SQLException e) {
			// 数据库连接失败异常处理
			e.printStackTrace();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			System.out.println("数据库数据成功获取！！");
		}
	}

}
