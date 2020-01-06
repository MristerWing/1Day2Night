# pom.xml setupList (Maven)

### AOP

1. aopAlliance

-   version: 1.0
-   link: https://mvnrepository.com/artifact/aopalliance/aopalliance

2. aspectjWeaver

-   version: 1.8.13
-   link: https://mvnrepository.com/artifact/org.aspectj/aspectjweaver

3. cgLib

-   version: 3.1
-   link : https://mvnrepository.com/artifact/cglib/cglib

### Oracle

1. springJDBC

-   version: 3.1.1
-   link : https://mvnrepository.com/artifact/org.springframework/spring-jdbc

2. oracle JDBC 6

-   link: https://mvnrepository.com/artifact/com.oracle/ojdbc6
-   **특이사항: Spring plugin 설치 필요**

```maven
<repositories>
	<repository>
		<id>Spring Plugins</id>
		<url>https://repo.spring.io/plugins-release/</url>
	</repository>
</repositories>
```

### MyBatis

1. mybatis

-   version: 3.4.6
-   link: https://mvnrepository.com/artifact/org.mybatis/mybatis

2. mybatis-spring

-   version: 1.3.2
-   link: https://mvnrepository.com/artifact/org.mybatis/mybatis-spring

### Pools

1. commons-dbcp

-   version: 1.4
-   link: https://mvnrepository.com/artifact/commons-dbcp/commons-dbcp

2. commons-pool

-   version: 1.6
-   link: https://mvnrepository.com/artifact/commons-pool/commons-pool

3 commons-collections

-   version: 3.2.1
-   link: https://mvnrepository.com/artifact/commons-collections/commons-collections

4. spring-tx

-   version: 3.0.5
-   link: https://mvnrepository.com/artifact/org.springframework/spring-tx

### file upload

1. commons-io

-   version: 1.3.2
-   link: https://mvnrepository.com/artifact/org.apache.commons/commons-io

2. commons-fileUpload

-   version: 1.3.3
-   link: https://mvnrepository.com/artifact/commons-fileupload/commons-fileupload

### Template / tiles2, 마지막에 추가 필요(2019-12-09)

1. tiles-JSP

-   version: 2.2.2
-   link: https://mvnrepository.com/artifact/org.apache.tiles/tiles-jsp

2. tiles-servlet

-   version: 2.2.2
-   link: https://mvnrepository.com/artifact/org.apache.tiles/tiles-servlet

3. tiles-core

-   version: 2.2.2
-   link: https://mvnrepository.com/artifact/org.apache.tiles/tiles-core
