# EL

>JSP2.0最重要的特性之一： Expression Language(EL),可以用它访问应用程序数据

## EL 语法

`${expreession}`

##EL隐式对象

* `pageContext` 当前JSP页面的 javax.servlet.jsp.PageContext
	
	* request
	* response
	* out
	* session
	* application
	* config
	* pageContext
	* page
	* exception
	
	```
	${pageContext.request}
	${pageContext["request"]
	
	```
* `initParam` 包含所有context初始化并以参数名称作为键的MAP
	```
	${initParam.password}
	```
* `param` 包含所有请求参数兵役参数名称作为键的MAP，有同名的请求参数，只有第一个参数可以利用param对象获取
	```
	${param.userName}
	```
* `paramValues`包含所有请求参数兵役参数名称作为键的MAP
* `header` 请求标头名称为键的MAP

```
${haeder["accept-language"]}
```

* `headerValues`
* `cookie` 当前请求对象中所有Cookie对象的MAP
```
${cookie.jsessionid.value}
${cookie.jsessionid.path}
```

* `applicationScope` 包含ServletContext对象中所有属性并以属性名称作为键的MAP
* `sessionScope` 包含HTTPSession对象中所有属性并以属性名称作为键的map

##其他EL运算符

###算数运算符

* +
* -
* *
* /(div)
* %(mod)

###关系运算符
* ==/eq
* !=/ne
* &gt;/gt
* &ge;(ge)
* &lt;/lt
* &le;/le

###逻辑运算符

* AND(&& 和and)
* OR(|| 和 or)
* NOT(! 和 not)

###条件运算符

`${statement?A:B}`


###empty运算符

`${empty x}`

x为null，或者x是长度为0 的字符串，空的MAP、数组、空集合，返回true，否则返回false



###关闭JSP页面

```
 <jsp-config>
  	<jsp-property-group>
  		<url-pattern>/employee.jsp</url-pattern>
  		<scripting-invalid>true</scripting-invalid>
  	</jsp-property-group>
  </jsp-config>
```


###关闭EL运算

1.  `<%@ page isELIgnored="true" %>`
2.  配置
```
 <jsp-config>
  	<jsp-property-group>
  		<url-pattern>/noEL.jsp</url-pattern>
  		<el-ignored>true</el-ignored>
  	</jsp-property-group>
  </jsp-config>
```


























































