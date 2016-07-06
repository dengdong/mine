
#JSTL

> `JavaServer Pages Standard Tag Library`（JSTL）是一个定制标签类库的集合


##1.通用动作指令（Core）

```
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
```

###1.1 out标签

out标签对表达式进行计算，并将结果输出到当前的JspWriter。

```
<c:out value="value" [escapeXml="{true|false}"] [defalut="defaultValue"]/>
```

###1.2 set 标签

set标签作用：

*  创建一个字符串和引用该字符串的一个限域变量
*  创建一个限域变量，并引用一个已经存在的某一个限域变量
*  设置限域对象的属性


第一种方式:

```
<c:set value="value" var="varName" [scope="{page|request|session|application}"] />
```
第二种方式:

```
<c:set var="varName" [scope="{page|request|session|application}"] >
body content
</c:set>
```

第三种方式，设置限域对象的属性值
```
<c:set target="target" property="property" value="value" />
```


第四种方式
```
<c:set target="target" property="property" >
body content 
</c:set>
```

###1.3 remove 标签

利用remove标签删除限域变量。

```
<c:remove val="varName" [scope="{page|request|session|application}"]  />
```


##2.条件式动作指令

###2.1 if标签


第一种方式：
```
<c:if test="testCondition" var="varName" [scope="{page|request|session|application}"] />
```

第一种方式：
```
<c:if test="testCondition" [var="varName"] [scope="{page|request|session|application}"] >
body content 
</c:if>
```

###2.2 choose/when/otherwise


##3 iterator动作指令

### 3.1 forEach标签

第一种方式
```
<c:forEach [var="varName"] begin="begin" end="end" step="step">
body content
</c:forEach>
```

第二种形式，迭代一个对象集合

```
<c:forEach items="collection" [var="varname"] [varStatus="varStatusname"] [begin="begin"] [end="end"] [step="step"]>
body content 
</c:forEach>
```
###3.2 forTokens标签

forTokens标签用于迭代特定分解符分割的token

```
<c:forTokens item="stringOfTokens" delims="delimiters" [var="varName"]
			[varStatus="varStatusName"] [begin="begin"] [end="end"] [step="step"]>
			body content
</c:forTokens>
```


##4.格式化动作指令

###4.1 formatNumber

###4.2 formatDate

###4.3 timeZone标签

###4.4 setTimeZone

###4.5 parseNumber

###4.6 parseDate


##5.函数

JSTP1.1 和1.2定义了一组标准函数，可以用在EL表达式

```
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
//调用函数格式
${fn:functionName}

```


###5.1 contains

```
${fn:contains("Abcd","bcd")}
```

###5.2 containsIgnoreCase

###5.3 endWith

###5.4 escapeXML

###5.5 indexOf

###5.6 join

###5.7 length

###5.8 replace

###5.9 split

###5.10 startWith

###5.11 substring

###5.12 substringAfter

###5.13 substringBefore

###5.14 toLowerCase

###5.15 toUpperCase

###5.16 trim










































