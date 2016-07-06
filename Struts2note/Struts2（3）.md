

###一、Struts2的国际化

1. 配置全局

###二、Struts2中的拦截器

####Struts2的很多核心功能都是由拦截器完成的

####在执行方法前或执行结果后，做拦截处理。

####自定义拦截器

* 定义一个类，继承`AbstractInterceptor` 或者实现`Interceptor`

 ```
 public class Demo1Interceptor extends AbstractInterceptor {

	
	//应用加载时就完成了初始化
	@Override
	public void init() {
		System.out.println("Demo1Interceptor 初始化");
	}

	//针对需要拦截的动作方法的访问，每次都会调用
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {

		System.out.println("Demo1Interceptor拦截前");
		String value = invocation.invoke();
		System.out.println("Demo1Interceptor拦截后" + value);
		return value;
	}

}
 ```
* 在struts中定义, 在动作中使用

```
<package name="p4" extends="struts-default" namespace="/interceptor">
		<!-- 声明自定义拦截器 -->
		<interceptors>
			<interceptor name="Demo1Interceptor" class="test.interceptor.Demo1Interceptor"></interceptor>
		</interceptors>
		<action name="demo1">
			<!-- 使用自定义拦截器：只要自己明确指定了一个拦截器。默认的拦截器都不起作用 -->
			<interceptor-ref name="Demo1Interceptor"></interceptor-ref>
			<result>/interceptor.jsp</result>
		</action>
	</package>
```

* 


###三、文件的上传和下载

1. 文件上传是由一个 fileUpload的拦截器实现的。
	前提： method 是 post； enctype = multipart/form-data;提供type=file的上传输入域
	
2. 单文件上传
   
   jsp页面：
   
	```
		<s:form action="upload" namespace="/uploadfiletest" enctype="multipart/form-data">
		<s:textfield name="name" label="姓名"></s:textfield>
		<s:file name="photo" label="照片"></s:file>
		<s:submit value="提交"></s:submit>
	</s:form>

	
	```

	Action:
   
   	```
   	public class FileUploadAction extends ActionSupport {

	private String name;
	private File photo; //和上传输入域名称一致，必须是File类型
	private String photoContentType; //文件名：上传的输入域名FileName
	private String photoFileName;//上传的文件的MIME类型
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public File getPhoto() {
		return photo;
	}
	public void setPhoto(File photo) {
		this.photo = photo;
	}
	public String getPhotoContentType() {
		return photoContentType;
	}
	public void setPhotoContentType(String photoContentType) {
		this.photoContentType = photoContentType;
	}
	public String getPhotoFileName() {
		return photoFileName;
	}
	public void setPhotoFileName(String photoFileName) {
		this.photoFileName = photoFileName;
	}
	@Override
	public String execute() throws Exception {
		
		System.out.println(name+":" + photoFileName +":" + photoContentType);
		
		String dir = ServletActionContext.getServletContext().getRealPath("/file");
	
		FileUtils.copyFile(photo, new File(dir, photoFileName));
		
		return SUCCESS;
	}
}
   	```
 
 struts.xml配置文件：
 
 ```
 	<package name="p6" extends="struts-default" namespace="/uploadfiletest">
		<action name="upload" class="test.action.FileUploadAction">
			<result name="success">/success.jsp</result>
		</action>
	</package>
 
 ```
   	
3. 多文件上传
4. 参数配置及不符合要求时的错误提示
5. 文件下载：结果类型

###四、OGNL表达式

###五、