

#JSP内置对象


###out对象

out对象是JspWrite累的实例，是向客户端输出内容常用的对象

####常用方法：

1.void println()
向客户端打印字符串
2.void clear()
清楚缓冲区的内容，如果在flush之后调用会抛出异常

3.void clearBuffer(); 清除缓冲区的内容，如果在flush之后调用不会抛出异常

4.void flush()
将缓冲区的内容输出到客户端

5.int getBufferSize() 返回缓冲区以字节数的大小，如不设置缓冲区则为0

6.int getRemaining() 返回缓冲区还剩多少可用

7.boolean isAutoFlush()返回缓冲区满时，是否自动清空还是抛出异常

8.void close()关闭输出流


###request对象

客户端的请求信息被封装在request对象中，通过它才能了解到客户的需求，然后做出响应。它是HttpServletRequest类的实例。
request对象具有请求域，即完成客户端的请求之前，该对象一直有效。

常用方法：

1.`String getParameter(String name)`返回name指定参数的返回值

2.`String[] getParameterValues(String name)` 返回包含参数name值的所有值的数组

3.`void setAttribute(String,Object)` 存储此请求中的属性

4.`object getAttribute(String name)` 返回指定属性的返回值

5.`String getContentType()`得到请求体的MIME类型

6.`String getProtocol()` 返回请求用的协议类型及版本号

7.`String getServerName（）` 返回接受请求的服务器主机名

8.`int getServerPort()` 返回请求所用的端口号

9.`String getCharacterEncoding()` 返回字节编码方式

10.`void setCharacterEncoding()`设置请求的字节编码方式

11.`int getContentLength()` 返回请求体的长度(字节)

12.`String getRemoteAddr()` 返回请求客户端的IP地址

13.`String getRealPath(String path)`

14.`String getContentPath()`



###response对象
response对象包含了响应客户请求的有关信息，但在JSP中很少直接用到它。它是HttpServletResponse类的实例。response对象具有页面作用域，即访问一个页面时，该页面的response对象只能对这次访问有效，其他页面的response对象对当前页面无效

* `String getCharacterEncoding()`返回响应用的何种编码
* `void SetContentType(String type)`设置响应的MIME类型
* `PrintWrite getWrite()`返回可以向客户端输出字符的一个对象
* `sendRedirect(String location)`重新定向客户端的请求


###请求转发与请求重定向

请求重定向： 客户端行为，response.sendRedirect() 从本质上讲等同于两次请求，前一次的请求对象不会保存，地址了的URL地址会改变

请求转发: 服务器行为，request.getRequestDispatcher().forward(req,resp),是一次请求，转发后请求对象会保存，地址栏的URL地址不变


###session

* session表示客户端与服务器的一次会话
* Web中的session指的是用户在浏览某个网站时，从进入网站到浏览器关闭所经过的这段时间，就是用户浏览这个网站所花费的时间
* session实际上是一个特定的时间概念

###session对象

* session对象是一个JSP内置对象
* session对象在第一个JSP页面被装载时自动创建，完成会话期管理
* 从一个客户打开浏览器并连接到服务器开始，到客户关闭浏览器离开这个服务器结束，成为一个会话
* 当一个客户访问一个服务器时，可能会在服务器的几个页面之间切换，服务器应该通过某种方法指导这是一个客户，就需要session
* session对象是HttpSession类的实例

####session对象常用方法如下:

* `long getCreateTime()`返回session创建时间
* `public String getId()` 返回session创建时JSP引擎设置的唯一ID
* `public Object setAttribute(String name ,Object value)`
* `public Object getAttribute(String name)`
* `String[] getValuesNames()`返回一个包含此session种所有可用属性的数组
* `int getMaxIncativeInterval()` 返回两次请求间隔多层时间session 自动被取消(秒)



###application 对象

* application对象实现了用户间数据的共享，可存放全局变量
* application开始于服务器的启动，终止于服务器的关闭
* 在用户的前后连接或不同用户之间的连接中，可以对application对象同一属性操作
* 在任何地方丢application对象属性的操作，都将影响到其他用户对此的访问
* 服务器的启动和关闭决定了app李擦头你对象的生命
* application对象是ServletContent实例


1. `void setAttribute(String,Object)`
2. `Object getAttribute(String)`
3. `Enumeration getAttributenNames()`
4. `String getServerInfo()`返回JSP（Servlet）引擎名及版本号


###page 内置对象


###pageContext对象

* pageContext对象提供了对JSP页面内所有的对象及名字空间的访问
* pageContext对象可以访问到本页所在的session，也可以取本页所在的application的某一属性值
* pageContent对象相当于页面中的所有功能的集大成者
* pageContent对象的本类名叫 pageContext


####常用方法

* `JspWrite getOut()`
* `HttpSession getSession()`
* `Object getPage()`
* `ServletRequest getRequest()`
* `ServletResponse getResponse()`
* `void setAttribute(String,Object)`
* `Object getAttribute(string,int scope)`
* `int getAttributeScope(String name)`
* `void forward(String)`
* `void include(String)`



###Config对象
> config对象是在一个Servlet初始化时，JSP引擎向它传递信息用的，此信息包括Ser略同初始化所要用到的参数（属性名和属性值构成）以及服务器的有关信息（通过传递一个ServletContext对象）


#####常用方法

* `ServletContext getServletContext` 返回含有服务器相关信息的ServletContext对象
* `String getInitParameter(String name)`返回初始化参数的值
* `Enumeration getInitParameterNames`返回Servlet初始化所需所有参数的枚举



###Exception对象
> exception对象是一个异常对象，当一个页面在运行过程中发生了异常，就产生这个对象。如果一个JSP页面要应用此对象，就必须把isErrorPage设为true，否则无法编译。实际上是java.lang.Throwable的对象

* `String getMessage()`
* `String toString()`
* `void printStackTrace()`
* `Throwable FillInStackTrace()`



#JavaBean 	

> Javabean就是符合某种特定的规则的Java类。使用JavaBeans的好处是解决代码的重复编写，减少代码冗余，功能区分明确，提高代码的维护性

###Javabean的设计原则
* 共有类
* 无参的共有构造方法
* 属性私有
* getter和setter方法


###JSP动作

> JSP 动作元素(action elements),动作元素为请求处理阶段提供信息。动作元素遵循XML元素的语法，有个一包含元素名的开始标签，可以有属性、可选的内容，与开始标签匹配的结束标签。


1. 存取JavaBean相关
	* `<jsp:useBean>`
	* `<jsp:setProperty>`
	* `<jsp:getProperty>`
2. JSP1.2有的基本元素，6个
	* `<jsp:include>`
	* `<jsp:forward>`
	* `<jsp:param>`
	* `<jsp:plugin>`
	* `<jsp:params>`
	* `<jsp:fallback>`
3. JSP2.0 新增的元素，与JSP Document有关
	* `<jsp:root>`
	* `<jsp:declartion>`
	* `<jsp:scriptlet>`
	* `<jsp:expression>`
	* `<jsp:text>`
	* `<jsp:output>`
4. JSP2.0 新增，用来动态生成XML
	* `<jsp:attribute>`
	* `<jsp:body>`
	* `<jsp:element>`
5. JSP2.0 新增，用在TagFile
	* `<jsp:invoke>`
	* `<jsp:dobody>`
	

#####<jsp:useBean>

> 作用：在jsp页面中实例化或者在指定范围内使用javabean：

```
<jsp:userBean id="标识符" class="Java 类名" scope='作用范围' />
```

#####<jsp:getProperty>

> 作用： 获取指定Javabean对象的属性值

```
<jsp:getProperty name="JavaBean属性名" property="属性名" />
```



# 指令

##page指令
> 利用page指令可以就当前JSP页面的某些方面对JSP转换器提出指示

* `import` 
* `session` 为false时，表示不参与Session管理，默认为true
* `buffer` out缓冲区大小，单位kb， 默认 大于等于8kb
* `autoFlush` 
* `isTreadSafe` 表示页面中实现的线程安全级别，不建议使用
* `info` 指定所生成的Servlet的getServletInfo方法返回值
* `errorPage`
* `isErrorPage` 
* `contentType`
* `pageEncoding`
* `isELIgnored` 是否忽略EL表达式
* `language`
* `extend `
* `deferredSyntaxAllowedAsLiteral`
* `trimDirectiveWhitespaces`

##include指令





















































