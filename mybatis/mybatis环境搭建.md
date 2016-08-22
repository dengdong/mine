

###myBatis环境搭建

1. 创建Web项目
2. 导入 jar包
3. 核心配置文件sqlMapConfig.xml


```
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
"http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
	<!-- 配置数据源、事务 -->
	
	<environments default="test">
		<environment id="test">
			<!-- 事务： JDBC/MANAGED  -->
			<transactionManager type="JDBC" />
			<!-- 数据源:  POOLED/UNPOOLED/JNDI -->
			<dataSource type="POOLED">
				<property name="driver" value="com.mysql.jdbc.Driver"/>
				<property name="url" value="jdbc://mysql://localhost:3306/test?charsetEncoding=utf8"/>
				<property name="username" value="root"/>
				<property name="password" value="root"/>
			</dataSource>
		</environment>
	</environments>
	
</configuration>

```


4. 测试类 SqlSessionFactoryBuilder.builder()创建SqlSessionFactory
5. 通过SqlSessionFactory获取SqlSession

```
String resource = "sqlMapConfig.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource );
		SqlSessionFactory factory =  new  SqlSessionFactoryBuilder().build(inputStream );
		SqlSession session = factory.openSession();

```

6. 